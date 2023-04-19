CREATE TABLE pessoa (
id BIGINT NOT NULL,
telefone VARCHAR(20) NOT NULL,
pais VARCHAR(50) NOT NULL,
estado VARCHAR(50) NOT NULL,
cidade VARCHAR(50) NOT NULL,
endereco VARCHAR(50) NOT NULL,
cep INT NOT NULL
);

CREATE TABLE pessoa_fisica(
id BIGINT NOT NULL,
nome VARCHAR(50) NOT NULL,
cpf VARCHAR(20) NOT NULL,
rg VARCHAR(10) NOT NULL,
genero VARCHAR(15) NOT NULL,
data_nascimento TIMESTAMP NOT NULL,
telefone_emergencia VARCHAR(20) NOT NULL,
id_pessoa BIGINT NOT NULL
);

CREATE TABLE pessoa_juridica(
id BIGINT NOT NULL,
cnpj VARCHAR(20) NOT NULL,
razao_social VARCHAR(50) NOT NULL,
nome_fantasia VARCHAR(50) NOT NULL,
data_abertura TIMESTAMP NOT NULL,
id_pessoa BIGINT NOT NULL
);

CREATE TABLE funcionario(
id BIGINT NOT NULL,
id_pessoa_fisica BIGINT NOT NULL,
matricula VARCHAR(20) NOT NULL,
data_admissao TIMESTAMP NOT NULL,
situacao BOOLEAN NOT NULL,
cargo VARCHAR(50) NOT NULL,
salario NUMERIC(8, 4) NOT NULL
);

CREATE TABLE reserva(
id BIGINT NOT NULL,
id_pessoa BIGINT NOT NULL,
id_local_hospedagem BIGINT NOT NULL,
data_inicio TIMESTAMP NOT NULL,
data_fim TIMESTAMP NOT NULL,
status_reserva BOOLEAN NOT NULL,
valor_total NUMERIC(8, 4) NOT NULL
);

CREATE TABLE hospedagem(
id BIGINT NOT NULL,
id_reserva BIGINT NOT NULL,
id_pessoa_fisica BIGINT NOT NULL,
data_check_in TIMESTAMP NOT NULL,
data_check_out TIMESTAMP NOT NULL
);

CREATE TABLE tipo_local_hospedagem(
id BIGINT NOT NULL,
nome VARCHAR(50) NOT NULL,
descricao VARCHAR(50) NOT NULL,
numero_de_camas INT NOT NULL
);

CREATE TABLE local_hospedagem(
id BIGINT NOT NULL,
id_tipo_local_hospedagem BIGINT NOT NULL,
id_quarto BIGINT NOT NULL,
nome VARCHAR(50) NOT NULL,
descricao VARCHAR(50) NOT NULL,
endereco VARCHAR(50) NOT NULL
);

CREATE TABLE tipo_quarto(
id BIGINT NOT NULL,
nome VARCHAR(50) NOT NULL,
preco NUMERIC(8, 4) NOT NULL,
descricao VARCHAR(50) NOT NULL
);

CREATE TABLE quarto(
id BIGINT NOT NULL,
id_tipo_quarto BIGINT NOT NULL,
capacidade INT NOT NULL
);

CREATE TABLE tipo_servico(
id BIGINT NOT NULL,
nome VARCHAR(50) NOT NULL,
preco NUMERIC(8, 4) NOT NULL,
descricao VARCHAR(50) NOT NULL
);

CREATE TABLE servico(
id BIGINT NOT NULL,
id_funcionario BIGINT NOT NULL,
id_hospedagem BIGINT NOT NULL,
id_tipo_servico BIGINT NOT NULL,
data_inicio_servico TIMESTAMP NOT NULL,
data_fim_servico TIMESTAMP NOT NULL,
status_do_servico BOOLEAN NOT NULL
);

CREATE TABLE produto(
id BIGINT NOT NULL,
id_local_hospedagem BIGINT NOT NULL,
nome VARCHAR(50) NOT NULL,
descricao VARCHAR(50) NOT NULL,
preco NUMERIC(8, 4) NOT NULL,
quantidade_em_estoque INT NOT NULL
);

CREATE TABLE hospedagem_produto(
id_hospedagem BIGINT NOT NULL,
id_produto BIGINT NOT NULL,
quantidade INT NOT NULL,
valor NUMERIC(8, 4) NOT NULL
);