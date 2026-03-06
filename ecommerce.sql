-- Criar banco
CREATE DATABASE ecommerce;
USE ecommerce;

-- Tabela cliente
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    tipo_cliente ENUM('PF','PJ'),
    cpf VARCHAR(14),
    cnpj VARCHAR(18)
);

-- Tabela produto
CREATE TABLE produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10,2)
);

-- Tabela pedido
CREATE TABLE pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- Tabela fornecedor
CREATE TABLE fornecedor (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100)
);

-- Tabela estoque
CREATE TABLE estoque (
    id_estoque INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    quantidade INT,
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

-- Tabela pagamento
CREATE TABLE pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    tipo VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- Tabela entrega
CREATE TABLE entrega (
    id_entrega INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    status VARCHAR(50),
    codigo_rastreio VARCHAR(50),
    FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido)
);

-- Inserindo clientes
INSERT INTO cliente (nome, tipo_cliente, cpf)
VALUES
('Ana', 'PF', '12345678900'),
('Empresa X', 'PJ', NULL);

-- Inserindo produtos
INSERT INTO produto (nome, preco)
VALUES
('Notebook', 3500),
('Mouse', 80);

-- Inserindo pedidos
INSERT INTO pedido (id_cliente, data_pedido)
VALUES
(1, '2024-01-10'),
(2, '2024-01-11');

-- Consultas

-- SELECT simples
SELECT * FROM cliente;

-- WHERE
SELECT * FROM produto
WHERE preco > 100;

-- ORDER BY
SELECT * FROM produto
ORDER BY preco DESC;

-- JOIN
SELECT cliente.nome, pedido.id_pedido
FROM cliente
JOIN pedido
ON cliente.id_cliente = pedido.id_cliente;

-- HAVING
SELECT id_cliente, COUNT(*) AS total_pedidos
FROM pedido
GROUP BY id_cliente
HAVING COUNT(*) > 0;