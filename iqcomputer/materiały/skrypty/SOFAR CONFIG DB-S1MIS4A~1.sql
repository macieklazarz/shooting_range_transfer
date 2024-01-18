select 
  customer_id, 
  customer as "Medico", 
  employee as "Utente", 
  product as "Campione", 
  nb_reimb_greater_18 as "nb_reimb_greater_18", 
  nb_noreimb_greater_18 as "nb_noreimb_greater_18", 
  nb_less_equal_18 as "nb_less_equal_18", 
  nb_no_limitations as "Senza Limitazione", 
  nb_tot as "Totale"
from (
  select 
    c.customer_id, 
    decode(pr.display_name, null, max(c.name || ', ' || c.first_name) || ' (Totale)', max(c.name || ', ' || c.first_name)) customer, 
    em.employee_id, 
    nvl(em.last_name || ', ' || em.first_name, null) employee, 
    nvl(pr.display_name, null) product, 
    sum(case when trunc(ev.start_date_time) > add_months(trunc(nvl(pr.start_date, to_date('01-01-1900','DD-MM-YYYY'))), 18) and nvl(pr.no_limitation, 0 ) = 0 and nvl(pr.reimbursable,0)='-1' then st.physical_quantity else 0 end) as nb_reimb_greater_18,
	sum(case when trunc(ev.start_date_time) > add_months(trunc(nvl(pr.start_date, to_date('01-01-1900','DD-MM-YYYY'))), 18) and nvl(pr.no_limitation, 0 ) = 0 and nvl(pr.reimbursable,0)='0' then st.physical_quantity else 0 end) as nb_noreimb_greater_18,
    sum(case when trunc(ev.start_date_time) <= add_months(trunc(nvl(pr.start_date, to_date('01-01-1900','DD-MM-YYYY'))), 18) and nvl(pr.no_limitation, 0) = 0 then st.physical_quantity else 0 end) as nb_less_equal_18, 
    sum(case when nvl(pr.no_limitation, 0) = '-1' then st.physical_quantity else 0 end) as nb_no_limitations, 
    sum(st.physical_quantity) nb_tot, 
    grouping_id(em.employee_id, pr.display_name) as grouping_id
  from 
    sample_transaction st 
    join (select event_id, customer_id, employee_id, alignment_id, start_date_time
            from event
            where 1 = 1 
            and status = 'SENT'
            $DATE_FILTER
             and customer_id in (select customer_id 
                                   from customer_alignment 
                                   where 1=1
                                  $ALIGNMENT)) ev 
      on st.event_id = ev.event_id 
    join product pr 
      on pr.product_id = st.product_id 
    join customer c
      on ev.customer_id = c.customer_id
    join employee em 
      on ev.employee_id = em.employee_id 
where exists (select customer_id from customer_alignment ca where ev.customer_id = ca.customer_id and ca.status = 1)
--and nvl(pr.no_limitation, 0) = 0 
  group by c.customer_id, rollup (em.employee_id, em.last_name || ', ' || em.first_name, pr.display_name)
  having grouping_id(em.employee_id, pr.display_name) in (0,3)
)
order by 2, 4