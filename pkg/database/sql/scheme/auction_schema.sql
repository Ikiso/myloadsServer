--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 15.0

-- Started on 2022-11-17 10:26:27

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
-- TOC entry 2870 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

--
-- TOC entry 196 (class 1259 OID 107393)
-- Name: bid; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bid (
    id bigint NOT NULL,
    amount double precision NOT NULL,
    company_id bigint NOT NULL,
    creator_id bigint NOT NULL,
    date timestamp without time zone,
    email character varying(255),
    name character varying(255),
    phone character varying(255),
    rating double precision,
    reject boolean NOT NULL,
    cargo_id bigint,
    tax_type integer,
    nds_amount integer,
    reject_comment text
);


--
-- TOC entry 205 (class 1259 OID 268035)
-- Name: bid_chain; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bid_chain (
    bid_id bigint NOT NULL,
    chain_id bigint NOT NULL
);


--
-- TOC entry 197 (class 1259 OID 107401)
-- Name: cargo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cargo (
    id bigint NOT NULL,
    company_id bigint NOT NULL,
    creator_id bigint,
    current_winner_expired timestamp without time zone,
    deleted boolean NOT NULL,
    loading_city character varying(255),
    loading_date timestamp without time zone,
    name character varying(255),
    shipper_name character varying(255),
    unloading_city character varying(255),
    winner_approve boolean NOT NULL,
    current_winner_id bigint,
    payment_id bigint,
    body_types character varying(255),
    points character varying(255),
    autorestarted boolean,
    bid_amount_limit integer,
    bids_hide_time bigint,
    chain_item boolean
);


--
-- TOC entry 204 (class 1259 OID 268022)
-- Name: cargo_chain; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cargo_chain (
    cargo_id bigint NOT NULL,
    chain_id bigint NOT NULL
);


--
-- TOC entry 203 (class 1259 OID 217858)
-- Name: cargo_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cargo_history (
    id bigint NOT NULL,
    amount double precision,
    creator_id bigint,
    type integer NOT NULL,
    date timestamp without time zone,
    cargo_id bigint NOT NULL
);


--
-- TOC entry 198 (class 1259 OID 107409)
-- Name: cargo_pay_model; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cargo_pay_model (
    id bigint NOT NULL,
    amount double precision NOT NULL,
    expiration_date timestamp without time zone,
    pay_type integer,
    payment_type integer,
    payment_via integer NOT NULL,
    start_date timestamp without time zone,
    tax integer,
    nds_rate integer
);


--
-- TOC entry 202 (class 1259 OID 173550)
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
-- TOC entry 201 (class 1259 OID 173545)
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


--
-- TOC entry 200 (class 1259 OID 107419)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 199 (class 1259 OID 107414)
-- Name: sanction; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sanction (
    id bigint NOT NULL,
    cargo_id bigint,
    company_id bigint NOT NULL,
    creator_id bigint NOT NULL,
    date timestamp without time zone
);


--
-- TOC entry 2723 (class 2606 OID 107400)
-- Name: bid bid_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bid
    ADD CONSTRAINT bid_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 217862)
-- Name: cargo_history cargo_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_history
    ADD CONSTRAINT cargo_history_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 107413)
-- Name: cargo_pay_model cargo_pay_model_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_pay_model
    ADD CONSTRAINT cargo_pay_model_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 107408)
-- Name: cargo cargo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo
    ADD CONSTRAINT cargo_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 173549)
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 107418)
-- Name: sanction sanction_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sanction
    ADD CONSTRAINT sanction_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 1259 OID 284439)
-- Name: bid_company_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX bid_company_id_index ON public.bid USING btree (company_id);


--
-- TOC entry 2721 (class 1259 OID 284440)
-- Name: bid_creator_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX bid_creator_id_index ON public.bid USING btree (creator_id);


--
-- TOC entry 2734 (class 1259 OID 301265)
-- Name: cargo_history_cargo_id_Index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "cargo_history_cargo_id_Index" ON public.cargo_history USING btree (cargo_id);


--
-- TOC entry 2726 (class 1259 OID 284437)
-- Name: current_winner_expired_Index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "current_winner_expired_Index" ON public.cargo USING btree (current_winner_expired);


--
-- TOC entry 2729 (class 1259 OID 284438)
-- Name: expiration_date_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX expiration_date_index ON public.cargo_pay_model USING btree (expiration_date);


--
-- TOC entry 2742 (class 2606 OID 268043)
-- Name: bid_chain bid_chain_to_bid_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bid_chain
    ADD CONSTRAINT bid_chain_to_bid_id FOREIGN KEY (bid_id) REFERENCES public.bid(id);


--
-- TOC entry 2743 (class 2606 OID 268038)
-- Name: bid_chain bid_chain_to_chain_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bid_chain
    ADD CONSTRAINT bid_chain_to_chain_id FOREIGN KEY (chain_id) REFERENCES public.bid(id);


--
-- TOC entry 2740 (class 2606 OID 268030)
-- Name: cargo_chain cargo_chain_to_cargo_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_chain
    ADD CONSTRAINT cargo_chain_to_cargo_id FOREIGN KEY (cargo_id) REFERENCES public.cargo(id);


--
-- TOC entry 2741 (class 2606 OID 268025)
-- Name: cargo_chain cargo_chain_to_chain_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_chain
    ADD CONSTRAINT cargo_chain_to_chain_id FOREIGN KEY (chain_id) REFERENCES public.cargo(id);


--
-- TOC entry 2738 (class 2606 OID 107426)
-- Name: cargo fkdqcx93dvefrtiyyqsainl008i; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo
    ADD CONSTRAINT fkdqcx93dvefrtiyyqsainl008i FOREIGN KEY (current_winner_id) REFERENCES public.bid(id);


--
-- TOC entry 2737 (class 2606 OID 107421)
-- Name: bid fkh7rkuhannsqk2f99meytbd5hh; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bid
    ADD CONSTRAINT fkh7rkuhannsqk2f99meytbd5hh FOREIGN KEY (cargo_id) REFERENCES public.cargo(id);


--
-- TOC entry 2739 (class 2606 OID 107431)
-- Name: cargo fkkavg4r4rm1bqas1yb370vx01s; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo
    ADD CONSTRAINT fkkavg4r4rm1bqas1yb370vx01s FOREIGN KEY (payment_id) REFERENCES public.cargo_pay_model(id);


-- Completed on 2022-11-17 10:26:27

--
-- PostgreSQL database dump complete
--

