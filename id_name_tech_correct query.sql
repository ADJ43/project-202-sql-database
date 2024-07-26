USE technology_db;

SELECT scores.id, name, technology, user_guesses.guess_correct AS correct FROM user_guesses
JOIN scores
JOIN technologies ON technologies.id = user_guesses.technology_id
ORDER BY scores.score DESC