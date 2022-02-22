select count(*) from academy where a_L_category = '테스트1' and a_m_category = '테스트1-1' and a_city = '남구'


<<<<<<< HEAD



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

select * from ACADEMY

select * from member

insert into ACADEMY values(70,'학원70','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(71,'학원71','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(72,'학원72','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(73,'학원73','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(74,'학원74','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(75,'학원75','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(76,'학원76','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(77,'학원77','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(78,'학원78','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(79,'학원79','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(80,'학원80','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(81,'학원81','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(82,'학원82','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(83,'학원83','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(84,'학원84','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(85,'학원85','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(86,'학원86','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(87,'학원87','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(88,'학원88','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(89,'학원89','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(90,'학원90','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(91,'학원91','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(92,'학원92','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(93,'학원93','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(94,'학원94','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
select * from academy where a_L_category = '테스트1' and a_m_category = '테스트1-1'
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

select * from MEMBER
insert into MEMBER values('mmmm','1234','닉네임','20','남자','651651-351','광주','강한')
select * from Recommend

drop table Recommend cascade CONSTRAINTS;

create table Recommend(
	a_id varchar(20) not null,
	a_name varchar(20) not null,
	a_address varchar(20) not null,
	a_L_category varchar(20) not null,
	a_m_category varchar(20) not null,
	a_note varchar(20) not null,
	a_city varchar(20) not null,
	constraint rec_pk primary key(a_id),	
	CONSTRAINT FK_a_id FOREIGN KEY(a_id) REFERENCES ACADEMY(a_id),
	CONSTRAINT FK_a_name FOREIGN KEY(a_name) REFERENCES ACADEMY(a_name),
	CONSTRAINT FK_a_address FOREIGN KEY(a_address) REFERENCES ACADEMY(a_address),
	CONSTRAINT FK_a_L_category FOREIGN KEY(a_L_category) REFERENCES ACADEMY(a_L_category),
	CONSTRAINT FK_a_m_category FOREIGN KEY(a_m_category) REFERENCES ACADEMY(a_m_category),
	CONSTRAINT FK_a_note FOREIGN KEY(a_note) REFERENCES ACADEMY(a_note),
	CONSTRAINT FK_a_city FOREIGN KEY(a_city) REFERENCES ACADEMY(a_city)
)

=======
insert into addr values('북구','용봉동','146')
select * from history
select * from member
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

select * from ACADEMY

select * from member

insert into ACADEMY values(70,'학원70','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(71,'학원71','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(72,'학원72','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(73,'학원73','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(74,'학원74','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(75,'학원75','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(76,'학원76','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(77,'학원77','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(78,'학원78','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(79,'학원79','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(80,'학원80','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(81,'학원81','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(82,'학원82','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(83,'학원83','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(84,'학원84','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(85,'학원85','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(86,'학원86','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(87,'학원87','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(88,'학원88','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(89,'학원89','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(90,'학원90','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(91,'학원91','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(92,'학원92','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(93,'학원93','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
insert into ACADEMY values(94,'학원94','광주광역시 테스트주소','테스트1','테스트1-1','테스트 노트','남구');
select * from academy where a_L_category = '테스트1' and a_m_category = '테스트1-1'
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

select * from MEMBER
insert into MEMBER values('mmmm','1234','닉네임','20','남자','651651-351','광주','강한')
select * from Recommend

drop table Recommend cascade CONSTRAINTS;

create table Recommend(
	a_id varchar(20) not null,
	a_name varchar(20) not null,
	a_address varchar(20) not null,
	a_L_category varchar(20) not null,
	a_m_category varchar(20) not null,
	a_note varchar(20) not null,
	a_city varchar(20) not null,
	constraint rec_pk primary key(a_id),	
	CONSTRAINT FK_a_id FOREIGN KEY(a_id) REFERENCES ACADEMY(a_id),
	CONSTRAINT FK_a_name FOREIGN KEY(a_name) REFERENCES ACADEMY(a_name),
	CONSTRAINT FK_a_address FOREIGN KEY(a_address) REFERENCES ACADEMY(a_address),
	CONSTRAINT FK_a_L_category FOREIGN KEY(a_L_category) REFERENCES ACADEMY(a_L_category),
	CONSTRAINT FK_a_m_category FOREIGN KEY(a_m_category) REFERENCES ACADEMY(a_m_category),
	CONSTRAINT FK_a_note FOREIGN KEY(a_note) REFERENCES ACADEMY(a_note),
	CONSTRAINT FK_a_city FOREIGN KEY(a_city) REFERENCES ACADEMY(a_city)
)
>>>>>>> branch 'master' of https://github.com/2022-SMHRD-KDT-BigData-1/Hobbyist.git

drop table map_info


create table map_info(
	category varchar(20) not null,
	academy varchar(50) not null ,
	location varchar(20) not null,
	tel varchar(20) not null
	) 

insert into map_info values ('운동', '모던필라테스', '남구', '062-672-9030')
insert into map_info values ('운동', '크로스핏디노', '남구', '062-655-6593')
insert into map_info values ('운동', '라인앤필라테스', '남구', '062-676-8896')
insert into map_info values ('운동', '모던필라테스', '남구', '062-672-9030')