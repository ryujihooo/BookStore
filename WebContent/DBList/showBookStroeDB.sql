create table membership(
	m_id varchar(10) not null,
	m_pw varchar(15) not null,
	m_name varchar(50) not null,
	m_email varchar(20) not null,
	m_phone varchar(15) not null,
	m_address varchar(100) not null,
	primary key (m_id)
)default charset=utf8;

show tables;

create table nonMembership(
	n_orderNum varchar(10) not null,
	n_orderDate date not null,
	n_name varchar(50) not null,
	n_phone varchar(15) not null,
	n_address varchar(100) not null,
	n_email varchar(20) not null,
	n_pw varchar(15) not null,
	primary key(n_email)
)default charset=utf8;

show tables;

create table bookOrder(
	o_orderNum varchar(10) not null,
	o_orderDate date not null,
	o_count int not null,
	o_totalPrice int not null,
	primary key(o_orderNum)
)default charset=utf8;


create table bookInformation(
	b_index int not null auto_increment,
	b_img varchar(20) not null,
	b_name varchar(50) not null,
	b_price int not null,
	b_author varchar(50) not null,
	b_publisher varchar(50) not null,
	b_information text,
	primary key(b_index)
)default charset=utf8;



show tables;