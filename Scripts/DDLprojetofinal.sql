CREATE DATABASE IF NOT EXISTS db_projeto_final_att
COLLATE utf8mb4_general_ci 
charset utf8mb4;
use db_projeto_final_att;


CREATE TABLE tb_pais (
    id_pais INTEGER PRIMARY KEY auto_increment,
    nome VARCHAR(140) NOT NULL,
    codigo CHAR(3) NOT NULL)
  AUTO_INCREMENT = 1 ;

CREATE TABLE tb_plano (
    id_plano INTEGER PRIMARY KEY auto_increment,
    valor FLOAT NOT NULL,
    descricao VARCHAR(200) NOT NULL)
    AUTO_INCREMENT = 1 ;

CREATE TABLE tb_tipo_pagamento (
    id_tipo_pagamento INTEGER PRIMARY KEY auto_increment ,
    nome VARCHAR(100) UNIQUE NOT NULL)
    AUTO_INCREMENT = 1 ;

CREATE TABLE tb_cartao_credito (
    id_cartao INTEGER PRIMARY KEY auto_increment,
    numero CHAR(20) UNIQUE NOT NULL,
    data_vencimento DATE NOT NULL,
    cod_seguranca CHAR(3) NOT NULL,
    nome_cartao VARCHAR(150) NOT NULL)
         AUTO_INCREMENT = 1 ;

CREATE TABLE tb_classificacao (
    id_classificacao INTEGER PRIMARY KEY auto_increment,
    idade INTEGER NOT NULL,
    descricao VARCHAR(250) NOT NULL)
    AUTO_INCREMENT = 1 ;
    
CREATE TABLE tb_categoria (
    id_categoria INTEGER PRIMARY KEY auto_increment,
    nome VARCHAR(100) NOT NULL)
    AUTO_INCREMENT = 1 ;

CREATE TABLE tb_idioma (
    id_idioma INTEGER PRIMARY KEY auto_increment,
    nome VARCHAR(100) NOT NULL)
    AUTO_INCREMENT = 1 ;
    
CREATE TABLE tb_ator (
    id_ator INTEGER PRIMARY KEY auto_increment,
    nome VARCHAR(150) NOT NULL,
    sobrenome VARCHAR(150) NOT NULL,
    data_nascimento DATE NOT NULL,
    foto VARCHAR(255) NOT NULL)
	AUTO_INCREMENT = 1 ;

CREATE TABLE tb_endereco (
    id_endereco INTEGER PRIMARY KEY auto_increment,
    cep VARCHAR(100) NOT NULL,
    bairro VARCHAR(255) NOT NULL,
    rua VARCHAR(255),
    quadra VARCHAR(255),
    numero INTEGER NOT NULL,
    id_pais INTEGER NOT NULL,
    data_atualizacao DATE NOT NULL,
    CONSTRAINT FK_id_pais FOREIGN KEY (id_pais) REFERENCES tb_pais(id_pais))
   AUTO_INCREMENT = 1 ;
   
CREATE TABLE tb_usuario (
    id_usuario INTEGER PRIMARY KEY auto_increment,
    nome VARCHAR(150) NOT NULL,
    data_atualizacao DATE NOT NULL,
    sobrenome VARCHAR(150) NOT NULL,
    email VARCHAR(200) UNIQUE NOT NULL,
    status ENUM ('A' , 'I') NOT NULL,
    data_nascimento DATE NOT NULL,
    data_cadastro DATE NOT NULL,
    senha VARCHAR(225) NOT NULL,
    id_endereco INTEGER NOT NULL,
   CONSTRAINT FK_id_endereco FOREIGN KEY (id_endereco) REFERENCES tb_endereco(id_endereco))
   AUTO_INCREMENT = 1 ;
   
CREATE TABLE tb_funcionario (
    id_funcionario INTEGER PRIMARY KEY auto_increment,
    foto_funcionario VARCHAR(255) NOT NULL,
    data_atualizacao DATE NOT NULL,
    id_usuario INTEGER NOT NULL,
  CONSTRAINT FK_id_usuario_2 FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id_usuario))
   AUTO_INCREMENT = 1 ;
    
CREATE TABLE tb_cliente (
    id_cliente INTEGER PRIMARY KEY auto_increment,
    id_usuario INTEGER NOT NULL,
    id_plano INTEGER NOT NULL,
    data_vencimento_plano DATE,
    id_cartao INTEGER NOT NULL,
    data_atualizacao DATE NOT NULL,
    CONSTRAINT FK_id_usuario FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id_usuario),
	CONSTRAINT FK_id_plano FOREIGN KEY (id_plano) REFERENCES tb_plano(id_plano),
    CONSTRAINT FK_id_cartao FOREIGN KEY (id_cartao) REFERENCES tb_cartao_credito(id_cartao))
     AUTO_INCREMENT = 1 ;
    
CREATE TABLE tb_pagamento (
    id_pagamento INTEGER PRIMARY KEY auto_increment,
    valor FLOAT NOT NULL,
    data_pagamento DATE NOT NULL,
    id_cliente INTEGER NOT NULL,
    id_tipo_pagamento INTEGER NOT NULL,
    id_cartao INTEGER NOT NULL,
    CONSTRAINT FK_id_cartao_1 FOREIGN KEY (id_cartao) REFERENCES tb_cartao_credito(id_cartao),
	CONSTRAINT FK_id_cliente_1 FOREIGN KEY (id_cliente) REFERENCES tb_cliente(id_cliente),
    CONSTRAINT FK_id_tipo_pagamento FOREIGN KEY (id_tipo_pagamento) REFERENCES tb_tipo_pagamento(id_tipo_pagamento))
     AUTO_INCREMENT = 1 ;

CREATE TABLE tb_catalogo (
    id_catalogo INTEGER PRIMARY KEY auto_increment,
    pais_origem VARCHAR(130) NOT NULL,
    imagem_capa VARCHAR(255)NOT NULL,
    titulo VARCHAR(170) NOT NULL,
    sinopse VARCHAR(255) NOT NULL,
    ano_lancamento YEAR NOT NULL,
    duracao TIME NOT NULL,
    avaliacao ENUM ('1','2','3','4','5') NOT NULL,
    data_atualizacao DATE NOT NULL,
    id_classificacao INTEGER NOT NULL,
    id_idioma INTEGER NOT NULL,
    CONSTRAINT FK_id_classificacao FOREIGN KEY (id_classificacao) REFERENCES tb_classificacao(id_classificacao),
    CONSTRAINT FK_id_idioma FOREIGN KEY (id_idioma) REFERENCES tb_idioma (id_idioma))
	AUTO_INCREMENT = 1;

-- Inclui uma nova coluna na tabela tb_catalogo esscolhendo a posição
ALTER TABLE tb_catalogo
ADD COLUMN tipo_midia enum('F', 'S');

CREATE TABLE tb_perfil (
    id_perfil INTEGER PRIMARY KEY auto_increment,
    foto VARCHAR(255) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    tipo ENUM( 'A', 'C') NOT NULL,
    id_cliente INTEGER NOT NULL,
    data_atualizacao DATE NOT NULL,
    CONSTRAINT FK_id_cliente FOREIGN KEY (id_cliente) REFERENCES tb_cliente (id_cliente))
     AUTO_INCREMENT = 1 ;
    
CREATE TABLE tb_serie (
    id_serie INTEGER PRIMARY KEY auto_increment,
    quant_episodio_total INTEGER NOT NULL,
    quantidade_temporada INTEGER NOT NULL,
    id_catalogo INTEGER NOT NULL,
    CONSTRAINT FK_id_catalogo_4 FOREIGN KEY (id_catalogo) REFERENCES tb_catalogo(id_catalogo))
         AUTO_INCREMENT = 1 ;      

CREATE TABLE tb_filme (
    id_filme INTEGER PRIMARY KEY auto_increment,
    oscar INTEGER NOT NULL,
    id_catalogo INTEGER NOT NULL,
    CONSTRAINT FK_id_catalogo FOREIGN KEY (id_catalogo) REFERENCES tb_catalogo(id_catalogo))
	AUTO_INCREMENT = 1 ;
              
CREATE TABLE tb_temporada (
    id_temporada INTEGER PRIMARY KEY auto_increment,
    titulo VARCHAR(145) NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    quantidade_episodio INTEGER NOT NULL,
    id_serie INTEGER NOT NULL,
    CONSTRAINT FK_id_serie FOREIGN KEY (id_serie) REFERENCES tb_serie(id_serie))
	AUTO_INCREMENT = 1 ;

alter table tb_temporada add column numero_temporada int;
    
CREATE TABLE tb_episodio (
    id_episodio INTEGER PRIMARY KEY auto_increment,
    numero_episodio INTEGER NOT NULL,
    id_catalogo INTEGER NOT NULL,
    id_temporada INTEGER NOT NULL,
    CONSTRAINT FK_id_temporada FOREIGN KEY (id_temporada) REFERENCES tb_temporada(id_temporada),
	CONSTRAINT FK_id_catalogo_5 FOREIGN KEY (id_catalogo) REFERENCES tb_catalogo(id_catalogo))
	AUTO_INCREMENT = 1 ;


CREATE TABLE tb_pais_catalogo (
    id_pais_catalogo INTEGER PRIMARY KEY auto_increment,
    id_pais INTEGER NOT NULL,
    id_catalogo INTEGER NOT NULL,
    CONSTRAINT FK_id_pais_3 FOREIGN KEY (id_pais) REFERENCES tb_pais(id_pais),
	CONSTRAINT FK_id_catalogo_6 FOREIGN KEY (id_catalogo) REFERENCES tb_catalogo(id_catalogo))
	AUTO_INCREMENT = 1 ;
    

CREATE TABLE tb_catalogo_ator (
    id_catalogo_ator INTEGER PRIMARY KEY auto_increment,
    id_catalogo INTEGER NOT NULL,
    id_ator INTEGER NOT NULL,
  	CONSTRAINT FK_id_catalogo_1 FOREIGN KEY (id_catalogo) REFERENCES tb_catalogo(id_catalogo),
    CONSTRAINT FK_id_ator FOREIGN KEY (id_ator) REFERENCES tb_ator (id_ator))
	AUTO_INCREMENT = 1 ;
    

CREATE TABLE tb_catalogo_categoria (
    id_catalogo_categoria INTEGER PRIMARY KEY  auto_increment,
    id_categoria INTEGER NOT NULL,
    id_catalogo INTEGER NOT NULL,
	CONSTRAINT FK_id_categoria_1 FOREIGN KEY (id_categoria) REFERENCES tb_categoria (id_categoria),
    CONSTRAINT FK_id_catalogo_2 FOREIGN KEY (id_catalogo) REFERENCES tb_catalogo(id_catalogo))
  	AUTO_INCREMENT = 1 ;

CREATE TABLE tb_catalogo_idioma (
    id_catalogo_idioma INTEGER PRIMARY KEY auto_increment,
    id_catalogo INTEGER NOT NULL,
    id_idioma INTEGER NOT NULL,
    CONSTRAINT FK_id_idioma_1 FOREIGN KEY (id_idioma)REFERENCES tb_idioma (id_idioma),
	CONSTRAINT FK_id_catalogo_3 FOREIGN KEY (id_catalogo) REFERENCES tb_catalogo(id_catalogo))
	AUTO_INCREMENT = 1 ;