CREATE DATABASE IF NOT EXISTS bayerchallenge;
USE bayerchallenge;

CREATE TABLE ProeficienciaIdioma (
    proeficiencia_idioma_id INT PRIMARY KEY AUTO_INCREMENT, 
    descricao VARCHAR(50)
);

CREATE TABLE Idiomas (
    idioma_id INT AUTO_INCREMENT PRIMARY KEY, 
    descricao VARCHAR(50), 
    proeficiencia_idioma_id INT,
    FOREIGN KEY (proeficiencia_idioma_id)
    REFERENCES ProeficienciaIdioma(proeficiencia_idioma_id)
);



-- Testes de insercao
-- INSERT INTO ProeficienciaIdioma (descricao)  VALUES ('basico');
-- INSERT INTO ProeficienciaIdioma (descricao)  VALUES ('avancado');
-- INSERT INTO Idiomas (descricao, proeficiencia_idioma_id ) VALUES ('ingles', 1);