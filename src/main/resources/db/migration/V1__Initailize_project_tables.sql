CREATE schema `migration`;
USE `migration`;
create user `user@%` identified by `password`;

create table favorite (
    id bigint NOT NULL AUTO_INCREMENT,
    created_date timestamp,
    modified_date timestamp,
    member_id bigint,
    source_station_id bigint,
    target_station_id bigint,
    primary key (id)
);

create table line (
    id bigint NOT NULL AUTO_INCREMENT,
    created_date timestamp,
    modified_date timestamp,
    color varchar(255),
    name varchar(255),
    primary key (id),
    UNIQUE KEY `line_uniq_index` (`name`),
);

create table member (
    id bigint NOT NULL AUTO_INCREMENT,
    created_date timestamp,
    modified_date timestamp,
    age integer,
    email varchar(255),
    password varchar(255),
    primary key (id)
);

create table section (
    id bigint NOT NULL AUTO_INCREMENT,
    distance integer not null,
    down_station_id bigint,
    line_id bigint,
    up_station_id bigint,
    primary key (id)
);

create table station (
    id bigint NOT NULL AUTO_INCREMENT,
    created_date timestamp,
    modified_date timestamp,
    name varchar(255),
    primary key (id),
    UNIQUE KEY `station_uniq_index` (`name`),
);

alter table section
    add constraint fk_section_line
        foreign key (line_id)
            references line;

alter table section
    add constraint fk_section_down_station
        foreign key (down_station_id)
            references station;

alter table section
    add constraint fk_section_up_station
        foreign key (up_station_id)
            references station;
