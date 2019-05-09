CREATE DATABASE IF NOT EXISTS bayerchallenge;
USE bayerchallenge;

CREATE TABLE PONTUACOES (
  pontuacao_id  INT   NOT NULL AUTO_INCREMENT,
  pontuacao_alcancada INT   NOT NULL,
  pontuacao_maxima INT  NOT NULL,
  PRIMARY KEY (pontuacao_id)
);

-- Testes de inserção no banco
--INSERT INTO PONTUACOES(pontuacao_alcancada, pontuacao_maxima) VALUES(49, 50);
--INSERT INTO PONTUACOES(pontuacao_alcancada, pontuacao_maxima) VALUES(50, 50);
--INSERT INTO PONTUACOES(pontuacao_alcancada, pontuacao_maxima) VALUES(15, 50);
