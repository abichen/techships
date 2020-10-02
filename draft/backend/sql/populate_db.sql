
INSERT INTO company (compName) values ("Chan-Zuckerberg Initiative");

INSERT INTO application (link, position, season, yr, company) values 
("https://boards.greenhouse.io/embed/job_app?token=2334600", 
"Software Engineering", "Summer", 2021, 
(select cid from company where compName ='Chan-Zuckerberg Initiative'));

insert into user(uid,password1,email,school) values ("testuser","tennis0","test@wellesley.edu","Wellesley College");

insert into company(compName) values ("Google");

insert into company(compName) values ("Amazon");

insert into company(compName) values ("Facebook");

insert into application(link,compName,uid,position,season,yr,experience) values ("https://www.facebook.com/careers/jobs/322265018877764/","Facebook","testuser","User Experience (UX/UI)","Summer","2021","Junior");

insert into application(link,compName,uid,position,season,yr,experience) values ("https://www.amazon.jobs/en/jobs/1204415/software-development-engineer-internship-summer-2021-us","Amazon","testuser","Software Engineering","Summer","2021","Senior");

insert into application(link,compName,uid,position,season,yr,experience) values ("https://careers.google.com/jobs/results/100877793807475398-software-engineering-intern-associates-summer-2021/","Google","testuser","Software Engineering", "Winter", "2021", "Junior");