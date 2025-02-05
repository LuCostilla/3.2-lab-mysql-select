-- Challenge 1 --

select a.au_id, a.au_lname, a.au_fname, t.title_id, p.pub_name as publisher
from authors as a

left join titleauthor as ta
on a.au_id = ta.au_id

left join publishers as p
on p.pub_id = p.pub_id

left join titles as t
on t.title_id = ta.title_id;

-- Challenge 2 --


SELECT  p.pub_name as publisher, a.au_id as author_id, a.au_fname, a.au_fname, count(t.title)
FROM titles as t

LEFT JOIN publishers as p
ON t.pub_id = p.pub_id

LEFT JOIN titleauthor as ta
ON t.title_id = ta.title_id

LEFT JOIN authors as a
ON a.au_id = ta.au_id

GROUP BY author_id, publisher;


-- Challenge 3 --

SELECT  p.pub_name as publisher, a.au_id as author_id, a.au_fname, a.au_fname, sum(s.qty) as total 
FROM titles as t

LEFT JOIN publishers as p
ON t.pub_id = p.pub_id

LEFT JOIN titleauthor as ta
ON t.title_id = ta.title_id

LEFT JOIN authors as a
ON a.au_id = ta.au_id

left join sales as s
on ta.title_id = s.title_id

GROUP BY author_id, publisher 
ORDER BY total desc 
limit 3;

-- Challenge 4 --

SELECT  p.pub_name as publisher, a.au_id as author_id, a.au_fname, a.au_fname, IFNULL(sum(s.qty),0) as total 

FROM titles as t

LEFT JOIN publishers as p
ON t.pub_id = p.pub_id

LEFT JOIN titleauthor as ta
ON t.title_id = ta.title_id

LEFT JOIN authors as a
ON a.au_id = ta.au_id

left join sales as s
on ta.title_id = s.title_id

GROUP BY author_id, publisher 
ORDER BY total desc
LIMIT 25