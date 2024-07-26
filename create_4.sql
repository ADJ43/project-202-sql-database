CREATE TABLE user_guesses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    technology_id INT NOT NULL,
    guess_correct BOOLEAN,
    FOREIGN KEY (user_id) REFERENCES scores(id),
    FOREIGN KEY (technology_id) REFERENCES technologies(id)
);
