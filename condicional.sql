use restaurante;

select * from pedidos
where id_funcionario = 4 and status = 'pendente';

select * from pedidos
where not status = 'concluido';

select * from pedidos
where id_produto in (1, 3, 5, 7, 8);

select * from cliente
where nome like 'c%';


select * from produtos
where descriao like '%carne%' or descriao like '%frango%';

select * from produtos
where preço between 20 and 30;

select * from pedidos;

select id_pedidos, status from pedidos;

update pedidos
set status = null
where id_pedidos = 6;

select * from pedidos
where status is null;

select * from pedidos;
select id_pedidos, status, ifnull(status, 'cancelado')  from pedidos;

select nome, cargo, salario from funcionarios;

select nome, cargo, salario, if(salario> 3000, 'Acima da média' , 'Abaixo da média') as media_salario from funcionarios;