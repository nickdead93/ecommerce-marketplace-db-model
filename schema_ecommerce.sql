CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    tipo_pessoa VARCHAR, 
    nome_razao VARCHAR,
    documento VARCHAR 
);

CREATE TABLE Pagamento (
    id_pagamento INT PRIMARY KEY,
    id_cliente INT,
    tipo_pagamento VARCHAR, 
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Produto (
    id_produto INT PRIMARY KEY,
    nome VARCHAR,
    valor_unitario DECIMAL
);

CREATE TABLE Fornecedor (
    id_fornecedor INT PRIMARY KEY,
    razao_social VARCHAR,
    cnpj VARCHAR
);

CREATE TABLE Vendedor_Terceiro (
    id_vendedor INT PRIMARY KEY,
    razao_social VARCHAR,
    cnpj VARCHAR
);

CREATE TABLE Produto_Fornecedor (
    id_produto INT,
    id_fornecedor INT,
    PRIMARY KEY (id_produto, id_fornecedor),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto),
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(id_fornecedor)
);

CREATE TABLE Estoque (
    id_estoque INT PRIMARY KEY,
    localizacao VARCHAR
);

CREATE TABLE Produto_Estoque (
    id_produto INT,
    id_estoque INT,
    quantidade INT,
    PRIMARY KEY (id_produto, id_estoque),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto),
    FOREIGN KEY (id_estoque) REFERENCES Estoque(id_estoque)
);

CREATE TABLE Pedido (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    status_pedido VARCHAR,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Pedido_Item (
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    PRIMARY KEY (id_pedido, id_produto),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

CREATE TABLE Entrega (
    id_entrega INT PRIMARY KEY,
    id_pedido INT,
    status_entrega VARCHAR,
    codigo_rastreio VARCHAR,
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);
