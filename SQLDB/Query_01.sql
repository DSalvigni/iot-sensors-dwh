/*All the traces for switch number 2 in a specific time period*/
select
'2' as switch_id,
'konux_accelerometer_z' as sensor,
accz.sen_platform_code,
accz.value,
accz.TS_CREATION
from konux_accelerometer_z as accz
where 
replace(accz.sen_platform_code,'\r\n','') in (
	select
	swi.sen_platform_code
	from
	konux_switch as swi
	where swi.swi_id = 2
	)
and accz.TS_CREATION = '2018-08-12 13:51:41'
union all
select
'2' as switch_id,
'konux_accelerometer_y' as sensor,
accy.sen_platform_code,
accy.value,
accy.TS_CREATION
from konux_accelerometer_y as accy
where 
replace(accy.sen_platform_code,'\r\n','') in (
	select
	swi.sen_platform_code
	from
	konux_switch as swi
	where swi.swi_id = 2
	)
and accy.TS_CREATION = '2018-08-12 13:51:41'
union all
select
'2' as switch_id,
'konux_battery' as sensor,
bat.sen_platform_code,
bat.value,
bat.TS_CREATION
from konux_battery as bat
where 
replace(bat.sen_platform_code,'\r\n','') in (
	select
	swi.sen_platform_code
	from
	konux_switch as swi
	where swi.swi_id = 2
	)
and bat.TS_CREATION = '2018-08-12 13:51:41'
union all
select
'2' as switch_id,
'konux_gyroscope' as sensor,
gyr.sen_platform_code,
gyr.value,
gyr.TS_CREATION
from konux_gyroscope as gyr
where 
replace(gyr.sen_platform_code,'\r\n','') in (
	select
	swi.sen_platform_code
	from
	konux_switch as swi
	where swi.swi_id = 2
	)
and gyr.TS_CREATION = '2018-08-12 13:51:41'
union all
select
'2' as switch_id,
'konux_temperature' as sensor,
tem.sen_platform_code,
tem.value,
tem.TS_CREATION
from konux_temperature as tem
where 
replace(tem.sen_platform_code,'\r\n','') in (
	select
	swi.sen_platform_code
	from
	konux_switch as swi
	where swi.swi_id = 2
	)
and tem.TS_CREATION = '2018-08-12 13:51:41'
