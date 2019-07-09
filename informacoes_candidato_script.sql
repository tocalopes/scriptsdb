CREATE TABLE `curriculos`
(
  `curriculos_id` int PRIMARY KEY NOT NULL,
  `curso_extra_id` int,
  `experiencia_id` int,
  `formacao_id` int,
  `idioma_id` int,
  `endereco_id` int,
  `obj_profissional` varchar(30) NOT NULL,
  `created_at` timestamp DEFAULT 'now()'
);

CREATE TABLE `formacoes`
(
  `formacao_id` int PRIMARY KEY NOT NULL,
  `campus_id` int,
  `curso` varchar(50) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_termino` date NOT NULL,
  `em_curso` boolean NOT NULL,
  `media` float
);

CREATE TABLE `instituicoes`
(
  `instituicao_id` int PRIMARY KEY NOT NULL,
  `nome` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL
);

CREATE TABLE `localidades`
(
  `localidade_id` int PRIMARY KEY NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `pais` varchar(50) NOT NULL
);

CREATE TABLE `campus`
(
  `campus_id` int PRIMARY KEY NOT NULL,
  `instituicao_id` int,
  `localidade_id` int
);

CREATE TABLE `idiomas`
(
  `idioma_id` int PRIMARY KEY NOT NULL,
  `idioma` varchar(50) NOT NULL,
  `proficiencia_id` int
);

CREATE TABLE `proficiencias`
(
  `proficiencia_id` int PRIMARY KEY NOT NULL,
  `nivel_fala` varchar(50) NOT NULL,
  `nivel_leitura` varchar(50) NOT NULL,
  `nivel_escrita` varchar(50) NOT NULL
);

CREATE TABLE `enderecos`
(
  `endereco_id` int PRIMARY KEY NOT NULL,
  `cep` varchar(50) NOT NULL,
  `rua_e_numero` varchar(80) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `pais` varchar(120) NOT NULL,
  `realocar` boolean
);

CREATE TABLE `experiencias`
(
  `experiencia_id` int PRIMARY KEY NOT NULL,
  `cargo` varchar(45) NOT NULL,
  `empresa` varchar(45) NOT NULL,
  `atual` tinyint(1) DEFAULT null,
  `entrada` date NOT NULL,
  `saida` datetime DEFAULT NULL
);

CREATE TABLE `cursos_extras`
(
  `curso_extra_id` int(10) PRIMARY KEY NOT NULL,
  `nome` varchar(45) NOT NULL,
  `instituicao` varchar(45) NOT NULL,
  `inicio` date NOT NULL,
  `duracao` int(10) NOT NULL,
  `atual` tinyint(1) DEFAULT NULL,
  `descricao` mediumtext
);

ALTER TABLE `formacoes` ADD FOREIGN KEY (`formacao_id`) REFERENCES `curriculos` (`formacao_id`);

ALTER TABLE `campus` ADD FOREIGN KEY (`instituicao_id`) REFERENCES `instituicoes` (`instituicao_id`);

ALTER TABLE `campus` ADD FOREIGN KEY (`localidade_id`) REFERENCES `localidades` (`localidade_id`);

ALTER TABLE `campus` ADD FOREIGN KEY (`campus_id`) REFERENCES `formacoes` (`campus_id`);

ALTER TABLE `idiomas` ADD FOREIGN KEY (`idioma_id`) REFERENCES `curriculos` (`idioma_id`);

ALTER TABLE `proficiencias` ADD FOREIGN KEY (`proficiencia_id`) REFERENCES `idiomas` (`proficiencia_id`);

ALTER TABLE `enderecos` ADD FOREIGN KEY (`endereco_id`) REFERENCES `curriculos` (`endereco_id`);

ALTER TABLE `experiencias` ADD FOREIGN KEY (`experiencia_id`) REFERENCES `curriculos` (`experiencia_id`);

ALTER TABLE `cursos_extras` ADD FOREIGN KEY (`curso_extra_id`) REFERENCES `curriculos` (`curso_extra_id`);
