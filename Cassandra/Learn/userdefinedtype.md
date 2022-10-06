### CREATE TYPE

CREATE TYPE ritvik.user (
    name text,
    age int,
    email text
);

### ALTER TYPE

ALTER TYPE ritvik.user ADD phone text;

ALTER TYPE ritvik.user DROP phone;

ALTER TYPE ritvik.user RENAME phone TO mobile;

### DROP TYPE

DROP TYPE ritvik.user;
