DELIMITER //

CREATE PROCEDURE GetTechnologiesLength(OUT tech_length INT)
BEGIN
	SELECT COUNT(*) INTO tech_length FROM technologies;
END //

DELIMITER ;