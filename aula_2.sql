/* AULA 2 CRIAÇÃO DE TABELA */

use informatica;

create table cliente(
	id_cliente int auto_increment primary key,
    nome varchar(255) not null,
    email varchar(100),
	data_nascimento date,
    limite_credito decimal(10,2),
    info_adicionais text,
    cadastro_ativo boolean default 1,
    id_produto int,
    unique (email)
);

create table produto (
	id_produto int
);

alter table produto add primary key (id_produto);

alter table cliente add foreign key (id_produto) references produto(id_produto);
