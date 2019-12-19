create table member (
	m_no number primary key,
	m_email varchar2(30) not null unique,
	m_passwd varchar2(20) not null,
	m_nick varchar2(30) not null unique,
	m_reg_date date default sysdate,
	m_out_date date,
	m_del_yn char(1) default 'n'
);

select * from member;

insert into member values (1,'master',1,'관리자',sysdate,null,'n');
-- 관리자 insert

--drop table member;
