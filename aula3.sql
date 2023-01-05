DROP DATABASE IF EXISTS aula_banco;
CREATE DATABASE aula_banco;


USE aula_banco;
/** Criando a tabela */
DROP TABLE IF EXISTS estado;
CREATE TABLE estado(
id INT NOT NULL AUTO_INCREMENT , 
nome VARCHAR(200) NOT NULL UNIQUE , -- CONSTRAINT INLINE 
sigla CHAR(2) NOT NULL UNIQUE ,
ativo CHAR(1) NOT NULL DEFAULT 'S',
data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
-- CHECK (ativo IN('S','N'))  -- CONSTRAINT OUT OF LINE
CONSTRAINT pk_estado PRIMARY KEY (id),
CONSTRAINT estado_ativo CHECK (ativo IN('S' , 'N')) 
);

DROP TABLE IF EXISTS cidade;
CREATE TABLE cidade (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL UNIQUE,
    ativo CHAR(1) NOT NULL DEFAULT 'S',
    data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado_id INT NOT NULL,
    CONSTRAINT pk_cidade PRIMARY KEY (id),
    CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id)
        REFERENCES estado (id),
    CONSTRAINT cidade_ativo CHECK (ativo IN ('S' , 'N')),
    CONSTRAINT cidade_unica UNIQUE (cidade , estado_id)
);


/** Inserindo registros  */
INSERT INTO estado (nome,sigla) VALUES ("PARANÁ","PR");
INSERT INTO estado (nome,sigla) VALUES ("São paulo","SP");
INSERT INTO estado (nome,sigla) VALUES ("BAHIA","BA");

INSERT INTO cidade (nome,sigla) VALUES ("PARANÁ","PR");
INSERT INTO cidade (nome,sigla) VALUES ("São paulo","SP");
INSERT INTO cidade (nome,sigla) VALUES ("BAHIA","BA");

SELECT 
    id, nome, ativo, data_cadastro
FROM
    estado;
