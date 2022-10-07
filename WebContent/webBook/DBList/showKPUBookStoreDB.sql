show databases;

CREATE TABLE IF NOT EXISTS bookInformation(
	b_id VARCHAR(30) not null,
	b_name VARCHAR(50),
	b_author VARCHAR(50),
	b_price  INTEGER,
	b_inform TEXT,
	b_publisher VARCHAR(50),
	b_date VARCHAR(30),
   	b_category VARCHAR(30),
	b_stock integer,
	b_condition VARCHAR(20),
	b_fileName  VARCHAR(50),
	PRIMARY KEY (b_id)
)default charset=utf8;

show tables;
desc bookinformation;
desc membershipInform;

drop table member;

insert into bookinformation values('1234','c++','robert',45000,'c언어 설명', '에이콘', '2015년10월11일', '컴퓨터', 11, 'New', '1056.jpg');
select * from bookinformation;

drop table bookinformation;


CREATE TABLE IF NOT EXISTS membershipInform(
	m_name VARCHAR(50),
	m_id VARCHAR(50) not null,
	m_pw VARCHAR(50),
	m_email VARCHAR(50),
	m_phone VARCHAR(50),
	m_address VARCHAR(30),
	PRIMARY KEY (m_id)
)default charset=utf8;


CREATE TABLE IF NOT EXISTS nonMembershipInform(
	nm_orderNum integer not null,
	nm_orderDate VARCHAR(50),
	nm_name VARCHAR(50),
	nm_phone varchar(50),
	nm_address varchar(100),
	nm_email VARCHAR(50),
	nm_pw varchar(50),
	PRIMARY KEY (nm_orderNum)
)default charset=utf8;


CREATE TABLE IF NOT EXISTS orderInform(
	o_orderNum integer not null,
	o_orderDate VARCHAR(50),
	o_count integer,
	o_total integer,
	PRIMARY KEY (o_orderNum)
)default charset=utf8;



CREATE TABLE IF NOT EXISTS csInform(
	cs_id integer not null,
	cs_title varchar(50),
	cs_userid varchar(50),
	cs_date VARCHAR(50),
	cs_content text,
	PRIMARY KEY (cs_id)
)default charset=utf8;

desc bookinformation;















