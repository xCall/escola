-- Apaga as tabelas e sequências do banco caso existam
DROP TABLE IF EXISTS matriculado;

DROP TABLE IF EXISTS disciplina;

DROP TABLE IF EXISTS professor;

DROP TABLE IF EXISTS aluno;

-- Crie as tabelas
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
