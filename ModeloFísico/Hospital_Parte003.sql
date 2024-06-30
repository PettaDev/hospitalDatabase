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


#Inclua ao menos 15 pacientes.
INSERT INTO pacientes(nome, cpf, data_nascimento) VALUES
('Ana Clara Silva Oliveira', 00000000000, '1990-01-01'),
('Bruno Henrique Santos Souza', 11111111111, '1985-02-02'),
('Camila Fernanda Pereira Gomes', 22222222222, '1995-03-03'),
('Daniel Eduardo Cardoso Mendes', 33333333333, '2000-04-04'),
('Gabriela Isabella Nunes Dias', 44444444444, '1982-05-05'),
('Henrique Augusto Costa Oliveira', 55555555555, '1992-06-06'),
('Isabella Sofia Martins Rodrigues', 66666666666, '1978-07-07'),
('Ana Silva', '77777777777', '1985-02-01'),
('João Pereira', '88888888888', '1990-02-02'),
('Maria Oliveira', '99999999999', '1995-03-03'),
('Carlos Souza', '10000000000', '2000-04-04'),
('Bruna Santos', '11000000000', '2005-05-05'),
('Pedro Gomes', '12000000000', '2010-06-06'),
('Luisa Dias', '13000000000', '2015-07-07'),
('Rafael Mendes', '14000000000', '2020-08-08'),
('Amanda Costa', '15000000000', '2021-09-09');

#Registre 20 consultas de diferentes pacientes e diferentes médicos(alguns pacientes realizam mais que uma consulta).
-- As consultas devem ter ocorrido entre 01/01/2015 e 01/01/2022. 

-- Ao menos dez consultas devem ter receituário com dois ou mais 

INSERT INTO receitas(descricao) VALUES
('Dieta leve com foco em proteínas e vegetais'),
('Exercícios para fortalecer o core e melhorar a postura'),
('Medicação para controlar a pressão arterial e reduzir o colesterol'),
('Fisioterapia para recuperar a amplitude de movimento após a cirurgia'),
('Psicoterapia para lidar com ansiedade e estresse'),
('Vacinação contra gripe e pneumonia'),
('Exames de sangue para verificar glicemia e colesterol'),
('Consulta oftalmológica para verificar a saúde dos olhos'),
('Aparelho auditivo para auxiliar na audição'),
('Orientação nutricional para perda de peso e controle alimentar');

#Inclua ao menos quatro convênios médicos
INSERT INTO convenios(nome, cnpj, tempo_carencia) VALUES
('Plano Saúde Familiar', '00.000.000/0001-00', '2024-08-01'),
('Plano Odontológico Dental Sorriso', '11.111.111/0001-01', '2023-12-24'),
('Plano de Visão Óptica Visão Clara', '22.222.222/0001-02', '2024-04-15'),
('Plano Completo ABC', '33.333.333/0001-03', '2024-02-02');

INSERT INTO consultas(data_hora, medico_id, convenio_id, paciente_id, receita_id) VALUES
('2020-04-01 10:30:00', '1', '1', '2', '1'),
('2020-05-15 19:00:00', '2', '2', '2', '2'),
('2020-06-30 16:30:00', '3', '3', '3', '3'),
('2020-07-01 15:30:00', '4', '4', '4', '4'),
('2015-08-30 14:00:00', '5', '1', '5', '5'),
('2017-08-40 13:30:00', '6', '2', '6', '6'),
('2021-09-30 12:30:00', '7', '3', '7', '7'),
('2020-05-30 11:00:00', '8', '4', '8', '8'),
('2021-10-30 10:30:00', '9', '1', '9', '9'),
('2020-12-30 10:30:00', '10', '2', '10', '10'),
('2019-04-30 15:40:00', '1', '3', '11', '2'),
('2020-03-30 10:30:00', '2', '4', '12', '3'),
('2016-02-30 10:00:00', '3', '1', '13', '4'),
('2020-01-30 12:30:00', '4', '2', '14', '5'),
('2015-06-30 11:30:00', '5', '3', '15', '6'),
('2022-07-30 10:30:00', '6', '4', '1', '6'),
('2015-08-30 11:30:00', '7', '1', '12', '7'),
('2017-07-30 12:00:00', '8', '2', '3', '8'),
('2019-06-30 11:30:00', '9', '3', '6', '9'),
('2022-04-30 10:30:00', '10', '4', '7', '10'),
('2021-03-30 12:00:00', '1', '1', '9', '1');



# Criar entidade de relacionamento entre médico e especialidade. 
CREATE TABLE medico_especializacao(
medico_id INT,
especializacao_id INT,
PRIMARY KEY (medico_id, especializacao_id),
FOREIGN KEY (medico_id) REFERENCES medicos (medico_id),
FOREIGN KEY (especializacao_id) REFERENCES especiazacoes(especializacao_id)
)default charset = utf8mb4 engine = InnoDB;


# Criar entidade entre internação e enfermeiro.
CREATE TABLE internacao_enfermeiro(
internacao_id INT,
enfermeiro_id INT,
FOREIGN KEY (internacao_id) REFERENCES internacoes (internacao_id),
FOREIGN KEY (enfermeiro_id) REFERENCES enfermeiros (enfermeiro_id)
)default charset = utf8mb4 engine = InnoDB;

# Colocar chaves estrangeira dentro da internação (Chaves Médico e Paciente).
-- Criando uma coluna
ALTER TABLE internacoes
ADD medico_id INT;

ALTER TABLE internacoes
ADD paciente_id INT;

-- Adicionando a FK
ALTER TABLE internacoes ADD COLUMN medico_id INT;

ALTER TABLE internacoes ADD CONSTRAINT medico_id
FOREIGN KEY (medico_id) REFERENCES medicos(medico_id);

ALTER TABLE internacoes ADD CONSTRAINT paciente_id
FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id);

#Registre ao menos sete internações. Pelo menos dois pacientes devem ter se internado mais de uma vez.
#Ao menos três quartos devem ser cadastrados. As internações devem ter ocorrido entre 01/01/2015 e 01/01/2022.

INSERT INTO internacoes(data_entrada, data_prevista_alta, quarto_id, paciente_id, medico_id) VALUES
('2018-03-15', '2018-03-20', 4, 1, 1),
('2020-11-12', '2020-11-17', 5, 2, 7),
('2017-08-01', '2017-08-10', 6, 1, 3),
('2019-04-05', '2019-04-12', 4, 3, 5),
('2021-07-23', '2021-07-28', 5, 2, 4),
('2016-05-09', '2016-05-14', 6, 1, 2),
('2015-12-25', '2016-01-03', 4, 3, 6);


INSERT INTO quartos(numero, tipoq_id, paciente_id) VALUES
(101, 1, 1),
(202, 2, 2),
(303, 3, 3);

#Considerando que “a princípio o hospital trabalha com apartamentos, quartos duplos e enfermaria”, inclua ao menos esses três tipos com valores diferentes.
CREATE TABLE apartamentos(
	tipoq_id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(255),
    valor_diaria INT,
    descricao VARCHAR(255)
)default charset = utf8mb4 engine = InnoDB;


CREATE TABLE enfermaria(
	tipoq_id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(255),
    valor_diaria INT,
    descricao VARCHAR(255)
)default charset = utf8mb4 engine = InnoDB;


#Inclua dados de dez profissionais de enfermaria. Associe cada internação a ao menos dois enfermeiros.

INSERT INTO enfermeiros (nome, internacao_id) VALUES
  ('Ana Clara Silva', 1),
  ('João Oliveira', 1),
  ('Maria Souza', 2),
  ('Carlos Gomes', 2),
  ('Bruna Santos', 3),
  ('Pedro Mendes', 3),
  ('Luisa Dias', 4),
  ('Rafael Costa', 4),
  ('Amanda Pereira', 5),
  ('Eduardo Lima', 5),
  ('Mariana Dias', 6),
  ('Bruno Oliveira', 6),
  ('Ana Souza', 7),
  ('Carlos Mendes', 7);

#Os dados de tipo de quarto são essenciais para a operação do sistema e, portanto, devem ser povoados assim que o sistema for instalado. 
INSERT INTO tipos_quartos(tipo, valor_diaria, descricao) VALUES
('Individual', 100.00, 'Quarto com uma cama, ideal para quem busca privacidade.'),
('Duplo', 150.00, 'Quarto com duas camas, perfeito para casais ou amigos.'),
('Suite', 200.00, 'Quarto amplo com cama king size, sala de estar e banheiro privativo, ideal para quem deseja mais conforto.');
