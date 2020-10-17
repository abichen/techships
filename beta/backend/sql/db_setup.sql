use techship_db;

drop table if exists picfile;
drop table if exists reviews;
drop table if exists favorites;
drop table if exists appLocation;
drop table if exists location;
drop table if exists application;
drop table if exists company;
drop table if exists user;

CREATE TABLE user(
    uid varchar(15),
    password1 char(100),
    email varchar(30),
    school varchar(40),
    primary key (uid)
);

CREATE TABLE company(
    compName varchar(30),
    sponsorship tinyint,
    primary key (compName)
);

create table application (
    link varchar(250),
    uid varchar(15),
    compName varchar(30),
    role enum ('Software Engineering', 'Product Management', 'Program Management', 'Data Science', 'User Experience (UX/UI)', 'Hardware Engineering'),
    season set ('Fall', 'Winter', 'Spring', 'Summer'),
    yr char(4),
    experience set ('Freshman', 'Sophomore', 'Junior', 'Senior'),
    primary key (link),
    foreign key (uid) references user (uid)
        on update restrict,
    foreign key (compName) references company (compName)
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

create table favorites(
    link varchar(250),
    uid varchar(15),
    foreign key (uid) references user (uid)
        on update restrict,
    foreign key (link) references application (link)
        on update restrict
)

engine = InnoDb;

create table review(
    uid varchar(15),
    compName varchar(30),
    reviewText varchar(350),
    foreign key (uid) references user (uid)
        on update restrict,
    foreign key (compName) references company (compName)
        on update restrict
        on delete restrict
)

engine = InnoDb;

create table picfile (
    compName varchar(30),
    filename varchar(50),
    foreign key (compName) references company(compName) 
        on delete cascade on update cascade
)

engine = InnoDb;

