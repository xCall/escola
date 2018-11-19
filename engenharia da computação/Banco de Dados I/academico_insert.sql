-- Apaga os dados existentes
DELETE FROM matriculado;
DELETE FROM disciplina;
DELETE FROM professor;
DELETE FROM aluno;

-- Insere os dados na tabela aluno
INSERT INTO aluno(id_aluno, nome_aluno, cpf, data_nascimento, media) VALUES
(1, 'José' , '11111111111', '1990-01-20', 85),
(2, 'João' , null         , '1993-09-10', 84.8),
(3, 'Maria', '33333333333', '1989-05-15', 66.9),
(4, 'Ana'  , '44444444444', '1992-04-21', 70.5);

-- Reinicia as sequências
ALTER SEQUENCE aluno_id_aluno_seq RESTART WITH 5;

-- Insere os dados na tabela professor
INSERT INTO professor(id_professor, nome_professor, sobrenome, area) VALUES
(10, 'Roberto', 'Silva'  , 'Computação'),
(20, 'Carlos' , 'Alves'  , 'Matemática'),
(30, 'José'   , 'Teodoro', 'Administração'),
(40, 'Rodrigo', 'Martins', 'Engenharia');

-- Insere os dados na tabela disciplina
INSERT INTO disciplina(id_disciplina, nome_disciplina, carga_horaria, id_professor) VALUES
(100, 'Algoritmos'      , 80, 10),
(200, 'Banco de Dados'  , 80, 10),
(300, 'Cálculo'         , 60, 20),
(400, 'Álgebra'         , 60, 20),
(500, 'Empreendedorismo', 40, 30),
(600, 'Redes'           , 80, null);

-- Insere os dados na tabela matriculado
INSERT INTO matriculado(id_disciplina, id_aluno, nota) VALUES
(100, 1, 89.5),
(200, 1,   78),
(300, 1,   90),
(400, 1, 82.5),
(100, 2, 88.7),
(200, 2,   81),
(400, 2, 77.5),
(500, 2,   92),
(100, 3, 72.5),
(200, 3, 52.8),
(400, 3, 83.3),
(100, 4,   71),
(200, 4,   70),
(300, 3,   59);
