CREATE DATABASE IF NOT EXISTS hospital
DEFAULT CHARACTER SET utf8mb4
DEFAULT COLLATE utf8mb4_general_ci;

USE hospital;

CREATE TABLE convenios(
    convenio_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    cnpj VARCHAR(18),
    tempo_carencia DATETIME
) DEFAULT CHARSET = utf8mb4 ENGINE = InnoDB;

CREATE TABLE pacientes(
    paciente_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    cpf VARCHAR(11),
    data_nascimento DATE
) DEFAULT CHARSET = utf8mb4 ENGINE = InnoDB;

CREATE TABLE especializacoes(
    especializacao_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255)
) DEFAULT CHARSET = utf8mb4 ENGINE = InnoDB;

CREATE TABLE medicos(
    medico_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    cpf VARCHAR(11),
    crm VARCHAR(12),
    especializacao_id INT
) DEFAULT CHARSET = utf8mb4 ENGINE = InnoDB;

CREATE TABLE consultas(
    consulta_id INT PRIMARY KEY AUTO_INCREMENT,
    data_hora DATETIME,
    valor INT,
    medico_id INT,
    convenio_id INT,
    especializacao_id INT,
    paciente_id INT,
    receita_id INT
) DEFAULT CHARSET = utf8mb4 ENGINE = InnoDB;

CREATE TABLE receitas(
    receita_id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(255)
) DEFAULT CHARSET = utf8mb4 ENGINE = InnoDB;

CREATE TABLE tipos_quartos(
    tipoq_id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(255),
    valor_diaria INT,
    descricao VARCHAR(255)
) DEFAULT CHARSET = utf8mb4 ENGINE = InnoDB;

CREATE TABLE quartos(
    quarto_id INT PRIMARY KEY AUTO_INCREMENT,
    numero INT,
    tipoq_id INT,
    paciente_id INT
) DEFAULT CHARSET = utf8mb4 ENGINE = InnoDB;

CREATE TABLE internacoes(
    internacao_id INT PRIMARY KEY AUTO_INCREMENT,
    data_entrada DATETIME,
    data_prevista_alta DATETIME,
    quarto_id INT,
    paciente_id INT
) DEFAULT CHARSET = utf8mb4 ENGINE = InnoDB;

CREATE TABLE enfermeiros(
    enfermeiro_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    internacao_id INT
) DEFAULT CHARSET = utf8mb4 ENGINE = InnoDB;

-- Adicionar Foreign Keys usando ALTER TABLE

ALTER TABLE medicos
    ADD CONSTRAINT fk_medicos_especializacoes FOREIGN KEY (especializacao_id) REFERENCES especializacoes(especializacao_id);

ALTER TABLE consultas
    ADD CONSTRAINT fk_consultas_medicos FOREIGN KEY (medico_id) REFERENCES medicos(medico_id),
    ADD CONSTRAINT fk_consultas_convenios FOREIGN KEY (convenio_id) REFERENCES convenios(convenio_id),
    ADD CONSTRAINT fk_consultas_especializacoes FOREIGN KEY (especializacao_id) REFERENCES especializacoes(especializacao_id),
    ADD CONSTRAINT fk_consultas_pacientes FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id);

ALTER TABLE quartos
    ADD CONSTRAINT fk_quartos_pacientes FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id),
    ADD CONSTRAINT fk_quartos_tipos_quartos FOREIGN KEY (tipoq_id) REFERENCES tipos_quartos(tipoq_id);

ALTER TABLE internacoes
    ADD CONSTRAINT fk_internacoes_quartos FOREIGN KEY (quarto_id) REFERENCES quartos(quarto_id),
    ADD CONSTRAINT fk_internacoes_pacientes FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id);

ALTER TABLE enfermeiros
    ADD CONSTRAINT fk_enfermeiros_internacoes FOREIGN KEY (internacao_id) REFERENCES internacoes(internacao_id);

ALTER TABLE consultas 
    ADD CONSTRAINT fk_consultas_receitas FOREIGN KEY (receita_id) REFERENCES receitas(receita_id);
