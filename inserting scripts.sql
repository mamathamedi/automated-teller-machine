----insert records into tables
insert into  hw8_customer (customer_pk,first_name,last_name,pin) 
values(1,'Jiaoyu','Guo','1234');
insert into  hw8_customer (customer_pk,first_name,last_name,pin) 
values(2,'Takk','Yamaguchi','2345');
insert into  hw8_customer (customer_pk,first_name,last_name,pin) 
values(3,'Yuxiao','Huo','3456');
insert into  hw8_customer (customer_pk,first_name,last_name,pin) 
values(4,'Jingyu','Tian','4567');
insert into  hw8_customer (customer_pk,first_name,last_name,pin) 
values(5,'Zhiwei','Qiao','5678');
select * from hw8_customer;

INSERT INTO hw8_account_type (account_type_pk,account_type) 
values (1,'checking_account');
INSERT INTO hw8_account_type (account_type_pk,account_type) 
values (2,'saving_account');
select * from hw8_account_type;


insert into hw8_account (account_pk,balance,account_type_fk,customer_fk)
values (1,5000, 2,1);
insert into hw8_account (account_pk,balance,account_type_fk,customer_fk)
values (2,6000, 2,2);
insert into hw8_account (account_pk,balance,account_type_fk,customer_fk)
values (6,7070, 4,2);
insert into hw8_account (account_pk,balance,account_type_fk,customer_fk)
values (4,8000, 2,4);
insert into hw8_account (account_pk,balance,account_type_fk,customer_fk)
values (5,9000, 2,5);
select * from hw8_account;



insert into hw8_transaction(transaction_pk, customer_fk, pin, account_fk, amount, type)
values(1,25,'2222',2,7500,'Withdraw');
insert into hw8_transaction(transaction_pk, customer_fk, pin, account_fk, amount, type)
values(2,1,'3456',2,7500,'Withdraw');
insert into hw8_transaction(transaction_pk, customer_fk, pin, account_fk, amount, type)
values(7,1,'1234',5,7550,'Withdraw');
insert into hw8_transaction(transaction_pk, customer_fk, pin, account_fk, amount, type)
values(4,1,'1234',1,7500,'Withdraw');
insert into hw8_transaction(transaction_pk, customer_fk, pin, account_fk, amount, type)
values(5,1,'1234',1,500,'Withdraw');
insert into hw8_transaction(transaction_pk, customer_fk, pin, account_fk, amount, type)
values(6,2,'2345',2,100,'Deposit');
insert into hw8_transaction(transaction_pk, customer_fk, pin, account_fk, amount, type)
values(7,2,'2345',2,500,'Withdraw');
insert into hw8_transaction(transaction_pk, customer_fk, pin, account_fk, amount, type)
values(8,3,'3456',3,-500,'Deposit');
insert into hw8_transaction(transaction_pk, customer_fk, pin, account_fk, amount, type)
values(9,3,'3456',3,-500,'Withdraw');
insert into hw8_transaction(transaction_pk, customer_fk, pin, account_fk, amount, type)
values(10,4,'4567',4,500,'Withdraw');
insert into hw8_transaction(transaction_pk, customer_fk, pin, account_fk, amount, type)
values(11,4,'4567',2,500,'Deposit');
insert into hw8_transaction(transaction_pk, customer_fk, pin, account_fk, amount, type)
values(12,5,'5678',5,14000,'Withdraw');
insert into hw8_transaction(transaction_pk, customer_fk, pin, account_fk, amount, type)
values(13,5,'5678',5,350,'Deposit');

insert into hw8_transaction(transaction_pk, customer_fk, pin, account_fk, amount, type)
values(14,6,'5678',5,350,'Deposit');
select * from hw8_transaction;

