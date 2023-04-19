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

entity pessoa_juridica{
    id <<PK>>
    cnpj
    razao_social
    nome_fantasia
    data_abertura
    id_pessoa <<FK>>
}

entity funcionario{
    id <<PK>>
    id_pessoa_fisica <<FK>>
    matricula
    data_admissao
    situacao
    cargo
    salario
}

entity reserva{
    id <<PK>>
    id_pessoa <<FK>>
    id_local_hospedagem <<FK>>
    data_inicio
    data_fim
    status_reserva
    valor_total
}

entity hospedagem{
    id <<PK>>
    id_reserva <<FK>>
    id_pessoa_fisica <<FK>>
    data_check_in
    data_check_out
}

entity tipo_local_hospedagem{
    id <<PK>>
    nome
    descricao
    numero_de_camas
}

entity local_hospedagem{
    id <<PK>>
    id_tipo_local_hospedagem <<FK>>
    id_quarto <<FK>>
    nome
    descricao
    endereco
}

entity tipo_quarto{
    id <<PK>>
    nome
    preco
    descricao
}

entity quarto{
    id <<PK>>
    id_tipo_quarto <<FK>>
    capacidade
}

entity tipo_servico{
    id <<PK>>
    nome
    preco
    descricao
}

entity servico{
    id <<PK>>
    id_funcionario <<FK>>
    id_hospedagem <<FK>>
    id_tipo_servico <<FK>>
    data_inicio_servico
    data_fim_servico
    status_do_servico
}

entity produto{
    id <<PK>>
    id_local_hospedagem <<FK>>
    nome
    descricao
    preco
    quantidade_em_estoque
}

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
