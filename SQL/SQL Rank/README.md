# SQL Ranking

Ranking is one of the importent features in SQL.<br />
It is a kind of ordering that handles the equality.

For example if your are ordering the set bellow based on score :

|  Team | Score |
|------:|:-----:|
| Alpha | 120   |
| Betha | 220   |
| Gamma | 220   |
| Theta | 120   |
| Landa | 100   |


Because of the equal values in score field, you might get different
order each time.

But with ranking you can handle this problem, so your output
can be like this:

|  Team 	| Score 	| Rank 	|
|------:	|:-----:	|------	|
| Alpha 	| 120   	| 2    	|
| Betha 	| 220   	| 1    	|
| Gamma 	| 220   	| 1    	|
| Theta 	| 120   	| 2    	|
| Landa 	| 100   	| 3    	|


Read more about rank <a href="https://learnsql.com/blog/how-to-rank-rows-in-sql/">Here</a>.

Also check our examples for Rank in SQL.