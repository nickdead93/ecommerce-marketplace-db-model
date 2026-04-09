-- 1. Quantos pedidos foram feitos por cada cliente?
SELECT c.nome_razao AS Cliente, c.tipo_pessoa AS Categoria, COUNT(p.id_pedido) AS Total_Pedidos
FROM Cliente c
LEFT JOIN Pedido p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nome_razao, c.tipo_pessoa
ORDER BY Total_Pedidos DESC;

-- 2. Algum vendedor também é fornecedor? (Compliance)
SELECT v.razao_social AS Nome_Vendedor, f.razao_social AS Nome_Fornecedor, v.cnpj AS CNPJ_Compartilhado
FROM Vendedor_Terceiro v
INNER JOIN Fornecedor f ON v.cnpj = f.cnpj;

-- 3. Relação de produtos, fornecedores e estoques (Supply Chain)
SELECT prod.nome AS Produto, f.razao_social AS Fornecedor, e.localizacao AS Centro_Distribuicao, pe.quantidade AS Saldo_Estoque
FROM Produto prod
INNER JOIN Produto_Fornecedor pf ON prod.id_produto = pf.id_produto
INNER JOIN Fornecedor f ON pf.id_fornecedor = f.id_fornecedor
INNER JOIN Produto_Estoque pe ON prod.id_produto = pe.id_produto
INNER JOIN Estoque e ON pe.id_estoque = e.id_estoque
ORDER BY pe.quantidade DESC;

-- 4. Faturamento por Pedido filtrando os de Alto Valor (Ticket Médio Alto)
SELECT p.id_pedido, c.nome_razao AS Cliente, SUM(pi.quantidade * prod.valor_unitario) AS Valor_Total_Pedido
FROM Pedido p
INNER JOIN Cliente c ON p.id_cliente = c.id_cliente
INNER JOIN Pedido_Item pi ON p.id_pedido = pi.id_pedido
INNER JOIN Produto prod ON pi.id_produto = prod.id_produto
GROUP BY p.id_pedido, c.nome_razao
HAVING Valor_Total_Pedido > 1000.00 
ORDER BY Valor_Total_Pedido DESC;
