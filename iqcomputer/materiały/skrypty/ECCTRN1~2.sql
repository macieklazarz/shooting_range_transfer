select * from customer where customer_id=70000000007083


select * from customer

select c1.customer_id, c1.name, c1.affiliation_id, c2.name from customer c1
left join customer c2 on c2.customer_id = c1.affiliation_id


select * from affiliation

select a.affiliation_id, a.from_customer_id, a.main_customer_name, c.name from affiliation a
left join customer c on c.customer_id = a.from_customer_id

select * from address

select af.to_name, ad.line_1_address, ad.city from affiliation af
join address ad on af.address_id = ad.address_id

select * from business_unit --pusta
select * from region
select * from team
select * from animal_clinic --pusta
select * from application_usage
select * from employee_notification --pusta
select * from event -- pusta
select * from survey_response --pusta
select * from survey --pusta


select * from product
select * from product_message

select p.product_id, pm.message_text from product p
join product_message pm on pm.product_id = p.product_id

select distinct message_text from product_message

select * from poa -- pusta
select s1.skill_id, s1.description, s2.description as master from skill s1
join skill s2 on s2.skill_id = s1.parent_skill_id

select * from todo --pusta
select * from contract --pusta
select c.name, p.display_name from customer c
join customer_suspension cs on cs.customer_id = c.customer_id
join product p on p.product_id = cs.product_id

-- customers adress
select * from address

select * from customer_alignment

select * from customer where customer_type like 'PRES'

---------------------------------------------------
select c1.name Prescriber, c2.name as Organization from customer c1
join affiliation a1 on c1.customer_id = a1.main_customer_id
join customer c2 on c2.customer_id = a1.from_customer_id

where c1.customer_type like 'PRES'
-----------------------------------------------------


--ZADANIE 1
select c1.customer_type, c1.customer_id, c1.name Prescriber, c2.name as Organization, c3.name "Main Organization", ad.line_1_address "Street", postal_area "Postal code", postal_city "City" from customer c1
left join affiliation a1 on c1.customer_id = a1.main_customer_id
left join customer c2 on c2.customer_id = a1.to_customer_id
left join affiliation a2 on a2.main_customer_id = c2.customer_id
left join customer c3 on c3.customer_id = a2.to_customer_id
left join address ad on ad.address_id = a1.address_id 
where /* a1.main_customer_id not like a1.to_customer_id and */ a2.main_customer_id not like a2.to_customer_id
order by c1.customer_type

-- ZADANIE 2
SELECT customer_type, count(*) FROM CUSTOMER C1
group by customer_type

SELECT c1.customer_id, c1.salutation_name, c1.external_id_1, t.name, a.alignment_name, e.external_id_2, e.display_name FROM CUSTOMER C1
left join customer_alignment ca on ca.customer_id = c1.customer_id
left join alignment a on a.alignment_id = ca.alignment_id
left join team t on t.team_id = a.team_id
join employee e on e.employee_id = a.employee_id
--join affiliation af on af.main_customer_id = c1.customer_id
where c1.customer_type = 'PRES' and e.external_id_2 is not null

select * from customer where name like '%hospita%'


select * from dn_property
select * from dn_property_role
select * from customer_alignment
select * from team
select * from customer
select * from territory
select * from affiliation
select * from employee
select * from alignment
select * from region
select * from address






select d1.dn_property_role_id, d1.property_role, d2.dn_property_role_id, d2.property_role from dn_property_role d1
left join dn_property_role d2 on d2.dn_property_role_id = d1.parent_id


select * from dn_translation -- where tenant_id not in (0)
select * from team where business_unit_id is not null
select * from alignment