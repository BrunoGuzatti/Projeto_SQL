use restaurante;

select count(quantidade) from pedidos;

select count(distinct id_cliente) from pedidos;

select avg (preço) from produtos;

select max(preço) from produtos;
select min(preço) from produtos;

select distinct nome, preço, dense_rank() over (order by preço desc) as ranking_preço from produtos limit 5;

select categoria, avg (preço) as media_preco from produtos group by categoria;

select * from info_produtos;
select fornecedor, count(*) as quantidade_de_produtos from info_produtos group by fornecedor order by quantidade_de_produtos;

select fornecedor, count(*) from info_produtos group by fornecedor having count(*) > 1;

select id_cliente, count(*) from pedidos group by id_cliente having count(*) < 2;