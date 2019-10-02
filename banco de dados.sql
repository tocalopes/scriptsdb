DROP DATABASE IF EXISTS bayerchallenge;
CREATE DATABASE bayerchallenge;
USE bayerchallenge;
DROP TABLE IF EXISTS `curriculo`;

CREATE TABLE `curriculo`
(
  `curriculo_id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `candidato_id` int,
  `objetivo_profissional` varchar(30) NOT NULL,
  `expectativa_salario` decimal(10,2),
  `resumo` tinytext NOT NULL,
  `created_at` timestamp DEFAULT NOW()
);


DROP TABLE IF EXISTS `curriculo_curso_extracurricular`;
CREATE TABLE `curriculo_curso_extracurricular`
(
  `curso_extracurricular_id` int NOT NULL,
  `curriculo_id` int NOT NULL
);

DROP TABLE IF EXISTS `curriculo_experiencia`;
CREATE TABLE `curriculo_experiencia`
(
  `experiencia_id` int NOT NULL,
  `curriculo_id` int NOT NULL
);

DROP TABLE IF EXISTS `curriculo_formacao`;
CREATE TABLE `curriculo_formacao`
(
  `curriculo_id` int NOT NULL,
  `formacao_id` int NOT NULL
);


DROP TABLE IF EXISTS `curriculo_idioma`;
CREATE TABLE `curriculo_idioma`
(
  `idioma_id` int NOT NULL,
  `curriculo_id` int NOT NULL
);

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario`
(
    `usuario_id` INT PRIMARY KEY AUTO_INCREMENT,
    `login` VARCHAR(40) UNIQUE,
    `senha` VARCHAR(40)
);
DROP TABLE IF EXISTS `candidato`;
CREATE TABLE `candidato`
(
  `candidato_id` int PRIMARY KEY AUTO_INCREMENT,
  `usuario_id` INT NOT NULL UNIQUE,
  `nome` varchar(30),
  `ìdade` int,
  `endereco_id` int,
  `email` varchar(30),
  `realocar` boolean,
  `status_candidatura_id` int,
  `telefone_residencial` LONG,
  `telefone_celular` LONG,
  `pontos_consumiveis` INT,
  `pontuacao_candidato_id` INT,
  `desbloqueavel_selecionado` INT DEFAULT 1,
  `created_at` timestamp DEFAULT NOW()
);

DROP TABLE IF EXISTS `candidato_fase`;
CREATE TABLE `candidato_fase`
(
    `fase_id`                  int,
    `candidato_id`             int,
    `status_candidato_fase_id` int not null,
    `pontuacao`                int,
    PRIMARY KEY (`fase_id`, `candidato_id`)
);
DROP TABLE IF EXISTS `status_candidato_fase`;
CREATE TABLE `status_candidato_fase`
(
    `status_candidato_fase_id` INT PRIMARY KEY AUTO_INCREMENT,
    `descricao` VARCHAR(40)
);

DROP TABLE IF EXISTS `fase`;
CREATE TABLE `fase`
(
  `fase_id` int PRIMARY KEY AUTO_INCREMENT,
  `descricao` varchar(40),
  `data_inicial` DATE,
  `data_final` DATE,
  `created_at` timestamp DEFAULT NOW()
);



DROP TABLE IF EXISTS `status_candidatura`;
CREATE TABLE `status_candidatura`
(
  `status_candidatura_id` int PRIMARY KEY AUTO_INCREMENT,
  `descricao` varchar(40)
);

DROP TABLE IF EXISTS `formacao_academica`;
CREATE TABLE `formacao_academica`
(
  `formacao_id` int PRIMARY KEY AUTO_INCREMENT,
  `instituicao` varchar(50),
  `nome_curso` varchar(50) NOT NULL,
  `situacao` varchar(45) NOT NULL,
  `nivel` varchar(45) NOT NULL,
  `created_at` timestamp DEFAULT NOW()
);

DROP TABLE IF EXISTS `idioma`;
CREATE TABLE `idioma`
(
  `idioma_id` int PRIMARY KEY AUTO_INCREMENT,
  `idioma` varchar(50) NOT NULL,
  `created_at` timestamp DEFAULT NOW()
);

DROP TABLE IF EXISTS `proficiencia`;
CREATE TABLE `proficiencia`
(
  `proficiencia_id` int PRIMARY KEY AUTO_INCREMENT,
  `nivel_fala` varchar(50) NOT NULL,
  `nivel_leitura` varchar(50) NOT NULL,
  `nivel_escrita` varchar(50) NOT NULL,
  `created_at` timestamp DEFAULT NOW()
);

DROP TABLE IF EXISTS `proficiencia_idioma`;
CREATE TABLE `proficiencia_idioma`
(
  `proficiencia_id` int ,
  `idioma_id` int,
  PRIMARY KEY (`proficiencia_id`,`idioma_id`)

);

DROP TABLE IF EXISTS `endereco`;
CREATE TABLE `endereco`
(
  `endereco_id` int PRIMARY KEY AUTO_INCREMENT,
  `cep` varchar(50),
  `rua` varchar(80),
  `numero` int,
  `cidade` varchar(50) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `created_at` timestamp DEFAULT NOW()
);

DROP TABLE IF EXISTS `experiencia_anterior`;
CREATE TABLE `experiencia_anterior`
(
  `experiencia_id` int PRIMARY KEY AUTO_INCREMENT,
  `cargo` varchar(45) NOT NULL,
  `empresa` varchar(45) NOT NULL,
  `emprego_atual` tinyint(1) DEFAULT null,
  `entrada` date NOT NULL,
  `saida` datetime DEFAULT NULL,
  `principais_atividades` mediumtext,
  `salario` decimal(10,2),
  `created_at` timestamp DEFAULT NOW()
);

DROP TABLE IF EXISTS `historico_pontuacao`;
CREATE TABLE `historico_pontuacao`
(
    `historico_pontuacao_id` INT PRIMARY KEY AUTO_INCREMENT,
    `pontos` int,
    `data` DATE,
    `candidato_id` INT NOT NULL,
    `created_at` timestamp DEFAULT NOW(),
    `updated_at` timestamp DEFAULT NOW()
);
DROP TABLE IF EXISTS `curso_extra_curricular`;
CREATE TABLE `curso_extra_curricular`
(
  `curso_extra_id` int(10) PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `instituicao` varchar(45) NOT NULL,
  `data_inicial` date,
  `duracao` varchar(45) NOT NULL,
  `situacao` varchar(45) NOT NULL,
  `descricao` mediumtext,
  `created_at` timestamp DEFAULT NOW()
);

CREATE TABLE pontuacao_candidato(
    `pontuacao_candidato_id` INT PRIMARY KEY AUTO_INCREMENT,
    `pontuacao_alcancada` INT NOT NULL DEFAULT 0,
    `pontuacao_level_id` INT NOT NULL
)

CREATE TABLE pontuacao_level (
  `pontuacao_level_id`  INT PRIMARY KEY AUTO_INCREMENT,
  `pontuacao_maxima` INT  NOT NULL,
  `level` INT NOT NULL DEFAULT 0 UNIQUE
);

CREATE TABLE vaga (
    `vaga_id` INT PRIMARY KEY AUTO_INCREMENT,
    `cargo` VARCHAR(40),
    `area_atuacao` VARCHAR(30),
    `requisitos_desejaveis` MEDIUMTEXT,
    `requisitos_obrigatorios` MEDIUMTEXT,
    `principais_atividades` MEDIUMTEXT,
    `salario`  DECIMAL(10,2),
    `beneficios` MEDIUMTEXT,
    `endereco_id` INT,
    `created_at` timestamp DEFAULT NOW()
)

CREATE TABLE candidato_vaga(
    `candidato_id` int,
    `vaga_id` int,
    PRIMARY KEY (`candidato_id`,`vaga_id`)
);


CREATE TABLE categoria_desafio(
    `categoria_desafio_id` INT PRIMARY KEY AUTO_INCREMENT,
    `titulo` VARCHAR(50),
    `descricao` VARCHAR(255),
    `vaga_id` INT
)

CREATE TABLE atividade_desafio(
    `atividade_desafio_id` INT PRIMARY KEY AUTO_INCREMENT,
    `categoria_desafio_id` INT NOT NULL,
    `pontos` INT,
    `titulo` VARCHAR(50),
    `descricao` VARCHAR(255),
    `pontos_candidato_id` INT,
    `minutos_necessarios` INT
)

CREATE TABLE atividade_candidato(
    `pontos_atividade` INT,
    `status_atividade_id` INT,
    `candidato_id` INT NOT NULL,
    `atividade_id` INT NOT NULL,
    `desafios_resolvidos` INT,
    PRIMARY KEY (`candidato_id`,`atividade_id`)
);

CREATE TABLE status_atividade(
    `status_atividade_id` INT PRIMARY KEY,
    `descricao` VARCHAR(30)
);

CREATE TABLE atividade(
    `atividade_id` INT PRIMARY KEY AUTO_INCREMENT,
    `atividade_desafio_id` INT NOT NULL,
    `titulo` VARCHAR(40),
    `descricao` MEDIUMTEXT
);

CREATE TABLE resposta_atividade(
    `resposta_atividade_id` INT PRIMARY KEY AUTO_INCREMENT,
    `atividade_id` INT,
    `resposta` varchar(100)
);

CREATE TABLE desbloqueavel(
    `desbloqueavel_id` INT PRIMARY KEY AUTO_INCREMENT,
    `descricao` VARCHAR(40),
    `pontos_minimos` INT,
    `tipo_desbloqueavel_id` INT,
    `valor` VARCHAR(20)
);

CREATE TABLE tipo_desbloqueavel(
    `tipo_desbloqueavel_id` INT PRIMARY KEY  AUTO_INCREMENT,
    `descricao` VARCHAR(40)
);

CREATE TABLE desbloqueavel_candidato(
    `candidato_id` INT,
    `desbloqueavel_id` INT,
    PRIMARY KEY (`candidato_id`,`desbloqueavel_id`)
);


    ALTER TABLE `candidato` ADD FOREIGN KEY (`desbloqueavel_selecionado`) REFERENCES  `desbloqueavel`(`desbloqueavel_id`);
    ALTER TABLE `candidato_fase` ADD FOREIGN KEY (`status_candidato_fase_id`) REFERENCES  `status_candidato_fase` (`status_candidato_fase_id`);
     ALTER TABLE `desbloqueavel` ADD FOREIGN KEY (`tipo_desbloqueavel_id`) REFERENCES  `tipo_desbloqueavel` (`tipo_desbloqueavel_id`);
    ALTER TABLE `desbloqueavel_candidato` ADD FOREIGN KEY (`candidato_id`) REFERENCES `candidato` (`candidato_id`);
    ALTER TABLE `desbloqueavel_candidato` ADD FOREIGN KEY (`desbloqueavel_id`) REFERENCES `desbloqueavel` (`desbloqueavel_id`);

    ALTER TABLE `atividade_candidato` ADD FOREIGN KEY  (`status_atividade_id`) REFERENCES `status_atividade` (`status_atividade_id`);
    ALTER TABLE `atividade_candidato` ADD FOREIGN KEY (`candidato_id`) REFERENCES `candidato` (`candidato_id`);
    ALTER TABLE `atividade_candidato` ADD FOREIGN KEY (`atividade_id`) REFERENCES `atividade` (`atividade_id`);

    ALTER TABLE `categoria_desafio` ADD FOREIGN KEY (`vaga_id`) REFERENCES `vaga`(`vaga_id`);

    ALTER TABLE `atividade_desafio` ADD FOREIGN KEY (`categoria_desafio_id`) REFERENCES `categoria_desafio` (`categoria_desafio_id`);

    ALTER TABLE `atividade` ADD FOREIGN KEY (`atividade_desafio_id`) REFERENCES `atividade_desafio` (`atividade_desafio_id`);

    ALTER TABLE `resposta_atividade` ADD FOREIGN KEY (`atividade_id`) REFERENCES `atividade` (`atividade_id`);


    ALTER TABLE `vaga` ADD FOREIGN KEY (`endereco_id`) REFERENCES `endereco` (`endereco_id`);
    ALTER TABLE `candidato_vaga` ADD FOREIGN KEY (`candidato_id`) REFERENCES `candidato` (`candidato_id`);
    ALTER TABLE `candidato_vaga` ADD FOREIGN KEY (`vaga_id`) REFERENCES `vaga` (`vaga_id`);

    ALTER TABLE `pontuacao_candidato` ADD FOREIGN KEY (`pontuacao_level_id`) REFERENCES `pontuacao_level` (`pontuacao_level_id`);

    ALTER TABLE `candidato_fase` ADD FOREIGN KEY (`candidato_id`) REFERENCES `candidato`(`candidato_id`);

    ALTER TABLE `candidato_fase` ADD FOREIGN KEY (`fase_id`) REFERENCES `fase`(`fase_id`);

    ALTER TABLE `candidato` ADD FOREIGN KEY (`status_candidatura_id`) REFERENCES `status_candidatura`(`status_candidatura_id`);

    ALTER TABLE `curriculo` ADD FOREIGN KEY (`candidato_id`) REFERENCES `candidato` (`candidato_id`);

    ALTER TABLE `candidato` ADD FOREIGN KEY (`pontuacao_candidato_id`) REFERENCES `pontuacao_candidato` (`pontuacao_candidato_id`);

    ALTER TABLE `candidato` ADD FOREIGN KEY (`endereco_id`) REFERENCES `endereco` (`endereco_id`);

    ALTER TABLE `historico_pontuacao` ADD FOREIGN KEY (`candidato_id`) REFERENCES `candidato` (`candidato_id`);


    INSERT INTO pontuacao_level(`pontuacao_maxima`, `level`) VALUES (50,0);
    INSERT INTO pontuacao_level(`pontuacao_maxima`, `level`) VALUES (100,1);
    INSERT INTO pontuacao_level(`pontuacao_maxima`, `level`) VALUES (150,2);


    INSERT INTO pontuacao_candidato(`pontuacao_alcancada`,`pontuacao_level_id`) VALUES (72, 2);


    INSERT INTO `status_candidatura` (descricao) VALUES ("Aguardando aprovação");

    INSERT INTO `fase` (descricao,data_inicial,data_final) VALUES ("Cadastro","2019-07-22","2019-12-01");
    INSERT INTO `fase` (descricao,data_inicial,data_final) VALUES ("1ª Fase: Criação do Currículo","2019-07-22","2019-12-01");
    INSERT INTO `fase` (descricao,data_inicial,data_final) VALUES ("2ª Fase: Testes Pontuados","2019-07-22","2019-12-01");

#     INSERT INTO `candidato` (usuario_id, nome, status_candidatura_id,pontuacao_candidato_id,pontos_consumiveis) VALUES (1,"Renan",1,1, 200);
#     INSERT INTO `candidato_fase` (fase_id,candidato_id) VALUES (1,1);
    # INSERT INTO `candidato_fase` (fase_id,candidato_id) VALUES (2,1);
    # INSERT INTO `candidato_fase` (fase_id,candidato_id) VALUES (3,1);

#     INSERT INTO historico_pontuacao (pontos,`data`,candidato_id) VALUES(100,'2019-09-20',1);
#     INSERT INTO historico_pontuacao (pontos,`data`,candidato_id) VALUES(10,'2019-09-18',1);
#     INSERT INTO historico_pontuacao (pontos,`data`,candidato_id) VALUES(60,'2019-09-17',1);
#     INSERT INTO historico_pontuacao (pontos,`data`,candidato_id) VALUES(70,'2019-09-16',1);


    select * from pontuacao_candidato;

    INSERT INTO endereco (`cidade`,`uf`) VALUES ("São Paulo", "SP");
    # INSERT INTO vaga (`cargo`,`area_atuacao`,`requisitos_desejaveis`,`requisitos_obrigatorios`,
    #                   `principais_atividades`,`salario`,`beneficios`,`endereco_id`) VALUES ("Desenvolvedor Front-End","Tecnologia","Office Avançado","ECMAScript2015","Desenvolvimento de sistemas de grande escala",5000.00,"Vale Refeição",1);
    # INSERT INTO vaga (`cargo`,`area_atuacao`,`requisitos_desejaveis`,`requisitos_obrigatorios`,
    #                   `principais_atividades`,`salario`,`beneficios`,`endereco_id`) VALUES ("Desenvolvedor PHP","Tecnologia","Angular 8","PHP 5 Avançado","Desenvolvimento de sistemas de grande escala",5000.00,"Vale Refeição",1);


#     INSERT INTO candidato_vaga values (1,1);
#     INSERT INTO categoria_desafio (titulo, descricao, vaga_id) VALUES ("Valores Pessoais","questões que tangem além do conhecimento técnico do candidato",1);
#     INSERT INTO categoria_desafio (titulo, descricao, vaga_id) VALUES ("Conhecimentos Específicos","Conhecimentos necessários para sua vaga",1);
#     INSERT INTO atividade_desafio (categoria_desafio_id, pontos, minutos_necessarios, titulo,descricao) VALUES (1,100,30,"Ética", "desenvolvimento e capacidade de atuação portando-se de uma conduta ética.");
#     INSERT INTO atividade_desafio (categoria_desafio_id, pontos, minutos_necessarios, titulo,descricao) VALUES (1,250,40,"Liderança", "Técnicas de liderança em ambientes de extrema diversibilidade.");
#
#     INSERT INTO atividade (titulo, descricao, atividade_desafio_id) VALUES ("Ética", "desenvolvimento e capacidade de atuação portando-se de uma conduta ética.",1);
#     INSERT INTO atividade (titulo, descricao, atividade_desafio_id) VALUES ("Posicionamento", "Qual a melhor forma de se posicionar perante funcionários que estão sem foco em suas atividades?",2);
#
#     INSERT INTO atividade_candidato(`pontos_atividade`,`candidato_id`,`atividade_id`,`desafios_resolvidos`) VALUES (40,1,1,2);
#
#     INSERT INTO resposta_atividade (resposta_atividade_id, atividade_id, resposta) VALUES (1, 1, "Nilismo social");
#     INSERT INTO resposta_atividade (resposta_atividade_id, atividade_id, resposta) VALUES (2, 1, "Aspectos sociais");
#     INSERT INTO resposta_atividade (resposta_atividade_id, atividade_id, resposta) VALUES (3, 1, "Libertinagem");
#     INSERT INTO resposta_atividade (resposta_atividade_id, atividade_id, resposta) VALUES (4, 1, "Ordem");
#
#     INSERT INTO atividade (titulo, descricao, atividade_desafio_id) VALUES ("Moral", "desenvolvimento e capacidade de atuação portando-se de uma conduta moral.",1);
#
#     INSERT INTO resposta_atividade (resposta_atividade_id, atividade_id, resposta) VALUES (5, 3, "Nilismo");
#     INSERT INTO resposta_atividade (resposta_atividade_id, atividade_id, resposta) VALUES (6, 3, "Empatia com funcionarios");
#     INSERT INTO resposta_atividade (resposta_atividade_id, atividade_id, resposta) VALUES (7, 3, "Disrupção empresarial");
#     INSERT INTO resposta_atividade (resposta_atividade_id, atividade_id, resposta) VALUES (8, 3, "Reordenação do convívio");
#
#
#     select * from atividade_desafio;
#     SELECT * FROM atividade;


#     SELECT DISTINCT ad.titulo, ad.descricao, ac.pontos_atividade, ad.pontos, ac.desafios_resolvidos, (select count(a1.atividade_id) from atividade a1 where a1.atividade_desafio_id = a.atividade_desafio_id), ad.minutos_necessarios, ad.atividade_desafio_id FROM atividade_desafio ad LEFT JOIN atividade a ON a.atividade_desafio_id = ad.atividade_desafio_id LEFT JOIN atividade_candidato ac ON ac.atividade_id = a.atividade_id WHERE ad.categoria_desafio_id = 1 ;

#     SELECT * FROM atividade_candidato;

#     SELECT sum(ad.pontos) from atividade_desafio ad;
#     select * from categoria_desafio;
#     SELECT DISTINCT cd.titulo, cd.descricao, (select sum(ac2.desafios_resolvidos) FROM atividade_candidato ac2 WHERE ac2.atividade_id = ac.atividade_id), (select count(a2.atividade_id) from atividade a2 WHERE a2.atividade_id = a.atividade_id ), (SELECT sum(ad2.pontos) FROM atividade_desafio ad2 WHERE ad2.categoria_desafio_id = ad.categoria_desafio_id) FROM categoria_desafio cd INNER JOIN candidato_vaga cv ON cv.vaga_id = cd.vaga_id  LEFT JOIN atividade_desafio ad on ad.categoria_desafio_id = cd.categoria_desafio_id LEFT JOIN atividade a ON a.atividade_desafio_id = ad.atividade_desafio_id LEFT JOIN atividade_candidato ac ON a.atividade_id = ac.atividade_id WHERE cv.candidato_id = 1 group by cd.categoria_desafio_id;
#
#     SELECT a.titulo, a.descricao FROM atividade a WHERE a.atividade_desafio_id = 1;
#
#     SELECT * FROM atividade;
    select * from status_candidatura;
    select * from fase;

    INSERT INTO tipo_desbloqueavel (descricao) VALUES ("tema");
    INSERT INTO tipo_desbloqueavel (descricao) VALUES ("tema interativo");
    INSERT INTO desbloqueavel (descricao, pontos_minimos, tipo_desbloqueavel_id, valor) VALUES ("Tema Padrão", 0, 1, "");
    INSERT INTO desbloqueavel (descricao, pontos_minimos, tipo_desbloqueavel_id, valor) VALUES ("Tema Dark", 50, 1, "dark-theme");
    INSERT INTO desbloqueavel (descricao, pontos_minimos, tipo_desbloqueavel_id, valor) VALUES ("Tema Pink", 150, 1, "pink-theme");
    INSERT INTO desbloqueavel (descricao, pontos_minimos, tipo_desbloqueavel_id, valor) VALUES ("Tema Futurístico", 250, 1, "futuristic-theme");
    INSERT INTO status_candidato_fase (descricao) VALUES ("concluído");
    INSERT INTO status_candidato_fase (descricao) VALUES ("em processo");

select * from desbloqueavel;

select * from usuario ;
# SELECT c.candidato_id FROM usuario u LEFT JOIN candidato c ON c.usuario_id = u.usuario_id WHERE u.login = "{login}" AND u.senha = "{senha}"
# SELECT c.candidato_id FROM usuario u LEFT JOIN candidato c ON c.usuario_id = u.usuario_id WHERE u.login = "renan.sanches_123@hotmail.com" AND u.senha = "senha1234"
SELECT * FROM usuario;

#     INSERT INTO desbloqueavel_candidato (candidato_id, desbloqueavel_id, selecionado) VALUES (1,1,1);
#     INSERT INTO desbloqueavel_candidato (candidato_id, desbloqueavel_id) VALUES (1,2);
    SELECT d.desbloqueavel_id, d.pontos_minimos, td.descricao, (SELECT "True" FROM desbloqueavel_candidato dc where dc.desbloqueavel_id = d.desbloqueavel_id and dc.candidato_id = 1 ), d.valor FROM desbloqueavel d LEFT JOIN tipo_desbloqueavel td ON d.tipo_desbloqueavel_id = td.tipo_desbloqueavel_id;
select * from candidato_fase;
select * from usuario;
select * from desbloqueavel_candidato;
select * from status_candidato_fase;
select * from usuario;
select * from desbloqueavel_candidato;
SELECT 1, c.desbloqueavel_selecionado FROM candidato c where c.candidato_id = 1;

DELETE FROM desbloqueavel_candidato WHERE candidato_id = 1 AND desbloqueavel_id = 2;
INSERT INTO desbloqueavel_candidato (desbloqueavel_id,candidato_id) VALUES (2, 1);
UPDATE candidato SET desbloqueavel_selecionado = {desbloqueavel_id} WHERE candidato_id = {self.candidato_id}
select * from candidato;
select * from desbloqueavel_candidato;
# SELECT cd.titulo, cd.descricao, sum(ac.desafios_resolvidos), count(a.atividade_id), sum(ad.pontos) FROM categoria_desafio cd INNER JOIN candidato_vaga cv ON cv.vaga_id = cd.vaga_id  LEFT JOIN atividade_desafio ad on ad.categoria_desafio_id = cd.categoria_desafio_id LEFT JOIN atividade a ON a.atividade_desafio_id = ad.atividade_desafio_id LEFT JOIN atividade_candidato ac ON a.atividade_id = ac.atividade_id WHERE cv.candidato_id = 1 ;
