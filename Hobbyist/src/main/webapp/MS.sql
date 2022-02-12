create table academy(
	a_seq number(5),
	a_id varchar(20) not null,
	a_name varchar(20) not null,
	a_day date not null,
	a_address varchar(20) not null,
	a_tel varchar(20) not null,
	a_time varchar(20) not null,
	a_category Number(5),
	a_m_category Number(5),
	
	constraint academy_pk primary key(a_id)
);
insert into History values(1,'학원','목 금', '북구', '010-4684-131','08:00-10:00')
select * from HISTORY

insert into ACADEMY values(1,'학원',date,'광주','651-1651','51시',2,3)
select * from academy
drop table academy
drop table member
create table Member(
	m_email varchar(20) not null,
	m_pw varchar(20) not null,
	m_name varchar(20) not null,
	m_nick varchar(20) not null,
	m_tel varchar(20) not null,
	m_address varchar(20) not null,
	m_age NUMBER(5) not null,
	m_gender varchar(10) not null,
	m_a_id varchar(20),
	constraint member_pk primary key(m_email)	
)

insert into MEMBER values('mmmm','1234','닉네임','20','남자','651651-351','광주','강한')
select * from member