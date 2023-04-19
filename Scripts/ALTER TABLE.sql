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
