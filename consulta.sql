use restaurante;

select nome, categoria from produtos where preço > 30;

select nome, telefone, Data_nascimento from cliente where Data_nascimento < 1985;

select id_produto, ingredientes from info_produtos where ingredientes like 'carne%';

select nome, categoria from produtos order by categoria, nome;

select nome, preço from produtos order by preço desc limit 5;

select nome, categoria from produtos limit 2 offset 9;

create table backup_pedidos as select * from pedidos;