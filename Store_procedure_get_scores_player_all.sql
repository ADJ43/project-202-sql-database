DELIMITER //

CREATE PROCEDURE GetScores(IN player_name VARCHAR(50), OUT player_scores TEXT)
BEGIN
	DECLARE temp_scores TEXT;
    
    IF player_name = '' THEN
		SELECT JSON_ARRAYAGG(JSON_OBJECT('name', name, 'score', score)) INTO temp_scores FROM scores;
	ELSE
		SELECT JSON_ARRAYAGG(JSON_OBJECT('name', name, 'score', score)) INTO temp_scores FROM scores WHERE name = player_name;
	END IF;
    
    SET player_scores = IFNULL(temp_scores, '[]');
END // 

DELIMITER ;