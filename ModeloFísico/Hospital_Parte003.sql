#Incluindo dez médicos de diferentes especialidades.
INSERT INTO medicos(nome, cpf, crm, especializacao_id) VALUES
('Ana Clara Oliveira Silva', 00000000000, 12345, 1),
('Bruno Henrique Souza Santos', 11111111111, 54321, 2),
('Camila Fernanda Gomes Pereira', 22222222222, 98765, 3),
('Daniel Eduardo Mendes Cardoso', 33333333333, 43210, 4),
('Gabriela Isabella Nunes Dias', 44444444444, 87654, 5),
('Henrique Augusto Oliveira Costa', 55555555555, 21098, 6),
('Isabella Sofia Rodrigues Martins', 66666666666, 65432, 7),
('João Lucas Silva Araújo', 77777777777, 09876, 4),
('Laura Mariana Santos Oliveira', 88888888888, 54321, 2),
('Matheus Gabriel Pereira Silva', 99999999999, 98765, 3);



#Ao menos sete especialidades 
#(considere a afirmação de que “entre as especialidades há pediatria, clínica geral, gastrenterologia e dermatologia”).
INSERT INTO especializacoes(nome) VALUES
('Pediatria'),
('Clínico Geral'),
('Gastroenterologia'),
('Dermatologia'),
('Cardiologia'),
('Ortopedia'),
('Oftalmologia');



#Inclua ao menos 15 pacientes.
INSERT INTO pacientes(nome, cpf, data_nascimento, convenio_id) VALUES
('Ana Clara Silva Oliveira', 00000000000, '1990-01-01', 1),
('Bruno Henrique Santos Souza', 11111111111, '1985-02-02', 2),
('Camila Fernanda Pereira Gomes', 22222222222, '1995-03-03', 3),
('Daniel Eduardo Cardoso Mendes', 33333333333, '2000-04-04', 1),
('Gabriela Isabella Nunes Dias', 44444444444, '1982-05-05', 2),
('Henrique Augusto Costa Oliveira', 55555555555, '1992-06-06', 3),
('Isabella Sofia Martins Rodrigues', 66666666666, '1978-07-07', 1);

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
INSERT INTO convenios(nome, cnpj, tempo_carencia) VALUES
  ('Plano Saúde Familiar', '00.000.000/0001-00', '2024-08-01'),
  ('Plano Odontológico Dental Sorriso', '11.111.111/0001-01', '2023-12-24'),
  ('Plano de Visão Óptica Visão Clara', '22.222.222/0001-02', '2024-04-15'),
  ('Plano Completo ABC', '33.333.333/0001-03', '2024-02-02');

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
