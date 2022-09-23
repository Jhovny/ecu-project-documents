
CREATE DATABASE db_product
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Peru.1252'
    LC_CTYPE = 'Spanish_Peru.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	


CREATE TABLE IF NOT EXISTS public.tb_client
(
    bi_id_client bigint NOT NULL,
    cv_nombres character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT tb_client_pkey PRIMARY KEY (bi_id_client)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.tb_client
    OWNER to postgres;
	

CREATE TABLE IF NOT EXISTS public.tb_account
(
    bi_id_account bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    cv_number_account character varying(20) COLLATE pg_catalog."default",
    ch_type_account character(4) COLLATE pg_catalog."default",
    db_balance_initial double precision,
    ch_state character varying(10) COLLATE pg_catalog."default",
    bi_id_client bigint,
    db_balance_available double precision,
    CONSTRAINT tb_acount_pkey PRIMARY KEY (bi_id_account),
    CONSTRAINT fk_client_id FOREIGN KEY (bi_id_client)
        REFERENCES public.tb_client (bi_id_client) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.tb_account
    OWNER to postgres;


CREATE TABLE IF NOT EXISTS public.tb_movement
(
    bi_id_movement bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    ch_type_movement character(4) COLLATE pg_catalog."default",
    db_value double precision,
    db_balance double precision,
    dt_date timestamp with time zone,
    bi_id_account bigint,
    CONSTRAINT tb_movement_pkey PRIMARY KEY (bi_id_movement),
    CONSTRAINT fk_account_id FOREIGN KEY (bi_id_account)
        REFERENCES public.tb_account (bi_id_account) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.tb_movement
    OWNER to postgres;




CREATE DATABASE db_client
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Peru.1252'
    LC_CTYPE = 'Spanish_Peru.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	

CREATE TABLE IF NOT EXISTS public.tb_client
(
    bi_id_client bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    bi_id_person bigint,
    cv_contrasenia character varying(50) COLLATE pg_catalog."default",
    cv_client_id character varying(50) COLLATE pg_catalog."default",
    bt_estado character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT tb_client_pkey PRIMARY KEY (bi_id_client),
    CONSTRAINT fk_id_person FOREIGN KEY (bi_id_person)
        REFERENCES public.tb_person (bi_id_person) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.tb_client
    OWNER to postgres;
	

CREATE TABLE IF NOT EXISTS public.tb_person
(
    bi_id_person bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    cv_name character varying(100) COLLATE pg_catalog."default",
    cv_gender character(2) COLLATE pg_catalog."default",
    in_age integer,
    cv_addres character varying(100) COLLATE pg_catalog."default",
    cv_phone character varying(10) COLLATE pg_catalog."default",
    cv_identification character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT pk_id PRIMARY KEY (bi_id_person)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.tb_person
    OWNER to postgres;