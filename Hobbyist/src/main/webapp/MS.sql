CREATE table WEB_MEMBER(
	m_email varchar(50), 
	m_pw varchar(50) not null,
	m_tel varchar(50) not null,
	m_address varchar(50) not null,
	constraint web_member_pk primary key(m_email)
)

create table pj_member(
	name varchar(50) not null,
	email varchar(50),
	pw varchar(50) not null,
	gender varchar(50) not null,
	nickname varchar(50) not null,
	address varchar(50) not null,
	constraint email_pk primary key(email)
)
















select * from web_member
 
drop table web_message

create table web_message(
	m_num NUMBER,
	m_sendName VARCHAR(50) not null,
	m_receiveEmail varchar(50) not null,
	m_content varchar(200) not null,
	m_sendDate date not null,
	constraint web_message_pk primary key(m_num)
)

create sequence num_seq increment by 1 start with 1;

insert into web_message values(num_seq.nextval,'test','dmdm','테스트내용',sysdate);

select * from web_message;

