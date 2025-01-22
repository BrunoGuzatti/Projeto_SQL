use restaurante;

select produtos.id_produto, produtos.nome, produtos.descriao, info_produtos.ingredientes
from produtos
inner join info_produtos
on produtos.id_produto = info_produtos.id_produto;

select pedidos.id_produto, pedidos.quantidade, pedidos.data_pedido, cliente.Nome, cliente.email
from pedidos
inner join cliente
on pedidos.id_cliente = cliente.id_cliente;

select pedidos.id_cliente, pedidos.quantidade, pedidos.data_pedido, cliente.nome, cliente.email, funcionarios.Nome, produtos.nome, produtos.preço
from pedidos
inner join cliente on cliente.id_cliente = pedidos.id_cliente
inner join funcionarios on funcionarios.id_funcionario = pedidos.id_funcionario
inner join produtos on produtos.id_produto = pedidos.id_pedidos;

select cliente.id_cliente, pedidos.id_pedidos, pedidos.status
from cliente
inner join pedidos on cliente.id_cliente = pedidos.id_cliente
where pedidos.status = 'pendente'
order by id_pedidos desc;

select cliente.id_cliente, pedidos.id_pedidos
from cliente
inner join pedidos on cliente.id_cliente = pedidos.id_cliente
where pedidos.id_pedidos is null;

select cliente.Nome, count(pedidos.id_pedidos) as total_pedidos
from cliente
left join pedidos on cliente.id_cliente = pedidos.id_cliente
group by cliente.id_cliente, cliente.Nome;

select pedidos.id_pedidos, sum(pedidos.quantidade * produtos.preço) as preco_total
from pedidos
inner join produtos on pedidos.id_produto = produtos.id_produto
group by pedidos.id_pedidos;