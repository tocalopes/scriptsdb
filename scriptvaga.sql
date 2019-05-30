CREATE DATABASE IF NOT EXISTS bayerchallenge;
USE bayerchallenge;

CREATE TABLE VAGAS (
    vaga_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo  VARCHAR(200) NOT NULL,
    descricao TEXT NOT NULL,
    data_max_submissao DATE NOT NULL,
);
