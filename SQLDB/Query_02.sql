/* Select all the traces of vertical accelerometer, configured as 20khz and mounted on switched K type and in location B*/
select
accy.sen_platform_code,
accy.value,
accy.TS_CREATION,
conf.con_valid_from as 'Configuration DT valid from',
conf.con_valid_to as 'Configuration DT valid to'
from
konux_accelerometer_y as accy
join konux_configuration as conf on (DATE_FORMAT(accy.TS_CREATION, '%d-%m-%Y') > DATE_FORMAT(conf.con_valid_from, '%d-%m-%Y') and  DATE_FORMAT(accy.TS_CREATION, '%d-%m-%Y') < DATE_FORMAT(conf.con_valid_to, '%d-%m-%Y') and conf.con_accelerometer_y='20khz')
where
replace(accy.sen_platform_code,'\r\n','')
	in(select
		swi.sen_platform_code
		from
		konux_switch as swi
		where 
		swi.swi_type = 'K'
		and
	   swi.swi_location = 'B')