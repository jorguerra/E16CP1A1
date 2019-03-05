create database call_list;
\c call_list;
create table users (
  id serial primary key,
  first_name varchar(20),
  email varchar(60)
);
insert into users (id, first_name, email) values
  (1,'Carlos','carlos@gmail.com'),
  (2,'Laura', 'laura@noesta.cl');

alter table user add column last_name varchar(20);
update users set last_name='González' where id=1;
update users set last_name='Perez' where id=2;

create table calls (
  id serial primary key,
  user_id int references users(id),
  phone varchar(15),
  date date
);

insert into calls (user_id, phone, date) values
  (2,'56991804010', '2019-03-02'),
  (2,'56991804011','2019-03-03'),
  (2,'56991804012', '2019-03-04'),
  (2,'56991804013','2019-03-05'),
  (2,'56991804014', '2019-03-06'),
  (2,'56991804015','2019-03-07');

insert into calls (user_id, phone, date) values
  (1,'56987123510', '2019-03-02'),
  (1,'56987123511','2019-03-03'),
  (1,'56987123512', '2019-03-04'),
  (1,'56987123515','2019-03-07');

insert into users (first_name, last_name, email) values
  ('Michael', 'Jackson', 'michael@jackson.com');

/*List of all users calls*/
select u.first_name, count(c.id) as qty_calls from users u
left join calls c on u.id = c.user_id
group by u.id

/*List of Carlos' calls*/
select u.first_name, c.date from users u
inner join calls c on u.id = c.user_id
where u.id = 1 group by u.first_name, c.date
order by c.date desc
