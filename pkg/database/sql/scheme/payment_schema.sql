--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 15.0

-- Started on 2022-11-17 10:29:01

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 2851 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

--
-- TOC entry 203 (class 1259 OID 181772)
-- Name: company_deposit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.company_deposit (
    id bigint NOT NULL,
    deposit_type integer,
    rate double precision,
    amount double precision,
    promo_period_start timestamp without time zone,
    cargo_cnt integer,
    reject_cnt integer
);


--
-- TOC entry 202 (class 1259 OID 181770)
-- Name: company_deposit_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.company_deposit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2852 (class 0 OID 0)
-- Dependencies: 202
-- Name: company_deposit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.company_deposit_id_seq OWNED BY public.company_deposit.id;


--
-- TOC entry 197 (class 1259 OID 123913)
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


--
-- TOC entry 196 (class 1259 OID 123908)
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


--
-- TOC entry 199 (class 1259 OID 173558)
-- Name: day_number; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.day_number (
    id character varying(255) NOT NULL,
    count integer NOT NULL,
    count2 integer
);


--
-- TOC entry 198 (class 1259 OID 173556)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 200 (class 1259 OID 173563)
-- Name: payment_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payment_history (
    id bigint NOT NULL,
    action character varying(255),
    date timestamp without time zone,
    description character varying(255),
    status integer,
    payment_id bigint
);


--
-- TOC entry 201 (class 1259 OID 173571)
-- Name: payment_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.payment_item (
    id bigint NOT NULL,
    amount double precision NOT NULL,
    confirmation_date timestamp without time zone,
    creation_date timestamp without time zone,
    creator_id bigint,
    document_number character varying(255),
    entity_id bigint NOT NULL,
    ext_id character varying(255),
    status integer,
    ya_confirm_json text,
    ya_request_json text,
    ya_response_json text,
    type integer,
    payment_object_type integer,
    cargo_dto_json text,
    comment text,
    src_amount double precision,
    act_number text
);


--
-- TOC entry 2710 (class 2604 OID 181775)
-- Name: company_deposit id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company_deposit ALTER COLUMN id SET DEFAULT nextval('public.company_deposit_id_seq'::regclass);


--
-- TOC entry 2712 (class 2606 OID 123912)
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 173562)
-- Name: day_number day_number_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.day_number
    ADD CONSTRAINT day_number_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 181777)
-- Name: company_deposit deposit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company_deposit
    ADD CONSTRAINT deposit_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 173570)
-- Name: payment_history payment_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_history
    ADD CONSTRAINT payment_history_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 173578)
-- Name: payment_item payment_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_item
    ADD CONSTRAINT payment_item_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 1259 OID 292625)
-- Name: payment_item_entity_id_creation_date_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payment_item_entity_id_creation_date_index ON public.payment_item USING btree (entity_id, creation_date DESC);


--
-- TOC entry 2718 (class 1259 OID 292624)
-- Name: payment_item_entity_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payment_item_entity_id_index ON public.payment_item USING btree (entity_id);


--
-- TOC entry 2719 (class 1259 OID 292626)
-- Name: payment_item_ext_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX payment_item_ext_id_index ON public.payment_item USING btree (ext_id);


--
-- TOC entry 2724 (class 2606 OID 173579)
-- Name: payment_history fkn2e4v7ttaot62bp7cqfr8v5hw; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.payment_history
    ADD CONSTRAINT fkn2e4v7ttaot62bp7cqfr8v5hw FOREIGN KEY (payment_id) REFERENCES public.payment_item(id);


-- Completed on 2022-11-17 10:29:01

--
-- PostgreSQL database dump complete
--

