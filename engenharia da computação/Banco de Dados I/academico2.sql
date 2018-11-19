-- Apaga o banco de dados
\c postgres;

DROP DATABASE IF EXISTS academico2;

CREATE DATABASE academico2;

\c academico2;

-- Apaga as tabelas e sequências do banco caso existam
DROP TABLE IF EXISTS matriculado CASCADE;

DROP TABLE IF EXISTS disciplina CASCADE;

DROP TABLE IF EXISTS professor CASCADE;

DROP TABLE IF EXISTS aluno CASCADE;

-- Crie as tabelas
CREATE TABLE aluno(
  id_aluno SERIAL NOT NULL,
  nome_aluno VARCHAR(80) NOT NULL,
  cpf CHAR(11),
  data_nascimento DATE,
  media FLOAT DEFAULT 0.0,
  CONSTRAINT aluno_pk PRIMARY KEY (id_aluno),
  CONSTRAINT aluno_cpf_key UNIQUE (cpf)
);

CREATE TABLE professor (
  id_professor INT NOT NULL,
  nome_professor VARCHAR(80) NOT NULL,
  sobrenome VARCHAR(80) NOT NULL,
  area VARCHAR(50),
  CONSTRAINT professor_pk PRIMARY KEY (id_professor)
);

CREATE TABLE disciplina(
  id_disciplina INT NOT NULL,
  nome_disciplina VARCHAR(100) NOT NULL,
  carga_horaria INT NOT NULL,
  id_professor INT,
  id_prerequisito INT,
  media FLOAT,
  CONSTRAINT disciplina_pk PRIMARY KEY (id_disciplina),
  CONSTRAINT disciplina_fk_professor FOREIGN KEY (id_professor) REFERENCES professor(id_professor),
  CONSTRAINT disciplina_fk_disciplina FOREIGN KEY (id_prerequisito) REFERENCES disciplina(id_disciplina)
);

CREATE TABLE matriculado(
  id_disciplina INT NOT NULL,
  id_aluno INT NOT NULL,
  nota FLOAT,
  CONSTRAINT matriculado_pk PRIMARY KEY (id_disciplina, id_aluno),
  CONSTRAINT matriculado_fk_aluno FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
  CONSTRAINT matriculado_fk_disciplina FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina)
);

-- Apaga os dados existentes
DELETE FROM matriculado;
DELETE FROM disciplina;
DELETE FROM professor;
DELETE FROM aluno;

-- Reinicia as sequências
ALTER SEQUENCE aluno_id_aluno_seq RESTART;

-- Insere os dados na tabela aluno
INSERT INTO aluno(nome_aluno, cpf, data_nascimento, media) VALUES
('José' , '11111111111', '1990-01-20', 70.5),
('João' , NULl         , '1993-09-10', 85),
('Maria', '33333333333', '1989-05-15', 66.9),
('Ana'  , '44444444444', '1992-04-21', 84.8);

-- Insere os dados na tabela professor
INSERT INTO professor(id_professor, nome_professor, sobrenome, area) VALUES
(10, 'Roberto', 'Silva'  , 'Computação'),
(20, 'Carlos' , 'Alves'  , 'Matemática'),
(30, 'José'   , 'Teodoro', 'Administração'),
(40, 'Rodrigo', 'Martins', 'Engenharia');

-- Insere os dados na tabela disciplina
INSERT INTO disciplina(id_disciplina, nome_disciplina, carga_horaria, id_professor, id_prerequisito) VALUES
( 100, 'Algoritmos I'                         , 80, 10, null),
( 200, 'Banco de Dados I'                     , 80, 10, null),
( 300, 'Cálculo I'                            , 60, 20, null),
( 400, 'Álgebra'                            , 60, 20, null),
( 500, 'Empreendedorismo'                   , 40, 30, null),
( 600, 'Redes'                              , 80, null, null),
( 700, 'Algoritmos II'                      , 80, null, 100),
( 800, 'Banco de Dados II'                  , 80, null, 200),
( 900, 'Programação Orientada a Objetos I'  , 80, null, 100),
(1000, 'Programação Orientada a Objetos II' , 80, null, 900),
(1100, 'Programação Orientada a Objetos III' , 80, null, 1000);

-- Insere os dados na tabela matriculado
INSERT INTO matriculado(id_disciplina, id_aluno, nota) VALUES
(100, 1, 89.5),
(100, 2, 88.7),
(100, 3, 72.5),
(100, 4,   71),
(200, 1,   78),
(200, 2,   81),
(200, 3, 52.8),
(200, 4,   70),
(300, 1,   90),
(300, 2,   -1),
(300, 3,   59),
(400, 1, 82.5),
(400, 2, 77.5),
(400, 3, 83.3),
(500, 2,   92),
(500, 3,   -1);
