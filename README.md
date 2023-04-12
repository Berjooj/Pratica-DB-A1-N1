Regras para avaliação A1/N1:

- Apresente em aula as consultas e o Diagrama Entidade Relacionamento (DER).
- As informações inseridas na apresentação, formato e a regra de negócio fazem parte da avaliação.
- A apresentação será desconsiderada caso os alunos façam apenas leitura de código e/ou leitura de comentários.
- A apresentação será desconsiderada caso ultrapasse o tempo de máximo de 10 minutos.
- A apresentação será desconsiderada caso as explicações sejam dispersas e/ou superficiais.
- A apresentação será desconsiderada caso os alunos não demonstrem domínio do assunto e/ou conteúdo do código e DER.
- Todos as implementações devem estar funcionado e devem ser executadas na apresentação.
- Para o modelo físico utilize sequencias e adicione separadamente as chaves no modelo conforme visto em aula.


1. Faca o DER e crie o modelo físico de um sistema de Hospedagem:

- As reservas podem ser feitas por pessoas físicas ou pessoas jurídicas.
- Pessoas físicas podem fazer reserva para outras pessoas físicas.
- Quando uma pessoa jurídica fizer a reserva obrigatoriamente deve indicar que pessoa física ficará hospedado.
- Existem reservas e essas reservas podem ou não se transformar em hospedagens dependendo do comparecimento de hospedes.
- Existe vários locais hospedagem e tipos de locais de hospedagem.
- Existem vários quartos e tipos de quartos.
- Nesses locais existem serviços prestados aos hospedes.
- Esses serviços podem ser agendados.
- Nesses locais existem produtos que são vendidos aos hospedes.
- Existem funcionários que prestam serviços nesses locais e esses são pessoas.
- Adicione ao DER as informações e regras de negócio que achar necessário desde sigam a logica de sistemas.
- Siga as orientações das normalizações de dados (Formas Normais) e evite qualquer redundância de dados, dando o máximo de coerência entre as relações.
- Todos os atributos devem ser NOT NULL.


2. Alimente o banco de dados com informações de forma relevante para que seja viável fazer as seguintes consultas e de forma que tenham coerência.


3. Faça as seguintes consultas:

- Faça uma consulta que apresente a quantidade geral de todos os serviços solicitados.

- Faça uma consulta que apresente o nome dos clientes que se hospedaram no ano de 2022.

- Faça uma consulta que apresente o nome e razão social e endereço dos clientes que já fizeram reservas no quarto de número 1903 e no 1909.

- Faça uma consulta que apresente a quantidade de clientes que já se hospedaram em um quarto do tipo Luxo.

- Faça uma consulta que apresente a média geral de todos os valores gastos em produtos nas hospedagens.

- Faça uma consulta que apresente a soma dos valores gastos por produtos agrupados por tipo de quarto.

- Faça uma consulta que apresente as reservas em que o cliente não compareceu baseados nas hospedagens efetivadas.

- Faça uma consulta que apresente o CNPJ apenas dos clientes pessoa jurídica que utilizaram o serviço de lavanderia. Mesmo que em hospedagens diferentes tenham utilizado o serviço, somente deve aparecer na lista uma vez o CNPJ.

- Faça uma consulta que apresente o todos os clientes com nome ou razão social, endereço e o valor total gasto em uma hospedagem, incluindo serviços e consumos.

- Faça uma consulta que apresente o nome e CPF dos clientes que já foram atendidos por um funcionário e o nome desse funcionário. Caso tenha sido atendido por esse mesmo funcionário, não repita a informação.

- Faça uma consulta de sua escolha que gere um relatório relevante para regra de negócio. O nível de complexidade da consulta definirá o peso para a questão.
