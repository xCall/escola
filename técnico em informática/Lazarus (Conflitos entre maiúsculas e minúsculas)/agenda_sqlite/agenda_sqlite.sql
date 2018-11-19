-- Tabela categoria
CREATE TABLE IF NOT EXISTS categoria (
  id_categoria INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  den_categoria VARCHAR(30) NOT NULL
);

-- Tabela cidade
CREATE TABLE IF NOT EXISTS cidade (
  id_cidade INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  den_cidade VARCHAR(60) NOT NULL,
  uf CHAR(2) NOT NULL
);

-- Tabela contato
CREATE TABLE IF NOT EXISTS contato (
  id_contato INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  nome_contato VARCHAR(70) NOT NULL,
  data_nascimento DATE,
  endereco VARCHAR(70),
  bairro VARCHAR(30),
  id_categoria INTEGER NOT NULL,
  id_cidade INTEGER NOT NULL,
  CONSTRAINT fk_contato_categoria
    FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria),
  CONSTRAINT fk_contato_cidade
    FOREIGN KEY (id_cidade) REFERENCES cidade (id_cidade)
);

-- Table telefone
CREATE TABLE IF NOT EXISTS telefone (
  id_contato INTEGER NOT NULL,
  telefone VARCHAR(15) NOT NULL,
  observacao VARCHAR(30),
  PRIMARY KEY (telefone, id_contato),
  CONSTRAINT fk_telefone_contato
    FOREIGN KEY (id_contato) REFERENCES contato (id_contato)
);

INSERT INTO categoria(den_categoria) VALUES
('Pessoal'),
('Profissional');

INSERT INTO cidade(den_cidade, uf) VALUES
('Bambuí', 'MG'),
('Medeiros', 'MG'),
('Tapiraí', 'MG'),
('Córrego Danta', 'MG');

INSERT INTO contato(nome_contato, data_nascimento, endereco, bairro, id_categoria, id_cidade) VALUES
('José',  '1990-01-02', NULL, NULL, 1, 1),
('Maria', '1992-03-02', 'Rua dos Bobos, 0', NULL, 2, 2),
('João',  '1989-09-25', NULL, NULL, 1, 3);

INSERT INTO telefone(id_contato, telefone, observacao) VALUES
(1, '1111-1111', 'Residencial'),
(1, '2222-1111', 'Celular'),
(2, '3333-3333', NULL),
(2, '4444-4444', NULL),
(2, '5555-5555', NULL);
