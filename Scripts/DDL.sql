CREATE SEQUENCE pessoa_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE pessoa ALTER COLUMN id SET DEFAULT NEXTVAL('pessoa_id_seq');

CREATE SEQUENCE pessoa_fisica_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE pessoa_fisica ALTER COLUMN id SET DEFAULT NEXTVAL('pessoa_fisica_id_seq');

CREATE SEQUENCE pessoa_juridica_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE pessoa_juridica ALTER COLUMN id SET DEFAULT NEXTVAL('pessoa_juridica_id_seq');

CREATE SEQUENCE cargo_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE cargo ALTER COLUMN id SET DEFAULT NEXTVAL('cargo_id_seq');

CREATE SEQUENCE funcionario_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE funcionario ALTER COLUMN id SET DEFAULT NEXTVAL('funcionario_id_seq');

CREATE SEQUENCE reserva_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE reserva ALTER COLUMN id SET DEFAULT NEXTVAL('reserva_id_seq');

CREATE SEQUENCE tipo_local_hospedagem_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE tipo_local_hospedagem ALTER COLUMN id SET DEFAULT NEXTVAL('tipo_local_hospedagem_id_seq');

CREATE SEQUENCE local_hospedagem_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE local_hospedagem ALTER COLUMN id SET DEFAULT NEXTVAL('local_hospedagem_id_seq');

CREATE SEQUENCE tipo_quarto_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE tipo_quarto ALTER COLUMN id SET DEFAULT NEXTVAL('tipo_quarto_id_seq');

CREATE SEQUENCE quarto_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE quarto ALTER COLUMN id SET DEFAULT NEXTVAL('quarto_id_seq');

CREATE SEQUENCE servico_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE servico ALTER COLUMN id SET DEFAULT NEXTVAL('servico_id_seq');


CREATE SEQUENCE produto_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE produto ALTER COLUMN id SET DEFAULT NEXTVAL('produto_id_seq');

CREATE SEQUENCE comanda_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE comanda ALTER COLUMN id SET DEFAULT NEXTVAL('comanda_id_seq');

CREATE TABLE pessoa(
    id       BIGINT primary key,
    telefone VARCHAR (20) NOT NULL,
    pais     VARCHAR (20) NOT NULL,
    estado   CHAR (2) NOT NULL,
    endereco VARCHAR (200) NOT NULL,
    cidade   VARCHAR (100) NOT NULL,
    cep      VARCHAR (10) NOT NULL
);

CREATE TABLE pessoa_fisica(
    id                  	BIGINT primary key,
    nome                	VARCHAR (100)NOT NULL,
    cpf 					VARCHAR (15) NOT NULL,
    rg 						VARCHAR (15)NOT NULL,
    genero 					CHAR (2) NOT NULL,
    data_nascimento 		DATE NOT NULL,
    telefone_emergencia 	VARCHAR (20)NOT NULL,
	id_pessoa				BIGINT NOT NULL,
    foreign key (id_pessoa) references pessoa (id)
);

CREATE TABLE pessoa_juridica(
    id 			  			BIGINT primary key,
    cnpj 					VARCHAR (20) NOT NULL,
    razao_social 			VARCHAR (100) NOT NULL,
    nome_fantasia 			VARCHAR (100) NOT NULL,
    data_abertura 			DATE NOT NULL,
	id_pessoa				BIGINT NOT NULL,
    foreign key (id_pessoa) references pessoa (id)
);

CREATE TABLE cargo(
    id 		BIGINT primary key,
    nome 	VARCHAR (100) NOT NULL,
    salario MONEY NOT NULL
);

CREATE TABLE funcionario(
    id 							      BIGINT primary key,
    matricula						  BIGINT NOT NULL,
    data_admissao					  DATE NOT NULL,
    situacao						  BOOLEAN NOT NULL,
    id_cargo 						  BIGINT NOT NULL,
    id_pessoa_fisica 				  BIGINT NOT NULL,
	foreign key (id_cargo) 		      references cargo (id),
	foreign key (id_pessoa_fisica) 	  references pessoa_fisica (id)
);

CREATE TABLE reserva(
    id 								  BIGINT primary key,
    data_inicio 					  DATE NOT NULL,
    data_fim 						  DATE NOT NULL,
    valor_total 					  MONEY NOT NULL,
	id_pessoa						  BIGINT NOT NULL,
	id_local_hospedagem				  BIGINT NOT NULL,
	foreign key (id_pessoa) 		  references pessoa (id),
    foreign key (id_local_hospedagem) references local_hospedagem (id)
);

CREATE TABLE hospedagem(
    id 							   BIGINT primary key,
    data_check_in 				   DATE NOT NULL,
    data_check_out 				   DATE NOT NULL,
	id_reserva					   BIGINT NOT NULL,
	id_comanda					   BIGINT NOT NULL,
    foreign key (id_reserva) 	   references reserva (id),
    foreign key (id_comanda) 	   references comanda (id)
);

CREATE TABLE pessoa_hospedagem(
	id_hospedagem				BIGINT NOT NULL,
	id_pessoa					BIGINT NOT NULL,
    foreign key (id_hospedagem) references hospedagem (id),
    foreign key (id_pessoa)     references pessoa (id)
);

CREATE TABLE tipo_local_hospedagem(
    id			    BIGINT primary key,
    nome            VARCHAR (100) NOT NULL,
    descricao       TEXT NOT NULL,
    numero_de_camas INT NOT NULL
);

CREATE TABLE local_hospedagem(
    id 						     		   BIGINT primary key,
    nome 								   VARCHAR (100) NOT NULL,
    descricao 							   TEXT NOT NULL,
    endereco 							   VARCHAR (200) NOT NULL,
	id_quarto							   BIGINT NOT NULL,
	id_tipo_local_hospedagem			   BIGINT NOT NULL,
	foreign key (id_quarto) 		  	   references quarto (id),
    foreign key (id_tipo_local_hospedagem) references local_hospedagem (id)
);

CREATE TABLE tipo_quarto(
    id 		  BIGINT primary key,
    nome 	  VARCHAR (50) NOT NULL,
    preco 	  MONEY NOT NULL,
    descricao TEXT NOT NULL
);

CREATE TABLE quarto(
    id 							 BIGINT primary key,
    capacidade 				     INT NOT NULL,
	id_tipo_quarto				 BIGINT NOT NULL,
	id_hospedagem				 BIGINT NOT NULL,
	foreign key (id_tipo_quarto) references tipo_quarto (id),
    foreign key (id_hospedagem)  references hospedagem (id)
);

CREATE TABLE servico(
    id 		  BIGINT primary key,
    nome 	  VARCHAR (50) NOT NULL,
    preco 	  MONEY NOT NULL,
    descricao TEXT NOT NULL
);

CREATE TABLE servico_funcionario_hospedagem(
    data_inicio_servico 	     DATE NOT NULL,
    data_fim_servico 		     DATE NOT NULL,
    status_do_servico 	         BOOLEAN NOT NULL,
	id_servico				     BIGINT NOT NULL,
	id_funcionario				 BIGINT NOT NULL,
	id_hospedagem				 BIGINT NOT NULL,
	foreign key (id_servico)     references servico (id),
    foreign key (id_funcionario) references funcionario (id),
	foreign key (id_hospedagem)  references hospedagem (id)
);

CREATE TABLE produto(
    id 								  BIGINT primary key,
    nome 							  VARCHAR (100) NOT NULL,
    descricao 						  TEXT NOT NULL,
    preco 							  MONEY NOT NULL,
    quantidade_em_estoque 			  INT NOT NULL,
	id_local_hospedagem				  BIGINT NOT NULL,
	foreign key (id_local_hospedagem) references local_hospedagem (id)
);

CREATE TABLE comanda_produto(
    quantidade 				 INT NOT NULL,
    valor 					 MONEY NOT NULL,
	id_comanda				 BIGINT NOT NULL,
	id_produto				 BIGINT NOT NULL,
	foreign key (id_comanda) references comanda (id),
    foreign key (id_produto) references produto (id)
);

CREATE TABLE comanda(
    id 						BIGINT primary key,
    data_pagamento 			DATE NOT NULL,
    forma_pagamento 		DATE NOT NULL,
	foreign key (id_pessoa) references pessoa (id)
);