CREATE TABLE election (
  id INT PRIMARY KEY,
  voter_id INT,
  candidate_id INT,
  election_date DATE
);


CREATE TABLE candidates (
  id INT PRIMARY KEY,
  name VARCHAR(50)
);


INSERT INTO election (id, voter_id, candidate_id, election_date) VALUES
  (1, 1, 1, '2022-01-01'),
  (2, 2, 1, '2022-01-01'),
  (3, 3, 2, '2022-01-01'),
  (4, 4, 3, '2022-01-01'),
  (5, 5, 1, '2022-01-01'),
  (6, 6, 2, '2022-01-01'),
  (7, 7, 3, '2022-01-01'),
  (8, 8, 1, '2022-01-01'),
  (9, 9, 2, '2022-01-01'),
  (10, 10, 3, '2022-01-01');


INSERT INTO candidates (id, name) VALUES
(1, 'John Smith'),
(2, 'Jane Doe'),
(3, 'Bob Johnson');


select * from election;
select * from candidates;

-- solution

select c.id, c.name, count(e.voter_id) as votes from candidates c 
join election e on c.id = e.candidate_id
group by 1,2
order by  count(e.voter_id) desc
limit 1