\echo 'patch0002'

create type item_type as ENUM ('weapon', 'armor', 'potion', 'item');

create table if not exists items (
    id serial PRIMARY KEY,
    name varchar(40) not null,
    description varchar(256) not null,
    type item_type,
    weight real not null check(weight >=0)
);

create table if not exists bonuses (
    id serial PRIMARY KEY
);

create type armor_type as ENUM ('head', 'shoulders', 'chest', 'wrist', 'hands', 'waist', 'legs', 'feet', 'cloak', 'necklace', 'ring');

create table if not exists armors (
    item_id int not null REFERENCES items(id),
    type armor_type,
    armor int,
    bonus_id int REFERENCES bonuses(id)
);

create type weapon_type as ENUM ('two hand sword', 'one hand sword', 'two hand axe', 'one hand axe', 'two hand mace', 'one hand mace', 'bow', 'slingshot', 'shield');

create table if not exists weapons (
    item_id int not null REFERENCES items(id),
    type weapon_type,
    damage real,
    armor int,
    bonus_id int REFERENCES bonuses(id)
);

insert into db_version values (2);
