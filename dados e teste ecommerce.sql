-- Use o banco de dados ecormmerce
USE ecormmerce;

-------------------------------------------------------------------------------
-- 1. Tabela: Terceiro_Vendedor (vendedores terceiros)
-------------------------------------------------------------------------------
INSERT INTO Terceiro_Vendedor (Razao_Social, Local, TerceiroVendedorCNPJ)
VALUES
  ('Vendedor 1', 'São Paulo', '11111111111111'),
  ('Vendedor 2', 'Rio de Janeiro', '22222222222222'),
  ('Vendedor 3', 'Belo Horizonte', '33333333333333'),
  ('Vendedor 4', 'Fortaleza', '44444444444444'),
  ('Vendedor 5', 'Porto Alegre', '55555555555555'),
  ('Vendedor 6', 'Recife', '66666666666666'),
  ('Vendedor 7', 'Curitiba', '77777777777777'),
  ('Vendedor 8', 'Salvador', '88888888888888'),
  ('Vendedor 9', 'Brasília', '99999999999999'),
  ('Vendedor 10', 'Campinas', '10101010101010');

-------------------------------------------------------------------------------
-- 2. Tabela: Produto
-------------------------------------------------------------------------------
INSERT INTO Produto (Categoria, Descricao, Valor)
VALUES
  ('Eletrônicos', 'Smartphone A', 1200.00),
  ('Eletrônicos', 'Notebook B', 2500.00),
  ('Eletrodomésticos', 'Geladeira C', 1800.00),
  ('Móveis', 'Cadeira D', 150.00),
  ('Móveis', 'Mesa E', 300.00),
  ('Vestuário', 'Camiseta F', 50.00),
  ('Vestuário', 'Calça G', 100.00),
  ('Livros', 'Livro H', 45.00),
  ('Esportes', 'Bicicleta I', 900.00),
  ('Acessórios', 'Relógio J', 350.00);

-------------------------------------------------------------------------------
-- 3. Tabela: Fornecedor
-------------------------------------------------------------------------------
INSERT INTO Fornecedor (FornecedorRazaoSocial, FornecedorCNPJ)
VALUES
  ('Fornecedor 1 LTDA', '10101010101010'),
  ('Fornecedor 2 LTDA', '20202020202020'),
  ('Fornecedor 3 LTDA', '30303030303030'),
  ('Fornecedor 4 LTDA', '40404040404040'),
  ('Fornecedor 5 LTDA', '50505050505050'),
  ('Fornecedor 6 LTDA', '60606060606060'),
  ('Fornecedor 7 LTDA', '70707070707070'),
  ('Fornecedor 8 LTDA', '80808080808080'),
  ('Fornecedor 9 LTDA', '90909090909090'),
  ('Fornecedor 10 LTDA', '01010101010101');

-------------------------------------------------------------------------------
-- 4. Tabela: Estoque
-------------------------------------------------------------------------------
INSERT INTO Estoque (Local)
VALUES
  ('Estoque Central'),
  ('Depósito Norte'),
  ('Depósito Sul'),
  ('Depósito Leste'),
  ('Depósito Oeste'),
  ('Armazém 1'),
  ('Armazém 2'),
  ('Almoxarifado A'),
  ('Almoxarifado B'),
  ('Centro de Distribuição');

-------------------------------------------------------------------------------
-- 5. Tabela: Cliente_PF (Clientes Pessoa Física)
-------------------------------------------------------------------------------
INSERT INTO Cliente_PF (Nome, CPF, RG, Data_de_Nascimento)
VALUES
  ('João Silva',      '11111111111', 'RG0000000001', '1980-01-01'),
  ('Maria Souza',     '22222222222', 'RG0000000002', '1985-02-02'),
  ('Carlos Pereira',  '33333333333', 'RG0000000003', '1975-03-03'),
  ('Ana Costa',       '44444444444', 'RG0000000004', '1990-04-04'),
  ('Paulo Oliveira',  '55555555555', 'RG0000000005', '1982-05-05'),
  ('Mariana Lima',    '66666666666', 'RG0000000006', '1995-06-06'),
  ('Ricardo Alves',   '77777777777', 'RG0000000007', '1988-07-07'),
  ('Fernanda Rocha',  '88888888888', 'RG0000000008', '1992-08-08'),
  ('Luiz Machado',    '99999999999', 'RG0000000009', '1978-09-09'),
  ('Sofia Martins',   '10101010101', 'RG0000000010', '1999-10-10');

-------------------------------------------------------------------------------
-- 6. Tabela: Cliente_PJ (Clientes Pessoa Jurídica)
-------------------------------------------------------------------------------
INSERT INTO Cliente_PJ (ClientePjCNPJ, ClientePjRazaoSocial)
VALUES
  ('10000000000001', 'Empresa A Ltda'),
  ('10000000000002', 'Empresa B Ltda'),
  ('10000000000003', 'Empresa C Ltda'),
  ('10000000000004', 'Empresa D Ltda'),
  ('10000000000005', 'Empresa E Ltda'),
  ('10000000000006', 'Empresa F Ltda'),
  ('10000000000007', 'Empresa G Ltda'),
  ('10000000000008', 'Empresa H Ltda'),
  ('10000000000009', 'Empresa I Ltda'),
  ('10000000000010', 'Empresa J Ltda');

-------------------------------------------------------------------------------
-- 7. Tabela: Entrega
-------------------------------------------------------------------------------
INSERT INTO Entrega (Status, Codigo_de_Rastreio, Data_de_envio, Data_prevista_de_entrega, Data_de_entrega, Avaliacao)
VALUES
  ('Em andamento', 'TRK0001', '2025-01-01', '2025-01-05', NULL, NULL),
  ('Concluido',    'TRK0002', '2025-01-02', '2025-01-06', '2025-01-06', 'Bom'),
  ('Cancelado',    'TRK0003', '2025-01-03', '2025-01-07', NULL, 'Cliente desistiu'),
  ('Em andamento', 'TRK0004', '2025-01-04', '2025-01-08', NULL, NULL),
  ('Concluido',    'TRK0005', '2025-01-05', '2025-01-09', '2025-01-09', 'Ótimo'),
  ('Em andamento', 'TRK0006', '2025-01-06', '2025-01-10', NULL, NULL),
  ('Concluido',    'TRK0007', '2025-01-07', '2025-01-11', '2025-01-11', 'Excelente'),
  ('Cancelado',    'TRK0008', '2025-01-08', '2025-01-12', NULL, 'Problemas logísticos'),
  ('Em andamento', 'TRK0009', '2025-01-09', '2025-01-13', NULL, NULL),
  ('Concluido',    'TRK0010', '2025-01-10', '2025-01-14', '2025-01-14', 'Satisfatório');

-------------------------------------------------------------------------------
-- 8. Tabela: Cliente (agrega registros PF e PJ)
-------------------------------------------------------------------------------
-- Inserindo 5 clientes PF (Tipo 'PF') e 5 clientes PJ (Tipo 'PJ')
INSERT INTO Cliente (Endereco, Email, Telefone, Tipo, Cliente_PF_idCliente_PF, Cliente_PJ_idCliente_PJ)
VALUES
  -- Clientes PF (referência: Cliente_PF com id de 1 a 5)
  ('Rua 1, nº 10', 'pf1@exemplo.com', '1111111111', 'PF', 1, NULL),
  ('Rua 2, nº 20', 'pf2@exemplo.com', '2222222222', 'PF', 2, NULL),
  ('Rua 3, nº 30', 'pf3@exemplo.com', '3333333333', 'PF', 3, NULL),
  ('Rua 4, nº 40', 'pf4@exemplo.com', '4444444444', 'PF', 4, NULL),
  ('Rua 5, nº 50', 'pf5@exemplo.com', '5555555555', 'PF', 5, NULL),
  -- Clientes PJ (referência: Cliente_PJ com id de 1 a 5)
  ('Av. 1, nº 100', 'pj1@exemplo.com', '6666666666', 'PJ', NULL, 1),
  ('Av. 2, nº 200', 'pj2@exemplo.com', '7777777777', 'PJ', NULL, 2),
  ('Av. 3, nº 300', 'pj3@exemplo.com', '8888888888', 'PJ', NULL, 3),
  ('Av. 4, nº 400', 'pj4@exemplo.com', '9999999999', 'PJ', NULL, 4),
  ('Av. 5, nº 500', 'pj5@exemplo.com', '1010101010', 'PJ', NULL, 5);

-------------------------------------------------------------------------------
-- 9. Tabela: Pedido
-------------------------------------------------------------------------------
INSERT INTO Pedido (Status_de_entrega, Descricao, Cliente_idCliente, Frete, Entrega_idEntrega)
VALUES
  ('Em entrega', 'Pedido 1 - Smartphone', 1, 20.00, 1),
  ('Concluido',  'Pedido 2 - Notebook',   2, 30.00, 2),
  ('Cancelado',  'Pedido 3 - Geladeira',   3, 40.00, 3),
  ('Em entrega', 'Pedido 4 - Cadeira',      4, 15.00, 4),
  ('Concluido',  'Pedido 5 - Mesa',         5, 25.00, 5),
  ('Em entrega', 'Pedido 6 - Camiseta',     6, 10.00, 6),
  ('Concluido',  'Pedido 7 - Calça',        7, 12.00, 7),
  ('Cancelado',  'Pedido 8 - Livro',        8,  8.00, 8),
  ('Em entrega', 'Pedido 9 - Bicicleta',    9, 50.00, 9),
  ('Concluido',  'Pedido 10 - Relógio',    10, 18.00, 10);

-------------------------------------------------------------------------------
-- 10. Tabela: Forma_de_pagamento
-------------------------------------------------------------------------------
INSERT INTO Forma_de_pagamento (tipo, Comentarios, Forma_de_pagamento, Cliente_idCliente)
VALUES
  ('Pix',     'Pagamento instantâneo',      'Chave PIX 1',   1),
  ('Credito', 'Parcelado em 3x',            'Cartão de crédito 2',  2),
  ('Debito',  'Pagamento à vista',          'Cartão de débito 3',   3),
  ('Boleto',  'Pagamento com boleto',       'Boleto bancário 4',    4),
  ('Pix',     'Pagamento instantâneo',      'Chave PIX 5',   5),
  ('Credito', 'Parcelado em 2x',            'Cartão de crédito 6',  6),
  ('Debito',  'Pagamento à vista',          'Cartão de débito 7',   7),
  ('Boleto',  'Pagamento com boleto',       'Boleto bancário 8',    8),
  ('Pix',     'Pagamento instantâneo',      'Chave PIX 9',   9),
  ('Credito', 'Parcelado em 4x',            'Cartão de crédito 10', 10);

-------------------------------------------------------------------------------
-- 11. Tabela: Produtos_por_vendedor_Terceiros
-------------------------------------------------------------------------------
INSERT INTO Produtos_por_vendedor_Terceiros (Terceiro_idTerceiro_Vendedor, Produto_idProduto)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9),
  (10, 10);

-------------------------------------------------------------------------------
-- 12. Tabela: Disponibilizando_um_produto
-------------------------------------------------------------------------------
INSERT INTO Disponibilizando_um_produto (Produto_idProduto, Fornecedor_idFornecedor)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9),
  (10, 10);

-------------------------------------------------------------------------------
-- 13. Tabela: Produto_por_estoque
-------------------------------------------------------------------------------
INSERT INTO Produto_por_estoque (Estoque_idEstoque, Produto_idProduto, Quantidade)
VALUES
  (1, 1, 10),
  (2, 2, 20),
  (3, 3, 30),
  (4, 4, 40),
  (5, 5, 50),
  (6, 6, 60),
  (7, 7, 70),
  (8, 8, 80),
  (9, 9, 90),
  (10, 10, 100);

-------------------------------------------------------------------------------
-- 14. Tabela: Relacao_de_produto_pedido
-------------------------------------------------------------------------------
INSERT INTO Relacao_de_produto_pedido (Produto_idProduto, Pedido_idPedido, Quantidade)
VALUES
  (1, 1, 1),
  (2, 2, 2),
  (3, 3, 1),
  (4, 4, 3),
  (5, 5, 1),
  (6, 6, 2),
  (7, 7, 1),
  (8, 8, 4),
  (9, 9, 1),
  (10, 10, 2);



-- textes

USE ecormmerce;

-- 1. Quantos pedidos foram feitos por cada cliente?
SELECT c.idCliente,
       c.Email,
       COUNT(p.idPedido) AS Total_Pedidos
FROM Cliente c
LEFT JOIN Pedido p ON c.idCliente = p.Cliente_idCliente
GROUP BY c.idCliente, c.Email;
-- Legenda:
-- Esta consulta retorna o identificador e o e-mail de cada cliente,
-- juntamente com a contagem total de pedidos que ele realizou.
-- O LEFT JOIN garante que clientes sem pedidos também sejam listados.

--------------------------------------------------

-- 2. Algum vendedor também é fornecedor?
SELECT tv.Razao_Social AS Vendedor,
       f.FornecedorRazaoSocial AS Fornecedor,
       tv.TerceiroVendedorCNPJ
FROM Terceiro_Vendedor tv
INNER JOIN Fornecedor f ON tv.TerceiroVendedorCNPJ = f.FornecedorCNPJ;
-- Legenda:
-- Esta consulta verifica se há vendedores cujo CNPJ também consta na
-- tabela de fornecedores, ou seja, se algum vendedor (na tabela Terceiro_Vendedor)
-- atua também como fornecedor (na tabela Fornecedor).

--------------------------------------------------

-- 3. Relação de produtos, fornecedores e estoques
SELECT 
    p.Descricao AS Produto,
    f.FornecedorRazaoSocial AS Fornecedor,
    f.FornecedorCNPJ AS Fornecedor_CNPJ,
    e.Local AS Estoque,
    ppe.Quantidade
FROM Produto p
JOIN Disponibilizando_um_produto dup ON p.idProduto = dup.Produto_idProduto
JOIN Fornecedor f ON dup.Fornecedor_idFornecedor = f.idFornecedor
JOIN Produto_por_estoque ppe ON p.idProduto = ppe.Produto_idProduto
JOIN Estoque e ON ppe.Estoque_idEstoque = e.idEstoque;
-- Legenda:
-- Esta consulta relaciona as informações dos produtos com seus respectivos
-- fornecedores e estoques. Exibe, para cada produto, a descrição, o nome do fornecedor,
-- o CNPJ do fornecedor, o local do estoque e a quantidade disponível.

--------------------------------------------------

-- 4. Relação de nomes dos fornecedores e nomes dos produtos
SELECT 
    f.FornecedorRazaoSocial AS Fornecedor,
    p.Descricao AS Produto
FROM Disponibilizando_um_produto dup
JOIN Fornecedor f ON dup.Fornecedor_idFornecedor = f.idFornecedor
JOIN Produto p ON dup.Produto_idProduto = p.idProduto;
-- Legenda:
-- Esta consulta lista, para cada associação encontrada na tabela 
-- Disponibilizando_um_produto, o nome do fornecedor (razão social) e a
-- descrição do produto correspondente.
