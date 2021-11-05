.LOGTABLE pdp_tmp.mylogfilo;  
.LOGON your_ip/user_name,password;

drop table pdp_tmp.MySchoolEmployee;
drop table pdp_tmp.WT_MySchoolEmployee;
drop table pdp_tmp.ET_MySchoolEmployee;
drop table pdp_tmp.UV_MySchoolEmployee;


CREATE TABLE pdp_tmp.MySchoolEmployee(
Employee_No INTEGER,
first_name varchar(30),
last_name varchar(30),
birthdate varchar(10),
joined_date varchar(10),
dept_no varchar(10)
)
unique primary index (Employee_No);



.begin import mload tables pdp_tmp.MySchoolEmployee;
.layout inslayout;
	.field Employee_No * varchar(10);
	.field first_name * varchar(30);
	.field last_name * varchar(30);
	.field birthdate * varchar(10);
	.field joined_date * varchar(10);
	.field dept_no * varchar(10);

.dml label insdml;
insert into pdp_tmp.MySchoolEmployee(Employee_No,first_name,last_name,birthdate,joined_date,dept_no)
values(:Employee_No,:first_name,:last_name,:birthdate,:joined_date,:dept_no);


.import infile D:\PTCL\MULTILOAD\ArfaSchoolEmployee.txt
	format vartext ','
	layout inslayout
	apply insdml;
.end mload;
.logoff;


3:09 PM 11/5/2021

3:12 PM 11/5/2021

3:29 PM 11/5/2021

3:30 PM 11/5/2021
