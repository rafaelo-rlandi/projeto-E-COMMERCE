
create database ecormmerce;
-- criando a base de dados que se usara 

use ecormmerce;



-- Tabela para armazenar vendedores terceiros.
CREATE TABLE Terceiro_Vendedor (
    idTerceiro_Vendedor INT AUTO_INCREMENT PRIMARY KEY,
    Razao_Social VARCHAR(45) NOT NULL,
    Local VARCHAR(45),
    TerceiroVendedorCNPJ CHAR(14) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- Comentários para a tabela Terceiro_Vendedor:
-- Linha 1: idTerceiro_Vendedor - Identificador único com incremento automático.
-- Linha 2: Razao_Social        - Armazena a razão social do vendedor.
-- Linha 3: Local               - Armazena a localização do vendedor.
-- Linha 4: TerceiroVendedorCNPJ- Armazena o CNPJ do vendedor (14 dígitos), garantindo exclusividade.


-- Tabela de Produtos.
CREATE TABLE Produto (
    idProduto INT AUTO_INCREMENT PRIMARY KEY,
    Categoria VARCHAR(45),
    Descricao VARCHAR(45),
    Valor DECIMAL(10,2)
) ENGINE=InnoDB;

-- Comentários para a tabela Produto:
-- Linha 1: idProduto  - Identificador único do produto.
-- Linha 2: Categoria  - Define a categoria à qual o produto pertence.
-- Linha 3: Descricao  - Fornece uma breve descrição do produto.
-- Linha 4: Valor      - Armazena o preço ou valor do produto com precisão decimal.


-- Tabela de Fornecedores.
CREATE TABLE Fornecedor (
    idFornecedor INT AUTO_INCREMENT PRIMARY KEY,
    FornecedorRazaoSocial VARCHAR(45),
    FornecedorCNPJ CHAR(14) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- Comentários para a tabela Fornecedor:
-- Linha 1: idFornecedor         - Identificador único do fornecedor.
-- Linha 2: FornecedorRazaoSocial- Armazena a razão social do fornecedor.
-- Linha 3: FornecedorCNPJ       - Armazena o CNPJ do fornecedor (14 dígitos), garantindo exclusividade.


-- Tabela de Estoque.
CREATE TABLE Estoque (
    idEstoque INT AUTO_INCREMENT PRIMARY KEY,
    Local VARCHAR(45)
) ENGINE=InnoDB;

-- Comentários para a tabela Estoque:
-- Linha 1: idEstoque - Identificador único do estoque.
-- Linha 2: Local     - Armazena o local ou endereço físico do estoque.


-- Tabela de clientes Pessoa Física.
CREATE TABLE Cliente_PF (
    idCliente_PF INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(45),
    CPF CHAR(11) NOT NULL UNIQUE,
    RG VARCHAR(12),
    Data_de_Nascimento DATE
) ENGINE=InnoDB;

-- Comentários para a tabela Cliente_PF:
-- Linha 1: idCliente_PF       - Identificador único da pessoa física.
-- Linha 2: Nome               - Armazena o nome completo do cliente.
-- Linha 3: CPF                - CPF, contendo 11 dígitos e sem duplicidade.
-- Linha 4: RG                 - RG do cliente.
-- Linha 5: Data_de_Nascimento - Data de nascimento registrada como DATE.


-- Tabela de clientes Pessoa Jurídica.
CREATE TABLE Cliente_PJ (
    idCliente_PJ INT AUTO_INCREMENT PRIMARY KEY,
    ClientePjCNPJ CHAR(14) NOT NULL UNIQUE,
    ClientePjRazaoSocial VARCHAR(45)
) ENGINE=InnoDB;

-- Comentários para a tabela Cliente_PJ:
-- Linha 1: idCliente_PJ       - Identificador único da pessoa jurídica.
-- Linha 2: ClientePjCNPJ      - Armazena o CNPJ do cliente PJ (14 dígitos), garantindo exclusividade.
-- Linha 3: ClientePjRazaoSocial- Armazena a razão social do cliente PJ.


-- Tabela de Entrega.
CREATE TABLE Entrega (
    idEntrega INT AUTO_INCREMENT PRIMARY KEY,
    Status ENUM('Cancelado','Em andamento','Concluido'),
    Codigo_de_Rastreio VARCHAR(45),
    Data_de_envio DATE,
    Data_prevista_de_entrega DATE,
    Data_de_entrega DATE,
    Avaliacao VARCHAR(45)
) ENGINE=InnoDB;

-- Comentários para a tabela Entrega:
-- Linha 1: idEntrega                - Identificador único da entrega.
-- Linha 2: Status                   - Define o status atual da entrega, utilizando ENUM.
-- Linha 3: Codigo_de_Rastreio       - Código que permite rastrear o pedido.
-- Linha 4: Data_de_envio            - Registra a data em que o pedido foi enviado.
-- Linha 5: Data_prevista_de_entrega - Indica a data prevista para a entrega.
-- Linha 6: Data_de_entrega          - Registra a data efetiva de entrega.
-- Linha 7: Avaliacao                - Armazena uma avaliação ou comentário sobre a entrega.


-- Tabela de Clientes (agrega informações para ambos os tipos: PF e PJ).
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    Endereco VARCHAR(45),
    Email VARCHAR(45),
    Telefone VARCHAR(45),
    Tipo ENUM('PJ', 'PF') NOT NULL,
    Cliente_PJ_idCliente_PJ INT DEFAULT NULL,
    Cliente_PF_idCliente_PF INT DEFAULT NULL,
    CONSTRAINT chk_cliente_tipo CHECK (
      (Tipo = 'PF' AND Cliente_PF_idCliente_PF IS NOT NULL AND Cliente_PJ_idCliente_PJ IS NULL)
      OR
      (Tipo = 'PJ' AND Cliente_PJ_idCliente_PJ IS NOT NULL AND Cliente_PF_idCliente_PF IS NULL)
    ),
    FOREIGN KEY (Cliente_PJ_idCliente_PJ) REFERENCES Cliente_PJ(idCliente_PJ),
    FOREIGN KEY (Cliente_PF_idCliente_PF) REFERENCES Cliente_PF(idCliente_PF)
) ENGINE=InnoDB;

-- Comentários para a tabela Cliente:
-- Linha 1: idCliente               - Identificador único do cliente.
-- Linha 2: Endereco                - Armazena o endereço do cliente.
-- Linha 3: Email                   - Armazena o e-mail do cliente.
-- Linha 4: Telefone                - Armazena o telefone de contato.
-- Linha 5: Tipo                    - Define se o cliente é 'PJ' ou 'PF'.
-- Linha 6: Cliente_PJ_idCliente_PJ - Referência obrigatória para PJ se Tipo = 'PJ'.
-- Linha 7: Cliente_PF_idCliente_PF - Referência obrigatória para PF se Tipo = 'PF'.
-- Linha 8: chk_cliente_tipo        - Constraint que valida que apenas um dos campos de referência esteja preenchido.
-- Linha 9: Chave estrangeira para Cliente_PJ.
-- Linha 10: Chave estrangeira para Cliente_PF.


-- Tabela de Pedidos.
CREATE TABLE Pedido (
    idPedido INT AUTO_INCREMENT PRIMARY KEY,
    Status_de_entrega VARCHAR(45),
    Descricao VARCHAR(45),
    Cliente_idCliente INT,
    Frete DECIMAL(10,2),
    Entrega_idEntrega INT,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (Entrega_idEntrega) REFERENCES Entrega(idEntrega)
) ENGINE=InnoDB;

-- Comentários para a tabela Pedido:
-- Linha 1: idPedido          - Identificador único do pedido.
-- Linha 2: Status_de_entrega - Indica o status atual da entrega do pedido.
-- Linha 3: Descricao         - Descrição ou observação sobre o pedido.
-- Linha 4: Cliente_idCliente - Referência ao cliente que efetuou o pedido.
-- Linha 5: Frete             - Armazena o valor do frete com precisão decimal.
-- Linha 6: Entrega_idEntrega - Referência à entrega associada.
-- Linha 7: Chave estrangeira para Cliente.
-- Linha 8: Chave estrangeira para Entrega.


-- Tabela de Formas de Pagamento.
CREATE TABLE Forma_de_pagamento (
    idForma_de_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    tipo ENUM('Boleto','Pix','Debito','Credito'),
    Comentarios VARCHAR(45),
    Forma_de_pagamento VARCHAR(45),
    Cliente_idCliente INT,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
) ENGINE=InnoDB;

-- Comentários para a tabela Forma_de_pagamento:
-- Linha 1: idForma_de_pagamento - Identificador único da forma de pagamento.
-- Linha 2: tipo                 - Define o tipo de pagamento, utilizando ENUM.
-- Linha 3: Comentarios          - Observações adicionais sobre a forma de pagamento.
-- Linha 4: Forma_de_pagamento   - Descrição da forma de pagamento.
-- Linha 5: Cliente_idCliente    - Referência ao cliente associado.
-- Linha 6: Chave estrangeira para Cliente.


-- Tabela para associar vendedores terceiros aos produtos.
CREATE TABLE Produtos_por_vendedor_Terceiros (
    Terceiro_idTerceiro_Vendedor INT,
    Produto_idProduto INT,
    PRIMARY KEY (Terceiro_idTerceiro_Vendedor, Produto_idProduto),
    FOREIGN KEY (Terceiro_idTerceiro_Vendedor) REFERENCES Terceiro_Vendedor(idTerceiro_Vendedor),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
) ENGINE=InnoDB;

-- Comentários para a tabela Produtos_por_vendedor_Terceiros:
-- Linha 1: Terceiro_idTerceiro_Vendedor - Referência ao vendedor terceiro.
-- Linha 2: Produto_idProduto            - Referência ao produto.
-- Linha 3: PRIMARY KEY composta pelos dois campos.
-- Linha 4: Chave estrangeira para Terceiro_Vendedor.
-- Linha 5: Chave estrangeira para Produto.


-- Tabela para associar produtos e fornecedores.
CREATE TABLE Disponibilizando_um_produto (
    Produto_idProduto INT,
    Fornecedor_idFornecedor INT,
    PRIMARY KEY (Produto_idProduto, Fornecedor_idFornecedor),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (Fornecedor_idFornecedor) REFERENCES Fornecedor(idFornecedor)
) ENGINE=InnoDB;

-- Comentários para a tabela Disponibilizando_um_produto:
-- Linha 1: Produto_idProduto      - Indica o produto disponível.
-- Linha 2: Fornecedor_idFornecedor - Indica o fornecedor que disponibiliza o produto.
-- Linha 3: PRIMARY KEY composta pelos dois campos.
-- Linha 4: Chave estrangeira para Produto.
-- Linha 5: Chave estrangeira para Fornecedor.


-- Tabela que relaciona produtos e estoques.
CREATE TABLE Produto_por_estoque (
    Estoque_idEstoque INT,
    Produto_idProduto INT,
    Quantidade INT,
    PRIMARY KEY (Estoque_idEstoque, Produto_idProduto),
    FOREIGN KEY (Estoque_idEstoque) REFERENCES Estoque(idEstoque),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto)
) ENGINE=InnoDB;

-- Comentários para a tabela Produto_por_estoque:
-- Linha 1: Estoque_idEstoque - Referência ao estoque.
-- Linha 2: Produto_idProduto - Referência ao produto.
-- Linha 3: Quantidade        - Número de unidades do produto no estoque.
-- Linha 4: PRIMARY KEY composta pelos campos de estoque e produto.
-- Linha 5: Chave estrangeira para Estoque.
-- Linha 6: Chave estrangeira para Produto.


-- Tabela que relaciona produtos e pedidos.
CREATE TABLE Relacao_de_produto_pedido (
    Produto_idProduto INT,
    Pedido_idPedido INT,
    Quantidade INT,
    PRIMARY KEY (Produto_idProduto, Pedido_idPedido),
    FOREIGN KEY (Produto_idProduto) REFERENCES Produto(idProduto),
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido)
) ENGINE=InnoDB;

-- Comentários para a tabela Relacao_de_produto_pedido:
-- Linha 1: Produto_idProduto - Referência ao produto.
-- Linha 2: Pedido_idPedido   - Referência ao pedido.
-- Linha 3: Quantidade        - Quantidade do produto no pedido.
-- Linha 4: PRIMARY KEY composta pelos campos de produto e pedido.
-- Linha 5: Chave estrangeira para Produto.
-- Linha 6: Chave estrangeira para Pedido.




