
create table academy(
	a_seq number(5),
	a_name varchar(20) not null,
	a_day date not null,
	a_address varchar(20) not null,
	a_tel varchar(20) not null,
	a_time varchar(20) not null,
	a_category Number(5),
	a_m_category Number(5),
	constraint academy_pk primary key(a_seq)
);
select * from academy

create table Member(
	m_email varchar(20) not null,
	m_pw varchar(20) not null,
	m_nick varchar(20) not null,
	m_age NUMBER(5) not null,
	m_gender varchar(10) not null,
	m_tel varchar(20) not null,
	m_address varchar(20) not null,
	m_hashtag varchar(20) not null,
	constraint member_pk primary key(m_email)
	
)













