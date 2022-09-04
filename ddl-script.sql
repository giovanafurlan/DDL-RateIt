/*
drop table t_rate_turma_conta;
drop table t_rate_avaliacao_diaria;
drop table t_rate_curso_materia;
drop table t_rate_turma;
drop table t_rate_materia;
drop table t_rate_curso;
drop table t_rate_conta;
drop table t_rate_instituicao;
*/

create table t_rate_instituicao (	
	cd_instituicao number(10,0) primary key, 
	ds_plano varchar(50), 
	nm_instituicao varchar(150) not null unique, 
	nr_cnpj varchar(18) not null unique,
	ds_token varchar(6) not null unique
);

create table t_rate_conta (
	cd_conta number(10,0) primary key,
	nm_conta varchar(150) not null,
	ds_email varchar(150) not null unique,
	ds_senha varchar(150) not null,
	ds_documento varchar(150) not null,
	dt_nascimento date not null, 
	st_conta number(1,0) not null,
	ds_tipo_conta varchar(1) not null,
	cd_instituicao references t_rate_instituicao
);

create table t_rate_materia(
	cd_materia number(10,0) primary key, 
	ds_materia varchar2(200) not null, 
	nm_materia varchar2(50) not null
);

create table t_rate_curso(
	cd_curso number(10,0) primary key, 
	nm_curso varchar2(50 char) not null, 
	nm_periodo number(10,0) not null
);

create table t_rate_turma(
	cd_turma number(10,0) primary key, 
	nm_turma varchar(50) not null, 
	cd_curso references t_rate_curso
);

create table t_rate_avaliacao_diaria(
	cd_avaliacao_diaria number(10,0) primary key, 
	ds_avaliacao varchar(255) not null, 
	dt_avaliacao date not null, 
	nr_estrela number(10,0) not null, 
	cd_conta references t_rate_conta,
	cd_materia references t_rate_materia
);

create table t_rate_turma_conta(
	cd_turma_conta number(10,0) primary key,
	cd_conta references t_rate_conta,
	cd_turma references t_rate_turma
);

create table t_rate_curso_materia(
	cd_curso_materia number(10,0) primary key, 
	cd_curso references t_rate_curso,
	cd_materia references t_rate_materia
);