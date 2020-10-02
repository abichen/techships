-- Populates our database

-- User
insert into user(uid,password1,email,school) values ("testuser","tennis0","test@wellesley.edu","Wellesley College");

-- Company
insert into company(compName) values ("Google");
insert into company(compName) values ("Amazon");
insert into company(compName) values ("Facebook");
insert into company(compName) values ("Prudential");
insert into company(compName) values ("Dropbox");
insert into company(compName) values ("Zillow");
insert into company(compName) values ("Reddit");
insert into company(compName) values ("JP Morgan & Chase");
insert into company(compName) values ("Salesforce");
insert into company(compName) values ("Goldman Sachs");
insert into company(compName) values ("Spotify");
insert into company(compName) values ("Capital One");
insert into company(compName) values ("Twitch");
insert into company(compName) values ("Robinhood");
insert into company(compName) values ("Silicon Labs");
insert into company(compName) values ("Microsoft");

-- Application
insert into application(link,compName,uid,role,season,yr,experience) values ("https://www.facebook.com/careers/jobs/322265018877764/","Facebook","testuser","User Experience (UX/UI)","Summer","2021","Junior");
insert into application(link,compName,uid,role,season,yr,experience) values ("https://www.amazon.jobs/en/jobs/1204415/software-development-engineer-internship-summer-2021-us","Amazon","testuser","Software Engineering","Summer","2021","Senior");
insert into application(link,compName,uid,role,season,yr,experience) values ("https://careers.google.com/jobs/results/100877793807475398-software-engineering-intern-associates-summer-2021/","Google","testuser","Software Engineering", "Winter", "2021", "Junior");
insert into application(link,compName,uid,role,season,yr,experience) values ("https://jobs.prudential.com/job-description.php?jobReqNo=TA%200002M&IsThisACampusRequisition=Yes","Prudential","testuser","Software Engineering","Summer","2021","Senior");
insert into application(link,compName,uid,role,season,yr,experience) values ("https://www.dropbox.com/jobs/listing/2265990?gh_jid=2265990","Dropbox","testuser","Software Engineering","Summer","2021","Junior");
insert into application(link,compName,uid,role,season,yr,experience) values ("https://careers.zillowgroup.com/ShowJob/JobId/458252/SoftwareDevelopmentEngineerIntern","Zillow","testuser","Software Engineering","Summer","2021","Sophomore");

insert into application(link,compName,uid,role,season,yr,experience) values ("https://boards.greenhouse.io/reddit/jobs/2324527","Reddit","testuser","Software Engineering","Summer","2021","Junior");
insert into application(link,compName,uid,role,season,yr,experience) values ("https://jpmc.fa.oraclecloud.com/hcmUI/CandidateExperience/en/sites/CX_1001/job/210013662/?utm_medium=jobshare&utm_source=PittCSC","JP Morgan & Chase","testuser","Software Engineering","Summer","2021","Junior");
insert into application(link,compName,uid,role,season,yr,experience) values ("https://www.goldmansachs.com/careers/students/programs/americas/summer-analyst-program.html","Goldman Sachs","testuser","Software Engineering","Summer","2021","Junior");
insert into application(link,compName,uid,role,season,yr,experience) values ("https://salesforce.wd1.myworkdayjobs.com/en-US/Futureforce_Internships/job/California---San-Francisco/Summer-2021-Intern---Software-Engineer_JR68839?d=cta-summer-view-sjb-1","Salesforce","testuser","Software Engineering","Summer","2021","Junior");
insert into application(link,compName,uid,role,season,yr,experience) values ("https://www.spotifyjobs.com/job/full-stack-engineer-summer-internship/","Spotify","testuser","Software Engineering","Summer","2021","Junior");
insert into application(link,compName,uid,role,season,yr,experience) values ("https://campus.capitalone.com/job/mclean/technology-internship-program-summer-2021/1786/17009506","Capital One","testuser","Software Engineering","Summer","2021","Junior");
insert into application(link,compName,uid,role,season,yr,experience) values ("https://boards.greenhouse.io/twitch/jobs/4827849002?gh_src=PittCSC","Twitch","testuser","Software Engineering","Summer","2021","Junior");
insert into application(link,compName,uid,role,season,yr,experience) values ("https://boards.greenhouse.io/robinhood/jobs/2214472?t=PittCSC","Robinhood","testuser","Software Engineering","Summer","2021","Junior");
insert into application(link,compName,uid,role,season,yr,experience) values ("https://jobs.jobvite.com/silabs/job/opymdfwg","Silicon Labs","testuser","Product Management","Summer","2021","Junior");
insert into application(link,compName,uid,role,season,yr,experience) values ("https://careers.microsoft.com/students/us/en/job/870951/Internship-Opportunities-for-Students-Explore-Program","Microsoft","testuser","Software Engineering","Summer","2021","Sophomore");
insert into application(link,compName,uid,role,season,yr,experience) values ("https://careers.google.com/jobs/results/93605726980580038-step-intern-second-year-student-summer-2021/","Google","testuser","Software Engineering", "Summer", "2021", "Sophomore");
insert into application(link,compName,uid,role,season,yr,experience) values ("https://careers.google.com/jobs/results/73266706413167302-associate-product-manager-intern-summer-2021/?employment_type=INTERN&q=step","Google","testuser","Product Management", "Summer", "2021", "Junior");

