SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cards (
    number character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    customer_id bigint
);


--
-- Name: customers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers (
    id bigint NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(50) NOT NULL,
    phone_number character varying(15),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: product_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.product_types (
    name character varying(100) NOT NULL,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    price numeric(15,2) NOT NULL,
    product_type_name character varying NOT NULL,
    publisher_name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: publishers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.publishers (
    name character varying(100) NOT NULL,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: wishlists; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wishlists (
    id bigint NOT NULL,
    name character varying NOT NULL,
    customer_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: wishlists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wishlists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wishlists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wishlists_id_seq OWNED BY public.wishlists.id;


--
-- Name: wishlists_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.wishlists_products (
    id bigint NOT NULL,
    product_id bigint,
    wishlist_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: wishlists_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.wishlists_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wishlists_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.wishlists_products_id_seq OWNED BY public.wishlists_products.id;


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: wishlists id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wishlists ALTER COLUMN id SET DEFAULT nextval('public.wishlists_id_seq'::regclass);


--
-- Name: wishlists_products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wishlists_products ALTER COLUMN id SET DEFAULT nextval('public.wishlists_products_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: cards cards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (number);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: product_types product_types_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.product_types
    ADD CONSTRAINT product_types_pkey PRIMARY KEY (name);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: publishers publishers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.publishers
    ADD CONSTRAINT publishers_pkey PRIMARY KEY (name);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: wishlists wishlists_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wishlists
    ADD CONSTRAINT wishlists_pkey PRIMARY KEY (id);


--
-- Name: wishlists_products wishlists_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wishlists_products
    ADD CONSTRAINT wishlists_products_pkey PRIMARY KEY (id);


--
-- Name: index_cards_on_customer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cards_on_customer_id ON public.cards USING btree (customer_id);


--
-- Name: index_customers_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_customers_on_email ON public.customers USING btree (email);


--
-- Name: index_customers_on_first_name_and_last_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_customers_on_first_name_and_last_name ON public.customers USING btree (first_name, last_name);


--
-- Name: index_products_on_product_type_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_products_on_product_type_name ON public.products USING btree (product_type_name);


--
-- Name: index_products_on_publisher_name; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_products_on_publisher_name ON public.products USING btree (publisher_name);


--
-- Name: index_wishlists_on_customer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wishlists_on_customer_id ON public.wishlists USING btree (customer_id);


--
-- Name: index_wishlists_products_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wishlists_products_on_product_id ON public.wishlists_products USING btree (product_id);


--
-- Name: index_wishlists_products_on_product_id_and_wishlist_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_wishlists_products_on_product_id_and_wishlist_id ON public.wishlists_products USING btree (product_id, wishlist_id);


--
-- Name: index_wishlists_products_on_wishlist_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_wishlists_products_on_wishlist_id ON public.wishlists_products USING btree (wishlist_id);


--
-- Name: wishlists fk_rails_18bd87f3b0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wishlists
    ADD CONSTRAINT fk_rails_18bd87f3b0 FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: wishlists_products fk_rails_1cefaeac67; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wishlists_products
    ADD CONSTRAINT fk_rails_1cefaeac67 FOREIGN KEY (wishlist_id) REFERENCES public.wishlists(id);


--
-- Name: products fk_rails_5d806bb18a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_rails_5d806bb18a FOREIGN KEY (publisher_name) REFERENCES public.publishers(name);


--
-- Name: cards fk_rails_778182f614; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT fk_rails_778182f614 FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: wishlists_products fk_rails_87422b7658; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.wishlists_products
    ADD CONSTRAINT fk_rails_87422b7658 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: products fk_rails_cc9ebd64b8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_rails_cc9ebd64b8 FOREIGN KEY (product_type_name) REFERENCES public.product_types(name);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20181211112111'),
('20181211120554'),
('20181212180721'),
('20181212183716'),
('20181212184614'),
('20181213073323'),
('20181214200847');


