-- zad 2
select c.name||' '||c.first_name Prescriber,c.onekey_id, t.name "Sales line", ad.line_1_address "Teritorry", a.role, e.display_name, c2.name "Organization name", ad.city, pa.country from prescriber p
join customer c on c.customer_id = p.customer_id
join customer_alignment ca on ca.customer_id = c.customer_id
join alignment a on a.alignment_id = ca.alignment_id
join team t on t.team_id = a.team_id
join employee e on e.employee_id = a.employee_id
join affiliation af on af.main_customer_id = c.customer_id
join address ad on ad.address_id = af.address_id
join customer c2 on c2.customer_id = af.to_customer_id
join postal_area pa on pa.postal_area = ad.postal_area
-- nie wiem skad posta code

select * from affiliation
select * from address
select * from customer_alignment
select * from team
select * from employee
select * from alignment
select * from region
select * from customer

-- zad 3
select c.name||' '||c.first_name Prescriber, c.onekey_id OCKID, cd.description  from prescriber p
join customer c on c.customer_id = p.customer_id
left join customer_specialty cs on cs.customer_id = c.customer_id
left join dn_code_value cv on cv.code =  cs.specialty
left join dn_code_description cd on cd.dn_code_value_id = cv.dn_code_value_id

-- pusta tabela role
-- zad 4
select distinct c.onekey_id, c.name||' '||c.first_name Prescriber, cd.description, cd2.description from prescriber p
join customer c on c.customer_id = p.customer_id
join customer_specialty cs on cs.customer_id = c.customer_id
join dn_code_value cv on cv.code =  cs.specialty
join dn_code_description cd on cd.dn_code_value_id = cv.dn_code_value_id
left join dn_code_description cd2 on cd2.dn_code_value_id = cv.dn_code_value_id
where cd.description not like cd2.description
-- nie ma prescriberow posiadajacych 2 specjalnosci
and cd.dn_language_id = 9999000000006948
and cd2.dn_language_id = 9999000000006948

-- zad 5
select a.role, e.employee_id, e.last_name||' '||e.first_name pracownik, e.login_id Login,  case when e2.last_name is null then 'n/a' else e2.last_name||' '||e2.first_name end as menager  from employee e
left join alignment a on a.employee_id = e.employee_id
left join alignment a2 on a2.alignment_id = a.manager_alignment_id
left join employee e2 on e2.employee_id = a2.employee_id

-- nie moge wstawic kolumny sales line bo tabea sales_plan_alignemnt jest pusta
-- skad dorwac territory?
-- user_account_authentication czy tutaj jest login? nie - logi jest w polu login_id tabeli employees
-- zad 6
select m.meeting_id, m.name,  TO_char(m.start_date_time, 'YYYY-MM-DD HH24:MI') "Start", TO_char(m.end_date_time, 'YYYY-MM-DD HH24:MI') "End",  m.status "Meet status", mip.status "IR status", mip.investment_request_id "IR ID", e.display_name from meeting m
join meeting_alignment ma on ma.meeting_id = m.meeting_id
join alignment a on a.alignment_id = ma.alignment_id
join meeting_invited_partners mip on mip.alignment_id = a.alignment_id
join employee e on e.employee_id = m.creator_employee_id
--investment request w tabeli meeting_invited_parners
-- brakuje jeszcze managera

select to_date('2019-09-08', 'YYYY-MM-DD HH24:MI:SS') from dual
select * from meeting_alignment
select distinct meeting_type from meeting
select * from meeting
select * from alignment where alignment_id = 60000003600288
select * from employee



select * from alignment where alignment_id = 60000000180280
select GLOBAL_EMPLOYEE_ROLE_ID from employee 
select * from team
select * from region
select * from region_country
select * from dn_code_value where code = '02DU'
select * from dn_code_description where DN_CODE_VALUE_ID = 60000002469903
select * from employee
select * from customer
select * from address
select * from customer_alignment