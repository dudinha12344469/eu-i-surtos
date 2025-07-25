
CREATE TABLE Linguagem_Programacao (
    nome VARCHAR(50) PRIMARY KEY,
    plataforma VARCHAR(100) NOT NULL,
    aberta BOOLEAN NOT NULL
);

CREATE TABLE Dominio (
    nome VARCHAR(50) PRIMARY KEY
);

CREATE TABLE Especialidade (
    nome VARCHAR(50) PRIMARY KEY,
    nome_dominio VARCHAR(50) NOT NULL,
    FOREIGN KEY (nome_dominio) REFERENCES Dominio(nome)
);

CREATE TABLE Programador (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nome_especialidade VARCHAR(50) NOT NULL,
    FOREIGN KEY (nome_especialidade) REFERENCES Especialidade(nome)
);

CREATE TABLE Empregado (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    lotado VARCHAR(100) NOT NULL
);

CREATE TABLE Setor (
    codigo_empregado INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    codigo VARCHAR(20) NOT NULL,
    FOREIGN KEY (codigo_empregado) REFERENCES Empregado(codigo)
);

CREATE TABLE Engenheiro (
    numero_registro INT PRIMARY KEY,
    codigo_empregado INT NOT NULL,
    FOREIGN KEY (codigo_empregado) REFERENCES Empregado(codigo)
);

CREATE TABLE Data_Evento (
    codigo INT PRIMARY KEY,
    data_inicio DATE NOT NULL
);

CREATE TABLE Projeto (
    codigo INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    codigo_programador INT NOT NULL,
    numero_registro_engenheiro INT NOT NULL,
    codigo_data INT NOT NULL,
    FOREIGN KEY (codigo_programador) REFERENCES Programador(codigo),
    FOREIGN KEY (numero_registro_engenheiro) REFERENCES Engenheiro(numero_registro),
    FOREIGN KEY (codigo_data) REFERENCES Data_Evento(codigo)
);

CREATE TABLE Coordena (
    codigo_data INT,
    numero_registro_engenheiro INT,
    data_coordenacao DATE NOT NULL,
    PRIMARY KEY (codigo_data, numero_registro_engenheiro),
    FOREIGN KEY (codigo_data) REFERENCES Data_Evento(codigo),
    FOREIGN KEY (numero_registro_engenheiro) REFERENCES Engenheiro(numero_registro)
);

CREATE TABLE Participa (
    codigo_programador INT,
    codigo_data INT,
    PRIMARY KEY (codigo_programador, codigo_data),
    FOREIGN KEY (codigo_programador) REFERENCES Programador(codigo),
    FOREIGN KEY (codigo_data) REFERENCES Data_Evento(codigo)
);

INSERT INTO Dominio (nome) VALUES
('Desenvolvimento Web'),
('Aplicativos Moveis'),
('Ciencia de Dados'),
('Inteligencia Artificial'),
('Programacao de Sistemas');

INSERT INTO Especialidade (nome, nome_dominio) VALUES
('Desenvolvimento Frontend', 'Desenvolvimento Web'),
('Desenvolvimento Backend', 'Desenvolvimento Web'),
('Aplicativos iOS', 'Aplicativos Moveis'),
('Aplicativos Android', 'Aplicativos Moveis'),
('Aprendizado de Maquina', 'Ciencia de Dados'),
('Redes Neurais', 'Inteligencia Artificial'),
('Sistemas Embarcados', 'Programacao de Sistemas');

INSERT INTO Linguagem_Programacao (nome, plataforma, aberta) VALUES
('JavaScript', 'Web', TRUE),
('Python', 'Multiplataforma', TRUE),
('Java', 'JVM', TRUE),
('C#', '.NET', FALSE),
('Swift', 'iOS', FALSE),
('Kotlin', 'JVM/Android', TRUE),
('C++', 'Nativo', TRUE),
('Go', 'Multiplataforma', TRUE);

INSERT INTO Programador (codigo, nome, nome_especialidade) VALUES
(1, 'Ana Silva', 'Desenvolvimento Frontend'),
(2, 'Carlos Santos', 'Desenvolvimento Backend'),
(3, 'Maria Oliveira', 'Aplicativos iOS'),
(4, 'Joao Pereira', 'Aprendizado de Maquina'),
(5, 'Paula Costa', 'Redes Neurais'),
(6, 'Roberto Lima', 'Aplicativos Android'),
(7, 'Fernanda Alves', 'Sistemas Embarcados');

INSERT INTO Empregado (codigo, nome, lotado) VALUES
(101, 'Dr. Pedro Martins', 'Diretoria de Tecnologia'),
(102, 'Eng. Lucia Ferreira', 'Setor de Desenvolvimento'),
(103, 'Eng. Ricardo Souza', 'Setor de Projetos'),
(104, 'Dra. Camila Rocha', 'Setor de Inovacao'),
(105, 'Eng. Marcos Dias', 'Setor de Infraestrutura');

INSERT INTO Setor (codigo_empregado, nome, codigo) VALUES
(101, 'Diretoria de Tecnologia', 'DT001'),
(102, 'Setor de Desenvolvimento', 'SD002'),
(103, 'Setor de Projetos', 'SP003'),
(104, 'Setor de Inovacao', 'SI004'),
(105, 'Setor de Infraestrutura', 'SIN005');

INSERT INTO Engenheiro (numero_registro, codigo_empregado) VALUES
(1001, 101),
(1002, 102),
(1003, 103),
(1004, 104),
(1005, 105);

INSERT INTO Data_Evento (codigo, data_inicio) VALUES
(1, '2024-01-15'),
(2, '2024-02-01'),
(3, '2024-03-10'),
(4, '2024-04-05'),
(5, '2024-05-20'),
(6, '2024-06-15'),
(7, '2024-07-01');

INSERT INTO Projeto (codigo, nome, codigo_programador, numero_registro_engenheiro, codigo_data) VALUES
(1, 'Sistema de Loja Online', 1, 1002, 1),
(2, 'Aplicativo de Banco', 3, 1003, 2),
(3, 'Sistema de Analise de Dados', 4, 1004, 3),
(4, 'Sistema de Gestao', 2, 1001, 4),
(5, 'Aplicativo de Entrega', 6, 1005, 5),
(6, 'Sistema Industrial', 7, 1002, 6),
(7, 'Plataforma de Relatorios', 5, 1004, 7);

INSERT INTO Coordena (codigo_data, numero_registro_engenheiro, data_coordenacao) VALUES
(1, 1002, '2024-01-15'),
(2, 1003, '2024-02-01'),
(3, 1004, '2024-03-10'),
(4, 1001, '2024-04-05'),
(5, 1005, '2024-05-20'),
(6, 1002, '2024-06-15'),
(7, 1004, '2024-07-01'),
(1, 1001, '2024-01-20'),
(3, 1002, '2024-03-15');

INSERT INTO Participa (codigo_programador, codigo_data) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 7),
(6, 5),
(7, 6),
(1, 4),
(2, 4),
(4, 7),
(5, 3);