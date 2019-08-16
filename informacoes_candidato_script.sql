CREATE DATABASE IF NOT EXISTS bayerchallenge;
USE bayerchallenge;

CREATE TABLE `curriculo`
(
  `curriculo_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `curso_extra_id` int,
  `experiencia_id` int,
  `formacao_id` int,
  `idioma_id` int,
  `endereco_id` int,
  `obj_profissional` varchar(30) NOT NULL,
  `created_at` timestamp DEFAULT 'now()'
);

CREATE TABLE `formacao`
(
  `formacao_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `campus_id` int,
  `curso` varchar(50) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_termino` date NOT NULL,
  `em_curso` boolean NOT NULL,
  `media` float
);

CREATE TABLE `instituicao`
(
  `instituicao_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL
);

CREATE TABLE `localidade`
(
  `localidade_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `cidade` varchar(50) NOT NULL,
  `pais` varchar(50) NOT NULL
);

CREATE TABLE `campus`
(
  `campus_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `instituicao_id` int,
  `localidade_id` int
);

CREATE TABLE `idioma`
(
  `idioma_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `idioma` varchar(50) NOT NULL,
  `proficiencia_id` int
);

CREATE TABLE `proficiencia`
(
  `proficiencia_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nivel_fala` varchar(50) NOT NULL,
  `nivel_leitura` varchar(50) NOT NULL,
  `nivel_escrita` varchar(50) NOT NULL
);

CREATE TABLE `endereco`
(
  `endereco_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `cep` varchar(50) NOT NULL,
  `rua_e_numero` varchar(80) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `pais` varchar(120) NOT NULL,
  `realocar` boolean
);

CREATE TABLE `experiencia`
(
  `experiencia_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `cargo` varchar(45) NOT NULL,
  `empresa` varchar(45) NOT NULL,
  `atual` tinyint(1) DEFAULT null,
  `entrada` date NOT NULL,
  `saida` datetime DEFAULT NULL
);

CREATE TABLE `curso_extra`
(
  `curso_extra_id` int(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `instituicao` varchar(45) NOT NULL,
  `inicio` date NOT NULL,
  `duracao` int(10) NOT NULL,
  `atual` tinyint(1) DEFAULT NULL,
  `descricao` mediumtext
);

ALTER TABLE `curriculo` ADD FOREIGN KEY (`formacao_id`) REFERENCES `formacao` (`formacao_id`);

ALTER TABLE `campus` ADD FOREIGN KEY (`instituicao_id`) REFERENCES `instituicao` (`instituicao_id`);

ALTER TABLE `campus` ADD FOREIGN KEY (`localidade_id`) REFERENCES `localidade` (`localidade_id`);

ALTER TABLE `formacao` ADD FOREIGN KEY (`campus_id`) REFERENCES `campus` (`campus_id`);

ALTER TABLE `curriculo` ADD FOREIGN KEY (`idioma_id`) REFERENCES `idioma` (`idioma_id`);

ALTER TABLE `idioma` ADD FOREIGN KEY (`proficiencia_id`) REFERENCES `proficiencia` (`proficiencia_id`);

ALTER TABLE `curriculo` ADD FOREIGN KEY (`endereco_id`) REFERENCES `endereco` (`endereco_id`);

ALTER TABLE `curriculo` ADD FOREIGN KEY (`experiencia_id`) REFERENCES `experiencias` (`experiencia_id`);

ALTER TABLE `curriculo` ADD FOREIGN KEY (`curso_extra_id`) REFERENCES `cursos_extras` (`curso_extra_id`);
