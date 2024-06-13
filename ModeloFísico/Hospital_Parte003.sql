#Incluindo dez médicos de diferentes especialidades.
INSERT INTO medicos VALUES
(),
(),
(),
(),
(),
(),
(),
(),
(),
();

#Ao menos sete especialidades 
#(considere a afirmação de que “entre as especialidades há pediatria, clínica geral, gastrenterologia e dermatologia”).
INSERT INTO especializacoes VALUES
(),
(),
(),
(),
(),
(),
();

#Inclua ao menos 15 pacientes.
INSERT INTO pacientes VALUES
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
();

#Registre 20 consultas de diferentes pacientes e diferentes médicos(alguns pacientes realizam mais que uma consulta).
#As consultas devem ter ocorrido entre 01/01/2015 e 01/01/2022. Ao menos dez consultas devem ter receituário com dois ou mais 

INSERT INTO consultas VALUES
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
(),
();

#Inclua ao menos quatro convênios médicos, associe ao menos cinco pacientes e cinco consultas.
INSERT INTO convenios VALUES
(),
(),
(),
();


# Criar entidade de relacionamento entre médico e especialidade. 
-- Feito na Parte 002

# Entidade de Relacionamento entre internação e enfermeiro.
-- Feito na Parte 002

# Arrumar a chave estrangeira do relacionamento entre convênio e médico.
-- Dúvidas

# Criar entidade entre internação e enfermeiro.
-- Feito na Parte 002

# Colocar chaves estrangeira dentro da internação (Chaves Médico e Paciente).
-- Criando uma coluna
ALTER TABLE internacoes
ADD medico_id INT;

-- Adicionando a FK
ALTER TABLE internacoes ADD CONSTRAINT medico_id
FOREIGN KEY (medico_id) REFERENCES medicos(medico_id);

#Registre ao menos sete internações.
#Pelo menos dois pacientes devem ter se internado mais de uma vez.
#Ao menos três quartos devem ser cadastrados. As internações devem ter ocorrido entre 01/01/2015 e 01/01/2022.

INSERT INTO internacoes VALUES
(),
(),
(),
();

INSERT INTO quartos VALUES
(),
(),
(),
();

INSERT INTO tipos_quartos VALUES
(),
(),
(),
();

#Considerando que “a princípio o hospital trabalha com apartamentos, quartos duplos e enfermaria”, inclua ao menos esses três tipos com valores diferentes.
CREATE TABLE apartamentos(
	tipoq_id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(255),
    valor_diaria INT,
    descricao VARCHAR(255)
)default charset = utf8mb4 engine = InnoDB;

INSERT INTO tipos_quartos VALUES
();

CREATE TABLE enfermaria(
	tipoq_id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(255),
    valor_diaria INT,
    descricao VARCHAR(255)
)default charset = utf8mb4 engine = InnoDB;


#Inclua dados de dez profissionais de enfermaria. Associe cada internação a ao menos dois enfermeiros.

INSERT INTO enfermeiros VALUES
(),
(),
(),
();

#Os dados de tipo de quarto, convênio e especialidade são essenciais para a operação do sistema e, portanto, devem ser povoados assim que o sistema for instalado. 
INSERT INTO tipos_quartos VALUES
(),
(),
(),
();
INSERT INTO convenios VALUES
(),
(),
(),
();
INSERT INTO especializacoes VALUES
(),
(),
(),
();
