CREATE TABLE Sala (
    id INT PRIMARY KEY,
    numero VARCHAR(10) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Tag (
    id INT PRIMARY KEY,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    tipo VARCHAR(50) NOT NULL
);

CREATE TABLE Usuario (
    id INT PRIMARY KEY,
    nome VARCHAR(100) UNIQUE NOT NULL,
    endereco VARCHAR(255) NOT NULL
);

CREATE TABLE Externo (
    cpf VARCHAR(11) PRIMARY KEY,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id)
);

CREATE TABLE Servidor (
    matricula VARCHAR(20) PRIMARY KEY,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id)
);

CREATE TABLE Permissao (
    id_usuario INT,
    id_sala INT,
    horario TIME NOT NULL,
    PRIMARY KEY (id_usuario, id_sala),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id),
    FOREIGN KEY (id_sala) REFERENCES Sala(id)
);

CREATE TABLE Acesso (
    id_usuario INT,
    id_tag INT,
    horario TIME NOT NULL,
    permitido BOOLEAN NOT NULL,
    PRIMARY KEY (id_usuario, id_tag),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id),
    FOREIGN KEY (id_tag) REFERENCES Tag(id)
);

CREATE TABLE Possui (
    id_usuario INT,
    id_tag INT,
    horario TIME NOT NULL,
    PRIMARY KEY (id_usuario, id_tag),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id),
    FOREIGN KEY (id_tag) REFERENCES Tag(id)
);

CREATE TABLE Supervisao (
    id_externo INT,
    id_servidor INT,
    PRIMARY KEY (id_externo, id_servidor),
    FOREIGN KEY (id_externo) REFERENCES Usuario(id),
    FOREIGN KEY (id_servidor) REFERENCES Usuario(id)
);

CREATE INDEX idx_usuario_nome ON Usuario(nome);
CREATE INDEX idx_tag_tipo ON Tag(tipo);

INSERT INTO Sala (id, numero, nome) VALUES
(1, '101', 'Laboratorio de Informatica'),
(2, '102', 'Sala de Reunioes'),
(3, '201', 'Auditorio'),
(4, '202', 'Biblioteca'),
(5, '301', 'Sala dos Professores');

INSERT INTO Tag (id, codigo, tipo) VALUES
(1, 'TAG001', 'RFID'),
(2, 'TAG002', 'Cartao Magnetico'),
(3, 'TAG003', 'RFID'),
(4, 'TAG004', 'Biometria'),
(5, 'TAG005', 'Cartao Magnetico'),
(6, 'TAG006', 'RFID'),
(7, 'TAG007', 'Biometria');

INSERT INTO Usuario (id, nome, endereco) VALUES
(1, 'Pedro Arthur', 'Rua das Flores, 123'),
(2, 'Maria Eduarda', 'Av. Principal, 456'),
(3, 'Gabriel Lucas', 'Rua do Sol, 789'),
(4, 'Paulo Heitor', 'Rua da Lua, 321'),
(5, 'Maria Lavinia', 'Av. Central, 654'),
(6, 'Roberto Alves', 'Rua Verde, 987'),
(7, 'Lucia Ferreira', 'Rua Azul, 147');

INSERT INTO Externo (cpf, id_usuario) VALUES
('12345678901', 1),
('23456789012', 2),
('34567890123', 3);

INSERT INTO Servidor (matricula, id_usuario) VALUES
('SRV001', 4),
('SRV002', 5),
('SRV003', 6),
('SRV004', 7);

INSERT INTO Permissao (id_usuario, id_sala, horario) VALUES
(1, 1, '08:00:00'),
(1, 2, '09:00:00'),
(2, 1, '10:00:00'),
(3, 3, '14:00:00'),
(4, 1, '07:00:00'),
(4, 2, '07:00:00'),
(4, 5, '07:00:00'),
(5, 2, '08:30:00'),
(5, 4, '13:00:00'),
(6, 1, '09:00:00'),
(6, 3, '15:00:00'),
(7, 4, '10:00:00'),
(7, 5, '16:00:00');

INSERT INTO Acesso (id_usuario, id_tag, horario, permitido) VALUES
(1, 1, '08:15:00', TRUE),
(1, 2, '09:30:00', TRUE),
(2, 3, '10:45:00', FALSE),
(3, 4, '14:20:00', TRUE),
(4, 5, '07:10:00', TRUE),
(4, 6, '07:45:00', TRUE),
(5, 7, '08:40:00', TRUE),
(6, 1, '09:15:00', TRUE),
(7, 2, '10:30:00', FALSE);

INSERT INTO Possui (id_usuario, id_tag, horario) VALUES
(1, 1, '08:00:00'),
(1, 2, '08:00:00'),
(2, 3, '08:00:00'),
(3, 4, '08:00:00'),
(4, 5, '07:00:00'),
(5, 6, '07:30:00'),
(6, 7, '08:00:00'),
(7, 1, '08:30:00');

INSERT INTO Supervisao (id_externo, id_servidor) VALUES
(1, 4),
(2, 5),
(3, 6),
(1, 7),
(2, 4);