CREATE TABLE Campus (
    codigo INT PRIMARY KEY,
    endereco VARCHAR(255) NOT NULL,
    cidade VARCHAR(100) NOT NULL
);
CREATE TABLE Professor (
    matricula VARCHAR(20) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    titulacao VARCHAR(50) NOT NULL,
    codigo_campus INT NOT NULL,
    FOREIGN KEY (codigo_campus) REFERENCES Campus(codigo)
);
create table Notebook(
	codigo VARCHAR(20) PRIMARY KEY,
    data_compra DATE NOT NULL,
    data_aquisicao DATE NOT NULL,
    matricula_professor VARCHAR(20) NOT NULL,
    FOREIGN KEY (matricula_professor) REFERENCES Professor(matricula)
);
CREATE TABLE Aluno (
    matricula VARCHAR(20) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    rendimento DECIMAL(4,2),
    codigo_campus INT NOT NULL,
    FOREIGN KEY (codigo_campus) REFERENCES Campus(codigo)
);
CREATE TABLE Turma (
    codigo VARCHAR(20) PRIMARY KEY,
    semestre VARCHAR(10) NOT NULL,
    matricula_professor VARCHAR(20) NOT NULL,
    FOREIGN KEY (matricula_professor) REFERENCES Professor(matricula)
);
CREATE TABLE Professor_Turma (
    matricula_professor VARCHAR(20),
    codigo_turma VARCHAR(20),
    PRIMARY KEY (matricula_professor, codigo_turma),
    FOREIGN KEY (matricula_professor) REFERENCES Professor(matricula),
    FOREIGN KEY (codigo_turma) REFERENCES Turma(codigo)
);
CREATE TABLE Aluno_Turma (
    matricula_aluno VARCHAR(20),
    codigo_turma VARCHAR(20),
    PRIMARY KEY (matricula_aluno, codigo_turma),
    FOREIGN KEY (matricula_aluno) REFERENCES Aluno(matricula),
    FOREIGN KEY (codigo_turma) REFERENCES Turma(codigo)
);
INSERT INTO Campus (codigo, endereco, cidade) VALUES
(1, 'Rua das Universidades, 100', 'São Paulo'),
(2, 'Av. Central, 500', 'Rio de Janeiro'),
(3, 'Rua do Conhecimento, 250', 'Belo Horizonte');
INSERT INTO Professor (matricula, nome, titulacao, codigo_campus) VALUES
('PROF001', 'Dr. João Silva', 'Doutor', 1),
('PROF002', 'Dra. Maria Santos', 'Mestre', 2),
('PROF003', 'Dr. Carlos Oliveira', 'Doutor', 1),
('PROF004', 'Dra. Ana Costa', 'Mestre', 3);
INSERT INTO Notebook (codigo, data_compra, data_aquisicao, matricula_professor) VALUES
('NB001', '2024-01-15', '2024-01-20', 'PROF001'),
('NB002', '2024-02-10', '2024-02-15', 'PROF002'),
('NB003', '2024-03-05', '2024-03-10', 'PROF003');
INSERT INTO Aluno (matricula, nome, rendimento, codigo_campus) VALUES
('ALU001', 'Pedro Almeida', 8.5, 1),
('ALU002', 'Julia Fernandes', 9.2, 2),
('ALU003', 'Lucas Rodrigues', 7.8, 1),
('ALU004', 'Camila Souza', 8.9, 3),
('ALU005', 'Rafael Lima', 7.5, 2);
INSERT INTO Turma (codigo, semestre, matricula_professor) VALUES
('TUR001', '2024.1', 'PROF001'),
('TUR002', '2024.1', 'PROF002'),
('TUR003', '2024.2', 'PROF003'),
('TUR004', '2024.2', 'PROF004');
INSERT INTO Professor_Turma (matricula_professor, codigo_turma) VALUES
('PROF001', 'TUR001'),
('PROF002', 'TUR002'),
('PROF003', 'TUR003'),
('PROF004', 'TUR004');
INSERT INTO Aluno_Turma (matricula_aluno, codigo_turma) VALUES
('ALU001', 'TUR001'),
('ALU002', 'TUR002'),
('ALU003', 'TUR001'),
('ALU004', 'TUR004'),
('ALU005', 'TUR002'),
('ALU001', 'TUR003'),
('ALU003', 'TUR003');
