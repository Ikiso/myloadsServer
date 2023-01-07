--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 15.0

-- Started on 2022-11-17 10:21:26

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
-- TOC entry 3366 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

--
-- TOC entry 200 (class 1259 OID 16406)
-- Name: action_viewer_model; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.action_viewer_model (
    id bigint NOT NULL,
    chats bigint NOT NULL,
    current_cargos bigint NOT NULL,
    notifications bigint NOT NULL,
    user_id bigint
);


--
-- TOC entry 257 (class 1259 OID 123927)
-- Name: action_viewer_model_cargo_list; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.action_viewer_model_cargo_list (
    action_viewer_model_id bigint NOT NULL,
    cargo_list bigint
);


--
-- TOC entry 201 (class 1259 OID 16411)
-- Name: address_model; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.address_model (
    id bigint NOT NULL,
    address character varying(255),
    city character varying(255),
    lat double precision NOT NULL,
    lon double precision NOT NULL,
    region character varying(255)
);


--
-- TOC entry 202 (class 1259 OID 16443)
-- Name: cargo_carrier_transport_model; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cargo_carrier_transport_model (
    id bigint NOT NULL,
    driver_id bigint,
    scheduler_id bigint,
    semitrailer_id bigint,
    time_window_id bigint,
    tractor_id bigint,
    trailer_id bigint,
    truck_id bigint
);


--
-- TOC entry 203 (class 1259 OID 16448)
-- Name: cargo_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cargo_history (
    id bigint NOT NULL,
    date timestamp without time zone,
    is_deleted boolean,
    new_pay_state integer,
    new_state integer,
    selected_carrier_id bigint,
    message character varying(255),
    old_cargo text,
    type integer,
    creator_id bigint,
    admin_change boolean
);


--
-- TOC entry 204 (class 1259 OID 16461)
-- Name: cargo_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cargo_item (
    id bigint NOT NULL,
    creator_id bigint,
    additional_information text,
    adr character varying(255),
    cargo_load_type integer,
    is_deleted boolean NOT NULL,
    is_tender boolean,
    mass double precision NOT NULL,
    name character varying(255),
    pay_state integer,
    state integer,
    transportation_accept_by_carrier boolean,
    transportation_accept_by_shipper boolean,
    value double precision NOT NULL,
    voted_by_carrier boolean NOT NULL,
    voted_by_shipper boolean NOT NULL,
    company_id bigint,
    cargo_carrier_transport_id bigint,
    cargo_size_id bigint,
    loading_info_id bigint,
    payment_id bigint,
    route_id bigint,
    selected_carrier_id bigint,
    selected_proposed_transport_id bigint,
    un_loading_info_id bigint,
    pellets integer,
    ext_id character varying(255),
    subsidiary_id bigint,
    chain_item boolean,
    cargo_has_been_changed boolean,
    shipper_sent_docs boolean,
    transport_has_been_changed boolean,
    ext_source character varying(255),
    date timestamp without time zone
);


--
-- TOC entry 205 (class 1259 OID 16469)
-- Name: cargo_item_cargo_body_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cargo_item_cargo_body_type (
    cargo_item_id bigint NOT NULL,
    cargo_body_type integer
);


--
-- TOC entry 255 (class 1259 OID 107352)
-- Name: cargo_item_cargo_nature_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cargo_item_cargo_nature_type (
    cargo_item_id bigint NOT NULL,
    cargo_nature_type integer NOT NULL
);


--
-- TOC entry 254 (class 1259 OID 98731)
-- Name: cargo_item_chain; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cargo_item_chain (
    cargo_item_id bigint NOT NULL,
    chain_id bigint NOT NULL
);


--
-- TOC entry 251 (class 1259 OID 82389)
-- Name: cargo_item_points; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cargo_item_points (
    cargo_item_id bigint NOT NULL,
    points_id bigint NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 16472)
-- Name: cargo_item_proposed_cargos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cargo_item_proposed_cargos (
    cargo_item_id bigint NOT NULL,
    proposed_cargos_id bigint NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 16477)
-- Name: cargo_item_state_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cargo_item_state_history (
    cargo_item_id bigint NOT NULL,
    state_history_id bigint NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 16480)
-- Name: cargo_loading_model; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cargo_loading_model (
    id bigint NOT NULL,
    comment text,
    company_name character varying(255),
    contact_phone character varying(255),
    date timestamp without time zone,
    address_id bigint,
    time_window_id bigint,
    unload_mass double precision,
    upload_mass double precision,
    accepted timestamp without time zone,
    delivered timestamp without time zone,
    download_time integer,
    loading_places integer,
    rc_or_net_market boolean
);


--
-- TOC entry 209 (class 1259 OID 16488)
-- Name: cargo_pay_billing_model; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cargo_pay_billing_model (
    id bigint NOT NULL,
    amount double precision NOT NULL,
    company_name character varying(255),
    pay_date timestamp without time zone,
    pay_from character varying(255),
    pay_to character varying(255),
    accept_payment_date timestamp without time zone
);


--
-- TOC entry 210 (class 1259 OID 16496)
-- Name: cargo_pay_model; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cargo_pay_model (
    id bigint NOT NULL,
    amount double precision NOT NULL,
    expiration_date timestamp without time zone,
    pay_type integer,
    payment_type integer,
    payment_via integer NOT NULL,
    tax integer,
    start_date timestamp without time zone,
    start_amount double precision,
    auction_time integer,
    start_tax integer,
    nds_rate integer,
    start_nds_rate integer
);


--
-- TOC entry 258 (class 1259 OID 164910)
-- Name: cargo_reject_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cargo_reject_history (
    id bigint NOT NULL,
    carrier_company_id bigint NOT NULL,
    carrier_company_name character varying(255),
    carrier_creator_id bigint NOT NULL,
    rejectors_industry integer,
    cargo_id bigint
);


--
-- TOC entry 211 (class 1259 OID 16525)
-- Name: cargo_size; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cargo_size (
    id bigint NOT NULL,
    height double precision NOT NULL,
    length double precision NOT NULL,
    width double precision NOT NULL
);


--
-- TOC entry 269 (class 1259 OID 293073)
-- Name: cargo_source_store; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cargo_source_store (
    id bigint NOT NULL,
    ext_id text,
    ext_source text,
    type text,
    request text,
    response text,
    date timestamp without time zone,
    rsponse character varying(255)
);


--
-- TOC entry 260 (class 1259 OID 189931)
-- Name: cargo_template; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cargo_template (
    id bigint NOT NULL,
    name text,
    json text,
    person_id bigint
);


--
-- TOC entry 259 (class 1259 OID 189929)
-- Name: cargo_template_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cargo_template_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 259
-- Name: cargo_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cargo_template_id_seq OWNED BY public.cargo_template.id;


--
-- TOC entry 212 (class 1259 OID 16530)
-- Name: cargo_time_window; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cargo_time_window (
    id bigint NOT NULL,
    end_time integer NOT NULL,
    start_time integer NOT NULL,
    end_minutes integer,
    start_minutes integer
);


--
-- TOC entry 213 (class 1259 OID 16535)
-- Name: chat_model; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chat_model (
    id bigint NOT NULL,
    last_date timestamp without time zone,
    first_person_id bigint,
    second_person_id bigint,
    deleted_by_first_person boolean NOT NULL,
    deleted_by_first_person_sins timestamp without time zone,
    deleted_by_second_person boolean NOT NULL,
    deleted_by_second_person_sins timestamp without time zone,
    first_person_unread integer NOT NULL,
    second_person_unread integer NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 16540)
-- Name: chat_model_messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.chat_model_messages (
    chat_model_id bigint NOT NULL,
    messages_id bigint NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 16543)
-- Name: company_business_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.company_business_data (
    id bigint NOT NULL,
    creator_id bigint,
    bank_infojson text,
    dt timestamp without time zone,
    errors text,
    kontur_focusjson text,
    company_id bigint,
    dd_bank_infojson text,
    dd_org_infojson text
);


--
-- TOC entry 216 (class 1259 OID 16551)
-- Name: company_model; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.company_model (
    id bigint NOT NULL,
    bank_name character varying(255),
    bik character varying(255),
    billing_account character varying(255),
    fact_address character varying(255),
    industry integer,
    inn character varying(255),
    juridical_rating double precision,
    kpp character varying(255),
    ks character varying(255),
    legal_address character varying(255),
    moderation_status integer,
    name character varying(255),
    ogrn character varying(255),
    owner_id bigint,
    pool_offer_file_id bigint,
    pool_document_list_file_id bigint,
    pool_recipient_address character varying(255),
    pool_recipient_name character varying(255),
    pool_recipient_email_and_phone character varying(255),
    kind_of_business character varying(255),
    loading_machines character varying(255),
    number_of_cars character varying(255),
    region_id bigint,
    selected_carrier_id bigint,
    disable_cargo_moving boolean
);


--
-- TOC entry 256 (class 1259 OID 107360)
-- Name: company_model_body_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.company_model_body_type (
    company_model_id bigint NOT NULL,
    body_type integer
);


--
-- TOC entry 217 (class 1259 OID 16559)
-- Name: company_model_pool; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.company_model_pool (
    company_model_id bigint NOT NULL,
    pool_id bigint NOT NULL
);


--
-- TOC entry 250 (class 1259 OID 57574)
-- Name: company_model_pool_documents_names; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.company_model_pool_documents_names (
    company_model_id bigint NOT NULL,
    pool_documents_names character varying(255)
);


--
-- TOC entry 199 (class 1259 OID 16400)
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
-- TOC entry 198 (class 1259 OID 16395)
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


--
-- TOC entry 268 (class 1259 OID 259796)
-- Name: dd_clean_address; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dd_clean_address (
    src text NOT NULL,
    address_id bigint
);


--
-- TOC entry 218 (class 1259 OID 16564)
-- Name: direction_model; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.direction_model (
    id bigint NOT NULL,
    adr character varying(255),
    danger boolean NOT NULL,
    distance double precision NOT NULL,
    mass double precision NOT NULL,
    name character varying(255),
    type integer,
    value double precision NOT NULL,
    loading_city_id bigint,
    tender_id bigint,
    un_loading_city_id bigint
);


--
-- TOC entry 248 (class 1259 OID 49190)
-- Name: direction_model_body_types; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.direction_model_body_types (
    direction_model_id bigint NOT NULL,
    body_types integer
);


--
-- TOC entry 219 (class 1259 OID 16572)
-- Name: direction_request_model; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.direction_request_model (
    id bigint NOT NULL,
    price double precision NOT NULL,
    direction_id bigint,
    request_id bigint
);


--
-- TOC entry 220 (class 1259 OID 16577)
-- Name: driver_model; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.driver_model (
    id bigint NOT NULL,
    creator_id bigint,
    moderation_status integer,
    full_name character varying(255),
    passport_date timestamp without time zone,
    passport_department_code character varying(255),
    passport_issued character varying(255),
    passport_number character varying(255),
    phone character varying(255),
    vu_number character varying(255),
    company_id bigint,
    residence_address_id bigint,
    deleted boolean,
    p_date character varying(255)
);


--
-- TOC entry 221 (class 1259 OID 16593)
-- Name: geocode_point; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.geocode_point (
    id bigint NOT NULL,
    lat double precision NOT NULL,
    lon double precision NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 16598)
-- Name: geocode_route_model; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.geocode_route_model (
    id bigint NOT NULL,
    date timestamp without time zone,
    distance bigint NOT NULL,
    "time" bigint NOT NULL,
    end_point_id bigint,
    start_point_id bigint,
    src integer
);


--
-- TOC entry 252 (class 1259 OID 82392)
-- Name: geocode_route_model_all_points; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.geocode_route_model_all_points (
    geocode_route_model_id bigint NOT NULL,
    all_points_id bigint NOT NULL
);


--
-- TOC entry 253 (class 1259 OID 82395)
-- Name: geocode_route_model_distances; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.geocode_route_model_distances (
    geocode_route_model_id bigint NOT NULL,
    distances bigint
);


--
-- TOC entry 223 (class 1259 OID 16603)
-- Name: geocode_route_model_points; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.geocode_route_model_points (
    geocode_route_model_id bigint NOT NULL,
    points_id bigint NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 16796)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 224 (class 1259 OID 16606)
-- Name: message_model; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.message_model (
    id bigint NOT NULL,
    post_date timestamp without time zone,
    text character varying(255),
    sender_id bigint,
    file_id bigint,
    file_size bigint,
    file_type character varying(255),
    type integer,
    chat_id bigint,
    unread boolean
);


--
-- TOC entry 225 (class 1259 OID 16611)
-- Name: notification_model; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notification_model (
    id bigint NOT NULL,
    creation_date timestamp without time zone,
    is_viewed boolean NOT NULL,
    type integer,
    person_id bigint
);


--
-- TOC entry 226 (class 1259 OID 16616)
-- Name: notification_model_artifacts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notification_model_artifacts (
    notification_model_id bigint NOT NULL,
    artifacts character varying(255)
);


--
-- TOC entry 227 (class 1259 OID 16619)
-- Name: password_reset_token; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.password_reset_token (
    id bigint NOT NULL,
    expiry_date timestamp without time zone,
    token character varying(255),
    person_id bigint
);


--
-- TOC entry 228 (class 1259 OID 16624)
-- Name: person; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.person (
    id bigint NOT NULL,
    creator_id bigint,
    company_status integer,
    email character varying(255),
    email_verify boolean NOT NULL,
    email_verify_token character varying(255),
    enabled boolean NOT NULL,
    pass_word character varying(255),
    registration_complete boolean,
    role integer,
    company_id bigint,
    chief_id bigint,
    info_id bigint,
    source integer,
    use_my_sign boolean,
    proposed_company_id bigint
);


--
-- TOC entry 261 (class 1259 OID 198161)
-- Name: person_mailing_props; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.person_mailing_props (
    person_id bigint,
    mailing_props integer
);


--
-- TOC entry 229 (class 1259 OID 16640)
-- Name: pool_item_model; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pool_item_model (
    id bigint NOT NULL,
    state integer,
    tender_id bigint,
    carrier_id bigint,
    shipper_id bigint,
    recipient character varying(255),
    shipper_subsidiary_id bigint,
    reject_message character varying(255),
    sanction_date timestamp without time zone
);


--
-- TOC entry 263 (class 1259 OID 207941)
-- Name: pool_item_model_reserved_cargo_names; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pool_item_model_reserved_cargo_names (
    pool_item_model_id bigint NOT NULL,
    reserved_cargo_names text
);


--
-- TOC entry 230 (class 1259 OID 16651)
-- Name: proposed_cargo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.proposed_cargo (
    id bigint NOT NULL,
    creator_id bigint,
    comment character varying(255),
    expiration_date timestamp without time zone,
    company_id bigint,
    cargo_id bigint,
    transport_model_id bigint
);


--
-- TOC entry 231 (class 1259 OID 16656)
-- Name: proposed_transport; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.proposed_transport (
    id bigint NOT NULL,
    creator_id bigint,
    amount double precision NOT NULL,
    comment character varying(255),
    expiration_date timestamp without time zone,
    tax_type integer,
    company_id bigint,
    cargo_id bigint,
    date timestamp without time zone
);


--
-- TOC entry 232 (class 1259 OID 16661)
-- Name: rating_model; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rating_model (
    id bigint NOT NULL,
    comment character varying(255),
    posted_date timestamp without time zone,
    cargo_id bigint,
    company_id bigint,
    rating integer
);


--
-- TOC entry 264 (class 1259 OID 216125)
-- Name: sanction_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sanction_history (
    id bigint NOT NULL,
    date timestamp without time zone,
    sanction_date timestamp without time zone,
    creator_id bigint,
    pool_id bigint,
    message text
);


--
-- TOC entry 233 (class 1259 OID 16666)
-- Name: scheduler_model; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.scheduler_model (
    id bigint NOT NULL,
    begin_date timestamp without time zone,
    end_date timestamp without time zone
);


--
-- TOC entry 234 (class 1259 OID 16671)
-- Name: semitrailer_model; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.semitrailer_model (
    id bigint NOT NULL,
    creator_id bigint,
    moderation_status integer,
    reg_number character varying(255),
    vehicle_mark character varying(255),
    body_type integer,
    carrying double precision NOT NULL,
    type integer,
    value double precision NOT NULL,
    company_id bigint,
    deleted boolean
);


--
-- TOC entry 246 (class 1259 OID 17368)
-- Name: spring_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.spring_session (
    primary_id character(36) NOT NULL,
    session_id character(36) NOT NULL,
    creation_time bigint NOT NULL,
    last_access_time bigint NOT NULL,
    max_inactive_interval integer NOT NULL,
    expiry_time bigint NOT NULL,
    principal_name character varying(100)
);


--
-- TOC entry 247 (class 1259 OID 17376)
-- Name: spring_session_attributes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.spring_session_attributes (
    session_primary_id character(36) NOT NULL,
    attribute_name character varying(200) NOT NULL,
    attribute_bytes bytea NOT NULL
);


--
-- TOC entry 235 (class 1259 OID 16682)
-- Name: stock_model; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stock_model (
    id bigint NOT NULL,
    name character varying(255),
    address_id bigint,
    creator_id bigint,
    contact_person character varying(255),
    contact_phone_number character varying(255),
    download_time integer NOT NULL,
    loading_places integer NOT NULL,
    company_id bigint,
    time_window_id bigint,
    rc_or_net_market boolean
);


--
-- TOC entry 249 (class 1259 OID 49430)
-- Name: subsidiary; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subsidiary (
    id bigint NOT NULL,
    creator_id bigint,
    moderation_status integer,
    address character varying(255),
    bank_name character varying(255),
    bik character varying(255),
    billing_account character varying(255),
    inn character varying(255),
    kpp character varying(255),
    ks character varying(255),
    name character varying(255),
    ogrn character varying(255),
    company_id bigint,
    pool_document_list_file_id bigint,
    pool_offer_file_id bigint,
    pool_recipient_address character varying(255),
    pool_recipient_email_and_phone character varying(255),
    pool_recipient_name character varying(255),
    deleted boolean
);


--
-- TOC entry 262 (class 1259 OID 207933)
-- Name: system_setting; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.system_setting (
    key text NOT NULL,
    value text
);


--
-- TOC entry 236 (class 1259 OID 16692)
-- Name: tender_model; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tender_model (
    id bigint NOT NULL,
    creator_id bigint,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    state integer,
    company_id bigint,
    payment_in integer,
    payment_type integer,
    comment character varying(255),
    date timestamp without time zone,
    load_type integer,
    nature_type integer,
    subsidiary_id bigint,
    ride_of_week character varying(255)
);


--
-- TOC entry 237 (class 1259 OID 16697)
-- Name: tender_request_model; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tender_request_model (
    id bigint NOT NULL,
    creator_id bigint,
    company_id bigint,
    tender_id bigint,
    tax integer
);


--
-- TOC entry 238 (class 1259 OID 16702)
-- Name: tractor_model; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tractor_model (
    id bigint NOT NULL,
    creator_id bigint,
    moderation_status integer,
    reg_number character varying(255),
    vehicle_mark character varying(255),
    type integer,
    company_id bigint,
    deleted boolean
);


--
-- TOC entry 239 (class 1259 OID 16713)
-- Name: trailer_model; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trailer_model (
    id bigint NOT NULL,
    creator_id bigint,
    moderation_status integer,
    reg_number character varying(255),
    vehicle_mark character varying(255),
    body_type integer,
    carrying double precision NOT NULL,
    type integer,
    value double precision NOT NULL,
    company_id bigint,
    deleted boolean
);


--
-- TOC entry 240 (class 1259 OID 16724)
-- Name: transport_model; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transport_model (
    id bigint NOT NULL,
    creator_id bigint,
    moderation_status integer,
    amount_rate integer NOT NULL,
    date_from timestamp without time zone,
    date_to timestamp without time zone,
    company_id bigint,
    loading_city_id bigint,
    semitrailer_id bigint,
    tractor_id bigint,
    trailer_id bigint,
    truck_id bigint,
    un_loading_city_id bigint,
    deleted boolean
);


--
-- TOC entry 241 (class 1259 OID 16729)
-- Name: transport_model_proposed_cargos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transport_model_proposed_cargos (
    transport_model_id bigint NOT NULL,
    proposed_cargos_id bigint NOT NULL
);


--
-- TOC entry 242 (class 1259 OID 16734)
-- Name: transport_model_proposed_transports; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.transport_model_proposed_transports (
    transport_model_id bigint NOT NULL,
    proposed_transports_id bigint NOT NULL
);


--
-- TOC entry 243 (class 1259 OID 16739)
-- Name: truck_model; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.truck_model (
    id bigint NOT NULL,
    creator_id bigint,
    moderation_status integer,
    reg_number character varying(255),
    vehicle_mark character varying(255),
    body_type integer,
    carrying double precision NOT NULL,
    type integer,
    value double precision NOT NULL,
    company_id bigint,
    deleted boolean
);


--
-- TOC entry 244 (class 1259 OID 16750)
-- Name: user_info; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_info (
    id bigint NOT NULL,
    contact_email character varying(255) NOT NULL,
    contact_phone_number character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    position_person character varying(255) NOT NULL
);


--
-- TOC entry 265 (class 1259 OID 259762)
-- Name: whatsapp_info_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.whatsapp_info_settings (
    id bigint NOT NULL,
    "startHour" integer,
    end_hour integer,
    person_id bigint,
    last_send_date timestamp without time zone,
    start_hour integer NOT NULL
);


--
-- TOC entry 266 (class 1259 OID 259767)
-- Name: whatsapp_info_settings_region; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.whatsapp_info_settings_region (
    whatsapp_info_settings_id bigint,
    region text
);


--
-- TOC entry 267 (class 1259 OID 259778)
-- Name: whatsapp_info_settings_regions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.whatsapp_info_settings_regions (
    whatsapp_info_settings_id bigint NOT NULL,
    regions character varying(255)
);


--
-- TOC entry 2994 (class 2604 OID 189934)
-- Name: cargo_template id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_template ALTER COLUMN id SET DEFAULT nextval('public.cargo_template_id_seq'::regclass);


--
-- TOC entry 2998 (class 2606 OID 16410)
-- Name: action_viewer_model action_viewer_model_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.action_viewer_model
    ADD CONSTRAINT action_viewer_model_pkey PRIMARY KEY (id);


--
-- TOC entry 3000 (class 2606 OID 16418)
-- Name: address_model address_model_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.address_model
    ADD CONSTRAINT address_model_pkey PRIMARY KEY (id);


--
-- TOC entry 3002 (class 2606 OID 16447)
-- Name: cargo_carrier_transport_model cargo_carrier_transport_model_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_carrier_transport_model
    ADD CONSTRAINT cargo_carrier_transport_model_pkey PRIMARY KEY (id);


--
-- TOC entry 3004 (class 2606 OID 16452)
-- Name: cargo_history cargo_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_history
    ADD CONSTRAINT cargo_history_pkey PRIMARY KEY (id);


--
-- TOC entry 3006 (class 2606 OID 16468)
-- Name: cargo_item cargo_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_item
    ADD CONSTRAINT cargo_item_pkey PRIMARY KEY (id);


--
-- TOC entry 3012 (class 2606 OID 16476)
-- Name: cargo_item_proposed_cargos cargo_item_proposed_cargos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_item_proposed_cargos
    ADD CONSTRAINT cargo_item_proposed_cargos_pkey PRIMARY KEY (cargo_item_id, proposed_cargos_id);


--
-- TOC entry 3018 (class 2606 OID 16487)
-- Name: cargo_loading_model cargo_loading_model_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_loading_model
    ADD CONSTRAINT cargo_loading_model_pkey PRIMARY KEY (id);


--
-- TOC entry 3021 (class 2606 OID 16495)
-- Name: cargo_pay_billing_model cargo_pay_billing_model_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_pay_billing_model
    ADD CONSTRAINT cargo_pay_billing_model_pkey PRIMARY KEY (id);


--
-- TOC entry 3023 (class 2606 OID 16500)
-- Name: cargo_pay_model cargo_pay_model_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_pay_model
    ADD CONSTRAINT cargo_pay_model_pkey PRIMARY KEY (id);


--
-- TOC entry 3117 (class 2606 OID 164914)
-- Name: cargo_reject_history cargo_reject_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_reject_history
    ADD CONSTRAINT cargo_reject_history_pkey PRIMARY KEY (id);


--
-- TOC entry 3025 (class 2606 OID 16529)
-- Name: cargo_size cargo_size_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_size
    ADD CONSTRAINT cargo_size_pkey PRIMARY KEY (id);


--
-- TOC entry 3129 (class 2606 OID 293080)
-- Name: cargo_source_store cargo_source_store_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_source_store
    ADD CONSTRAINT cargo_source_store_pkey PRIMARY KEY (id);


--
-- TOC entry 3119 (class 2606 OID 189939)
-- Name: cargo_template cargo_template_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_template
    ADD CONSTRAINT cargo_template_pkey PRIMARY KEY (id);


--
-- TOC entry 3027 (class 2606 OID 16534)
-- Name: cargo_time_window cargo_time_window_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_time_window
    ADD CONSTRAINT cargo_time_window_pkey PRIMARY KEY (id);


--
-- TOC entry 3029 (class 2606 OID 16539)
-- Name: chat_model chat_model_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_model
    ADD CONSTRAINT chat_model_pkey PRIMARY KEY (id);


--
-- TOC entry 3033 (class 2606 OID 16550)
-- Name: company_business_data company_business_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company_business_data
    ADD CONSTRAINT company_business_data_pkey PRIMARY KEY (id);


--
-- TOC entry 3035 (class 2606 OID 16558)
-- Name: company_model company_model_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company_model
    ADD CONSTRAINT company_model_pkey PRIMARY KEY (id);


--
-- TOC entry 3037 (class 2606 OID 16563)
-- Name: company_model_pool company_model_pool_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company_model_pool
    ADD CONSTRAINT company_model_pool_pkey PRIMARY KEY (company_model_id, pool_id);


--
-- TOC entry 3127 (class 2606 OID 259803)
-- Name: dd_clean_address dd_clean_address_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dd_clean_address
    ADD CONSTRAINT dd_clean_address_pkey PRIMARY KEY (src);


--
-- TOC entry 3039 (class 2606 OID 16571)
-- Name: direction_model direction_model_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.direction_model
    ADD CONSTRAINT direction_model_pkey PRIMARY KEY (id);


--
-- TOC entry 3041 (class 2606 OID 16576)
-- Name: direction_request_model direction_request_model_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.direction_request_model
    ADD CONSTRAINT direction_request_model_pkey PRIMARY KEY (id);


--
-- TOC entry 3043 (class 2606 OID 16584)
-- Name: driver_model driver_model_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.driver_model
    ADD CONSTRAINT driver_model_pkey PRIMARY KEY (id);


--
-- TOC entry 3045 (class 2606 OID 16597)
-- Name: geocode_point geocode_point_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.geocode_point
    ADD CONSTRAINT geocode_point_pkey PRIMARY KEY (id);


--
-- TOC entry 3047 (class 2606 OID 16602)
-- Name: geocode_route_model geocode_route_model_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.geocode_route_model
    ADD CONSTRAINT geocode_route_model_pkey PRIMARY KEY (id);


--
-- TOC entry 3055 (class 2606 OID 16610)
-- Name: message_model message_model_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.message_model
    ADD CONSTRAINT message_model_pkey PRIMARY KEY (id);


--
-- TOC entry 3057 (class 2606 OID 16615)
-- Name: notification_model notification_model_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notification_model
    ADD CONSTRAINT notification_model_pkey PRIMARY KEY (id);


--
-- TOC entry 3059 (class 2606 OID 16623)
-- Name: password_reset_token password_reset_token_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.password_reset_token
    ADD CONSTRAINT password_reset_token_pkey PRIMARY KEY (id);


--
-- TOC entry 3062 (class 2606 OID 16631)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 2996 (class 2606 OID 16399)
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- TOC entry 3064 (class 2606 OID 16644)
-- Name: pool_item_model pool_item_model_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pool_item_model
    ADD CONSTRAINT pool_item_model_pkey PRIMARY KEY (id);


--
-- TOC entry 3066 (class 2606 OID 16655)
-- Name: proposed_cargo proposed_cargo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proposed_cargo
    ADD CONSTRAINT proposed_cargo_pkey PRIMARY KEY (id);


--
-- TOC entry 3068 (class 2606 OID 16660)
-- Name: proposed_transport proposed_transport_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proposed_transport
    ADD CONSTRAINT proposed_transport_pkey PRIMARY KEY (id);


--
-- TOC entry 3072 (class 2606 OID 16665)
-- Name: rating_model rating_model_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rating_model
    ADD CONSTRAINT rating_model_pkey PRIMARY KEY (id);


--
-- TOC entry 3123 (class 2606 OID 216132)
-- Name: sanction_history sanction_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sanction_history
    ADD CONSTRAINT sanction_history_pkey PRIMARY KEY (id);


--
-- TOC entry 3074 (class 2606 OID 16670)
-- Name: scheduler_model scheduler_model_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.scheduler_model
    ADD CONSTRAINT scheduler_model_pkey PRIMARY KEY (id);


--
-- TOC entry 3076 (class 2606 OID 16678)
-- Name: semitrailer_model semitrailer_model_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.semitrailer_model
    ADD CONSTRAINT semitrailer_model_pkey PRIMARY KEY (id);


--
-- TOC entry 3107 (class 2606 OID 17383)
-- Name: spring_session_attributes spring_session_attributes_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.spring_session_attributes
    ADD CONSTRAINT spring_session_attributes_pk PRIMARY KEY (session_primary_id, attribute_name);


--
-- TOC entry 3105 (class 2606 OID 17372)
-- Name: spring_session spring_session_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.spring_session
    ADD CONSTRAINT spring_session_pk PRIMARY KEY (primary_id);


--
-- TOC entry 3078 (class 2606 OID 16686)
-- Name: stock_model stock_model_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_model
    ADD CONSTRAINT stock_model_pkey PRIMARY KEY (id);


--
-- TOC entry 3109 (class 2606 OID 49437)
-- Name: subsidiary subsidiary_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subsidiary
    ADD CONSTRAINT subsidiary_pkey PRIMARY KEY (id);


--
-- TOC entry 3121 (class 2606 OID 207940)
-- Name: system_setting system_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.system_setting
    ADD CONSTRAINT system_setting_pkey PRIMARY KEY (key);


--
-- TOC entry 3080 (class 2606 OID 16696)
-- Name: tender_model tender_model_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tender_model
    ADD CONSTRAINT tender_model_pkey PRIMARY KEY (id);


--
-- TOC entry 3082 (class 2606 OID 16701)
-- Name: tender_request_model tender_request_model_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tender_request_model
    ADD CONSTRAINT tender_request_model_pkey PRIMARY KEY (id);


--
-- TOC entry 3084 (class 2606 OID 16709)
-- Name: tractor_model tractor_model_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tractor_model
    ADD CONSTRAINT tractor_model_pkey PRIMARY KEY (id);


--
-- TOC entry 3086 (class 2606 OID 16720)
-- Name: trailer_model trailer_model_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trailer_model
    ADD CONSTRAINT trailer_model_pkey PRIMARY KEY (id);


--
-- TOC entry 3088 (class 2606 OID 16728)
-- Name: transport_model transport_model_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_model
    ADD CONSTRAINT transport_model_pkey PRIMARY KEY (id);


--
-- TOC entry 3090 (class 2606 OID 16733)
-- Name: transport_model_proposed_cargos transport_model_proposed_cargos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_model_proposed_cargos
    ADD CONSTRAINT transport_model_proposed_cargos_pkey PRIMARY KEY (transport_model_id, proposed_cargos_id);


--
-- TOC entry 3094 (class 2606 OID 16738)
-- Name: transport_model_proposed_transports transport_model_proposed_transports_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_model_proposed_transports
    ADD CONSTRAINT transport_model_proposed_transports_pkey PRIMARY KEY (transport_model_id, proposed_transports_id);


--
-- TOC entry 3098 (class 2606 OID 16746)
-- Name: truck_model truck_model_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.truck_model
    ADD CONSTRAINT truck_model_pkey PRIMARY KEY (id);


--
-- TOC entry 3053 (class 2606 OID 16777)
-- Name: geocode_route_model_points uk_4kcjvmhb98801igaua8xdfe7v; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.geocode_route_model_points
    ADD CONSTRAINT uk_4kcjvmhb98801igaua8xdfe7v UNIQUE (points_id);


--
-- TOC entry 3031 (class 2606 OID 16775)
-- Name: chat_model_messages uk_86i8qfu154ob88jbca23n2hoj; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_model_messages
    ADD CONSTRAINT uk_86i8qfu154ob88jbca23n2hoj UNIQUE (messages_id);


--
-- TOC entry 3115 (class 2606 OID 98735)
-- Name: cargo_item_chain uk_9l8o31c328aj4hp97ih7d51m5; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_item_chain
    ADD CONSTRAINT uk_9l8o31c328aj4hp97ih7d51m5 UNIQUE (chain_id);


--
-- TOC entry 3014 (class 2606 OID 16765)
-- Name: cargo_item_proposed_cargos uk_9sjx1i46736gmm7uxvhc40rj2; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_item_proposed_cargos
    ADD CONSTRAINT uk_9sjx1i46736gmm7uxvhc40rj2 UNIQUE (proposed_cargos_id);


--
-- TOC entry 3113 (class 2606 OID 82401)
-- Name: geocode_route_model_all_points uk_b31cirxllv1sui4v7ep26w26m; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.geocode_route_model_all_points
    ADD CONSTRAINT uk_b31cirxllv1sui4v7ep26w26m UNIQUE (all_points_id);


--
-- TOC entry 3092 (class 2606 OID 16791)
-- Name: transport_model_proposed_cargos uk_belkfewvf5arr2h1o59gkf7aj; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_model_proposed_cargos
    ADD CONSTRAINT uk_belkfewvf5arr2h1o59gkf7aj UNIQUE (proposed_cargos_id);


--
-- TOC entry 3049 (class 2606 OID 268006)
-- Name: geocode_route_model uk_e0jl9yd6sumj6c5lgacwuku3g; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.geocode_route_model
    ADD CONSTRAINT uk_e0jl9yd6sumj6c5lgacwuku3g UNIQUE (end_point_id);


--
-- TOC entry 3051 (class 2606 OID 268008)
-- Name: geocode_route_model uk_elbw71rv1xt72t5f3d3c4kexe; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.geocode_route_model
    ADD CONSTRAINT uk_elbw71rv1xt72t5f3d3c4kexe UNIQUE (start_point_id);


--
-- TOC entry 3016 (class 2606 OID 16767)
-- Name: cargo_item_state_history uk_h9qd8kj7dlxxh9pfyoiajjodg; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_item_state_history
    ADD CONSTRAINT uk_h9qd8kj7dlxxh9pfyoiajjodg UNIQUE (state_history_id);


--
-- TOC entry 3111 (class 2606 OID 82399)
-- Name: cargo_item_points uk_iqi2lcgbiw1ch5qhu1pipphr2; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_item_points
    ADD CONSTRAINT uk_iqi2lcgbiw1ch5qhu1pipphr2 UNIQUE (points_id);


--
-- TOC entry 3096 (class 2606 OID 16793)
-- Name: transport_model_proposed_transports uk_s2vhlvks393896logu6r0eodp; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_model_proposed_transports
    ADD CONSTRAINT uk_s2vhlvks393896logu6r0eodp UNIQUE (proposed_transports_id);


--
-- TOC entry 3100 (class 2606 OID 16757)
-- Name: user_info user_info_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_pkey PRIMARY KEY (id);


--
-- TOC entry 3125 (class 2606 OID 259766)
-- Name: whatsapp_info_settings whatsapp_info_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.whatsapp_info_settings
    ADD CONSTRAINT whatsapp_info_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 3007 (class 1259 OID 276240)
-- Name: company_ext_id_Index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "company_ext_id_Index" ON public.cargo_item USING btree (company_id, ext_id);


--
-- TOC entry 3008 (class 1259 OID 284432)
-- Name: company_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX company_id_index ON public.cargo_item USING btree (company_id);


--
-- TOC entry 3009 (class 1259 OID 284433)
-- Name: creator_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX creator_id_index ON public.cargo_item USING btree (creator_id);


--
-- TOC entry 3060 (class 1259 OID 148503)
-- Name: idx_by_email; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_by_email ON public.person USING btree (email);


--
-- TOC entry 3019 (class 1259 OID 284441)
-- Name: loading_model_date_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX loading_model_date_index ON public.cargo_loading_model USING btree (date DESC);


--
-- TOC entry 3069 (class 1259 OID 284435)
-- Name: pt_company_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pt_company_id_index ON public.proposed_transport USING btree (company_id);


--
-- TOC entry 3070 (class 1259 OID 284436)
-- Name: pt_creator_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX pt_creator_id_index ON public.proposed_transport USING btree (creator_id);


--
-- TOC entry 3101 (class 1259 OID 17373)
-- Name: spring_session_ix1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX spring_session_ix1 ON public.spring_session USING btree (session_id);


--
-- TOC entry 3102 (class 1259 OID 17374)
-- Name: spring_session_ix2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX spring_session_ix2 ON public.spring_session USING btree (expiry_time);


--
-- TOC entry 3103 (class 1259 OID 17375)
-- Name: spring_session_ix3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX spring_session_ix3 ON public.spring_session USING btree (principal_name);


--
-- TOC entry 3010 (class 1259 OID 284434)
-- Name: state_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX state_index ON public.cargo_item USING btree (state);


--
-- TOC entry 3228 (class 2606 OID 107355)
-- Name: cargo_item_cargo_nature_type cargo_item_to_cargo_nature_type; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_item_cargo_nature_type
    ADD CONSTRAINT cargo_item_to_cargo_nature_type FOREIGN KEY (cargo_item_id) REFERENCES public.cargo_item(id);


--
-- TOC entry 3232 (class 2606 OID 189940)
-- Name: cargo_template cargo_template_to_person; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_template
    ADD CONSTRAINT cargo_template_to_person FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3239 (class 2606 OID 259804)
-- Name: dd_clean_address dd_clean_address_to_address; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dd_clean_address
    ADD CONSTRAINT dd_clean_address_to_address FOREIGN KEY (address_id) REFERENCES public.address_model(id);


--
-- TOC entry 3201 (class 2606 OID 17253)
-- Name: tender_request_model fk1c0biwmdonvge6v1v1qx3ltdj; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tender_request_model
    ADD CONSTRAINT fk1c0biwmdonvge6v1v1qx3ltdj FOREIGN KEY (tender_id) REFERENCES public.tender_model(id);


--
-- TOC entry 3170 (class 2606 OID 17058)
-- Name: driver_model fk1wr22dm304pyd1s325prrkvko; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.driver_model
    ADD CONSTRAINT fk1wr22dm304pyd1s325prrkvko FOREIGN KEY (company_id) REFERENCES public.company_model(id);


--
-- TOC entry 3220 (class 2606 OID 57585)
-- Name: company_model_pool_documents_names fk22yadvxkrmcgxtbwukme3gpxc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company_model_pool_documents_names
    ADD CONSTRAINT fk22yadvxkrmcgxtbwukme3gpxc FOREIGN KEY (company_model_id) REFERENCES public.company_model(id);


--
-- TOC entry 3226 (class 2606 OID 98736)
-- Name: cargo_item_chain fk24ak0ithy1g8m6jpbl83cy2vi; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_item_chain
    ADD CONSTRAINT fk24ak0ithy1g8m6jpbl83cy2vi FOREIGN KEY (chain_id) REFERENCES public.cargo_item(id);


--
-- TOC entry 3172 (class 2606 OID 17073)
-- Name: geocode_route_model fk25mcosetovw0yuhng6pmp19e6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.geocode_route_model
    ADD CONSTRAINT fk25mcosetovw0yuhng6pmp19e6 FOREIGN KEY (start_point_id) REFERENCES public.geocode_point(id);


--
-- TOC entry 3150 (class 2606 OID 16933)
-- Name: cargo_item_proposed_cargos fk28ihttk2r9jkwtkqia5ai8li1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_item_proposed_cargos
    ADD CONSTRAINT fk28ihttk2r9jkwtkqia5ai8li1 FOREIGN KEY (proposed_cargos_id) REFERENCES public.proposed_cargo(id);


--
-- TOC entry 3204 (class 2606 OID 17273)
-- Name: trailer_model fk30htnnl0rot1fdxkb5ivnpojj; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trailer_model
    ADD CONSTRAINT fk30htnnl0rot1fdxkb5ivnpojj FOREIGN KEY (company_id) REFERENCES public.company_model(id);


--
-- TOC entry 3212 (class 2606 OID 17333)
-- Name: transport_model_proposed_cargos fk38r2csrretacc4pyh8o90e3ex; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_model_proposed_cargos
    ADD CONSTRAINT fk38r2csrretacc4pyh8o90e3ex FOREIGN KEY (transport_model_id) REFERENCES public.transport_model(id);


--
-- TOC entry 3161 (class 2606 OID 17018)
-- Name: company_model fk3ed7xeir5awc7r0hv8xmo7n32; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company_model
    ADD CONSTRAINT fk3ed7xeir5awc7r0hv8xmo7n32 FOREIGN KEY (owner_id) REFERENCES public.person(id);


--
-- TOC entry 3205 (class 2606 OID 17298)
-- Name: transport_model fk3ok082aiamcub2hr9ohseowo6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_model
    ADD CONSTRAINT fk3ok082aiamcub2hr9ohseowo6 FOREIGN KEY (loading_city_id) REFERENCES public.cargo_loading_model(id);


--
-- TOC entry 3206 (class 2606 OID 17323)
-- Name: transport_model fk3t87fpe9psb40tj7sp3blgr1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_model
    ADD CONSTRAINT fk3t87fpe9psb40tj7sp3blgr1c FOREIGN KEY (un_loading_city_id) REFERENCES public.cargo_loading_model(id);


--
-- TOC entry 3185 (class 2606 OID 17133)
-- Name: pool_item_model fk3tuq53wue8suaidwingkaap7o; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pool_item_model
    ADD CONSTRAINT fk3tuq53wue8suaidwingkaap7o FOREIGN KEY (carrier_id) REFERENCES public.company_model(id);


--
-- TOC entry 3149 (class 2606 OID 16928)
-- Name: cargo_item_cargo_body_type fk3yaionea5vio9dyjlmb1ssq4j; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_item_cargo_body_type
    ADD CONSTRAINT fk3yaionea5vio9dyjlmb1ssq4j FOREIGN KEY (cargo_item_id) REFERENCES public.cargo_item(id);


--
-- TOC entry 3225 (class 2606 OID 82422)
-- Name: geocode_route_model_distances fk456t9qohdvyrnpw5s29funqjf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.geocode_route_model_distances
    ADD CONSTRAINT fk456t9qohdvyrnpw5s29funqjf FOREIGN KEY (geocode_route_model_id) REFERENCES public.geocode_route_model(id);


--
-- TOC entry 3181 (class 2606 OID 17118)
-- Name: person fk4mec06rl82u1m1ufodd8jrxcj; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT fk4mec06rl82u1m1ufodd8jrxcj FOREIGN KEY (info_id) REFERENCES public.user_info(id);


--
-- TOC entry 3176 (class 2606 OID 49155)
-- Name: message_model fk4n5qfs94j80vlnjggbqinmubf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.message_model
    ADD CONSTRAINT fk4n5qfs94j80vlnjggbqinmubf FOREIGN KEY (chat_id) REFERENCES public.chat_model(id);


--
-- TOC entry 3227 (class 2606 OID 98741)
-- Name: cargo_item_chain fk4vqq8plebksu3ao3md24ob32p; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_item_chain
    ADD CONSTRAINT fk4vqq8plebksu3ao3md24ob32p FOREIGN KEY (cargo_item_id) REFERENCES public.cargo_item(id);


--
-- TOC entry 3177 (class 2606 OID 17088)
-- Name: message_model fk4w5u1ounp6irvab8d5pb3qx06; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.message_model
    ADD CONSTRAINT fk4w5u1ounp6irvab8d5pb3qx06 FOREIGN KEY (sender_id) REFERENCES public.person(id);


--
-- TOC entry 3179 (class 2606 OID 17098)
-- Name: notification_model_artifacts fk50psghr9wr4accxtr4yxdjmcl; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notification_model_artifacts
    ADD CONSTRAINT fk50psghr9wr4accxtr4yxdjmcl FOREIGN KEY (notification_model_id) REFERENCES public.notification_model(id);


--
-- TOC entry 3218 (class 2606 OID 49193)
-- Name: direction_model_body_types fk5m19evh1my85i03p8475y24da; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.direction_model_body_types
    ADD CONSTRAINT fk5m19evh1my85i03p8475y24da FOREIGN KEY (direction_model_id) REFERENCES public.direction_model(id);


--
-- TOC entry 3207 (class 2606 OID 17308)
-- Name: transport_model fk5rdcsth82ye0g4mlfyu5y1ji1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_model
    ADD CONSTRAINT fk5rdcsth82ye0g4mlfyu5y1ji1 FOREIGN KEY (tractor_id) REFERENCES public.tractor_model(id);


--
-- TOC entry 3191 (class 2606 OID 17183)
-- Name: proposed_transport fk70xha7bbvnutejhqhvvmndcs9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proposed_transport
    ADD CONSTRAINT fk70xha7bbvnutejhqhvvmndcs9 FOREIGN KEY (cargo_id) REFERENCES public.cargo_item(id);


--
-- TOC entry 3180 (class 2606 OID 17103)
-- Name: password_reset_token fk71pqwtdsld8paixym8khcs8h7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.password_reset_token
    ADD CONSTRAINT fk71pqwtdsld8paixym8khcs8h7 FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3182 (class 2606 OID 17113)
-- Name: person fk787in6i44uj97onbb3oio1gm3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT fk787in6i44uj97onbb3oio1gm3 FOREIGN KEY (chief_id) REFERENCES public.person(id);


--
-- TOC entry 3139 (class 2606 OID 65948)
-- Name: cargo_item fk7kyb803wpcmta0qwap3a3q593; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_item
    ADD CONSTRAINT fk7kyb803wpcmta0qwap3a3q593 FOREIGN KEY (subsidiary_id) REFERENCES public.subsidiary(id);


--
-- TOC entry 3196 (class 2606 OID 17218)
-- Name: stock_model fk8nik2qrgv1p1moxsufgj10gke; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_model
    ADD CONSTRAINT fk8nik2qrgv1p1moxsufgj10gke FOREIGN KEY (address_id) REFERENCES public.address_model(id);


--
-- TOC entry 3156 (class 2606 OID 16998)
-- Name: chat_model fk8nxx2wwcclrfv6dvn6owmtobx; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_model
    ADD CONSTRAINT fk8nxx2wwcclrfv6dvn6owmtobx FOREIGN KEY (second_person_id) REFERENCES public.person(id);


--
-- TOC entry 3131 (class 2606 OID 16838)
-- Name: cargo_carrier_transport_model fk95738uib0wx43b4xrnk40r6mx; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_carrier_transport_model
    ADD CONSTRAINT fk95738uib0wx43b4xrnk40r6mx FOREIGN KEY (scheduler_id) REFERENCES public.scheduler_model(id);


--
-- TOC entry 3165 (class 2606 OID 17043)
-- Name: direction_model fk9bipeen52fix7ik5mg0swa3u9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.direction_model
    ADD CONSTRAINT fk9bipeen52fix7ik5mg0swa3u9 FOREIGN KEY (un_loading_city_id) REFERENCES public.address_model(id);


--
-- TOC entry 3221 (class 2606 OID 82402)
-- Name: cargo_item_points fk9d1cwbdjksq62qgnyqv52eole; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_item_points
    ADD CONSTRAINT fk9d1cwbdjksq62qgnyqv52eole FOREIGN KEY (points_id) REFERENCES public.cargo_loading_model(id);


--
-- TOC entry 3140 (class 2606 OID 16898)
-- Name: cargo_item fk9s5g9wvwd0stio4oqx9u31462; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_item
    ADD CONSTRAINT fk9s5g9wvwd0stio4oqx9u31462 FOREIGN KEY (loading_info_id) REFERENCES public.cargo_loading_model(id);


--
-- TOC entry 3208 (class 2606 OID 17293)
-- Name: transport_model fka0p5rxpfgotha2b76ql11vyx8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_model
    ADD CONSTRAINT fka0p5rxpfgotha2b76ql11vyx8 FOREIGN KEY (company_id) REFERENCES public.company_model(id);


--
-- TOC entry 3188 (class 2606 OID 17173)
-- Name: proposed_cargo fka3ybd8pmtj3gal60qjmhqkg3m; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proposed_cargo
    ADD CONSTRAINT fka3ybd8pmtj3gal60qjmhqkg3m FOREIGN KEY (transport_model_id) REFERENCES public.transport_model(id);


--
-- TOC entry 3132 (class 2606 OID 16853)
-- Name: cargo_carrier_transport_model fkaeeuoboyt2eb1g5t9i4vcejec; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_carrier_transport_model
    ADD CONSTRAINT fkaeeuoboyt2eb1g5t9i4vcejec FOREIGN KEY (tractor_id) REFERENCES public.tractor_model(id);


--
-- TOC entry 3183 (class 2606 OID 259813)
-- Name: person fkaidi0hxd73y671la2kgfuwwqu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT fkaidi0hxd73y671la2kgfuwwqu FOREIGN KEY (proposed_company_id) REFERENCES public.company_model(id);


--
-- TOC entry 3162 (class 2606 OID 107372)
-- Name: company_model fkbi9ejxksnhenrhmakevcimvuy; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company_model
    ADD CONSTRAINT fkbi9ejxksnhenrhmakevcimvuy FOREIGN KEY (region_id) REFERENCES public.address_model(id);


--
-- TOC entry 3173 (class 2606 OID 17068)
-- Name: geocode_route_model fkca669yruv7ruws4siohksjnjh; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.geocode_route_model
    ADD CONSTRAINT fkca669yruv7ruws4siohksjnjh FOREIGN KEY (end_point_id) REFERENCES public.geocode_point(id);


--
-- TOC entry 3151 (class 2606 OID 16938)
-- Name: cargo_item_proposed_cargos fkcicgb7v1frj1ci1b4w8xgi9ry; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_item_proposed_cargos
    ADD CONSTRAINT fkcicgb7v1frj1ci1b4w8xgi9ry FOREIGN KEY (cargo_item_id) REFERENCES public.cargo_item(id);


--
-- TOC entry 3214 (class 2606 OID 17338)
-- Name: transport_model_proposed_transports fkcws72pio3t1n88pxe843eyabv; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_model_proposed_transports
    ADD CONSTRAINT fkcws72pio3t1n88pxe843eyabv FOREIGN KEY (proposed_transports_id) REFERENCES public.proposed_transport(id);


--
-- TOC entry 3152 (class 2606 OID 16948)
-- Name: cargo_item_state_history fkcxhns4sh78d1y55h7k2avjv29; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_item_state_history
    ADD CONSTRAINT fkcxhns4sh78d1y55h7k2avjv29 FOREIGN KEY (cargo_item_id) REFERENCES public.cargo_item(id);


--
-- TOC entry 3184 (class 2606 OID 17108)
-- Name: person fkdgwnrb2bf8y8madaoji5xeyp2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT fkdgwnrb2bf8y8madaoji5xeyp2 FOREIGN KEY (company_id) REFERENCES public.company_model(id);


--
-- TOC entry 3133 (class 2606 OID 16833)
-- Name: cargo_carrier_transport_model fkdh9iap1htta9po0f7qnddjckd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_carrier_transport_model
    ADD CONSTRAINT fkdh9iap1htta9po0f7qnddjckd FOREIGN KEY (driver_id) REFERENCES public.driver_model(id);


--
-- TOC entry 3230 (class 2606 OID 123930)
-- Name: action_viewer_model_cargo_list fkdxnojcdn6yvy53h46trc8wbm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.action_viewer_model_cargo_list
    ADD CONSTRAINT fkdxnojcdn6yvy53h46trc8wbm FOREIGN KEY (action_viewer_model_id) REFERENCES public.action_viewer_model(id);


--
-- TOC entry 3134 (class 2606 OID 16843)
-- Name: cargo_carrier_transport_model fkdxykk73jjau7n5tydqtpo9640; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_carrier_transport_model
    ADD CONSTRAINT fkdxykk73jjau7n5tydqtpo9640 FOREIGN KEY (semitrailer_id) REFERENCES public.semitrailer_model(id);


--
-- TOC entry 3222 (class 2606 OID 82407)
-- Name: cargo_item_points fke06dc378cch9wbhkcpn2saa87; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_item_points
    ADD CONSTRAINT fke06dc378cch9wbhkcpn2saa87 FOREIGN KEY (cargo_item_id) REFERENCES public.cargo_item(id);


--
-- TOC entry 3223 (class 2606 OID 82412)
-- Name: geocode_route_model_all_points fke2yi5yiwe0yys1y8c23ammad8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.geocode_route_model_all_points
    ADD CONSTRAINT fke2yi5yiwe0yys1y8c23ammad8 FOREIGN KEY (all_points_id) REFERENCES public.geocode_point(id);


--
-- TOC entry 3141 (class 2606 OID 16888)
-- Name: cargo_item fke3gpucq4jmk1n3fqij31daf0d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_item
    ADD CONSTRAINT fke3gpucq4jmk1n3fqij31daf0d FOREIGN KEY (cargo_size_id) REFERENCES public.cargo_size(id);


--
-- TOC entry 3163 (class 2606 OID 17028)
-- Name: company_model_pool fke5ldrs9pr3ia1wlec5amxpt9t; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company_model_pool
    ADD CONSTRAINT fke5ldrs9pr3ia1wlec5amxpt9t FOREIGN KEY (company_model_id) REFERENCES public.company_model(id);


--
-- TOC entry 3238 (class 2606 OID 259791)
-- Name: whatsapp_info_settings_regions fke9wurhr3ubr1cfbra8k52lqwo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.whatsapp_info_settings_regions
    ADD CONSTRAINT fke9wurhr3ubr1cfbra8k52lqwo FOREIGN KEY (whatsapp_info_settings_id) REFERENCES public.whatsapp_info_settings(id);


--
-- TOC entry 3142 (class 2606 OID 16908)
-- Name: cargo_item fkejd3795o7nd396b4tahfchpfc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_item
    ADD CONSTRAINT fkejd3795o7nd396b4tahfchpfc FOREIGN KEY (route_id) REFERENCES public.geocode_route_model(id);


--
-- TOC entry 3199 (class 2606 OID 17243)
-- Name: tender_model fkexi3obb6lpvtcrrho2x1yej95; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tender_model
    ADD CONSTRAINT fkexi3obb6lpvtcrrho2x1yej95 FOREIGN KEY (company_id) REFERENCES public.company_model(id);


--
-- TOC entry 3189 (class 2606 OID 17163)
-- Name: proposed_cargo fkf51o4lbkiluwuswplkygq88iu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proposed_cargo
    ADD CONSTRAINT fkf51o4lbkiluwuswplkygq88iu FOREIGN KEY (company_id) REFERENCES public.company_model(id);


--
-- TOC entry 3235 (class 2606 OID 259781)
-- Name: sanction_history fkf80as1uls8u6ahrjc7ruh7fov; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sanction_history
    ADD CONSTRAINT fkf80as1uls8u6ahrjc7ruh7fov FOREIGN KEY (pool_id) REFERENCES public.pool_item_model(id);


--
-- TOC entry 3164 (class 2606 OID 17023)
-- Name: company_model_pool fkfah5l8e213oqkn9hhdthutxeu; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company_model_pool
    ADD CONSTRAINT fkfah5l8e213oqkn9hhdthutxeu FOREIGN KEY (pool_id) REFERENCES public.pool_item_model(id);


--
-- TOC entry 3197 (class 2606 OID 107382)
-- Name: stock_model fkg9go24sfwnur30o4rav3uouwy; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_model
    ADD CONSTRAINT fkg9go24sfwnur30o4rav3uouwy FOREIGN KEY (company_id) REFERENCES public.company_model(id);


--
-- TOC entry 3215 (class 2606 OID 17343)
-- Name: transport_model_proposed_transports fkgl039x2iy8vycngfi2i6qalwd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_model_proposed_transports
    ADD CONSTRAINT fkgl039x2iy8vycngfi2i6qalwd FOREIGN KEY (transport_model_id) REFERENCES public.transport_model(id);


--
-- TOC entry 3178 (class 2606 OID 17093)
-- Name: notification_model fkgm22wwnkrejmahs7ir34lh37v; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notification_model
    ADD CONSTRAINT fkgm22wwnkrejmahs7ir34lh37v FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3158 (class 2606 OID 17008)
-- Name: chat_model_messages fkgsnwq8q00slt4csqqs63earek; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_model_messages
    ADD CONSTRAINT fkgsnwq8q00slt4csqqs63earek FOREIGN KEY (chat_model_id) REFERENCES public.chat_model(id);


--
-- TOC entry 3209 (class 2606 OID 17318)
-- Name: transport_model fkgssmi3lwk9wcn9qhw6s6sego8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_model
    ADD CONSTRAINT fkgssmi3lwk9wcn9qhw6s6sego8 FOREIGN KEY (truck_id) REFERENCES public.truck_model(id);


--
-- TOC entry 3231 (class 2606 OID 164915)
-- Name: cargo_reject_history fkgwi5tja19l4t0byihuw12bwcg; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_reject_history
    ADD CONSTRAINT fkgwi5tja19l4t0byihuw12bwcg FOREIGN KEY (cargo_id) REFERENCES public.cargo_item(id);


--
-- TOC entry 3224 (class 2606 OID 82417)
-- Name: geocode_route_model_all_points fkgwuwlxkv83ncup9cqukuh9oo7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.geocode_route_model_all_points
    ADD CONSTRAINT fkgwuwlxkv83ncup9cqukuh9oo7 FOREIGN KEY (geocode_route_model_id) REFERENCES public.geocode_route_model(id);


--
-- TOC entry 3143 (class 2606 OID 16903)
-- Name: cargo_item fkh3c94x0o5c75m1yybn278tkwj; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_item
    ADD CONSTRAINT fkh3c94x0o5c75m1yybn278tkwj FOREIGN KEY (payment_id) REFERENCES public.cargo_pay_model(id);


--
-- TOC entry 3216 (class 2606 OID 17348)
-- Name: truck_model fkh59kawskpncguu34k13fjvvu7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.truck_model
    ADD CONSTRAINT fkh59kawskpncguu34k13fjvvu7 FOREIGN KEY (company_id) REFERENCES public.company_model(id);


--
-- TOC entry 3144 (class 2606 OID 16913)
-- Name: cargo_item fkhdmkh5gwi8psh94e0qoteutpr; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_item
    ADD CONSTRAINT fkhdmkh5gwi8psh94e0qoteutpr FOREIGN KEY (selected_carrier_id) REFERENCES public.company_model(id);


--
-- TOC entry 3193 (class 2606 OID 17193)
-- Name: rating_model fki69mxh0lkafhtixtlwehwqg08; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rating_model
    ADD CONSTRAINT fki69mxh0lkafhtixtlwehwqg08 FOREIGN KEY (company_id) REFERENCES public.company_model(id);


--
-- TOC entry 3154 (class 2606 OID 16958)
-- Name: cargo_loading_model fkimugmdwycgvxonnp9rrh3oanw; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_loading_model
    ADD CONSTRAINT fkimugmdwycgvxonnp9rrh3oanw FOREIGN KEY (time_window_id) REFERENCES public.cargo_time_window(id);


--
-- TOC entry 3159 (class 2606 OID 17003)
-- Name: chat_model_messages fkin517ktw1pqi9p3o9va5g698j; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_model_messages
    ADD CONSTRAINT fkin517ktw1pqi9p3o9va5g698j FOREIGN KEY (messages_id) REFERENCES public.message_model(id);


--
-- TOC entry 3171 (class 2606 OID 17063)
-- Name: driver_model fkjgvd7lkp8yx379u1yjddpvuo3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.driver_model
    ADD CONSTRAINT fkjgvd7lkp8yx379u1yjddpvuo3 FOREIGN KEY (residence_address_id) REFERENCES public.address_model(id);


--
-- TOC entry 3160 (class 2606 OID 17013)
-- Name: company_business_data fkji2f4l7bsqehqg7wyuuhhjnxk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company_business_data
    ADD CONSTRAINT fkji2f4l7bsqehqg7wyuuhhjnxk FOREIGN KEY (company_id) REFERENCES public.company_model(id);


--
-- TOC entry 3186 (class 2606 OID 17138)
-- Name: pool_item_model fkjvia65xtumikwaowceug55lfo; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pool_item_model
    ADD CONSTRAINT fkjvia65xtumikwaowceug55lfo FOREIGN KEY (shipper_id) REFERENCES public.company_model(id);


--
-- TOC entry 3192 (class 2606 OID 17178)
-- Name: proposed_transport fkk0bp8vyknvearmjc7s8qgw5nm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proposed_transport
    ADD CONSTRAINT fkk0bp8vyknvearmjc7s8qgw5nm FOREIGN KEY (company_id) REFERENCES public.company_model(id);


--
-- TOC entry 3210 (class 2606 OID 17313)
-- Name: transport_model fkkd6ysy7a0jxk4gw0fqbxoqcdn; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_model
    ADD CONSTRAINT fkkd6ysy7a0jxk4gw0fqbxoqcdn FOREIGN KEY (trailer_id) REFERENCES public.trailer_model(id);


--
-- TOC entry 3166 (class 2606 OID 17033)
-- Name: direction_model fkl2rucy3x4k1xkox2kn6wothgb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.direction_model
    ADD CONSTRAINT fkl2rucy3x4k1xkox2kn6wothgb FOREIGN KEY (loading_city_id) REFERENCES public.address_model(id);


--
-- TOC entry 3202 (class 2606 OID 17248)
-- Name: tender_request_model fkl8ayk1p3iak771mueeix86hxx; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tender_request_model
    ADD CONSTRAINT fkl8ayk1p3iak771mueeix86hxx FOREIGN KEY (company_id) REFERENCES public.company_model(id);


--
-- TOC entry 3219 (class 2606 OID 49443)
-- Name: subsidiary fkl9nudyxrf1mymn3hy4totw6gm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subsidiary
    ADD CONSTRAINT fkl9nudyxrf1mymn3hy4totw6gm FOREIGN KEY (company_id) REFERENCES public.company_model(id);


--
-- TOC entry 3236 (class 2606 OID 259786)
-- Name: whatsapp_info_settings fklc9o304ogpa6r42f0i3dw990x; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.whatsapp_info_settings
    ADD CONSTRAINT fklc9o304ogpa6r42f0i3dw990x FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3145 (class 2606 OID 16923)
-- Name: cargo_item fklca09n4l468li4m0npfcispu2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_item
    ADD CONSTRAINT fklca09n4l468li4m0npfcispu2 FOREIGN KEY (un_loading_info_id) REFERENCES public.cargo_loading_model(id);


--
-- TOC entry 3174 (class 2606 OID 17078)
-- Name: geocode_route_model_points fkm2ssqexow8jhvj9pxiveltcov; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.geocode_route_model_points
    ADD CONSTRAINT fkm2ssqexow8jhvj9pxiveltcov FOREIGN KEY (points_id) REFERENCES public.geocode_point(id);


--
-- TOC entry 3195 (class 2606 OID 17198)
-- Name: semitrailer_model fkm98no15wxywqua657x83odky4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.semitrailer_model
    ADD CONSTRAINT fkm98no15wxywqua657x83odky4 FOREIGN KEY (company_id) REFERENCES public.company_model(id);


--
-- TOC entry 3194 (class 2606 OID 17188)
-- Name: rating_model fkmgpd9kuv5leemm27ahrqauw9s; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rating_model
    ADD CONSTRAINT fkmgpd9kuv5leemm27ahrqauw9s FOREIGN KEY (cargo_id) REFERENCES public.cargo_item(id);


--
-- TOC entry 3153 (class 2606 OID 16943)
-- Name: cargo_item_state_history fkmjt8t9r9ia69b6v2263p2dm4h; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_item_state_history
    ADD CONSTRAINT fkmjt8t9r9ia69b6v2263p2dm4h FOREIGN KEY (state_history_id) REFERENCES public.cargo_history(id);


--
-- TOC entry 3135 (class 2606 OID 16858)
-- Name: cargo_carrier_transport_model fkmt3swripsm4o01iy1nghdriq8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_carrier_transport_model
    ADD CONSTRAINT fkmt3swripsm4o01iy1nghdriq8 FOREIGN KEY (trailer_id) REFERENCES public.trailer_model(id);


--
-- TOC entry 3175 (class 2606 OID 17083)
-- Name: geocode_route_model_points fkn57gdndjlucjqof4uoaoat2k2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.geocode_route_model_points
    ADD CONSTRAINT fkn57gdndjlucjqof4uoaoat2k2 FOREIGN KEY (geocode_route_model_id) REFERENCES public.geocode_route_model(id);


--
-- TOC entry 3146 (class 2606 OID 16873)
-- Name: cargo_item fkn5xhckyhcvu9tnefql5s9mtvx; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_item
    ADD CONSTRAINT fkn5xhckyhcvu9tnefql5s9mtvx FOREIGN KEY (company_id) REFERENCES public.company_model(id);


--
-- TOC entry 3200 (class 2606 OID 65958)
-- Name: tender_model fknexhakfst78a9utx1g91tw8g8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tender_model
    ADD CONSTRAINT fknexhakfst78a9utx1g91tw8g8 FOREIGN KEY (subsidiary_id) REFERENCES public.subsidiary(id);


--
-- TOC entry 3167 (class 2606 OID 17038)
-- Name: direction_model fknfi51aragbd816hjmbwvk9bvw; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.direction_model
    ADD CONSTRAINT fknfi51aragbd816hjmbwvk9bvw FOREIGN KEY (tender_id) REFERENCES public.tender_model(id);


--
-- TOC entry 3147 (class 2606 OID 16918)
-- Name: cargo_item fknj2sh0jw9xvjea42lrx14lqw2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_item
    ADD CONSTRAINT fknj2sh0jw9xvjea42lrx14lqw2 FOREIGN KEY (selected_proposed_transport_id) REFERENCES public.proposed_transport(id);


--
-- TOC entry 3203 (class 2606 OID 17258)
-- Name: tractor_model fko1kljnigcle6d6h6hd9tyipuf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tractor_model
    ADD CONSTRAINT fko1kljnigcle6d6h6hd9tyipuf FOREIGN KEY (company_id) REFERENCES public.company_model(id);


--
-- TOC entry 3229 (class 2606 OID 107377)
-- Name: company_model_body_type fkpsamto0o71us8lnv4q4t24kn2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.company_model_body_type
    ADD CONSTRAINT fkpsamto0o71us8lnv4q4t24kn2 FOREIGN KEY (company_model_id) REFERENCES public.company_model(id);


--
-- TOC entry 3157 (class 2606 OID 16993)
-- Name: chat_model fkpvusj9rwktbl86i297jxm9lqh; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.chat_model
    ADD CONSTRAINT fkpvusj9rwktbl86i297jxm9lqh FOREIGN KEY (first_person_id) REFERENCES public.person(id);


--
-- TOC entry 3213 (class 2606 OID 17328)
-- Name: transport_model_proposed_cargos fkpyuywpks6s9ekgink31cbq2q5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_model_proposed_cargos
    ADD CONSTRAINT fkpyuywpks6s9ekgink31cbq2q5 FOREIGN KEY (proposed_cargos_id) REFERENCES public.proposed_cargo(id);


--
-- TOC entry 3198 (class 2606 OID 107387)
-- Name: stock_model fkq3akfy4hn85xna2e8tkhkfeyq; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stock_model
    ADD CONSTRAINT fkq3akfy4hn85xna2e8tkhkfeyq FOREIGN KEY (time_window_id) REFERENCES public.cargo_time_window(id);


--
-- TOC entry 3168 (class 2606 OID 17048)
-- Name: direction_request_model fkq69qsggaakqy3sa71fhwd1n28; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.direction_request_model
    ADD CONSTRAINT fkq69qsggaakqy3sa71fhwd1n28 FOREIGN KEY (direction_id) REFERENCES public.direction_model(id);


--
-- TOC entry 3190 (class 2606 OID 17168)
-- Name: proposed_cargo fkrrakn99s1e6j72nl5eiuv41p4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proposed_cargo
    ADD CONSTRAINT fkrrakn99s1e6j72nl5eiuv41p4 FOREIGN KEY (cargo_id) REFERENCES public.cargo_item(id);


--
-- TOC entry 3169 (class 2606 OID 17053)
-- Name: direction_request_model fkrygthjdgw7uwmc76p4o024tca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.direction_request_model
    ADD CONSTRAINT fkrygthjdgw7uwmc76p4o024tca FOREIGN KEY (request_id) REFERENCES public.tender_request_model(id);


--
-- TOC entry 3187 (class 2606 OID 65953)
-- Name: pool_item_model fks0bx5ki9rsoxe1b7ov3fr2p59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pool_item_model
    ADD CONSTRAINT fks0bx5ki9rsoxe1b7ov3fr2p59 FOREIGN KEY (shipper_subsidiary_id) REFERENCES public.subsidiary(id);


--
-- TOC entry 3155 (class 2606 OID 16953)
-- Name: cargo_loading_model fks5r3g7yf146k2iuvgmdyuk5ed; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_loading_model
    ADD CONSTRAINT fks5r3g7yf146k2iuvgmdyuk5ed FOREIGN KEY (address_id) REFERENCES public.address_model(id);


--
-- TOC entry 3136 (class 2606 OID 16848)
-- Name: cargo_carrier_transport_model fksmj9v1a3ufygxjj6tvonawsxt; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_carrier_transport_model
    ADD CONSTRAINT fksmj9v1a3ufygxjj6tvonawsxt FOREIGN KEY (time_window_id) REFERENCES public.cargo_time_window(id);


--
-- TOC entry 3130 (class 2606 OID 16798)
-- Name: action_viewer_model fksqhm43a2lgkm2vcw080aredm6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.action_viewer_model
    ADD CONSTRAINT fksqhm43a2lgkm2vcw080aredm6 FOREIGN KEY (user_id) REFERENCES public.person(id);


--
-- TOC entry 3137 (class 2606 OID 16863)
-- Name: cargo_carrier_transport_model fkt3iixnadd8mfro2na31kwf08l; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_carrier_transport_model
    ADD CONSTRAINT fkt3iixnadd8mfro2na31kwf08l FOREIGN KEY (truck_id) REFERENCES public.truck_model(id);


--
-- TOC entry 3138 (class 2606 OID 16868)
-- Name: cargo_history fkt9ygihy40db7ieq73giqly7wy; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_history
    ADD CONSTRAINT fkt9ygihy40db7ieq73giqly7wy FOREIGN KEY (selected_carrier_id) REFERENCES public.company_model(id);


--
-- TOC entry 3148 (class 2606 OID 16878)
-- Name: cargo_item fktbsrdn9ut4j0cisue1mgvut3i; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo_item
    ADD CONSTRAINT fktbsrdn9ut4j0cisue1mgvut3i FOREIGN KEY (cargo_carrier_transport_id) REFERENCES public.cargo_carrier_transport_model(id);


--
-- TOC entry 3211 (class 2606 OID 17303)
-- Name: transport_model fktp85qmy12r7dx7vx5i8p79q4u; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.transport_model
    ADD CONSTRAINT fktp85qmy12r7dx7vx5i8p79q4u FOREIGN KEY (semitrailer_id) REFERENCES public.semitrailer_model(id);


--
-- TOC entry 3233 (class 2606 OID 198164)
-- Name: person_mailing_props mailing_props_to_person; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.person_mailing_props
    ADD CONSTRAINT mailing_props_to_person FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- TOC entry 3234 (class 2606 OID 207947)
-- Name: pool_item_model_reserved_cargo_names pool_item_model_to_reserved_cargo_names; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pool_item_model_reserved_cargo_names
    ADD CONSTRAINT pool_item_model_to_reserved_cargo_names FOREIGN KEY (pool_item_model_id) REFERENCES public.pool_item_model(id);


--
-- TOC entry 3217 (class 2606 OID 17384)
-- Name: spring_session_attributes spring_session_attributes_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.spring_session_attributes
    ADD CONSTRAINT spring_session_attributes_fk FOREIGN KEY (session_primary_id) REFERENCES public.spring_session(primary_id) ON DELETE CASCADE;


--
-- TOC entry 3237 (class 2606 OID 259773)
-- Name: whatsapp_info_settings_region whatsapp_info_settings_to_region; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.whatsapp_info_settings_region
    ADD CONSTRAINT whatsapp_info_settings_to_region FOREIGN KEY (whatsapp_info_settings_id) REFERENCES public.whatsapp_info_settings(id);


--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2022-11-17 10:21:26

--
-- PostgreSQL database dump complete
--

