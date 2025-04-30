CREATE DATABASE agendamento;
USE agendamento;

CREATE TABLE professores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    curso VARCHAR(100) -- Opcional
);

CREATE TABLE espacos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(70) NOT NULL,
    tipo VARCHAR(50) NOT NULL
);

CREATE TABLE equipamentos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    descricao TEXT,
    quantidade INT NOT NULL
);

CREATE TABLE agendamentos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    professor_id INT NOT NULL,
    espaco_id INT NOT NULL,
    dia DATE NOT NULL,
    hora_inicio TIME NULL,
    hora_fim TIME NULL,
    observacoes TEXT NULL,
    FOREIGN KEY (professor_id) REFERENCES professores(id),
    FOREIGN KEY (espaco_id) REFERENCES espacos(id)
);

CREATE TABLE agendamento_equipamentos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    agendamento_id INT NOT NULL,
    equipamento_id INT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (agendamento_id) REFERENCES agendamentos(id),
    FOREIGN KEY (equipamento_id) REFERENCES equipamentos(id)
);

CREATE TABLE admins (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(100) NOT NULL
);
