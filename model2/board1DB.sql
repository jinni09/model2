create table board1 (
	no number primary key, -- 게시글 번호 프라이머리키
	subject varchar2(200) not null, -- 게시글 제목
	content varchar2(4000) not null, -- 게시글내용
	readcount number default 0, -- 읽은 횟수
	ip varchar2(20) not null, -- 작성자 ip
	reg_date date default sysdate, -- 게시글 등록일
	up_date date, --게시글 수정일
	del_yn char(1) default 'n' check (del_yn in ('y','n')), -- 게시글 삭제여부
	m_no number not null -- m_no과 참조된 외래키
);

-- 게시판에 m_no 외래키 설정
alter table board1 add constraint fk_m_no
foreign key(m_no) references member(m_no);

-- 게시판 제약조건 삭제
alter table board1 drop constraint fk_m_no;


--oracle Date 형식 조회 시 시/분/초도 보이게끔 oracle 설정.
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';


-- select문
select * from (select rowNum rn, a.* from 
(select brd.*, m_nick, (select count(*) from 
recommend rcmd where rcmd.brd_no = brd.no) recommend from 
board1 brd, member m where brd.m_no=m.m_no and del_yn='n' order by no desc) a) where rn between 1 and 10;