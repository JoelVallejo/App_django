--CREATE DATABASE db_cuentasxpagar;

--DROP DATABASE db_cuentasxpagar;

--CREATE USER user_admin WITH ENCRYPTED PASSWORD '12345';

--ALTER ROLE user_admin SET client_encoding TO 'utf8';

--ALTER ROLE user_admin SET default_transaction_isolation TO 'read committed';

--ALTER ROLE user_admin SET timezone TO 'UTC -5';

--GRANT ALL PRIVILEGES ON DATABASE db_cuentasxpagar TO user_admin;

DROP TABLE if EXISTS roles CASCADE;

DROP table if exists empresas;

DROP TABLE if EXISTS usuarios;

CREATE TABLE
    empresas(
        id_empresa SERIAL not null,
        nombre character varying(40) not null,
        descripcion character varying(70) not null,
        ruc character(13) not null,
        email character varying(70) not null,
        direccion character(85),
        celular1 character(10) not null,
        celular2 character(10),
        telefono character(9),
        sitio_web character varying(80),
        estado char(1) default 'A',
        creditos TEXT,
        fecha_registro TIMESTAMP default now(),
        constraint pk_empresas primary key (id_empresa)
    );

SELECT * FROM empresas;

--------------------------------------tabla roles--------------------------------------------

CREATE TABLE
    roles(
        id_rol integer not null primary key,
        descripccion character varying(40)
    );

SELECT * FROM roles;

------------------------------------------------tabla usuarios---------------------------------

create table
    usuarios(
        id_usuario integer not null primary key,
        identificacion character(10) not null,
        imagen bytea,
        descripcion character varying(70) not null,
        puesto character varying(50),
        departamento character varying(50),
        nombres character varying(50) not null,
        usuario character(32) not null,
        credencial character(180) not null,
        celular1 char(10) not null,
        celular2 char(10),
        telefono char(9),
        direccion character varying(80) not null,
        email character varying(50) not null,
        fecha_creacion timestamp not null default now(),
        fecha_acceso timestamp not null,
        estado char(1) default 'A',
        rol integer not null,
        constraint fk_usuarios foreign key (rol) references roles(id_rol) on update cascade on delete restrict
    );

/*insert into usuarios (iduser, identificacion, nombre, apellido, celular, telefono, direccion, email, usuario, password) 
 values (1, '1207482736', 'JOEL RAUL', 'VALLEJO ALVARIO', '0962041882', '052571799', 'CDLA.CRISTO DEL CONSUELO', 'joelvallejo_37@outlook.com', 'JOERUGAMERS', PGP_SYM_ENCRYPT('Rajop_45#$','AES_KEY') ),
 (2, '1406249823', 'PAUL CARLOS', 'GARCIA RODRIGUEZ', '0926241723', '042398712', 'AV.FRANCISCO DE ORELLANA', 'paul34@gmail.com', 'ROYAMMCG21',PGP_SYM_ENCRYPT('gjhgh656#@','AES_KEY') );
 */

select * from usuarios;

--SELECT  pgp_sym_decrypt(password::bytea,'AES_KEY') FROM usuarios;

--SELECT CAST (saldo as money) FROM usuarios;

--create EXTENSION pgcrypto;