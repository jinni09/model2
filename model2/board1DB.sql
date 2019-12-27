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

drop constraint fk_m_no;

