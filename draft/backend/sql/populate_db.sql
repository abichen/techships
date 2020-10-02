-- Populates our database

-- User
insert into user(uid,password1,email,school) values ("testuser","tennis0","test@wellesley.edu","Wellesley College");

-- -- Company
insert into company(compName) values ("Google");
insert into company(compName) values ("Amazon");
insert into company(compName) values ("Facebook");
insert into company(compName) values ("Prudential");
insert into company(compName) values ("Dropbox");
insert into company(compName) values ("Zillow");

-- Application
insert into application(link,compName,uid,role,season,yr,experience) values ("https://www.facebook.com/careers/jobs/322265018877764/","Facebook","testuser","User Experience (UX/UI)","Summer","2021","Junior");
insert into application(link,compName,uid,role,season,yr,experience) values ("https://www.amazon.jobs/en/jobs/1204415/software-development-engineer-internship-summer-2021-us","Amazon","testuser","Software Engineering","Summer","2021","Senior");
insert into application(link,compName,uid,role,season,yr,experience) values ("https://careers.google.com/jobs/results/100877793807475398-software-engineering-intern-associates-summer-2021/","Google","testuser","Software Engineering", "Winter", "2021", "Junior");
insert into application(link,compName,uid,role,season,yr,experience) values ("https://jobs.prudential.com/job-description.php?jobReqNo=TA%200002M&IsThisACampusRequisition=Yes","Prudential","testuser","Software Engineering","Summer","2021","Senior");
insert into application(link,compName,uid,role,season,yr,experience) values ("https://www.dropbox.com/jobs/listing/2265990?gh_jid=2265990","Dropbox","testuser","Software Engineering","Summer","2021","Junior");
insert into application(link,compName,uid,role,season,yr,experience) values ("https://careers.zillowgroup.com/ShowJob/JobId/458252/SoftwareDevelopmentEngineerIntern","Zillow","testuser","Software Engineering","Summer","2021","Sophomore");