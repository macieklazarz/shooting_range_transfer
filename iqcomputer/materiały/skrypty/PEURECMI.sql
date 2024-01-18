select tenant_id,customer_id, count(1) from phone where phone_type='PEML'
and tenant_id in (500035,500113,500073) group by customer_id,tenant_id having count(1)>1
order by tenant_id;
------------
select tenant_id,customer_id, count(1) from phone where phone_type='PEML'
and tenant_id in (500035,500113,500073) group by customer_id,tenant_id having count(1)<2
order by tenant_id;
------------
select tenant_id,customer_id, count(1) from phone where phone_type='PEML' and phone_number = ' '
and tenant_id in (500035,500113,500073) group by customer_id,tenant_id having count(1)<2
order by tenant_id;
--------------
select * from phone where affiliation_id is not null and phone_type='PEML'and phone_number = ' '
-----------------------
select * from affiliation where affiliation_id = 60000048574182
------------------------
select tenant_id,customer_id, count(*) from phone where phone_type='PEML'
and tenant_id in (500035,500113,500073) group by customer_id,tenant_id having count(*)>1;

select * from phone where tenant_id=500073 and customer_id = 60000053351988

select * from phone where tenant_id=500113 and customer_id = 60000329084970

select * from phone where tenant_id=500035 and customer_id = 11140000035640

select * from phone where tenant_id=500113 and customer_id = 60000292010949


select * from customer



select * from phone where tenant_id=500113 and customer_id = 60000292011826 and phone_type = 'PEML'

select * from phone where phone_number = ' '

select * from tenant where tenant_id in (500035,500113,500073)

select * from sm_phone_113_20190315 where phone_type = 'PEML' and phone_number like '% %'
select * from sm_phone_113_20190318 where phone_type = 'PEML' and phone_number like '% %' and tenant_id  in (500035,500113,500073)
select * from sm_phone_20190415_500035 where phone_type = 'PEML' and phone_number like '% %' and tenant_id  in (500035,500113,500073)
select * from sm_phone_20190415_500035 where  tenant_id  not in (500035,500113,500073)
select * from sm_phone_35_20190318 where phone_type = 'PEML' and phone_number like '% %' and tenant_id  in (500035,500113,500073)
select * from sm_phone_113_20190318 where  affiliation_id is not null


select * from sm_phone_113_20190318 where phone_type = 'PEML' and phone_number not like '% %' and tenant_id  in (500035,500113,500073)
select * from phone where phone_id = 4000002407070992
select * from phone where create_date is not null and phone_type = 'PEML'


select tenant_id,customer_id, count(1) from phone where phone_type!='PEML'
and tenant_id in (500035,500113,500073) group by customer_id,tenant_id having count(1)>1
order by tenant_id;

select * from phone where tenant_id=500035 and customer_id = 60000007675014


select * from dn_all_code where code = 'AEML'


select * from sm_phone_113_20190318 where phone_type = 'PEML' and phone_number like '% %' and tenant_id  in (500035,500113,500073)
select * from phone where customer_id in  (60000292009998) and phone_type = 'PEML'

select * from sm_phone_113_20190318 where customer_id in (select customer_id from (
select tenant_id,customer_id, count(1) from phone where phone_type='PEML'
and tenant_id in (500035,500113,500073) group by customer_id,tenant_id having count(1)>1
));
select * from sm_phone_113_20190318 where customer_id in  (60000292009998)

select customer_id, phone_type, phone_number, rank from phone where tenant_id=500113 and customer_id = 60000329084970 and phone_type = 'PEML'
