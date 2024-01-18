select distinct code_1 from event_dynamic
where table_id = 7888501022205474
AND code_1 != -1 or code_1 is null

select * from dn_all_code where description like '%ammini%'

select * from dn_code_value
where table_name like 'dynamic__7888501022205474'

select * from event
select distinct code_1 from event_dynamic
where table_id = 7888501022205474

select * from dn_all_code where table_name like 'dynamic__7888501022205474'

select distinct table_name from dn_all_code order by 1

select distinct table_name from DN_code_table
where table_name like 'dynamic__7888501022205474' order by 1

select * from dn_all_code where table_name like '%7888500000158245'
select * from dn_all_code where code_role = 'hospital_org_type' and table_name is not null
select * from event_detail

---- 25.10.2019
select onekey_id, customer_id from customer
select * from customer_alignment

select a.customer_alignment_id, a.customer_id,c.customer_id, c.onekey_id from customer_alignment a
left join customer c on c.customer_id = a.customer_id

select distinct table_id from customer_dynamic

select * from legal_entity
select distinct legal_type from legal_entity

select * from dn_all_code where description like '%hosp%'

-----------------------------------

select dt.dn_dynamic_table_id,NVL(dt.table_name,dct.text) as entity_name,dt.dynamic_table,dt.parent_root,dp.column_name,dpd.name,dl.dn_language_id,dl.description as language,

dp.dn_user_type_id,du.description as user_type_name,

dt.dn_version_id,dv.description version_name

from dn_dynamic_table dt

  inner join dn_property dp on (dp.table_name like 'dynamic%' || dt.dn_dynamic_table_id)

  left outer join dn_client_translation dct on (dct.string_id=dt.table_name)

  inner join dn_property_description dpd on (dpd.dn_property_id=dp.dn_property_id)

  inner join dn_language dl on (dl.dn_language_id=dpd.dn_language_id)

  inner join dn_version dv on (dv.dn_version_id=dt.dn_version_id)

  inner join dn_user_type du on (du.dn_user_type_id=dp.dn_user_type_id)

where

  --dt.tenant_id=500017

   dt.dn_dynamic_table_id = 7888500000158245

order by dt.dn_dynamic_table_id

-------------------------------------

select * from customer_dynamic

select * from dn_all_code where table_name = 'customer_dynamic'

select * from dn_code_table where code_role like '%hospital_or%'
select * from legal_entity
select * from dn_all_code where code = '00F4'
select * from dn_all_code where code_role like '%hospital_or%'