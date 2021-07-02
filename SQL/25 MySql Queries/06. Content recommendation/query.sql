select user_id, page_likes as recommended_page
from friends as f join likes as l on f.friend = l.user_id
where recommended_page not in ( 
	select page_likes 
	from likes as ll 
	where ll.user_id == user_id )
order by user_id asc, recommended_page asc;