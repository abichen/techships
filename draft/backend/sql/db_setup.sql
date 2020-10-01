use techship_db;

drop table if exists appLocation;
drop table if exists location;
drop table if exists application;
drop table if exists user;
drop table if exists company;


CREATE TABLE user(
    uid varchar(15),
    password1 varchar(20),
    email varchar(30),
    school varchar(40),
    primary key (uid)
);

CREATE TABLE company(
    cid int not null auto_increment,
    compName varchar(30),
    sponsorship tinyint,
    primary key (cid)
    
);

create table application (
    link varchar(100),
    cid int,
    uid varchar(15),
    position enum ('Software Engineering', 'Product Management', 'Project Management', 'Data Science', 'User Experience (UX/UI)'),
    season set ('Fall 2020', 'Winter 2021', 'Fall 2021', 'Summer 2021'),
    yr char(4),
    experience set ('Freshman', 'Sophomore', 'Junior', 'Senior'),
    primary key (link),
    foreign key (uid) references user (uid)
        on update restrict,
    foreign key (cid) references company (cid)
        on update restrict
        on delete restrict
)
engine = InnoDb;

create table location (  
    city varchar(25),
    state varchar(2),
    country varchar (20),
    primary key (city)

);

create table appLocation(
    city varchar(25),
    link varchar(100),
    foreign key(city) references location (city)
        on update restrict
        on delete restrict,
    foreign key (link) references application (link)
        on update restrict
        on delete restrict
)

engine = InnoDb;