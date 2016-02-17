select per.person_id
,      per.effective_start_date per_start
,      per.effective_end_date per_end
,      asgn.effective_start_date asgn_start
,      asgn.effective_end_date asgn_end
,      greatest(per.effective_start_date,asgn.effective_start_date)  start_d
,      least(per.effective_end_date, asgn.effective_end_date) end_d
From per_all_people_f per 
left outer join per_all_assignments_f asgn
on per.person_id = asgn.person_id
and  asgn.primary_flag = 'Y'
and  (   asgn.effective_start_date between per.effective_start_date and per.effective_end_date
      or per.effective_start_date between asgn.effective_start_date and asgn.effective_end_date
     )
where   per.person_id in (130, 27299)
/



select * FRom all_tab_columns where table_name like upper('PER%') and column_name = 'EFFECTIVE_START_DATE';

select * from (
select person_id
, count(*)
From per_all_people_f
group by person_id
having count(*) > 5
)
where rownum < 100;