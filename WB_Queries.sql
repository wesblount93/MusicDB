-- 1. Show all Christmas pieces that do not contain any brass instruments
select distinct title, composer, arranger, publisher
from piece natural join piece_genre
where genre = 'Christmas' and piece_ID not in (select piece_ID
				       						   from instr_piece_assignment natural join instrument
				       						   where category = 'brass')


-- 2. Show all pieces by arranger Joseph Martin
select title
from piece
where arranger = 'Joseph Martin'


-- 3. Show all publishers who only appear once in the database
select publisher
from piece
group by publisher
having count(publisher) = 1


-- 4. Show all pieces that contain the key of A major
select distinct title
from piece natural join piece_key
where key = 'A major'


-- 5. List any Contemporary Christmas pieces 
select A.title, A.composer, A.arranger
from (piece natural join piece_genre) as A, (piece natural join piece_genre) as B
where A.piece_ID = B.piece_ID and A.genre = 'Contemporary' and B.genre = 'Christmas'


-- 6. Show all pieces that contain any minor key
select distinct title
from piece natural join piece_key
where key like '%minor%'


-- 7. Show all pieces that that do not include any choir or vocals, and show their genre
select distinct genre, title, composer, arranger
from piece natural join piece_genre
where piece_ID not in (select piece_ID
				       from instr_piece_assignment natural join instrument 
				       where category = 'vocal')


-- 8. Show all piece that include ONLY SATB and any percussion category instrument 
with percussion as (select distinct instrument_name
			        from instrument
			        where category = 'percussion')

select distinct title, composer, arranger, publisher 
from piece natural join instr_piece_assignment 
except
select distinct title, composer, arranger, publisher
from piece natural join instr_piece_assignment
where instrument_name <> 'SATB' and instrument_name not in percussion 


-- 9. Show all original pieces (no arranger)
select title, composer
from piece
where arranger is null


-- 10. Create a view showing the title, composer, arranger of all piece with publisher JW Pepper
create view jw_pepper as
	select title, composer, arranger
	from piece
	where publisher = 'JW Pepper';

select *
from jw_pepper



-- 11. Update the title of 'Fountain' to 'The Fountain' and diplay the updated tuple
update piece 
	set title = 'The Fountain'
	where title = 'Fountain';

select * 
from piece
where title = 'The Fountain'








