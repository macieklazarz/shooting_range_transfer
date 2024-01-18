select * from customer_dynamic where table_id=1888002682878206

select * from customer where customer_id = 60000021568536
select * from customer where onkey_id

select * from customer_alignment where customer_id = 60000021568536

select * from customer_dynamic where table_id = 1888002682878206

select * from customer_dynamic

-----------------------

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

   dt.dn_dynamic_table_id = 1888002682878206

order by dt.dn_dynamic_table_id

