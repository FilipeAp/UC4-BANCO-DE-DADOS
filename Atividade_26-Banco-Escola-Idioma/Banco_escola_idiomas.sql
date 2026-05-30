CREATE DATABASE Banco_escola_idiomas;
USE Banco_escola_idiomas;

CREATE TABLE Aluno (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cpf VARCHAR(14) UNIQUE,
    data_nascimento DATE,
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco VARCHAR(200)
);

CREATE TABLE Professor (
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    cpf VARCHAR(14) UNIQUE,
    email VARCHAR(100),
    telefone VARCHAR(20),
    especialidade VARCHAR(100),
    data_contratacao DATE
);

CREATE TABLE Curso (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    idioma VARCHAR(50),
    nivel VARCHAR(50),
    carga_horaria INT,
    material VARCHAR(100)
);

CREATE TABLE Unidade (
    id_unidade INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    endereco VARCHAR(200),
    cidade VARCHAR(100),
    estado VARCHAR(50),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE Turma (
    id_turma INT PRIMARY KEY AUTO_INCREMENT,
    id_curso INT,
    id_professor INT,
    id_unidade INT,
    horario TIME,
    dias_semana VARCHAR(100),
    sala VARCHAR(20),
    vagas INT,

    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso),
    FOREIGN KEY (id_professor) REFERENCES Professor(id_professor),
    FOREIGN KEY (id_unidade) REFERENCES Unidade(id_unidade)
);

CREATE TABLE Matricula (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    id_turma INT,
    data_matricula DATE,
    status VARCHAR(30),

    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_turma) REFERENCES Turma(id_turma)
);

CREATE TABLE Aula (
    id_aula INT PRIMARY KEY AUTO_INCREMENT,
    id_turma INT,
    data_aula DATE,
    conteudo TEXT,

    FOREIGN KEY (id_turma) REFERENCES Turma(id_turma)
);

CREATE TABLE Nota (
    id_nota INT PRIMARY KEY AUTO_INCREMENT,
    id_matricula INT,
    nota1 DECIMAL(5,2),
    nota2 DECIMAL(5,2),
    media DECIMAL(5,2),

    FOREIGN KEY (id_matricula) REFERENCES Matricula(id_matricula)
);

CREATE TABLE Frequencia (
    id_frequencia INT PRIMARY KEY AUTO_INCREMENT,
    id_matricula INT,
    id_aula INT,
    presente BOOLEAN,

    FOREIGN KEY (id_matricula) REFERENCES Matricula(id_matricula),
    FOREIGN KEY (id_aula) REFERENCES Aula(id_aula)
);