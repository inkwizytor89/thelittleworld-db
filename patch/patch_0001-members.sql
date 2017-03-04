\echo 'patch0001'

create table if not exists companies (
    id serial PRIMARY KEY,
    name varchar(40),
    fury real not null check (fury >=-1 AND fury <=1),
    sociality real not null check (sociality >=-1 AND sociality <=1),
    updated TIMESTAMP default now(),
    created TIMESTAMP default now()
);
CREATE TRIGGER update_companies BEFORE UPDATE ON companies FOR EACH ROW EXECUTE PROCEDURE updated();
ALTER TABLE users ADD COLUMN company_id int REFERENCES companies;

create table if not exists members (
    id serial PRIMARY KEY,
    name varchar(40),
    fury real not null check (fury >=-1 AND fury <=1),
    sociality real not null check (sociality >=-1 AND sociality <=1),
    sex sex_type,
    company_id integer REFERENCES companies,
    strength real not null default 8.0,
    agility real not null default 8.0,
    stamina real not null default 8.0,
    intelligence real not null default 8.0,
    wisdom real not null default 8.0,
    charisma real not null default 8.0,
    updated TIMESTAMP default now(),
    created TIMESTAMP default now()
);
CREATE TRIGGER update_members BEFORE UPDATE ON members FOR EACH ROW EXECUTE PROCEDURE updated();


insert into db_version values (1);
