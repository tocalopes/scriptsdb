CREATE DATABASE IF NOT EXISTS BAYER;
USE BAYER;

DROP TABLE IF EXISTS `BAYER`.`candidado`;
CREATE TABLE  `BAYER`.`candidado` (
  `id_candidato` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `sobrenome` varchar(45) NOT NULL,
  `idade` int(10) unsigned NOT NULL,
  `email` varchar(60) NOT NULL,
  `telFixo` varchar(45) DEFAULT NULL,
  `celular` varchar(45) DEFAULT NULL,
  `salario` decimal(10,0) NOT NULL,
  `objetivo` mediumtext NOT NULL,
  `id_grauFormacao` int(10) unsigned NOT NULL,
  `id_cursoFormacao` int(10) unsigned NOT NULL,
  `id_idioma` int(10) unsigned DEFAULT NULL,
  `id_cursoExtra` int(10) unsigned DEFAULT NULL,
  `id_experiencia` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_candidato`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `BAYER`.`curso_extra`;
CREATE TABLE  `BAYER`.`curso_extra` (
  `id_cursoExtra` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `instituicao` varchar(45) NOT NULL,
  `inicio` date NOT NULL,
  `duracao` int(10) unsigned NOT NULL,
  `atual` tinyint(1) DEFAULT NULL,
  `descricao` mediumtext,
  PRIMARY KEY (`id_cursoExtra`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `BAYER`.`endereco`;
CREATE TABLE  `BAYER`.`endereco` (
  `id_endereco` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cep` varchar(45) NOT NULL,
  `rua` varchar(45) NOT NULL,
  `numero` varchar(45) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_endereco`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `BAYER`.`experiencia`;
CREATE TABLE  `BAYER`.`experiencia` (
  `id_experiencia` int(10) unsigned NOT NULL,
  `cargo` varchar(45) NOT NULL,
  `empresa` varchar(45) NOT NULL,
  `atual` tinyint(1) DEFAULT NULL,
  `entrada` date NOT NULL,
  `saida` datetime DEFAULT NULL,
  PRIMARY KEY (`id_experiencia`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `BAYER`.`formacao`;
CREATE TABLE  `BAYER`.`formacao` (
  `id_cursoFormacao` int(10) unsigned NOT NULL,
  `nome` varchar(60) NOT NULL,
  `instituicao` varchar(60) NOT NULL,
  `atual` tinyint(1) DEFAULT NULL,
  `id_nivelFormacao` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_cursoFormacao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `BAYER`.`idioma`;
CREATE TABLE  `BAYER`.`idioma` (
  `id_idioma` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `id_nivelIdioma` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_idioma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `BAYER`.`nivel_formacao`;
CREATE TABLE  `BAYER`.`nivel_formacao` (
  `id_formacao` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id_formacao`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `BAYER`.`nivel_idioma`;
CREATE TABLE  `BAYER`.`nivel_idioma` (
  `id_nivelIdioma` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id_nivelIdioma`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
