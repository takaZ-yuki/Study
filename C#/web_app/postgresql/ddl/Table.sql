create table members (
    id varchar(32) primary key,
    name varchar(32) not null
);

create table todos (
    id serial primary key,
    member_id varchar(32),
    content varchar(256) not null,
    due date,
    done boolean,
    foreign key (member_id) references members (id)
);
