-- First I get all the platform ID, for sesnsor with AVG temperature below 0 to catch the Switc
select
tem.sen_platform_code,
avg(tem.value)
from
konux_temperature as tem
where
tem.value < 0
and
tem.TS_CREATION > (DATE_ADD(current_date,interval -2 day))
group by 
tem.sen_platform_code

-- The previous query shows the AVG but in order to filter we use the tem value below 0 to integrate the filter in one query.
-- Be carefull to change the date because in my case I used the filter -2 days before but if you integrate in your locale
-- environment the days must be extendend because the data in the DB are static.
select
swi.swi_id,
swi.sen_platform_code,
t.value,
t.TS_CREATION
from
konux_switch as swi
right join konux_temperature as t on replace(t.sen_platform_code,'\r\n','')=replace(swi.sen_platform_code,'\r\n','')
where 
swi.swi_type = 'M'
and
replace(swi.sen_platform_code,'\r\n','')
	in
	(
	select
		tem.sen_platform_code
		from
		konux_temperature as tem
		where
		tem.value < 0
		and
		tem.TS_CREATION > (DATE_ADD(current_date,interval -2 day))
	)		
and
t.TS_CREATION > (DATE_ADD(current_date,interval -2 day))