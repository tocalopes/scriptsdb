CREATE DATABASE IF NOT EXISTS bayerchallenge;
USE bayerchallenge;

DROP TABLE IF EXISTS `curriculo`;
CREATE TABLE `curriculo`
(
  `curriculo_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `candidato_id` int,
  `curso_extra_id` int,
  `experiencia_id` int,
  `formacao_id` int,
  `idioma_id` int,
  `objetivo_profissional` varchar(30) NOT NULL,
  `expectativa_salario` decimal(10,2),
  `resumo` tinytext NOT NULL,
  `created_at` timestamp DEFAULT NOW()
);

DROP TABLE IF EXISTS `candidato`;
CREATE TABLE `candidato`
(
  `candidato_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nome` varchar(30),
  `ìdade` int,
  `endereco_id` int,  
  `email` varchar(30),
  `telefone_residencial` int,
  `telefone_celular` int,
  `created_at` timestamp DEFAULT NOW()
);

DROP TABLE IF EXISTS `formacao_academica`;
CREATE TABLE `formacao_academica`
(
  `formacao_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `instituicao` varchar(50),
  `nome_curso` varchar(50) NOT NULL,
  `situacao` varchar(45) NOT NULL,
  `nivel` varchar(45) NOT NULL,
  `created_at` timestamp DEFAULT NOW()
);

DROP TABLE IF EXISTS `idioma`;
CREATE TABLE `idioma`
(
  `idioma_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `idioma` varchar(50) NOT NULL,
  `created_at` timestamp DEFAULT NOW()
);

DROP TABLE IF EXISTS `proficiencia`;
CREATE TABLE `proficiencia`
(
  `proficiencia_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nivel_fala` varchar(50) NOT NULL,
  `nivel_leitura` varchar(50) NOT NULL,
  `nivel_escrita` varchar(50) NOT NULL,
  `created_at` timestamp DEFAULT NOW()
);

DROP TABLE IF EXISTS `proficiencia_idioma`;
CREATE TABLE `proficiencia_idioma`
(
  `proficiencia_id` int NOT NULL,
  `idioma_id` int NOT NULL,
  `created_at` timestamp DEFAULT NOW()
);

DROP TABLE IF EXISTS `endereco`;
CREATE TABLE `endereco`
(
  `endereco_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `cep` varchar(50) NOT NULL,
  `rua` varchar(80) NOT NULL,
  `numero` int NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `realocar` boolean,
  `created_at` timestamp DEFAULT NOW()
);

DROP TABLE IF EXISTS `experiencia_anterior`;
CREATE TABLE `experiencia_anterior`
(
  `experiencia_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `cargo` varchar(45) NOT NULL,
  `empresa` varchar(45) NOT NULL,
  `emprego_atual` tinyint(1) DEFAULT null,
  `entrada` date NOT NULL,
  `saida` datetime DEFAULT NULL,
  `principais_atividades` mediumtext,
  `salario` decimal(10,2),
  `created_at` timestamp DEFAULT NOW()
);

DROP TABLE IF EXISTS `curso_extra_curricular`;
CREATE TABLE `curso_extra_curricular`
(
  `curso_extra_id` int(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `instituicao` varchar(45) NOT NULL,
  `data_inicial` date NOT NULL,
  `duracao` varchar(45) NOT NULL,
  `situacao` varchar(45) NOT NULL,
  `descricao` mediumtext,
  `created_at` timestamp DEFAULT NOW()
);

ALTER TABLE `curriculo` ADD FOREIGN KEY (`formacao_id`) REFERENCES `formacao_academica` (`formacao_id`);

ALTER TABLE `curriculo` ADD FOREIGN KEY (`idioma_id`) REFERENCES `idioma` (`idioma_id`);

ALTER TABLE `curriculo` ADD FOREIGN KEY (`candidato_id`) REFERENCES `candidato` (`candidato_id`);

ALTER TABLE `candidato` ADD FOREIGN KEY (`endereco_id`) REFERENCES `endereco` (`endereco_id`);

ALTER TABLE `curriculo` ADD FOREIGN KEY (`experiencia_id`) REFERENCES `experiencia_anterior` (`experiencia_id`);

ALTER TABLE `curriculo` ADD FOREIGN KEY (`curso_extra_id`) REFERENCES `curso_extra_curricular` (`curso_extra_id`);
