@startuml Hospedagem

entity pessoa{
    id <<PK>>
    telefone
    pais
    estado
    cidade
    endereco
    cep
}

CREATE SEQUENCE pessoa_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE pessoa ALTER COLUMN id SET DEFAULT NEXTVAL('pessoa_id_seq');

entity pessoa_fisica{
    id <<PK>>
    nome
    cpf
    rg
    genero
    data_nascimento
    telefone_emergencia
    id_pessoa <<FK>>
}

CREATE SEQUENCE pessoa_fisica_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE pessoa_fisica ALTER COLUMN id SET DEFAULT NEXTVAL('pessoa_fisica_id_seq');

entity pessoa_juridica{
    id <<PK>>
    cnpj
    razao_social
    nome_fantasia
    data_abertura
    id_pessoa <<FK>>
}

CREATE SEQUENCE pessoa_juridica_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE pessoa_juridica ALTER COLUMN id SET DEFAULT NEXTVAL('pessoa_juridica_id_seq');


entity funcionario{
    id <<PK>>C
    id_pessoa_fisica <<FK>>
    matricula
    data_admissao
    situacao
    cargo
    salario
}

CREATE SEQUENCE funcionario_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE funcionario ALTER COLUMN id SET DEFAULT NEXTVAL('funcionario_id_seq');


entity reserva{
    id <<PK>>
    id_pessoa <<FK>>
    id_local_hospedagem <<FK>>
    data_inicio
    data_fim
    status_reserva
    valor_total
}

CREATE SEQUENCE reserva_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE reserva ALTER COLUMN id SET DEFAULT NEXTVAL('reserva_id_seq');


entity hospedagem{
    id <<PK>>
    id_reserva <<FK>>
    id_comanda <<FK>>
    id_pessoa_fisica <<FK>>
    data_check_in
    data_check_out
}

CREATE SEQUENCE hospedagem_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE hospedagem ALTER COLUMN id SET DEFAULT NEXTVAL('hospedagem_id_seq');


entity tipo_local_hospedagem{
    id <<PK>>
    nome
    descricao
    numero_de_camas
}

CREATE SEQUENCE tipo_local_hospedagem_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE tipo_local_hospedagem ALTER COLUMN id SET DEFAULT NEXTVAL('tipo_local_hospedagem_id_seq');




entity local_hospedagem{
    id <<PK>>
    id_tipo_local_hospedagem <<FK>>
    id_quarto <<FK>>
    nome
    descricao
    endereco
}

CREATE SEQUENCE local_hospedagem_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE local_hospedagem ALTER COLUMN id SET DEFAULT NEXTVAL('local_hospedagem_id_seq');


entity tipo_quarto{
    id <<PK>>
    nome
    preco
    descricao
}

CREATE SEQUENCE tipo_quarto_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE tipo_quarto ALTER COLUMN id SET DEFAULT NEXTVAL('tipo_quarto_id_seq');




entity quarto{
    id <<PK>>
    id_tipo_quarto <<FK>>
    capacidade
}

CREATE SEQUENCE quarto_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE quarto ALTER COLUMN id SET DEFAULT NEXTVAL('quarto_id_seq');




entity tipo_servico{
    id <<PK>>
    nome
    preco
    descricao
}


CREATE SEQUENCE tip_servico_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE tipo_servico ALTER COLUMN id SET DEFAULT NEXTVAL('tipo_servico_id_seq');

entity servico{
    id <<PK>>
    id_funcionario <<FK>>
    id_hospedagem <<FK>>
    id_tipo_servico <<FK>>
    data_inicio_servico
    data_fim_servico
    status_do_servico
}

CREATE SEQUENCE servico_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE servico ALTER COLUMN id SET DEFAULT NEXTVAL('servico_id_seq');



entity produto{
    id <<PK>>
    id_local_hospedagem <<FK>>
    nome
    descricao
    preco
    quantidade_em_estoque
}

CREATE SEQUENCE produto_id_seq
INCREMENT 1
START 1
CACHE 1;

ALTER TABLE produto ALTER COLUMN id SET DEFAULT NEXTVAL('produto_id_seq');


entity hospedagem_produto{
    id_hospedagem <<FK>>
    id_produto <<FK>>
    quantidade
    valor
}

pessoa "1..0" -- "1..1" pessoa_fisica
pessoa "1..0" -- "1..1" pessoa_juridica

pessoa_fisica "1..0" -- "1..1" funcionario

reserva "n..1" -- "1..n" pessoa
hospedagem "1..1" -- "1..0" reserva

local_hospedagem "1..0" -- "1..1" reserva
local_hospedagem "1..1" -- "1..1" tipo_local_hospedagem

quarto "n..1" -- "1..n" tipo_quarto
quarto "n..1" -- "1..n" local_hospedagem

produto "n..1" -- "1..n" local_hospedagem

hospedagem_produto "n..1" -- "1..n" produto
hospedagem_produto "n..1" -- "1..n" hospedagem

servico "n..1" -- "1..n" tipo_servico
servico "n..1" -- "1..n" funcionario
servico "n..1" -- "1..n" hospedagem

hospedagem -- pessoa_fisica

@enduml