\echo 'unpatch 0001'
drop table if exists companions;

ALTER TABLE users DROP COLUMN company_id;
drop table if exists companies;
