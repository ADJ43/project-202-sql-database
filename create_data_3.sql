CREATE TABLE scores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    score INT NOT NULL
);

INSERT INTO scores (name, score) VALUES
('John', 100),
('Jane', 200),
('Doe', 300),
('Andres', 5),
('Guest', 15);
