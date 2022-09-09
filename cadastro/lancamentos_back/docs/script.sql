drop database if exists lancamentos;
create database lancamentos charset=UTF8 collate utf8_general_ci;
use lancamentos;

create table debitos(
 e_lancamento integer not null primary key,
 datas date not null,
 descricao varchar(100) not null,
 valor varchar(10) not null,
 tipo varchar(1) not null
);

describe debitos;

show tables;

LOAD DATA INFILE 'C:/Users/Felipe Canizela/Desktop/cadastro/lancamentos_back/docs/lancamentos.csv'
INTO TABLE debitos
FIELDS TERMINATED BY ';'
ENCLOSE BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

select * from debitos;

create view vw_debitos as
select * from debitos where tipo = "C"

create view vw_credito as
select * from debitos where tipo = "D"

select * from vw_debitos;
select * from vw_credito;