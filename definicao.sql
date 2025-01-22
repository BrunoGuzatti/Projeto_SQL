create database Restaurante;

use Restaurante;

create table Funcionarios(
	id_funcionario int auto_increment primary key,
	Nome varchar(255),
	CPF varchar(14),
	Data_nacimento date,
	Endereco varchar(255),
	Telefone varchar(15),
	Email varchar(100),
	Cargo varchar(100),
	Salario decimal(10, 2),
	Data_admissao date
);

create table Cliente(
	id_cliente int auto_increment primary key,
    Nome varchar(255),
    CPF varchar(14),
    Data_nascimento date,
    endereço varchar(255),
    telefone varchar(15),
    email varchar(100),
    Data_cadastro date
);

create table Produtos(
	id_produto int auto_increment primary key,
    nome varchar(255),
    descriao text,
    preço decimal(10, 2),
    categoria varchar(100)
);

create table Pedidos(
id_pedidos int auto_increment primary key,
id_cliente int,
foreign key (id_cliente) references Cliente (id_cliente),
id_funcionario int,
foreign key (id_funcionario) references Funcionarios (id_funcionario),
id_produto int,
foreign key (id_produto) references Produtos (id_produto),
quantidade int,
preco decimal(10, 2),
data_pedido date,
status varchar(50)
);

create table info_produtos(
id_info int auto_increment primary key,
id_produto int,
foreign key (id_produto) references Produtos (id_produto),
ingredientes text,
fornecedor varchar(255)
);