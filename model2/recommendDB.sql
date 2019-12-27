create table recommend (
	brd_no number not null, 
	m_no number not null,
	reg_date date default sysdate,
	del_yn char(1) default 'n' check (del_yn in ('y','n')),
	primary key(brd_no, m_no)
);

-- 게시판에 brd_no 외래키 설정
ALTER TABLE recommend ADD CONSTRAINT fk_brd_no_re
FOREIGN KEY(brd_no) REFERENCES bard1(no);

-- 게시판에  m_no 외래키 설정
ALTER TABLE recommend ADD CONSTRAINT fk_m_no_re
FOREIGN KEY(m_no) REFERENCES member(m_no);

drop constraint fk_m_no_re;
drop constraint fk_brd_no_re;


-- select문
select * from (select rowNum rn, a.* from 
(select brd.*, m_nick, (select count(*) from recommend rcmd where rcmd.brd_no = brd.no) recommend from board1 brd, member m where brd.m_no=m.m_no and del_yn='n' order by reg_date desc) a) where rn between 1 and 10;