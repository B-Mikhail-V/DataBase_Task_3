create table if not exists singers(
id serial primary key,
name varchar(80) not null unique
);
create table if not exists albums(
id serial primary key,
title varchar(255) not null unique,
recording_year varchar(4) not null
);
create table if not exists tracks(
id serial primary key,
title varchar(255) not null,
duration integer not null,
albums_id integer not null references albums(id)
);
create table if not exists genres(
id serial primary key,
title varchar(255) not null unique
);
create table if not exists collections(
id serial primary key,
title varchar(255) not null unique,
recording_year varchar(4) not null
);
create table if not exists SingersGenres(
singers_id integer not null references singers(id),
genres_id integer not null references genres(id),
constraint pk primary key (singers_id, genres_id)
);
create table if not exists SingersAlbums(
singers_id integer not null references singers(id),
albums_id integer not null references albums(id),
constraint pk_2 primary key (singers_id, albums_id)
);
create table if not exists CollectionsTracks(
tracks_id integer not null references tracks(id),
collections_id integer not null references collections(id),
constraint pk_3 primary key (tracks_id, collections_id)
);