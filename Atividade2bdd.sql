
CREATE DATABASE Biblioteca;
USE Biblioteca;


CREATE TABLE Autores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    nacionalidade VARCHAR(50)
);


CREATE TABLE Categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50)
);


CREATE TABLE Livros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    ano_publicacao YEAR,
    id_autor INT,
    id_categoria INT,
    FOREIGN KEY (id_autor) REFERENCES Autores(id),
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id)
);

-- a)
ALTER TABLE Livros ADD preco DECIMAL(5,2);
-- b)
ALTER TABLE Categorias ADD quantidade INT DEFAULT 0;

-- 3- a)

INSERT INTO Autores (nome, nacionalidade) VALUES
('J.K. Rowling', 'Britânica'),
('George Orwell', 'Britânico'),
('Gabriel García Márquez', 'Colombiano');


INSERT INTO Categorias (descricao, quantidade) VALUES
('Ficção', 10),
('Distopia', 7),
('Biografia', 3);


INSERT INTO Livros (titulo, ano_publicacao, id_autor, id_categoria, preco) VALUES
('1984', 1949, 2, 2, 25.50),
('Cem Anos de Solidão', 1967, 3, 1, 35.00),
('Harry Potter e a Pedra Filosofal', 1997, 1, 1, 29.90);

-- b) 

INSERT INTO Autores (nome, nacionalidade) VALUES
('Isabel Allende', 'Chilena');


INSERT INTO Livros (titulo, ano_publicacao, id_autor, id_categoria, preco) VALUES
('A Casa dos Espíritos', 1982, 4, 1, 45.00);

-- 4- a)
UPDATE Categorias
SET descricao = 'Romance'
WHERE id = 1;

-- b)
UPDATE Livros
SET preco = preco * 1.10
WHERE ano_publicacao < 2000;


-- c)
UPDATE Autores
SET nome = 'Gabriel García Márquez'
WHERE nome LIKE '%Gabriel%' AND nome NOT LIKE 'Gabriel García Márquez';

-- 5- a)
DELETE FROM Livros
WHERE ano_publicacao < 1950;

-- b) 
DELETE FROM Categorias
WHERE quantidade < 5;

-- 6- a)
ALTER TABLE Categorias DROP COLUMN quantidade;


