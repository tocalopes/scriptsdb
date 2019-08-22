CREATE DATABASE IF NOT EXISTS bayerchallenge;
USE bayerchallenge;

CREATE TABLE `curriculo`
(
  `curriculo_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `curso_extra_id` int,
  `experiencia_id` int,
  `formacao_id` int,
  `idioma_id` int,
  `obj_profissional` varchar(30) NOT NULL,
  `resumo` textarea,
  `candidato_id` int,
  `created_at` timestamp DEFAULT NOW()
);

CREATE TABLE `candidato`
(
  `candidato_id` int,
  `nome` varchar(30),
  `ìdade` int,
  `endereco_id` int,  
  `email` varchar(30),
  `telefone_residencial` int,
  `telefone_celular` int,
  `created_at` timestamp DEFAULT NOW()
)

CREATE TABLE `formacao`
(
  `formacao_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `instituicao` varchar(50),
  `curso` varchar(50) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_termino` date NOT NULL,
  `em_curso` boolean NOT NULL,
  `media` float,
  `created_at` timestamp DEFAULT NOW()
);

CREATE TABLE `idioma`
(
  `idioma_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `idioma` varchar(50) NOT NULL,
  `proficiencia_id` int,
  `created_at` timestamp DEFAULT NOW()
);

CREATE TABLE `proficiencia`
(
  `proficiencia_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nivel_fala` varchar(50) NOT NULL,
  `nivel_leitura` varchar(50) NOT NULL,
  `nivel_escrita` varchar(50) NOT NULL,
  `created_at` timestamp DEFAULT NOW()
);

CREATE TABLE `endereco`
(
  `endereco_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `cep` varchar(50) NOT NULL,
  `rua_e_numero` varchar(80) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `pais` varchar(120) NOT NULL,
  `realocar` boolean,
  `created_at` timestamp DEFAULT NOW()
);

CREATE TABLE `experiencia_anterior`
(
  `experiencia_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `cargo` varchar(45) NOT NULL,
  `empresa` varchar(45) NOT NULL,
  `atual` tinyint(1) DEFAULT null,
  `entrada` date NOT NULL,
  `saida` datetime DEFAULT NULL,
  `created_at` timestamp DEFAULT NOW()
);

CREATE TABLE `curso_extra`
(
  `curso_extra_id` int(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `instituicao` varchar(45) NOT NULL,
  `inicio` date NOT NULL,
  `duracao` int(10) NOT NULL,
  `atual` tinyint(1) DEFAULT NULL,
  `descricao` mediumtext,
  `created_at` timestamp DEFAULT NOW()
);

ALTER TABLE `curriculo` ADD FOREIGN KEY (`formacao_id`) REFERENCES `formacao` (`formacao_id`);

ALTER TABLE `curriculo` ADD FOREIGN KEY (`idioma_id`) REFERENCES `idioma` (`idioma_id`);

ALTER TABLE `curriculo` ADD FOREIGN KEY (`candidato_id`) REFERENCES `candidato` (`candidato_id`);

ALTER TABLE `idioma` ADD FOREIGN KEY (`proficiencia_id`) REFERENCES `proficiencia` (`proficiencia_id`);

ALTER TABLE `curriculo` ADD FOREIGN KEY (`endereco_id`) REFERENCES `endereco` (`endereco_id`);

ALTER TABLE `curriculo` ADD FOREIGN KEY (`experiencia_id`) REFERENCES `experiencia_anterior` (`experiencia_id`);

ALTER TABLE `curriculo` ADD FOREIGN KEY (`curso_extra_id`) REFERENCES `curso_extra` (`curso_extra_id`);
