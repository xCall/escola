\connect postgres;

DROP DATABASE IF EXISTS academico;

CREATE DATABASE academico;

\connect academico;

CREATE TABLE aluno(
  id_aluno SERIAL NOT NULL,
  nome_aluno VARCHAR(50) NOT NULL,
  cpf CHAR(11),
  data_nascimento DATE,
  media FLOAT DEFAULT 0.0,
  CONSTRAINT aluno_pk PRIMARY KEY (id_aluno),
  CONSTRAINT aluno_cpf_key UNIQUE (cpf)
);

CREATE TABLE professor (
  id_professor INT NOT NULL,
  nome_professor VARCHAR(50) NOT NULL,
  sobrenome VARCHAR(50) NOT NULL,
  area VARCHAR(20),
  CONSTRAINT professor_pk PRIMARY KEY (id_professor)
);


CREATE TABLE disciplina(
  id_disciplina INT NOT NULL,
  nome_disciplina VARCHAR(30) NOT NULL,
  carga_horaria INT NOT NULL,
  id_professor INT,
  CONSTRAINT disciplina_pk PRIMARY KEY (id_disciplina),
  CONSTRAINT disciplina_fk_professor FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);

CREATE TABLE matriculado(
  id_disciplina INT NOT NULL,
  id_aluno INT NOT NULL,
  nota FLOAT,
  CONSTRAINT matriculado_pk PRIMARY KEY (id_disciplina, id_aluno),
  CONSTRAINT matriculado_fk_aluno FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
  CONSTRAINT matriculado_fk_disciplina FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina)
);

INSERT INTO aluno(id_aluno, nome_aluno, cpf, data_nascimento, media) VALUES
(1, 'José',  '11111111111', '1990-01-20', 85.0),
(2, 'João',  NULL,          '1993-09-10', 84.8),
(3, 'Maria', '33333333333', '1989-05-15', 66.9),
(4, 'Ana',   '44444444444', '1992-04-21', 70.5);

INSERT INTO professor(id_professor, nome_professor, sobrenome, area) VALUES
(10, 'Roberto', 'Silva',   'Computação'),
(20, 'Carlos',  'Alves',   'Administração'),
(30, 'José',    'Teodoro', 'Matemática'),
(40, 'Rodrigo', 'Martins', 'Engenharia');

INSERT INTO disciplina(id_disciplina, nome_disciplina, carga_horaria, id_professor) VALUES
(100, 'Algoritmos',       80, 10),
(200, 'Banco de Dados',   80, 10),
(300, 'Cálculo',          60, 20),
(400, 'Álgebra',          60, 20),
(500, 'Empreendedorismo', 40, 30),
(600, 'Redes',            80, NULL);

INSERT INTO matriculado(id_disciplina, id_aluno, nota) VALUES
(100, 1, 89.5),
(200, 1, 78.0),
(300, 1, 90.0),
(400, 1, 82.5),
(100, 2, 88.7),
(200, 2, 81.0),
(400, 2, 77.5),
(500, 2, 92.0),
(100, 3, 72.5),
(200, 3, 52.8),
(400, 3, 83.3),
(100, 4, 71.0),
(200, 4, 70.0),
(300, 3, 59.0);
