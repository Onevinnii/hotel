create database hotel;
create table nacionalidade(
sigla varchar (2),
nome varchar (50));

alter table nacionalidade add primary key(
sigla);

create table cliente(
cod_cli int,
nome_cli varchar(50),
telefone varchar(11),
sexo varchar(1),
cpf varchar(11),
passaporte varchar(8),
documento varchar (7));

alter table cliente add primary key(
cod_cli);

create table tem(
sigla varchar (2),
cod_cli int, 
foreign key(sigla) references nacionalidade (sigla),
foreign key (cod_cli) references cliente (cod_cli));

create table operadora(
cod_ope varchar (2) primary key,
nom_ope varchar (20));

create table tipo_quar(
cod_tipo_qua varchar (3) primary key,
desc_tipo varchar (3),
val_tipo_qua varchar (5));

create table quarto(
num_qua int primary key,
andar int,
cod_tipo_qua varchar (3),
foreign key (cod_tipo_qua) references tipo_quar (cod_tipo_qua));

create table reserva(
num_res varchar (2),
num_cartao varchar(16),
qta_dia varchar(2),
dat_res date,
dat_ini date,
_status bit(1),
cod_cli int,
cod_tipo_qua varchar(3),
cod_ope varchar (2),
foreign key (cod_cli) references cliente (cod_cli),
foreign key (cod_tipo_qua) references tipo_quar (cod_tipo_qua),
foreign key (cod_ope) references operadora (cod_ope));

alter table reserva add primary key (
num_res);


select * from nacionalidade;

insert into nacionalidade(
sigla,
nome) 
values
('BR','Brasil'),
('AF','Afeganistão');

select * from cliente;

insert into cliente(
cod_cli,
nome_cli,
telefone,
sexo,
cpf,
passaporte,
documento)
values
(001, 'Pedro', '81912345678', 'M', '70670670612', '12345678', '1237894'),
(002, 'Maria', '81912345678', 'F', '50270670612', '65445678', '9877894'),
(003, 'Felipeee', '81915875678', 'M', '98770670612', '42145678', '5247894');

select * from cliente;

update cliente set nome_cli = 'Felipe' where nome_cli = 'Felipeee';

delete from cliente where cod_cli = 3;

select * from reserva;

insert into reserva(
num_res,
num_cartao,
qta_dia,
dat_res,
dat_ini,
_status,
cod_cli,
cod_tipo_qua,
cod_ope)
values
('01', '7842546547852194', '4', '2023-05-05', '2023-05-08', 1, 001, '001', '99'),
('02', '9853146547854257', '3', '2023-01-07','2023-01-07', 1, 002, '002', '88');


select * from operadora;

insert into operadora(
cod_ope,
nom_ope)
values
('99', 'visa'),
('88', 'master');

select * from tipo_quar;

insert into tipo_quar(
cod_tipo_qua,
desc_tipo,
val_tipo_qua)
values
('001','fam','400'),
('002','sol','150');

select * from quarto;

insert into quarto(
num_qua,
andar,
cod_tipo_qua)
values
(12, 0,'001'),
(21, 1,'002');

select * from tem;

insert into tem(
sigla,
cod_cli)
values
('BR',001),
('AF',002);

select * from reserva;

select * from cliente;

select cliente.cod_cli,
cliente.nome_cli as nome,
cliente.telefone,
cliente.sexo,
cliente.cpf,
cliente.passaporte,
cliente.documento as rg,
reserva.num_res as numero_da_reserva,
reserva.num_cartao as numero_cartao,
reserva.qta_dia as quantidade_dia,
reserva.dat_res as data_reserva,
reserva.dat_ini as data_inicio,
reserva._status,
cod_tipo_qua as codigo_tipo_quarto,
cod_ope as codigo_operadora
from cliente
inner join reserva
on cliente.cod_cli = reserva.cod_cli;

