use restaurante;

CREATE VIEW resumo_pedido AS
SELECT 
    pedidos.id_pedidos,
    pedidos.quantidade,
    pedidos.data_pedido,
    cliente.nome as nomecliente,
    cliente.email,
    funcionarios.nome as nomefuncionario,
    produtos.nome as nomeproduto,
    produtos.preço
FROM pedidos
JOIN cliente ON pedidos.id_cliente = cliente.id_cliente
JOIN funcionarios ON pedidos.id_funcionario = funcionarios.id_funcionario
JOIN produtos ON pedidos.id_produto = produtos.id_produto;

SELECT 
    id_pedidos,
    nomecliente,
    (quantidade * preço) AS total
FROM 
    resumo_pedido;
    
explain
SELECT 
    id_pedidos,
    nomecliente,
    (quantidade * preço) AS total
FROM 
    resumo_pedido;
    
delimiter //
create function BuscaIngredientesProduto(id_produto int)
returns varchar(200)
reads sql data
begin
	declare lista_ingredientes varchar(200);
    select ingredientes into lista_ingredientes from info_produtos where info_produtos.id_produto = id_produto;
    return lista_ingredientes;
    end //
    
delimiter ;

SELECT BuscaIngredientesProduto(10);

delimiter //
create function mediaPedido(id_produtos int)
returns varchar(200)
reads sql data
begin
	declare media_total decimal(10, 2);
	declare total_pedido decimal(10, 2);
    declare mensagem varchar(50);
    
    select coalesce(avg(quantidade * preço), 0)
	into media_total from pedidos inner join produtos on pedidos.id_pedidos = produtos.id_produto;
    
    select coalesce(sum(quantidade * preço), 0)
    into total_pedido from pedidos inner join produtos on pedidos.id_pedidos = produtos.id_produto;
     
     if total_pedido > media_total then 
     set mensagem = 'Total do pedido é acima da média';
     ELSEIF total_pedido < media_total THEN
        SET mensagem = 'Total do pedido é abaixo da média';
    ELSE
        SET mensagem = 'Total do pedido é igual à média';
    END IF;

    RETURN mensagem;
    
end //
    
DELIMITER ;


SELECT mediaPedido(5);
SELECT mediaPedido(6);