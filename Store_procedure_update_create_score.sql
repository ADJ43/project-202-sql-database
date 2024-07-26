DELIMITER //

CREATE PROCEDURE CheckGuessAndUpdateScore(IN tech_index INT, IN guessed_name VARCHAR(50), IN player_name VARCHAR(50), OUT is_correct BOOLEAN, OUT tech_name VARCHAR(50))
BEGIN
	DECLARE tech_id INT;
    DECLARE value INT;
    
    SET tech_id = tech_index + 1;
    
    SELECT technology, level INTO tech_name, value
    FROM technologies
    WHERE id = tech_id;
    
    IF tech_name IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Technology not found';
	END IF;
    
    SET is_correct = (tech_name = guessed_name);
    
    IF is_correct THEN
	UPDATE scores
    SET score = score + value
    WHERE name = player_name;
    
    IF ROW_COUNT() = 0 THEN
		INSERT INTO scores (name, score) VALUES (player_name, value);
	END IF;
ELSE
	UPDATE scores
    SET score = score + 0
    WHERE name = player_name;
    
    IF ROW_COUNT() = 0 THEN
		INSERT INTO scores (name, scores) VALUES (player_name, 0);
	END IF;
END IF;
END //

DELIMITER ;