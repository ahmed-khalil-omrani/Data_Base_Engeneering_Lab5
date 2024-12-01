/*
CREATE TABLE EMP(
  empNum Number primary key,
  empName varchar(30),
  job varchar(30),
  hiredate date , 
  managerID Number,
  salary Number ,
  commission Number,
  deptNum Number
);

CREATE TABLE DEPT(
   DeptNum Number primary key,
   DeptName varchar(30),
   location varchar(30),
   director Number,
   Foreign key (director) References EMP(empNum) 
);
CREATE TABLE PROJECT(
   codeP Number Primary key,
   nameP varchar(30)

);
CREATE TABLE PARTICIPATION(
   empNum Number constraint fk1 references EMP(empNum),
   codeP Number constraint fk2 references PROJECT(codeP)  , 
   function varchar(30),
   Constraint pk primary key(empNum , codeP)
);
ALTER table EMP add constraint fk_emp1 foreign key(managerID) references EMP(empNum);
ALTER TABLE EMP add constraint fk_emp2 foreign key (deptNum) references DEPT(deptNum);

---2:
insert into DEPT(deptNum,deptName,location) values(10,'Dept1','Monastir'); 
insert into DEPT(deptNum,deptName,location) values(20,'Dept2','Monastir'); 
insert into DEPT(deptNum,deptName,location) values(30,'Dept3','Monastir'); 
insert into DEPT(deptNum,deptName,location) values(40,'Dept4','Monastir');
insert into DEPT(deptNum,deptName,location) values(50,'Dept5','Monastir');
insert into EMP values (100,'Emp1', 'Poste1', '12/02/2018', NULL, 1500, NULL,10); 
insert into EMP values (101,'Emp2', 'Poste2', '12/03/2016', 100, 1000, NULL,20); 
insert into EMP values (102,'Emp3', 'Poste2', '12/02/2016', 100, 1100, NULL,30);
insert into EMP values (103,'Emp4', 'Poste4', '12/03/2016', NULL, 1400, NULL,40);
insert into EMP values (104,'Emp5', 'Poste5', '12/03/2016', 103, 1100, NULL,50);
insert into EMP values (109,'Emp9', 'Poste2', '12/03/2016', 100, 1000, NULL,20);
insert into EMP values (110,'Emp10', 'Poste2','12/03/2016', 100, 11000, NULL,30);
insert into EMP values (111,'Emp11', 'Poste2', '12/03/2016', 100, 13000,NULL,40); 
insert into EMP values (112,'Emp12', 'Poste2', '12/03/2016', 100, 14000,NULL,20);
insert into EMP values (120,'Emp20', 'Poste2','12/03/2016', 103, 1000, NULL,20); 
insert into EMP values (121,'Emp21', 'Poste2','12/03/2016', 103, 11000, NULL,30);
insert into EMP values (122,'Emp23', 'Poste2','12/03/2016', 103, 13000, NULL,40); 
insert into EMP values (123,'Emp22', 'Poste2','12/03/2016', 103, 14000, NULL,20);
insert into EMP values (124,'Emp24', 'Poste2','12/03/2016', 103, 14000, NULL,20);

alter table EMP DROP constraint fk_emp1;
alter table EMP add constraint fk_emp1 Foreign key (managerID) references EMP(EMPNUM) ON DELETE SET NULL; 
alter table EMP DROP CONSTRAINT fk_emp2;
alter table EMP ADD CONSTRAINT fk_emp2 foreign key (deptNum) references Dept(deptNUM) ON DELETE set null; 


alter table PARTICIPATION DROP CONSTRAINT fk1;
alter table PARTICIPATION ADD constraint fk1 foreign key (empNUM) references EMP(empNum) ON DELETE SET NULL; 
alter table PARTICIPATION DROP constraint fk2;
alter table PARTICIPATION ADD constraint fk2 foreign key (codep) references PROJECT(CODEp) ON DELETE SET NULL;

alter table EMP DROP constraint fk_emp1;
alter table EMP ADD CONSTRAINT fk_emp1 foreign key (managerID ) references EMP(empNUM) on delete cascade;

alter table EMP DROP Constraint fk_emp2;
alter table EMP ADD CONSTRAINT fk_emp2 foreign key (DEPTNUM) REFERENCES DEPT(DEPTNUM) ON DELETE CASCADE;


alter table participation DROP CONSTRAINT fk1;
alter table participation ADD CONSTRAINT fk1 FOREIGN KEY (empnum) references EMP(empnum) ON DELETE cascade;

alter table participation Drop constraint fk2;
alter table participation add constraint fk2 foreign key (codeP) references Project(codeP) ON DELETE CASCADE; 

alter table EMP add ADDRESS VARCHAR(30) DEFAULT 'MONASTIR';

insert into EMP(EMPNUM,EMPNAME,JOB,HIREDATE,MANAGERID,SALARY,COMMISSION,DEPTNUM) values(7,'mohamed','eng','12/03/2016',100, 1000, NULL,20);

alter table EMP modify address varchar(40);

alter table EMP drop (address);*/
---1:

Declare 
Inc int:=200;
Begin
Update emp Set salary=salary+inc where(DeptNum=(select deptnum from dept where deptname='IT'));
end;
---2:

set SERVEROUTPUT On;
declare
v_deptnum dept.deptnum%type;
begin
select deptnum into v_deptnum from dept where deptname='Commercial';
for i in (select * from emp)loop
if i.deptNum=v_deptnum then
dbms_Output.put_line(i.empname);
end if;
end loop;
end;
---3:
begin 
for i in (select * from emp)Loop
  if i.salary<1000000 then
     i.commission:=i.commission+10;
  elsif i.salary<1500000 then
     i.commission:=i.commission+15;
  elsif i.salary>1500000 then
     i.commission:=i.commission+15;
  else
    i.commission:=0;
end if;
end loop;
end;
