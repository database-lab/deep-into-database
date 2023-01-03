SELECT s1.score, count(DISTINCT s2.score) AS score_rank
FROM scores s1 JOIN scores s2 ON s1.score <= s2.score
GROUP BY s1.id, s1.score
ORDER BY 1 DESC;