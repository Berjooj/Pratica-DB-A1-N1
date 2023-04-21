-- CRIA AS TABELAS
CREATE TABLE pessoa (
	id BIGINT NOT NULL
	, telefone VARCHAR(20) NOT NULL
	, pais VARCHAR(50) NOT NULL
	, estado VARCHAR(50) NOT NULL
	, cidade VARCHAR(50) NOT NULL
	, endereco VARCHAR(50) NOT NULL
	, cep INT NOT NULL
);

CREATE TABLE pessoa_fisica(
	id BIGINT NOT NULL
	, nome VARCHAR(50) NOT NULL
	, cpf VARCHAR(20) NOT NULL
	, rg VARCHAR(10) NOT NULL
	, genero VARCHAR(15) NOT NULL
	, data_nascimento TIMESTAMP NOT NULL
	, telefone_emergencia VARCHAR(20) NOT NULL
	, id_pessoa BIGINT NOT NULL
);

CREATE TABLE pessoa_juridica(
	id BIGINT NOT NULL
	, cnpj VARCHAR(20) NOT NULL
	, razao_social VARCHAR(100) NOT NULL
	, nome_fantasia VARCHAR(100) NOT NULL
	, data_abertura TIMESTAMP NOT NULL
	, id_pessoa BIGINT NOT NULL
);

CREATE TABLE funcionario(
	id BIGINT NOT NULL
	, id_pessoa_fisica BIGINT NOT NULL
	, matricula VARCHAR(20) NOT NULL
	, data_admissao TIMESTAMP NOT NULL
	, situacao BOOLEAN NOT NULL
	, cargo VARCHAR(50) NOT NULL
	, salario NUMERIC(8, 4) NOT NULL
);

CREATE TABLE reserva(
	id BIGINT NOT NULL
	, id_pessoa BIGINT NOT NULL
	, id_local_hospedagem BIGINT NOT NULL
	, data_inicio TIMESTAMP NOT NULL
	, data_fim TIMESTAMP NOT NULL
	, status_reserva BOOLEAN NOT NULL
	, valor_total NUMERIC(8, 4) NOT NULL
);

CREATE TABLE hospedagem(
	id BIGINT NOT NULL
	, id_reserva BIGINT NOT NULL
	, id_pessoa_fisica BIGINT NOT NULL
	, data_check_in TIMESTAMP NOT NULL
	, data_check_out TIMESTAMP NOT NULL
);

CREATE TABLE tipo_local_hospedagem(
	id BIGINT NOT NULL
	, nome VARCHAR(50) NOT NULL
	, descricao VARCHAR(50) NOT NULL
);

CREATE TABLE local_hospedagem(
	id BIGINT NOT NULL
	, id_tipo_local_hospedagem BIGINT NOT NULL
	, id_quarto BIGINT NOT NULL
	, nome VARCHAR(50) NOT NULL
	, descricao VARCHAR(50) NOT NULL
	, endereco VARCHAR(50) NOT NULL
);

CREATE TABLE tipo_quarto(
	id BIGINT NOT NULL
	, nome VARCHAR(50) NOT NULL
	, preco NUMERIC(8, 4) NOT NULL
	, descricao VARCHAR(150) NOT NULL
);

CREATE TABLE quarto(
	id BIGINT NOT NULL
	, id_tipo_quarto BIGINT NOT NULL
	, numero INTEGER NOT NULL
	, capacidade INT NOT NULL
    , numero_de_camas INT NOT NULL
);

CREATE TABLE tipo_servico(
	id BIGINT NOT NULL
	, nome VARCHAR(50) NOT NULL
	, preco NUMERIC(8, 4) NOT NULL
	, descricao VARCHAR(150) NOT NULL
);

CREATE TABLE servico(
	id BIGINT NOT NULL
	, id_funcionario BIGINT NOT NULL
	, id_hospedagem BIGINT NOT NULL
	, id_tipo_servico BIGINT NOT NULL
	, data_inicio_servico TIMESTAMP NOT NULL
	, data_fim_servico TIMESTAMP NOT NULL
	, status_do_servico BOOLEAN NOT NULL
);

CREATE TABLE produto(
	id BIGINT NOT NULL
	, id_local_hospedagem BIGINT NOT NULL
	, nome VARCHAR(50) NOT NULL
	, descricao VARCHAR(150) NOT NULL
	, preco NUMERIC(8, 4) NOT NULL
	, quantidade_em_estoque INT NOT NULL
);

CREATE TABLE hospedagem_produto(
	id_hospedagem BIGINT NOT NULL
	, id_produto BIGINT NOT NULL
	, quantidade INT NOT NULL
	, valor NUMERIC(8, 4) NOT NULL
);

-- EXECUTA OS ALTER TABLES PARA FKs e PKs
ALTER TABLE pessoa ADD PRIMARY KEY(id);

ALTER TABLE pessoa_fisica ADD PRIMARY KEY(id);
ALTER TABLE pessoa_fisica ADD FOREIGN KEY(id_pessoa) REFERENCES pessoa(id);

ALTER TABLE pessoa_juridica ADD PRIMARY KEY(id);
ALTER TABLE pessoa_juridica ADD FOREIGN KEY(id_pessoa) REFERENCES pessoa(id);

ALTER TABLE funcionario ADD PRIMARY KEY(id);
ALTER TABLE funcionario ADD FOREIGN KEY(id_pessoa_fisica) REFERENCES pessoa_fisica(id);

ALTER TABLE tipo_local_hospedagem ADD PRIMARY KEY(id);

ALTER TABLE tipo_quarto ADD PRIMARY KEY(id);

ALTER TABLE quarto ADD PRIMARY KEY(id);
ALTER TABLE quarto ADD FOREIGN KEY(id_tipo_quarto) REFERENCES tipo_quarto(id);

ALTER TABLE local_hospedagem ADD PRIMARY KEY(id);
ALTER TABLE local_hospedagem ADD FOREIGN KEY(id_tipo_local_hospedagem) REFERENCES tipo_local_hospedagem(id);
ALTER TABLE local_hospedagem ADD FOREIGN KEY(id_quarto) REFERENCES quarto(id);

ALTER TABLE reserva ADD PRIMARY KEY(id);
ALTER TABLE reserva ADD FOREIGN KEY(id_pessoa) REFERENCES pessoa(id);
ALTER TABLE reserva ADD FOREIGN KEY(id_local_hospedagem) REFERENCES local_hospedagem(id);

ALTER TABLE hospedagem ADD PRIMARY KEY(id);
ALTER TABLE hospedagem ADD FOREIGN KEY(id_reserva) REFERENCES reserva(id);

ALTER TABLE tipo_servico ADD PRIMARY KEY(id);

ALTER TABLE servico ADD PRIMARY KEY(id);
ALTER TABLE servico ADD FOREIGN KEY(id_funcionario) REFERENCES funcionario(id);
ALTER TABLE servico ADD FOREIGN KEY(id_hospedagem) REFERENCES hospedagem(id);
ALTER TABLE servico ADD FOREIGN KEY(id_tipo_servico) REFERENCES tipo_servico(id);

ALTER TABLE produto ADD PRIMARY KEY(id);
ALTER TABLE produto ADD FOREIGN KEY(id_local_hospedagem) REFERENCES local_hospedagem(id);

ALTER TABLE hospedagem_produto ADD FOREIGN KEY(id_hospedagem) REFERENCES hospedagem(id);
ALTER TABLE hospedagem_produto ADD FOREIGN KEY(id_produto) REFERENCES produto(id);

-- CRIA AS SEQUENCIAS
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

CREATE SEQUENCE hospedagem_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE hospedagem ALTER COLUMN id SET DEFAULT NEXTVAL('hospedagem_id_seq');

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

CREATE SEQUENCE tipo_servico_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE tipo_servico ALTER COLUMN id SET DEFAULT NEXTVAL('tipo_servico_id_seq');

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