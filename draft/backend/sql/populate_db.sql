
INSERT INTO company (compName) values ("Chan-Zuckerberg Initiative");

INSERT INTO application (link, position, season, yr, company) values 
("https://boards.greenhouse.io/embed/job_app?token=2334600", 
"Software Engineering", "Summer", 2021, 
(select cid from company where compName ='Chan-Zuckerberg Initiative'));
