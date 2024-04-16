select * from clients c, orders o where c.idClient = o.idOrderClient;

-- recuperacao de pedido com produto associado
select * from clients c
			inner join orders o ON c.idClient = o.idOrderClient
            inner join productOrder p ON p.idPOorder = o.idOrder
		group by idClient ;
        
-- Recuperar quantos pedidos foram realizados pelos clientes
select c.idClient, Pname,count(*) as Number_of_orders from clients c
			inner join orders o ON c.idClient = o.idOrderClient
		group by idClient;


-- seleciona todos os cliente em que uma única compra gastaram mais do que R$ 1.200,00

select c.idClient,Pname,o.limitAvailable from clients c 
inner join orders p on c.idClient = p.idOrderClient
inner join payments o on p.idOrderClient=o.idclient
and o.limitAvailable > 1200.0;

-- todos os produtos que são vendidos na loja
select concat(Pname,' - ',category) as Nome_do_Produto, description,value from product order by Pname;

-- Todos os produtos fornecidos por determinados fornecedores

select f.idSupplier,socialName,f.Address from supplier as f
inner join productSeller as fp on f.idSupplier = fp.idPseller
inner join product as p on fp.idPproduct = p.idProduct order by f.idSupplier;

-- quantos produtos cada fornecedor fornece para a loja
select count(distinct(p.idProduct)) as quantidade_produto,f.idSupplier,
f.socialName,f.Address from supplier f inner join 
productsupplier ftp on f.idSupplier = ftp.idPsSupplier inner join 
product p on ftp.idPsProduct = p.idProduct group by f.idSupplier;


SELECT COUNT(idClient), Born FROM clients
GROUP BY Born
HAVING Born > "1951-12-22";