select sum(score) as total_score, hacker_id, name
from hackers h join submission s on h.hacker_id = s.hacker_id
group by hacker_id, challenge_id
where total_score != 0 
order by total_score desc, hacker_id asc;