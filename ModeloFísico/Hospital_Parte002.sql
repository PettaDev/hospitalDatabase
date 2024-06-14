CREATE DATABASE IF NOT EXISTS HOSPITAL
default character set utf8mb4
default collate utf8mb4_general_ci;
#Criando Database e definindo a linguagem padrão

USE HOSPITAL;

CREATE TABLE convenios(
    convenio_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
    cnpj VARCHAR(18),
    tempo_carencia DATETIME
)default charset = utf8mb4 engine = InnoDB;

CREATE TABLE pacientes(
	paciente_id INT PRIMARY KEY auto_increment,
	nome VARCHAR(255),
	cpf VARCHAR(11),
	data_nascimento DATE,
    convenio_id INT,
    foreign key (convenio_id) references convenios(convenio_id)
)default charset = utf8mb4 engine = InnoDB;

CREATE TABLE especializacoes(
    especializacao_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255)
)default charset = utf8mb4 engine = InnoDB;

CREATE TABLE medicos(
    medico_id INT PRIMARY KEY auto_increment,
    nome varchar(255),
    cpf varchar(11) ,
    crm varchar(12) ,
    especializacao_id INT,
    FOREIGN KEY (especializacao_id) REFERENCES especializacoes (especializacao_id)
)default charset = utf8mb4 engine = InnoDB;


CREATE TABLE consultas(
    consulta_id INT PRIMARY KEY AUTO_INCREMENT,
    data_hora DATETIME,
    medico_id INT,
    convenio_id INT,
    especializacao_id INT,
    paciente_id INT,
    receita_id INT,
    FOREIGN KEY (medico_id) REFERENCES medicos(medico_id),
    FOREIGN KEY (convenio_id) REFERENCES convenios(convenio_id),
    FOREIGN KEY (especializacao_id) REFERENCES especializacoes(especializacao_id),
    FOREIGN KEY (receita_id) REFERENCES receitas(receita_id),
    FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id)
)default charset = utf8mb4 engine = InnoDB;

CREATE TABLE receitas(
    receita_id INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(255),
    paciente_id INT,
    medico_id INT,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id),
    FOREIGN KEY (medico_id) REFERENCES medicos(medico_id)
)default charset = utf8mb4 engine = InnoDB;

CREATE TABLE tipos_quartos(
	tipoq_id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(255),
    valor_diaria INT,
    descricao VARCHAR(255)
)default charset = utf8mb4 engine = InnoDB;

CREATE TABLE quartos(
    quarto_id INT PRIMARY KEY AUTO_INCREMENT,
    numero INT,
    tipoq_id INT,
    paciente_id INT,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id),
    FOREIGN KEY (tipoq_id) REFERENCES tipos_quartos(tipoq_id)
)default charset = utf8mb4 engine = InnoDB;

CREATE TABLE enfermeiros(
    enfermeiro_id INT PRIMARY KEY AUTO_INCREMENT,
    quarto_id INT,
    FOREIGN KEY (quarto_id) REFERENCES quartos(quarto_id)
)default charset = utf8mb4 engine = InnoDB;


CREATE TABLE internacoes(
    internacao_id INT PRIMARY KEY AUTO_INCREMENT,
    data_entrada DATETIME,
    data_prevista_alta DATETIME,
    quarto_id INT,
    enfermeiro_id INT,
    paciente_id INT,
    FOREIGN KEY (quarto_id) REFERENCES quartos(quarto_id),
    FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id),
	FOREIGN KEY (enfermeiro_id) REFERENCES enfermeiros(enfermeiro_id)
)default charset = utf8mb4 engine = InnoDB;
