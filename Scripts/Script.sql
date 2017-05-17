create table tbl_attach(
	pno int not null,
	fullName varchar(150) not null,
	regdate timestamp default now(),
	primary key(pno)
);

alter table tbl_attach add constraint fk_board_attach
foreign key(bno) references tbl_board(bno);

select * from tbl_attach;

drop table tbl_attach;