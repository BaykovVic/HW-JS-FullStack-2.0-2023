-- Adminer 4.7.1 PostgreSQL dump

DROP TABLE IF EXISTS "categories";
CREATE TABLE "public"."categories" (
    "id" integer NOT NULL,
    "category_name" character varying,
    "description" character varying,
    "is_available" boolean,
    "qty" integer NOT NULL,
    CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "clients";
CREATE TABLE "public"."clients" (
    "id" integer NOT NULL,
    "client_login" character varying NOT NULL,
    "client_password" character varying NOT NULL,
    "client_address" character varying NOT NULL,
    "client_phone_number" character varying,
    "client_email" character varying NOT NULL,
    CONSTRAINT "clients_pk" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "items";
CREATE TABLE "public"."items" (
    "id" integer NOT NULL,
    "cat_id" integer NOT NULL,
    "item_name" character varying,
    "item_description" character varying,
    "item_price" integer,
    "is_available" boolean,
    "qty" integer NOT NULL,
    CONSTRAINT "items_pk" PRIMARY KEY ("id"),
    CONSTRAINT "items_fk" FOREIGN KEY (cat_id) REFERENCES categories(id) NOT DEFERRABLE
) WITH (oids = false);


DROP TABLE IF EXISTS "orders";
CREATE TABLE "public"."orders" (
    "id" integer NOT NULL,
    "client_id" integer NOT NULL,
    "item_id" integer NOT NULL,
    "price" integer NOT NULL,
    "qty" integer,
    "client_name" character varying NOT NULL,
    "client_s_name" character varying,
    "delivery_address" character varying NOT NULL,
    CONSTRAINT "orders_pk" PRIMARY KEY ("id"),
    CONSTRAINT "orders_fk" FOREIGN KEY (client_id) REFERENCES clients(id) NOT DEFERRABLE,
    CONSTRAINT "orders_fk_1" FOREIGN KEY (item_id) REFERENCES items(id) NOT DEFERRABLE
) WITH (oids = false);


-- 2023-03-29 16:10:26.328427+00
