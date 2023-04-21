-- 1) Faça uma consulta que apresente a quantidade geral de todos os serviços solicitados.
SELECT
	count(*) AS "Quantidade serviços solicitados"
FROM
	servico s;

-- Referência
-- Serviço
SELECT
	s.*
FROM
	servico s;

-- 2) Faça uma consulta que apresente o nome dos clientes que se hospedaram no ano de 2022.
SELECT
	pf.nome AS "Nome"
FROM
	hospedagem h
JOIN pessoa_fisica pf ON
	pf.id = h.id_pessoa_fisica
WHERE
	h.data_check_in BETWEEN '2022-01-01'::date AND '2022-12-31'::date;

-- Referência
SELECT
	h.*
FROM
	hospedagem h;

SELECT
	pf.*
FROM
	pessoa_fisica pf;

-- 3) Faça uma consulta que apresente o nome e razão social e endereço dos clientes que já fizeram reservas no quarto de número 1903 e no 1909.
SELECT
	pj.razao_social AS "Razão social"
	, pf.nome AS "Nome"
	, p.endereco || ', ' || p.cep::varchar || ', ' || p.estado || ' - ' || p.pais AS "Endereço"
FROM
	reserva r
JOIN pessoa p ON
	p.id = r.id_pessoa
LEFT JOIN pessoa_juridica pj ON
	pj.id_pessoa = p.id
LEFT JOIN pessoa_fisica pf ON
	pf.id_pessoa = p.id
JOIN local_hospedagem lh ON
	lh.id = r.id_local_hospedagem
JOIN quarto q ON
	q.id = lh.id_quarto
WHERE
	q.numero IN (
		1903, 1909
	);

-- Referência
SELECT
	r.*
FROM
	reserva r;

SELECT
	p.*
FROM
	pessoa p;

SELECT
	pj.*
FROM
	pessoa_juridica pj;

SELECT
	lh.*
FROM
	local_hospedagem lh;

SELECT
	q.*
FROM
	quarto q;

-- 4) Faça uma consulta que apresente a quantidade de clientes que já se hospedaram em um quarto do tipo Luxo.
SELECT
	*
FROM
	hospedagem h
JOIN reserva r ON
	r.id = h.id_reserva
JOIN local_hospedagem lh ON
	lh.id = r.id_local_hospedagem
JOIN quarto q ON
	q.id = lh.id_quarto
JOIN tipo_quarto tq ON
	tq.id = q.id_tipo_quarto
	AND tq.nome = 'Luxo';

-- 5) Faça uma consulta que apresente a média geral de todos os valores gastos em produtos nas hospedagens.
SELECT
	avg(hp.valor) AS "Valor"
	, p.nome AS "Nome produto"
FROM
	hospedagem_produto hp
JOIN produto p ON
	p.id = hp.id_produto
GROUP BY
	hp.id_produto
	, p.nome;

-- 6) Faça uma consulta que apresente a soma dos valores gastos por produtos agrupados por tipo de quarto.
SELECT
	sum(hp.valor) AS "Valor"
	, tq.nome AS "Tipo quarto"
FROM
	hospedagem_produto hp
JOIN produto p ON
	p.id = hp.id_produto
JOIN local_hospedagem lh ON
	lh.id = p.id_local_hospedagem
JOIN quarto q ON
	q.id = lh.id_quarto
JOIN tipo_quarto tq ON
	tq.id = q.id_tipo_quarto
GROUP BY
	tq.id;

-- 7) Faça uma consulta que apresente as reservas em que o cliente não compareceu baseados nas hospedagens efetivadas.
SELECT
	r.*
FROM
	reserva r
LEFT JOIN hospedagem h ON
	h.id_reserva = r.id
WHERE
	h.id IS NULL;

-- 8) Faça uma consulta que apresente o CNPJ apenas dos clientes pessoa jurídica que utilizaram o serviço de lavanderia.
-- Mesmo que em hospedagens diferentes tenham utilizado o serviço, somente deve aparecer na lista uma vez o CNPJ.
SELECT
	DISTINCT pj.cnpj
FROM
	pessoa_juridica pj
JOIN reserva r ON
	r.id_pessoa = pj.id_pessoa
JOIN hospedagem h ON
	h.id_reserva = r.id
JOIN servico s ON
	s.id_hospedagem = h.id
JOIN tipo_servico ts ON
	ts.id = s.id_tipo_servico
	AND ts.nome = 'Lavanderia';

-- 9) Faça uma consulta que apresente o todos os clientes com nome ou razão social, endereço e o valor total gasto em uma hospedagem, incluindo serviços e consumos.
SELECT
	pj.razao_social AS "Razão social"
	, pf.nome AS "Nome"
	, p.endereco || ', ' || p.cep::varchar || ', ' || p.estado || ' - ' || p.pais AS "Endereço"
	, lh.endereco "Endereço hospedagem"
	, (
		SELECT
			sum(ts.preco)
		FROM
			servico s
		JOIN tipo_servico ts ON
			ts.id = s.id_tipo_servico
		WHERE
			s.id_hospedagem = h.id
	) +
	(
		SELECT
			sum(hp.valor)
		FROM
			hospedagem_produto hp
		WHERE
			hp.id_hospedagem = h.id
	)
	+ r.valor_total
	AS "Valor total"
FROM
	reserva r
JOIN pessoa p ON
	p.id = r.id_pessoa
LEFT JOIN pessoa_juridica pj ON
	pj.id_pessoa = p.id
LEFT JOIN pessoa_fisica pf ON
	pf.id_pessoa = p.id
JOIN hospedagem h ON
	h.id_reserva = r.id
JOIN local_hospedagem lh ON
	lh.id = r.id_local_hospedagem;

-- 10) Faça uma consulta que apresente o nome e CPF dos clientes que já foram atendidos por um funcionário e o nome desse funcionário.
-- Caso tenha sido atendido por esse mesmo funcionário, não repita a informação.
SELECT
	pf.nome AS "Nome"
	, pf.cpf AS "CPF"
	, pf_f.nome AS "Nome funcionário"
FROM
	hospedagem h
JOIN pessoa_fisica pf ON
	pf.id = h.id_pessoa_fisica
JOIN servico s ON
	s.id_hospedagem = h.id
JOIN funcionario f ON
	f.id = s.id_funcionario
JOIN pessoa_fisica pf_f ON
	pf_f.id = f.id_pessoa_fisica
GROUP pf.nome
	, pf.cpf
	, pf_f.nome;

-- 11) Faça uma consulta de sua escolha que gere um relatório relevante para regra de negócio. O nível de complexidade da consulta definirá o peso para a questão.



