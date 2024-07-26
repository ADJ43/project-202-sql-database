DELIMITER //

CREATE PROCEDURE GetTechnologyImage(IN tech_index INT, OUT tech_image VARCHAR(255))
BEGIN
	DECLARE tech_id INT;
    
	SET tech_id = tech_index + 1;
    
	SELECT image INTO tech_image
    FROM technologies
    WHERE id = tech_id;
    
    IF tech_image IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Technology not found';
	END IF;
END //

DELIMITER ;