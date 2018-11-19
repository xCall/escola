
CREATE SEQUENCE cidade_id_cidade_seq;

CREATE TABLE cidade (
                id_cidade INTEGER NOT NULL DEFAULT nextval('cidade_id_cidade_seq'),
                den_cidade VARCHAR(100) NOT NULL,
                uf CHAR(2) NOT NULL,
                CONSTRAINT cidade_pk PRIMARY KEY (id_cidade)
);


ALTER SEQUENCE cidade_id_cidade_seq OWNED BY cidade.id_cidade;

CREATE SEQUENCE produto_id_produto_seq;

CREATE TABLE produto (
                id_produto BIGINT NOT NULL DEFAULT nextval('produto_id_produto_seq'),
                den_produto VARCHAR(100) NOT NULL,
                unidade CHAR(3) NOT NULL,
                estoque REAL NOT NULL,
                preco_atual NUMERIC(12,2) NOT NULL,
                CONSTRAINT produto_pk PRIMARY KEY (id_produto)
);


ALTER SEQUENCE produto_id_produto_seq OWNED BY produto.id_produto;

CREATE SEQUENCE fornecedor_id_fornecedor_seq;

CREATE TABLE fornecedor (
                id_fornecedor BIGINT NOT NULL DEFAULT nextval('fornecedor_id_fornecedor_seq'),
                den_fornecedor VARCHAR NOT NULL,
                telefone VARCHAR(15) NOT NULL,
                endereco VARCHAR(100) NOT NULL,
                id_cidade INTEGER NOT NULL,
                CONSTRAINT fornecedor_pk PRIMARY KEY (id_fornecedor)
);


ALTER SEQUENCE fornecedor_id_fornecedor_seq OWNED BY fornecedor.id_fornecedor;

CREATE SEQUENCE compra_id_compra_seq;

CREATE TABLE compra (
                id_compra BIGINT NOT NULL DEFAULT nextval('compra_id_compra_seq'),
                data DATE NOT NULL,
                id_fornecedor BIGINT NOT NULL,
                valor_total NUMERIC(12,2) NOT NULL,
                CONSTRAINT compra_pk PRIMARY KEY (id_compra)
);


ALTER SEQUENCE compra_id_compra_seq OWNED BY compra.id_compra;

CREATE SEQUENCE conta_pagar_id_conta_pagar_seq;

CREATE TABLE conta_pagar (
                id_conta_pagar BIGINT NOT NULL DEFAULT nextval('conta_pagar_id_conta_pagar_seq'),
                id_compra BIGINT NOT NULL,
                id_fornecedor BIGINT NOT NULL,
                valor NUMERIC(12,2) NOT NULL,
                juros NUMERIC(12,2) NOT NULL,
                data_vencimento DATE NOT NULL,
                data_pagamento DATE,
                pago CHAR(1) NOT NULL,
                CONSTRAINT conta_pagar_pk PRIMARY KEY (id_conta_pagar)
);


ALTER SEQUENCE conta_pagar_id_conta_pagar_seq OWNED BY conta_pagar.id_conta_pagar;

CREATE TABLE compra_produto (
                id_produto BIGINT NOT NULL,
                id_compra BIGINT NOT NULL,
                quantidade REAL NOT NULL,
                valor NUMERIC(12,2),
                CONSTRAINT compra_produto_pk PRIMARY KEY (id_produto, id_compra)
);


CREATE SEQUENCE cliente_id_cliente_seq;

CREATE TABLE cliente (
                id_cliente BIGINT NOT NULL DEFAULT nextval('cliente_id_cliente_seq'),
                den_cliente VARCHAR(100) NOT NULL,
                telefone VARCHAR(15),
                endereco VARCHAR(100) NOT NULL,
                id_cidade INTEGER NOT NULL,
                CONSTRAINT cliente_pk PRIMARY KEY (id_cliente)
);


ALTER SEQUENCE cliente_id_cliente_seq OWNED BY cliente.id_cliente;

CREATE SEQUENCE venda_id_venda_seq;

CREATE TABLE venda (
                id_venda BIGINT NOT NULL DEFAULT nextval('venda_id_venda_seq'),
                id_cliente BIGINT NOT NULL,
                data DATE NOT NULL,
                valor_total NUMERIC(12,2) NOT NULL,
                CONSTRAINT venda_pk PRIMARY KEY (id_venda)
);


ALTER SEQUENCE venda_id_venda_seq OWNED BY venda.id_venda;

CREATE SEQUENCE conta_receber_id_conta_receber_seq;

CREATE TABLE conta_receber (
                id_conta_receber BIGINT NOT NULL DEFAULT nextval('conta_receber_id_conta_receber_seq'),
                id_cliente BIGINT NOT NULL,
                id_venda BIGINT NOT NULL,
                valor NUMERIC(12,2) NOT NULL,
                juros NUMERIC(12,2) NOT NULL,
                data_vencimento DATE NOT NULL,
                data_pagamento DATE,
                pago CHAR(1) NOT NULL,
                CONSTRAINT conta_receber_pk PRIMARY KEY (id_conta_receber)
);


ALTER SEQUENCE conta_receber_id_conta_receber_seq OWNED BY conta_receber.id_conta_receber;

CREATE TABLE venda_produto (
                id_venda BIGINT NOT NULL,
                id_produto BIGINT NOT NULL,
                quantidade REAL NOT NULL,
                valor NUMERIC(12,2) NOT NULL,
                CONSTRAINT venda_produto_pk PRIMARY KEY (id_venda, id_produto)
);


ALTER TABLE fornecedor ADD CONSTRAINT cidade_fornecedor_fk
FOREIGN KEY (id_cidade)
REFERENCES cidade (id_cidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE cliente ADD CONSTRAINT cidade_cliente_fk
FOREIGN KEY (id_cidade)
REFERENCES cidade (id_cidade)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE compra_produto ADD CONSTRAINT produto_compra_itens_fk
FOREIGN KEY (id_produto)
REFERENCES produto (id_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE venda_produto ADD CONSTRAINT produto_venda_produto_fk
FOREIGN KEY (id_produto)
REFERENCES produto (id_produto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE compra ADD CONSTRAINT fornecedor_fk
FOREIGN KEY (id_fornecedor)
REFERENCES fornecedor (id_fornecedor)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE conta_pagar ADD CONSTRAINT fornecedor_conta_pagar_fk
FOREIGN KEY (id_fornecedor)
REFERENCES fornecedor (id_fornecedor)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE compra_produto ADD CONSTRAINT compra_compra_itens_fk
FOREIGN KEY (id_compra)
REFERENCES compra (id_compra)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE conta_pagar ADD CONSTRAINT compra_conta_pagar_fk
FOREIGN KEY (id_compra)
REFERENCES compra (id_compra)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE venda ADD CONSTRAINT cliente_fk
FOREIGN KEY (id_cliente)
REFERENCES cliente (id_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE conta_receber ADD CONSTRAINT cliente_contas_receber_fk
FOREIGN KEY (id_cliente)
REFERENCES cliente (id_cliente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE venda_produto ADD CONSTRAINT pedido_fk
FOREIGN KEY (id_venda)
REFERENCES venda (id_venda)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE conta_receber ADD CONSTRAINT venda_contas_receber_fk
FOREIGN KEY (id_venda)
REFERENCES venda (id_venda)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
