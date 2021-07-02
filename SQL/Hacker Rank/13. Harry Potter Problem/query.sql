/*
Enter your query here.
*/
SELECT ID, AGE, COINS_NEEDED, POWER 
FROM (WANDS w JOIN WANDS_PROPERTY p ON w.Code = p.Code) 
WHERE p.is_evil = 0 AND w.coins_needed = ( SELECT MIN(coins_needed) 
                                          FROM Wands w1 JOIN WANDS_PROPERTY p1 ON (w1.code = p1.code) 
                                          WHERE w1.power = w.power AND p1.age = p.age ) 
ORDER BY POWER DESC, AGE DESC;