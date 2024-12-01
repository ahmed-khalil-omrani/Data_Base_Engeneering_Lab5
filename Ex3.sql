create table PILOT (Matricule varchar(40), Name varchar(40), City varchar(40), Age Number(20), Salary Number(20));
insert into pilot values('NP058','figue', 'cannes',38,2800);
insert into pilot values('NP115','lavande', 'USA',54,4000);
insert into pilot values('NP115','lavande', 'USA',30,3000);
set serveroutput On;
declare
j int :=0;
s_salary pilot.salary%type :=0;
begin 
for i in (select * from pilot)loop
if 35<=i.age and i.age<=55 then
j:=j+1;
s_salary:=s_salary+i.salary;
end if;
end loop;
dbms_output.put_line(s_salary/j);
end;

  
