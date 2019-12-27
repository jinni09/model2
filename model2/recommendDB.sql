create table recommend (
	brd_no number not null, 
	m_no number not null,
	reg_date date default sysdate,
	primary key(brd_no, m_no)
);

-- 게시판에 brd_no 외래키 설정
ALTER TABLE recommend ADD CONSTRAINT fk_brd_no_re
FOREIGN KEY(brd_no) REFERENCES board1(no);

-- 게시판에  m_no 외래키 설정
ALTER TABLE recommend ADD CONSTRAINT fk_m_no_re
FOREIGN KEY(m_no) REFERENCES member(m_no);

drop constraint fk_m_no_re;
drop constraint fk_brd_no_re;