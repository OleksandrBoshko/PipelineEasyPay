--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

-- Started on 2018-11-27 19:05:16

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2386 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 187 (class 1259 OID 174987)
-- Name: address_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE address_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE address_item_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 205 (class 1259 OID 175023)
-- Name: addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE addresses (
    id bigint NOT NULL,
    is_active boolean,
    lat double precision NOT NULL,
    lng double precision NOT NULL,
    city_id bigint,
    flat_id bigint,
    house_id bigint,
    region_id bigint,
    street_id bigint
);


ALTER TABLE addresses OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 175028)
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE city (
    id bigint NOT NULL,
    name character varying(255),
    region_id bigint
);


ALTER TABLE city OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 174989)
-- Name: city_sequence_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE city_sequence_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE city_sequence_item_id_seq OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 174991)
-- Name: counter_sequence_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE counter_sequence_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE counter_sequence_item_id_seq OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 175033)
-- Name: counters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE counters (
    id bigint NOT NULL,
    is_active boolean,
    current_value bigint,
    is_fixed boolean,
    last_updated date,
    old_value bigint,
    address_id bigint,
    debt_id bigint,
    user_id bigint
);


ALTER TABLE counters OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 174981)
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE databasechangelog (
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


ALTER TABLE databasechangelog OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 174976)
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE databasechangeloglock OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 174993)
-- Name: debt_sequence_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE debt_sequence_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE debt_sequence_item_id_seq OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 175038)
-- Name: debts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE debts (
    id bigint NOT NULL,
    last_counter_reminder_send date,
    last_debt_reminder_send date,
    last_paid date,
    value double precision,
    utility_id bigint
);


ALTER TABLE debts OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 175043)
-- Name: email_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE email_token (
    id bigint NOT NULL,
    token character varying(255) NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE email_token OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 175048)
-- Name: flat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE flat (
    id bigint NOT NULL,
    number character varying(255),
    house_id bigint
);


ALTER TABLE flat OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 174995)
-- Name: flat_sequence_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE flat_sequence_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE flat_sequence_item_id_seq OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 174997)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 175053)
-- Name: house; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE house (
    id bigint NOT NULL,
    number character varying(255),
    street_id bigint
);


ALTER TABLE house OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 174999)
-- Name: house_sequence_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE house_sequence_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE house_sequence_item_id_seq OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 175001)
-- Name: new_price_sequence_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE new_price_sequence_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE new_price_sequence_item_id_seq OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 175058)
-- Name: new_prices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE new_prices (
    new_price_id bigint NOT NULL,
    activation_date date NOT NULL,
    new_price double precision,
    current_price_id bigint NOT NULL
);


ALTER TABLE new_prices OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 175063)
-- Name: payments_histories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE payments_histories (
    id bigint NOT NULL,
    checkpath character varying(200),
    google_drive_file_id character varying(255),
    pay_date date NOT NULL,
    payment_sum double precision NOT NULL,
    address_id bigint NOT NULL,
    user_id bigint NOT NULL,
    utility_id bigint NOT NULL
);


ALTER TABLE payments_histories OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 175003)
-- Name: payments_history_sequence_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE payments_history_sequence_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE payments_history_sequence_item_id_seq OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 175005)
-- Name: price_sequence_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE price_sequence_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE price_sequence_item_id_seq OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 175068)
-- Name: prices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE prices (
    price_id bigint NOT NULL,
    active boolean,
    date date,
    price double precision,
    utility_id bigint
);


ALTER TABLE prices OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 175073)
-- Name: rating; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE rating (
    id bigint NOT NULL,
    rating double precision NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE rating OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 175007)
-- Name: rating_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rating_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rating_item_id_seq OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 175078)
-- Name: rating_list_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE rating_list_item (
    id bigint NOT NULL,
    rating_value double precision NOT NULL,
    user_id bigint NOT NULL,
    rater_user_id bigint NOT NULL
);


ALTER TABLE rating_list_item OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 175009)
-- Name: rating_list_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rating_list_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rating_list_item_id_seq OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 175083)
-- Name: region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE region (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE region OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 175011)
-- Name: region_sequence_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE region_sequence_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE region_sequence_item_id_seq OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 175088)
-- Name: schedule_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE schedule_history (
    id bigint NOT NULL,
    comment character varying(255),
    event_date date NOT NULL,
    status character varying(255),
    submit_date date NOT NULL,
    address_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE schedule_history OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 175096)
-- Name: schedules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE schedules (
    id bigint NOT NULL,
    event_date date NOT NULL,
    is_repeat boolean NOT NULL,
    address_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE schedules OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 175013)
-- Name: schedules_history_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE schedules_history_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schedules_history_item_id_seq OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 175015)
-- Name: schedules_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE schedules_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schedules_item_id_seq OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 175101)
-- Name: street; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE street (
    id bigint NOT NULL,
    name character varying(255),
    city_id bigint
);


ALTER TABLE street OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 175106)
-- Name: unscheduled_addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE unscheduled_addresses (
    id bigint NOT NULL,
    address_id bigint NOT NULL,
    utility_id bigint NOT NULL
);


ALTER TABLE unscheduled_addresses OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 175017)
-- Name: unscheduled_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE unscheduled_addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE unscheduled_addresses_id_seq OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 175111)
-- Name: user_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE user_address (
    user_id bigint NOT NULL,
    address_id bigint NOT NULL
);


ALTER TABLE user_address OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 175019)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_id_seq OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 175116)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    user_id bigint NOT NULL,
    stripecustomerid character varying(255),
    avatar character varying(255),
    email character varying(255),
    last_login date,
    name character varying(255),
    password character varying(255),
    phone_number character varying(255),
    role character varying(255),
    surname character varying(255),
    status character varying(255)
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 175124)
-- Name: utilities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE utilities (
    id bigint NOT NULL,
    is_active boolean,
    identification_code character varying(255),
    logo character varying(255),
    name character varying(50),
    phone character varying(255),
    web_site character varying(255),
    address_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE utilities OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 175132)
-- Name: utilities_counters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE utilities_counters (
    utility_id bigint NOT NULL,
    counter_id bigint NOT NULL
);


ALTER TABLE utilities_counters OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 175137)
-- Name: utilities_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE utilities_users (
    utility_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE utilities_users OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 175021)
-- Name: utility_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE utility_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE utility_item_id_seq OWNER TO postgres;

--
-- TOC entry 2387 (class 0 OID 0)
-- Dependencies: 187
-- Name: address_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('address_item_id_seq', 75, true);


--
-- TOC entry 2358 (class 0 OID 175023)
-- Dependencies: 205
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (1, true, 48.2690871, 25.924404099999947, 1, 1, 1, 1, 2);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (2, true, 48.025148000000002, 33.469425099999967, 3, 2, 2, 2, 4);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (3, true, 48.2708972, 25.953113400000007, 1, 3, 3, 1, 5);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (4, true, 48.293169499999998, 25.934576099999958, 1, 4, 4, 1, 6);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (5, true, 48.297532199999999, 25.936605999999983, 1, 5, 5, 1, 7);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (6, true, 48.295348099999998, 25.934265600000003, 1, 6, 6, 1, 8);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (7, true, 48.295746200000004, 25.93277850000004, 1, 7, 7, 1, 9);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (8, true, 48.292247599999989, 25.928941000000009, 1, 8, 8, 1, 10);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (9, true, 48.292825800000003, 25.934579600000006, 1, 9, 9, 1, 11);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (10, true, 48.2921671, 25.930448399999932, 1, 10, 10, 1, 12);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (11, true, 48.289922300000008, 25.929384600000049, 1, 11, 11, 1, 13);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (12, true, 48.289083000000012, 25.931894400000033, 1, 12, 12, 1, 14);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (13, true, 48.287550799999998, 25.930330000000026, 1, 13, 13, 1, 15);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (14, true, 48.287074999999987, 25.935322700000029, 1, 14, 14, 1, 16);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (15, true, 48.286315300000012, 25.94225890000007, 1, 15, 15, 1, 17);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (16, true, 48.288062099999998, 25.942760200000066, 1, 16, 16, 1, 18);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (17, true, 48.289479200000002, 25.943222200000037, 1, 17, 17, 1, 19);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (18, true, 48.285018000000001, 25.941299000000072, 1, 18, 18, 1, 20);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (19, true, 48.286411000000001, 25.94714010000007, 1, 19, 19, 1, 21);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (20, true, 48.286717900000014, 25.945527599999991, 1, 20, 20, 1, 22);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (21, true, 48.276790699999999, 25.928110999999944, 1, 21, 21, 1, 23);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (22, true, 48.273249399999997, 25.918623600000046, 1, 22, 22, 1, 24);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (23, true, 48.292853500000007, 25.882487500000025, 1, 23, 23, 1, 25);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (24, true, 48.274142899999987, 25.923390599999948, 1, 24, 24, 1, 26);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (25, true, 48.269552300000001, 25.922298500000011, 1, 25, 25, 1, 27);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (26, true, 48.2648169, 25.921831699999984, 1, 26, 26, 1, 28);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (27, true, 48.274748000000002, 25.908476199999996, 1, 27, 27, 1, 29);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (28, true, 48.270911899999987, 25.909399699999994, 1, 28, 28, 1, 30);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (29, true, 48.273966999999999, 25.918696700000055, 1, 29, 29, 1, 31);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (30, true, 48.319228300000013, 25.937909900000022, 1, 30, 30, 1, 32);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (31, true, 48.273651399999999, 25.903132000000028, 1, 31, 31, 1, 33);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (32, true, 48.269014100000007, 25.892609399999969, 1, 32, 32, 1, 34);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (33, true, 48.274174599999988, 25.901473300000021, 1, 33, 33, 1, 35);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (34, true, 48.2810129, 25.90351140000007, 1, 34, 34, 1, 36);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (35, true, 48.286926999999999, 25.89313889999994, 1, 35, 35, 1, 25);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (36, true, 48.285761299999997, 25.925108000000023, 1, 36, 36, 1, 37);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (37, true, 48.2855609, 25.890957100000037, 1, 37, 37, 1, 38);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (38, true, 48.267313299999998, 25.991444999999999, 1, 38, 38, 1, 39);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (39, true, 48.277454000000013, 25.98526430000004, 1, 39, 39, 1, 40);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (40, true, 48.277197600000001, 25.986151199999995, 1, 40, 40, 1, 40);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (41, true, 48.27131, 25.997746000000006, 1, 41, 41, 1, 40);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (42, true, 48.272287499999997, 25.956730900000025, 1, 42, 42, 1, 5);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (43, true, 48.278668499999988, 25.994582100000002, 1, 43, 43, 1, 41);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (44, true, 48.282086600000007, 25.993894599999976, 1, 44, 44, 1, 42);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (45, true, 48.283595400000003, 25.99372859999994, 1, 45, 45, 1, 43);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (46, true, 48.279629800000002, 25.988621700000067, 1, 46, 46, 1, 44);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (47, true, 48.273508399999997, 25.982285400000023, 1, 47, 47, 1, 45);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (48, true, 48.2774912, 26.003448599999956, 1, 48, 48, 1, 46);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (49, true, 48.275241000000008, 26.003593099999989, 1, 49, 49, 1, 47);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (50, true, 48.273760699999997, 26.006154700000025, 1, 50, 50, 1, 48);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (51, true, 48.284370600000003, 26.002123399999959, 1, 51, 51, 1, 49);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (52, true, 48.286458799999998, 25.992062400000009, 1, 52, 52, 1, 50);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (53, true, 48.286969999999997, 25.986776299999974, 1, 53, 53, 1, 51);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (54, true, 48.285572299999998, 25.913932799999998, 1, 54, 54, 1, 52);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (55, true, 48.285572299999998, 25.913932799999998, 1, 55, 55, 1, 52);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (56, true, 48.287511299999998, 25.920411699999931, 1, 56, 56, 1, 52);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (57, true, 48.288145399999998, 25.913368699999978, 1, 57, 57, 1, 53);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (58, true, 48.293660199999998, 25.900499599999989, 1, 58, 58, 1, 54);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (59, true, 48.295296, 25.911281400000007, 1, 59, 59, 1, 55);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (60, true, 48.294160699999999, 25.918698100000029, 1, 60, 60, 1, 56);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (61, true, 48.297653500000003, 25.910110700000018, 1, 61, 61, 1, 57);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (62, true, 48.294730999999999, 25.886551499999996, 1, 62, 62, 1, 58);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (63, true, 48.295062899999998, 25.889418400000068, 1, 63, 63, 1, 59);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (64, true, 48.296506899999997, 25.886763599999995, 1, 64, 64, 1, 60);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (65, true, 48.296917800000003, 25.884620100000006, 1, 65, 65, 1, 61);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (66, true, 48.295029000000007, 25.882172800000035, 1, 66, 66, 1, 62);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (67, true, 48.290248499999997, 25.88719500000002, 1, 67, 67, 1, 63);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (68, true, 48.291910799999997, 25.893441700000039, 1, 68, 68, 1, 64);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (69, true, 48.297055299999997, 25.902250399999957, 1, 69, 69, 1, 65);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (70, true, 48.299855999999998, 25.900926799999979, 1, 70, 70, 1, 66);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (71, true, 48.3004526, 25.903225600000042, 1, 71, 71, 1, 67);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (72, true, 37.421999900000003, -122.08405749999997, 68, 72, 72, 3, 69);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (73, true, 48.2690871, 25.924404099999947, 70, 73, 73, 4, 71);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (74, true, 48.283568199999991, 25.938629699999979, 70, 74, 74, 4, 72);
INSERT INTO addresses (id, is_active, lat, lng, city_id, flat_id, house_id, region_id, street_id) VALUES (75, true, 48.260925899999997, 25.954262599999993, 70, 75, 75, 4, 72);


--
-- TOC entry 2359 (class 0 OID 175028)
-- Dependencies: 206
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO city (id, name, region_id) VALUES (1, 'Чернівці', 1);
INSERT INTO city (id, name, region_id) VALUES (3, 'Кривий Ріг', 2);
INSERT INTO city (id, name, region_id) VALUES (68, 'Mountain View', 3);
INSERT INTO city (id, name, region_id) VALUES (70, 'Chernivtsi', 4);


--
-- TOC entry 2388 (class 0 OID 0)
-- Dependencies: 188
-- Name: city_sequence_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('city_sequence_item_id_seq', 72, true);


--
-- TOC entry 2389 (class 0 OID 0)
-- Dependencies: 189
-- Name: counter_sequence_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('counter_sequence_item_id_seq', 281, true);


--
-- TOC entry 2360 (class 0 OID 175033)
-- Dependencies: 207
-- Data for Name: counters; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (80, true, 1, false, NULL, 1, 36, 37, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (276, true, 1, false, NULL, 1, 70, 135, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (277, true, 1, false, NULL, 1, 70, 135, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (278, true, 1, false, NULL, 1, 71, 136, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (279, true, 1, false, NULL, 1, 71, 136, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (272, true, 1, false, NULL, 1, 68, 133, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (273, true, 1, false, NULL, 1, 68, 133, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (274, true, 1, false, NULL, 1, 69, 134, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (275, true, 1, false, NULL, 1, 69, 134, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (268, true, 1, false, NULL, 1, 66, 131, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (269, true, 1, false, NULL, 1, 66, 131, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (270, true, 1, false, NULL, 1, 67, 132, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (271, true, 1, false, NULL, 1, 67, 132, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (264, true, 1, false, NULL, 1, 64, 129, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (265, true, 1, false, NULL, 1, 64, 129, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (266, true, 1, false, NULL, 1, 65, 130, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (267, true, 1, false, NULL, 1, 65, 130, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (260, true, 1, false, NULL, 1, 62, 127, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (261, true, 1, false, NULL, 1, 62, 127, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (262, true, 1, false, NULL, 1, 63, 128, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (263, true, 1, false, NULL, 1, 63, 128, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (256, true, 1, false, NULL, 1, 60, 125, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (257, true, 1, false, NULL, 1, 60, 125, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (258, true, 1, false, NULL, 1, 61, 126, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (259, true, 1, false, NULL, 1, 61, 126, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (92, true, 1, false, NULL, 1, 33, 43, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (93, true, 1, false, NULL, 1, 33, 43, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (94, true, 1, false, NULL, 1, 33, 44, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (95, true, 1, false, NULL, 1, 33, 44, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (88, true, 1, false, NULL, 1, 34, 41, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (89, true, 1, false, NULL, 1, 34, 41, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (90, true, 1, false, NULL, 1, 34, 42, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (91, true, 1, false, NULL, 1, 34, 42, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (84, true, 1, false, NULL, 1, 35, 39, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (85, true, 1, false, NULL, 1, 35, 39, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (86, true, 1, false, NULL, 1, 35, 40, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (87, true, 1, false, NULL, 1, 35, 40, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (81, true, 1, false, NULL, 1, 36, 37, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (82, true, 1, false, NULL, 1, 36, 38, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (83, true, 1, false, NULL, 1, 36, 38, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (76, true, 1, false, NULL, 1, 37, 35, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (77, true, 1, false, NULL, 1, 37, 35, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (78, true, 1, false, NULL, 1, 37, 36, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (79, true, 1, false, NULL, 1, 37, 36, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (72, true, 1, false, NULL, 1, 20, 33, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (73, true, 1, false, NULL, 1, 20, 33, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (74, true, 1, false, NULL, 1, 20, 34, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (75, true, 1, false, NULL, 1, 20, 34, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (68, true, 1, false, NULL, 1, 19, 31, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (69, true, 1, false, NULL, 1, 19, 31, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (70, true, 1, false, NULL, 1, 19, 32, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (71, true, 1, false, NULL, 1, 19, 32, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (64, true, 1, false, NULL, 1, 18, 29, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (66, true, 1, false, NULL, 1, 18, 30, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (67, true, 1, false, NULL, 1, 18, 30, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (124, true, 1, false, NULL, 1, 25, 59, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (125, true, 1, false, NULL, 1, 25, 59, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (126, true, 1, false, NULL, 1, 25, 60, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (127, true, 1, false, NULL, 1, 25, 60, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (120, true, 1, false, NULL, 1, 26, 57, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (121, true, 1, false, NULL, 1, 26, 57, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (122, true, 1, false, NULL, 1, 26, 58, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (123, true, 1, false, NULL, 1, 26, 58, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (116, true, 1, false, NULL, 1, 27, 55, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (117, true, 1, false, NULL, 1, 27, 55, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (118, true, 1, false, NULL, 1, 27, 56, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (119, true, 1, false, NULL, 1, 27, 56, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (112, true, 1, false, NULL, 1, 28, 53, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (113, true, 1, false, NULL, 1, 28, 53, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (114, true, 1, false, NULL, 1, 28, 54, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (115, true, 1, false, NULL, 1, 28, 54, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (108, true, 1, false, NULL, 1, 29, 51, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (109, true, 1, false, NULL, 1, 29, 51, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (110, true, 1, false, NULL, 1, 29, 52, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (111, true, 1, false, NULL, 1, 29, 52, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (104, true, 1, false, NULL, 1, 30, 49, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (105, true, 1, false, NULL, 1, 30, 49, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (106, true, 1, false, NULL, 1, 30, 50, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (107, true, 1, false, NULL, 1, 30, 50, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (65, true, 5, false, '2018-09-05', 1, 18, 29, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (100, true, 1, false, NULL, 1, 31, 47, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (101, true, 1, false, NULL, 1, 31, 47, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (102, true, 1, false, NULL, 1, 31, 48, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (103, true, 1, false, NULL, 1, 31, 48, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (96, true, 1, false, NULL, 1, 32, 45, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (97, true, 1, false, NULL, 1, 32, 45, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (98, true, 1, false, NULL, 1, 32, 46, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (99, true, 1, false, NULL, 1, 32, 46, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (28, true, 1, false, NULL, 1, 9, 11, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (29, true, 1, false, NULL, 1, 9, 11, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (30, true, 1, false, NULL, 1, 9, 12, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (31, true, 1, false, NULL, 1, 9, 12, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (24, true, 1, false, NULL, 1, 8, 9, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (25, true, 1, false, NULL, 1, 8, 9, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (26, true, 1, false, NULL, 1, 8, 10, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (27, true, 1, false, NULL, 1, 8, 10, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (20, true, 1, false, NULL, 1, 7, 7, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (21, true, 1, false, NULL, 1, 7, 7, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (22, true, 1, false, NULL, 1, 7, 8, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (23, true, 1, false, NULL, 1, 7, 8, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (16, true, 1, false, NULL, 1, 6, 5, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (17, true, 1, false, NULL, 1, 6, 5, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (18, true, 1, false, NULL, 1, 6, 6, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (19, true, 1, false, NULL, 1, 6, 6, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (12, true, 1, false, NULL, 1, 5, 3, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (13, true, 1, false, NULL, 1, 5, 3, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (14, true, 1, false, NULL, 1, 5, 4, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (15, true, 1, false, NULL, 1, 5, 4, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (8, true, 1, false, NULL, 1, 6, 5, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (9, true, 1, false, NULL, 1, 5, 3, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (10, true, 1, false, NULL, 1, 5, 3, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (11, true, 1, false, NULL, 1, 5, 3, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (4, true, 1, false, NULL, 1, 4, 2, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (5, true, 1, false, NULL, 1, 5, 3, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (6, true, 1, false, NULL, 1, 5, 4, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (7, true, 1, false, NULL, 1, 6, 5, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (1, true, 1, false, NULL, 1, 4, 1, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (3, true, 1, false, NULL, 1, 4, 2, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (60, true, 1, false, NULL, 1, 17, 27, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (61, true, 1, false, NULL, 1, 17, 27, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (62, true, 1, false, NULL, 1, 17, 28, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (63, true, 1, false, NULL, 1, 17, 28, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (56, true, 1, false, NULL, 1, 16, 25, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (57, true, 1, false, NULL, 1, 16, 25, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (58, true, 1, false, NULL, 1, 16, 26, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (59, true, 1, false, NULL, 1, 16, 26, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (52, true, 1, false, NULL, 1, 15, 23, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (53, true, 1, false, NULL, 1, 15, 23, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (54, true, 1, false, NULL, 1, 15, 24, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (55, true, 1, false, NULL, 1, 15, 24, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (48, true, 1, false, NULL, 1, 14, 21, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (49, true, 1, false, NULL, 1, 14, 21, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (50, true, 1, false, NULL, 1, 14, 22, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (51, true, 1, false, NULL, 1, 14, 22, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (44, true, 1, false, NULL, 1, 13, 19, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (45, true, 1, false, NULL, 1, 13, 19, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (46, true, 1, false, NULL, 1, 13, 20, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (47, true, 1, false, NULL, 1, 13, 20, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (40, true, 1, false, NULL, 1, 12, 17, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (41, true, 1, false, NULL, 1, 12, 17, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (42, true, 1, false, NULL, 1, 12, 18, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (43, true, 1, false, NULL, 1, 12, 18, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (36, true, 1, false, NULL, 1, 11, 15, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (38, true, 1, false, NULL, 1, 11, 16, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (39, true, 1, false, NULL, 1, 11, 16, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (32, true, 1, false, NULL, 1, 10, 13, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (33, true, 1, false, NULL, 1, 10, 13, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (34, true, 1, false, NULL, 1, 10, 14, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (35, true, 1, false, NULL, 1, 10, 14, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (220, true, 1, false, NULL, 1, 60, 107, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (221, true, 1, false, NULL, 1, 60, 107, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (222, true, 1, false, NULL, 1, 61, 108, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (223, true, 1, false, NULL, 1, 61, 108, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (216, true, 1, false, NULL, 1, 58, 105, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (217, true, 1, false, NULL, 1, 58, 105, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (218, true, 1, false, NULL, 1, 59, 106, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (219, true, 1, false, NULL, 1, 59, 106, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (212, true, 1, false, NULL, 1, 56, 103, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (213, true, 1, false, NULL, 1, 56, 103, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (214, true, 1, false, NULL, 1, 57, 104, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (215, true, 1, false, NULL, 1, 57, 104, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (208, true, 1, false, NULL, 1, 54, 101, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (209, true, 1, false, NULL, 1, 54, 101, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (210, true, 1, false, NULL, 1, 55, 102, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (211, true, 1, false, NULL, 1, 55, 102, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (204, true, 1, false, NULL, 1, 52, 99, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (205, true, 1, false, NULL, 1, 52, 99, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (206, true, 1, false, NULL, 1, 53, 100, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (207, true, 1, false, NULL, 1, 53, 100, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (200, true, 1, false, NULL, 1, 50, 97, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (201, true, 1, false, NULL, 1, 50, 97, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (202, true, 1, false, NULL, 1, 51, 98, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (203, true, 1, false, NULL, 1, 51, 98, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (196, true, 1, false, NULL, 1, 52, 95, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (197, true, 1, false, NULL, 1, 52, 95, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (198, true, 1, false, NULL, 1, 53, 96, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (199, true, 1, false, NULL, 1, 53, 96, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (192, true, 1, false, NULL, 1, 50, 93, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (193, true, 1, false, NULL, 1, 50, 93, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (194, true, 1, false, NULL, 1, 51, 94, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (195, true, 1, false, NULL, 1, 51, 94, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (252, true, 1, false, NULL, 1, 58, 123, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (253, true, 1, false, NULL, 1, 58, 123, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (254, true, 1, false, NULL, 1, 59, 124, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (255, true, 1, false, NULL, 1, 59, 124, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (248, true, 1, false, NULL, 1, 56, 121, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (249, true, 1, false, NULL, 1, 56, 121, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (250, true, 1, false, NULL, 1, 57, 122, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (251, true, 1, false, NULL, 1, 57, 122, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (244, true, 1, false, NULL, 1, 54, 119, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (245, true, 1, false, NULL, 1, 54, 119, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (246, true, 1, false, NULL, 1, 55, 120, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (247, true, 1, false, NULL, 1, 55, 120, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (240, true, 1, false, NULL, 1, 70, 117, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (241, true, 1, false, NULL, 1, 70, 117, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (242, true, 1, false, NULL, 1, 71, 118, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (243, true, 1, false, NULL, 1, 71, 118, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (236, true, 1, false, NULL, 1, 68, 115, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (237, true, 1, false, NULL, 1, 68, 115, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (238, true, 1, false, NULL, 1, 69, 116, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (239, true, 1, false, NULL, 1, 69, 116, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (232, true, 1, false, NULL, 1, 66, 113, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (233, true, 1, false, NULL, 1, 66, 113, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (234, true, 1, false, NULL, 1, 67, 114, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (235, true, 1, false, NULL, 1, 67, 114, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (228, true, 1, false, NULL, 1, 64, 111, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (229, true, 1, false, NULL, 1, 64, 111, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (230, true, 1, false, NULL, 1, 65, 112, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (231, true, 1, false, NULL, 1, 65, 112, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (224, true, 1, false, NULL, 1, 62, 109, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (225, true, 1, false, NULL, 1, 62, 109, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (226, true, 1, false, NULL, 1, 63, 110, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (227, true, 1, false, NULL, 1, 63, 110, 104);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (156, true, 1, false, NULL, 1, 41, 75, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (157, true, 1, false, NULL, 1, 41, 75, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (158, true, 1, false, NULL, 1, 41, 76, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (159, true, 1, false, NULL, 1, 41, 76, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (152, true, 1, false, NULL, 1, 40, 73, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (153, true, 1, false, NULL, 1, 40, 73, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (154, true, 1, false, NULL, 1, 40, 74, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (155, true, 1, false, NULL, 1, 40, 74, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (148, true, 1, false, NULL, 1, 39, 71, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (149, true, 1, false, NULL, 1, 39, 71, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (150, true, 1, false, NULL, 1, 39, 72, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (151, true, 1, false, NULL, 1, 39, 72, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (144, true, 1, false, NULL, 1, 38, 69, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (145, true, 1, false, NULL, 1, 38, 69, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (146, true, 1, false, NULL, 1, 38, 70, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (147, true, 1, false, NULL, 1, 38, 70, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (140, true, 1, false, NULL, 1, 21, 67, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (141, true, 1, false, NULL, 1, 21, 67, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (142, true, 1, false, NULL, 1, 21, 68, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (143, true, 1, false, NULL, 1, 21, 68, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (136, true, 1, false, NULL, 1, 22, 65, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (137, true, 1, false, NULL, 1, 22, 65, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (138, true, 1, false, NULL, 1, 22, 66, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (139, true, 1, false, NULL, 1, 22, 66, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (132, true, 1, false, NULL, 1, 23, 63, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (133, true, 1, false, NULL, 1, 23, 63, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (134, true, 1, false, NULL, 1, 23, 64, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (135, true, 1, false, NULL, 1, 23, 64, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (128, true, 1, false, NULL, 1, 24, 61, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (129, true, 1, false, NULL, 1, 24, 61, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (130, true, 1, false, NULL, 1, 24, 62, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (131, true, 1, false, NULL, 1, 24, 62, 102);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (188, true, 1, false, NULL, 1, 49, 91, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (189, true, 1, false, NULL, 1, 49, 91, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (190, true, 1, false, NULL, 1, 49, 92, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (191, true, 1, false, NULL, 1, 49, 92, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (184, true, 1, false, NULL, 1, 48, 89, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (185, true, 1, false, NULL, 1, 48, 89, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (186, true, 1, false, NULL, 1, 48, 90, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (187, true, 1, false, NULL, 1, 48, 90, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (180, true, 1, false, NULL, 1, 46, 87, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (181, true, 1, false, NULL, 1, 46, 87, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (182, true, 1, false, NULL, 1, 47, 88, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (183, true, 1, false, NULL, 1, 47, 88, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (176, true, 1, false, NULL, 1, 46, 85, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (177, true, 1, false, NULL, 1, 46, 85, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (178, true, 1, false, NULL, 1, 47, 86, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (179, true, 1, false, NULL, 1, 47, 86, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (172, true, 1, false, NULL, 1, 45, 83, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (173, true, 1, false, NULL, 1, 45, 83, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (174, true, 1, false, NULL, 1, 45, 84, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (175, true, 1, false, NULL, 1, 45, 84, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (168, true, 1, false, NULL, 1, 44, 81, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (169, true, 1, false, NULL, 1, 44, 81, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (170, true, 1, false, NULL, 1, 44, 82, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (171, true, 1, false, NULL, 1, 44, 82, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (164, true, 1, false, NULL, 1, 43, 79, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (165, true, 1, false, NULL, 1, 43, 79, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (166, true, 1, false, NULL, 1, 43, 80, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (167, true, 1, false, NULL, 1, 43, 80, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (160, true, 1, false, NULL, 1, 42, 77, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (161, true, 1, false, NULL, 1, 42, 77, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (162, true, 1, false, NULL, 1, 42, 78, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (163, true, 1, false, NULL, 1, 42, 78, 103);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (2, true, 1, false, '2018-09-05', 1, 4, 1, 101);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (280, true, 0, true, NULL, 0, 74, 137, 6);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (281, true, 0, true, NULL, 0, 74, 137, 6);
INSERT INTO counters (id, is_active, current_value, is_fixed, last_updated, old_value, address_id, debt_id, user_id) VALUES (37, true, 25, false, '2018-09-05', 25, 11, 15, 101);


--
-- TOC entry 2339 (class 0 OID 174981)
-- Dependencies: 186
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-1', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:00.939852', 1, 'EXECUTED', '8:65d7ca90a96a3c86fa876613b67119cc', 'createSequence sequenceName=address_item_id_seq', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-2', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:00.949931', 2, 'EXECUTED', '8:46dee61c2fb5918312cbc8c51a5db007', 'createSequence sequenceName=city_sequence_item_id_seq', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-3', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:00.954751', 3, 'EXECUTED', '8:1b9b44f38af2360997c227d8ce668c52', 'createSequence sequenceName=counter_sequence_item_id_seq', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-4', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:00.958594', 4, 'EXECUTED', '8:3bef19fa1d14259793d0f8114f07d20e', 'createSequence sequenceName=debt_sequence_item_id_seq', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-5', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:00.962414', 5, 'EXECUTED', '8:04832ad94b21d478975d4741bc27ad95', 'createSequence sequenceName=flat_sequence_item_id_seq', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-6', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:00.966057', 6, 'EXECUTED', '8:9df4ee4464a4a10dfcf2717c73a52620', 'createSequence sequenceName=hibernate_sequence', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-7', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:00.969992', 7, 'EXECUTED', '8:d226f6dc145d95be78a0b34df58005b6', 'createSequence sequenceName=house_sequence_item_id_seq', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-8', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:00.973564', 8, 'EXECUTED', '8:72e63257c85b021f69c57a7d011011a5', 'createSequence sequenceName=new_price_sequence_item_id_seq', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-9', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:00.977527', 9, 'EXECUTED', '8:4721ac21ffc6d6c64e4f030cbef66448', 'createSequence sequenceName=payments_history_sequence_item_id_seq', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-10', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:00.980875', 10, 'EXECUTED', '8:c2df7e0209eef0e83de77da7068b8f12', 'createSequence sequenceName=price_sequence_item_id_seq', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-11', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:00.984531', 11, 'EXECUTED', '8:5371d35b68bb0231e2416d2e27a5aa6f', 'createSequence sequenceName=rating_item_id_seq', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-12', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:00.98796', 12, 'EXECUTED', '8:c738e1046e1d61778fed37a45ba791bc', 'createSequence sequenceName=rating_list_item_id_seq', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-13', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:00.991394', 13, 'EXECUTED', '8:4adc42d8732057a0f4c597eb5ba36ff7', 'createSequence sequenceName=region_sequence_item_id_seq', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-14', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:00.994951', 14, 'EXECUTED', '8:f083f2cc102f5c43ea38b170bcb5f37f', 'createSequence sequenceName=schedules_history_item_id_seq', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-15', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:00.999261', 15, 'EXECUTED', '8:7e689b0a5cde1e980d36616e69a51215', 'createSequence sequenceName=schedules_item_id_seq', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-16', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.004066', 16, 'EXECUTED', '8:a25bff5ae18e9d91af13ba2e2cb671df', 'createSequence sequenceName=unscheduled_addresses_id_seq', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-17', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.008007', 17, 'EXECUTED', '8:1d9f716724c1e9c143d73801a61ed525', 'createSequence sequenceName=user_id_seq', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-18', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.011584', 18, 'EXECUTED', '8:eb7738f7a674d1ee7a7a3beda2e4331a', 'createSequence sequenceName=utility_item_id_seq', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-19', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.019262', 19, 'EXECUTED', '8:35df546ffaddc227c77d4959c21f7f31', 'createTable tableName=addresses', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-20', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.025878', 20, 'EXECUTED', '8:0ca92e027a7066fa2f450bc57b852e52', 'createTable tableName=city', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-21', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.037679', 21, 'EXECUTED', '8:a28433529786746076f6325492d720d2', 'createTable tableName=counters', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-22', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.04397', 22, 'EXECUTED', '8:240aa37bc6911bf066d85dc0769edc1b', 'createTable tableName=debts', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-23', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.050906', 23, 'EXECUTED', '8:d960ffa196e950ee6c1d6077784908b2', 'createTable tableName=email_token', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-24', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.057495', 24, 'EXECUTED', '8:a25ec48b418ee0a3475d66594bda6efc', 'createTable tableName=flat', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-25', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.065764', 25, 'EXECUTED', '8:0fd97508165a4fac06c7b7c7a2e1f689', 'createTable tableName=house', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-26', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.07355', 26, 'EXECUTED', '8:3d40ba2e620852069e4637f9c9f0bdab', 'createTable tableName=new_prices', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-27', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.08064', 27, 'EXECUTED', '8:44737dbdbbd3e9c3bedce2655213a510', 'createTable tableName=payments_histories', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-28', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.08884', 28, 'EXECUTED', '8:f248ed32b6b57b7a45cba2dc1ff18091', 'createTable tableName=prices', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-29', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.096701', 29, 'EXECUTED', '8:69fff3a7ab667919a344004fb5d1229e', 'createTable tableName=rating', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-30', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.104288', 30, 'EXECUTED', '8:141128f8cd019716227c45053565b683', 'createTable tableName=rating_list_item', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-31', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.11109', 31, 'EXECUTED', '8:7afdd5f1045f51027ed1504071b41281', 'createTable tableName=region', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-32', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.125112', 32, 'EXECUTED', '8:fb6a4b41b1c2f442dd2dbb06cafc03c7', 'createTable tableName=schedule_history', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-33', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.132326', 33, 'EXECUTED', '8:b5738333cbbac21e4d4f8a5fa405af9d', 'createTable tableName=schedules', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-34', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.138628', 34, 'EXECUTED', '8:60124749ca78272e892fa33f28ca6d47', 'createTable tableName=street', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-35', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.146231', 35, 'EXECUTED', '8:5c108861bb986f8006704d72bf80b533', 'createTable tableName=unscheduled_addresses', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-36', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.156697', 36, 'EXECUTED', '8:dfdf3a638b0ff50d2077f98c4f88f028', 'createTable tableName=user_address', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-37', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.170869', 37, 'EXECUTED', '8:a13cad0389a7c9cdac9283cd67ecc4d7', 'createTable tableName=users', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-38', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.192528', 38, 'EXECUTED', '8:21ff58f151e907ba38250c9be24a65e4', 'createTable tableName=utilities', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-39', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.201376', 39, 'EXECUTED', '8:b4ec429ea07bd46d215410b19be4162d', 'createTable tableName=utilities_counters', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-40', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.2059', 40, 'EXECUTED', '8:2cf1230550b35654c641f7f47ffff907', 'createTable tableName=utilities_users', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-41', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.213605', 41, 'EXECUTED', '8:c39d8027a737a5769e850693b2a1bcc4', 'addUniqueConstraint constraintName=uk_668u0bx7e9egiitqc9qb81f2m, tableName=email_token', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-42', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.22013', 42, 'EXECUTED', '8:930ca191405d374f276f19715b20d1b7', 'addUniqueConstraint constraintName=uk_6dotkott2kjsp8vw4d0m25fb7, tableName=users', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-43', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.22655', 43, 'EXECUTED', '8:2093714c99965008057c026f80cb06f0', 'addUniqueConstraint constraintName=uk_8dfu35xwik8uwlrdloci4ok2i, tableName=rating', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-44', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.232456', 44, 'EXECUTED', '8:10075bf55eef40f63336d18aab7dd820', 'addUniqueConstraint constraintName=uk_fgmup9aa43riapctj438a4496, tableName=utilities_counters', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-45', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.23805', 45, 'EXECUTED', '8:e2c73b6c3d7cc84f25a5e7f07b055ac2', 'addUniqueConstraint constraintName=uk_ln32yb3toibbu0u8dhy2y53s4, tableName=utilities_users', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-46', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.246003', 46, 'EXECUTED', '8:5fd75eed79a7656e3079bbdd7f0621ba', 'addForeignKeyConstraint baseTableName=utilities_counters, constraintName=fk1807atc0qcnw4yovwh8d72obe, referencedTableName=counters', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-47', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.250416', 47, 'EXECUTED', '8:9e190e71020ac5239e97900d2b31ce52', 'addForeignKeyConstraint baseTableName=utilities, constraintName=fk1s0qikif4q73e9ymphj9cep4p, referencedTableName=addresses', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-48', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.255013', 48, 'EXECUTED', '8:a19849f0cb146fc5ce2f70ce8ee1bb87', 'addForeignKeyConstraint baseTableName=payments_histories, constraintName=fk2lx5m7ip5f9y5nq96ergaj44y, referencedTableName=users', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-49', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.259101', 49, 'EXECUTED', '8:9f6e1ab0440502993bf8c66b7597426a', 'addForeignKeyConstraint baseTableName=city, constraintName=fk3rysom5kikyjkau1g51atih4h, referencedTableName=region', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-50', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.264009', 50, 'EXECUTED', '8:b7236c3c5f946d18223b4278735dff42', 'addForeignKeyConstraint baseTableName=schedule_history, constraintName=fk3va03xy5c6s0k6a5phv6f92ex, referencedTableName=users', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-51', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.268244', 51, 'EXECUTED', '8:1df9f663e88157faf6acc229cb8ee1ab', 'addForeignKeyConstraint baseTableName=addresses, constraintName=fk4rstcb49bt870l35ywo8f9e9j, referencedTableName=city', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-52', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.271464', 52, 'EXECUTED', '8:1b13c10e035c2b066433ec8f790a1083', 'addForeignKeyConstraint baseTableName=counters, constraintName=fk5flcne9xrqwg51vt6o2mdwe5w, referencedTableName=users', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-53', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.275596', 53, 'EXECUTED', '8:83bae4b3c2b19a0c0c69f0131981d3b8', 'addForeignKeyConstraint baseTableName=counters, constraintName=fk7b2k5pjmx35h699d3bnsrts9p, referencedTableName=debts', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-54', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.279502', 54, 'EXECUTED', '8:b66ab3e1f9458ddefc7a0cdadccf3c4a', 'addForeignKeyConstraint baseTableName=new_prices, constraintName=fk7nubylk92k2p7mjr80yjgqg3q, referencedTableName=prices', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-55', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.284509', 55, 'EXECUTED', '8:134b68b210690ff3b325afd73b1cb30b', 'addForeignKeyConstraint baseTableName=utilities_users, constraintName=fk8sxifmm14rrcuf3pf0im7ndoe, referencedTableName=utilities', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-56', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.28866', 56, 'EXECUTED', '8:5b9599f2be327f2d1cca4c0265cae510', 'addForeignKeyConstraint baseTableName=addresses, constraintName=fk9chsbxenbwylf5cp6dqya31jf, referencedTableName=street', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-57', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.293023', 57, 'EXECUTED', '8:4111c4bc4da9b309b6c5e67b1b530d65', 'addForeignKeyConstraint baseTableName=debts, constraintName=fk9svo04byim1ukeihaoul4oc, referencedTableName=utilities', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-58', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.297564', 58, 'EXECUTED', '8:12714c47a4901fc8c7e53e99cb5ea2c4', 'addForeignKeyConstraint baseTableName=rating_list_item, constraintName=fka1ppwb9e47k1sypbswhcusxb3, referencedTableName=users', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-59', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.302423', 59, 'EXECUTED', '8:c17f62f4c5f0f98c3bf75fd4f5a14547', 'addForeignKeyConstraint baseTableName=payments_histories, constraintName=fkafewohdk7acusgg8k2s3r1l7r, referencedTableName=utilities', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-60', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.307248', 60, 'EXECUTED', '8:2f79c3cf9ec0ffb6107fd04f31d98853', 'addForeignKeyConstraint baseTableName=utilities_counters, constraintName=fkawfg0ahidksvxwd24cvdsr6c0, referencedTableName=utilities', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-61', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.312732', 61, 'EXECUTED', '8:c2902053f09edabfbe02fd6db9e83c7d', 'addForeignKeyConstraint baseTableName=house, constraintName=fkcj5nnv2nm4dimlo9ov3mt8kjg, referencedTableName=street', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-62', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.318536', 62, 'EXECUTED', '8:dccb397e54ece337abf13d508996f9bf', 'addForeignKeyConstraint baseTableName=schedules, constraintName=fkd4y4xekwahv9boo6lc8gfl3jv, referencedTableName=users', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-63', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.323064', 63, 'EXECUTED', '8:7a6bf0c4ea7b318bd541189b3a98ca26', 'addForeignKeyConstraint baseTableName=counters, constraintName=fkdey6ejyym3w93sarow2sivb4h, referencedTableName=addresses', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-64', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.328659', 64, 'EXECUTED', '8:d8694b07e568953387ab4a4d4849ddb3', 'addForeignKeyConstraint baseTableName=rating_list_item, constraintName=fkesrcypnm210jbkj07wsnojyll, referencedTableName=users', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-65', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.333412', 65, 'EXECUTED', '8:178ca6b59a9975c112148f4f8518826b', 'addForeignKeyConstraint baseTableName=rating, constraintName=fkf68lgbsbxl310n0jifwpfqgfh, referencedTableName=users', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-66', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.337606', 66, 'EXECUTED', '8:729baf7d068a14907c76c5192d4ac2b1', 'addForeignKeyConstraint baseTableName=street, constraintName=fkgn6qy2xi8r62dxucjyaq0rupy, referencedTableName=city', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-67', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.342254', 67, 'EXECUTED', '8:f34da26bbe8124692104d3611809840e', 'addForeignKeyConstraint baseTableName=addresses, constraintName=fkhq39i05aq7366x18ru89sik51, referencedTableName=flat', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-68', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.345985', 68, 'EXECUTED', '8:ebecd29478bc5f69c24ff7ab39ff6038', 'addForeignKeyConstraint baseTableName=payments_histories, constraintName=fkidj1l09jakrmgpalej5uxnlp2, referencedTableName=addresses', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-69', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.349912', 69, 'EXECUTED', '8:6c6ee4cb756ab85c15df4331bdd572a9', 'addForeignKeyConstraint baseTableName=schedules, constraintName=fkj5rgo1khgty8s38nw6ux1usv6, referencedTableName=addresses', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-70', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.354162', 70, 'EXECUTED', '8:7fb872b0384813ea3f5783b3fddc24bb', 'addForeignKeyConstraint baseTableName=prices, constraintName=fkjbbte4nqcj5n2gko518atefsl, referencedTableName=utilities', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-71', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.358168', 71, 'EXECUTED', '8:fa6f817f9e33ad2666e91abebb43502d', 'addForeignKeyConstraint baseTableName=schedule_history, constraintName=fkky79w5lor3qgkpqrkraxgftdp, referencedTableName=addresses', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-72', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.362249', 72, 'EXECUTED', '8:96ce156cf29c0bca86dd41abe8f14959', 'addForeignKeyConstraint baseTableName=unscheduled_addresses, constraintName=fklm0ifg7xay037fq572b6tl1l2, referencedTableName=addresses', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-73', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.366561', 73, 'EXECUTED', '8:dabc492ae3eea2b0dc7f93d6aef1e5cd', 'addForeignKeyConstraint baseTableName=unscheduled_addresses, constraintName=fklo3kiqrca55n1n0ddc55dy519, referencedTableName=utilities', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-74', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.370248', 74, 'EXECUTED', '8:cdd9e400c360b819d4ae3f976a480c85', 'addForeignKeyConstraint baseTableName=addresses, constraintName=fkmujmyxuagrc4msdogdce6urgr, referencedTableName=house', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-75', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.373704', 75, 'EXECUTED', '8:5fa3cf1d5c692875f3cd994557906447', 'addForeignKeyConstraint baseTableName=addresses, constraintName=fkndvlc3rh41djfy85er0n14exa, referencedTableName=region', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-76', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.377113', 76, 'EXECUTED', '8:931a6a9a5c7d3975ba4d8f7db172c70c', 'addForeignKeyConstraint baseTableName=flat, constraintName=fkp650eo25rh3tg2lsqx1x25a7p, referencedTableName=house', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-77', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.380434', 77, 'EXECUTED', '8:129ac7126b4eb2140ccce5a03283f99a', 'addForeignKeyConstraint baseTableName=utilities_users, constraintName=fkpkyn4k5o7a7c7lbb0lv9ijkq6, referencedTableName=users', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-78', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.385011', 78, 'EXECUTED', '8:c12973482031a19783933d815311cf3c', 'addForeignKeyConstraint baseTableName=email_token, constraintName=fkpnii9y1irxajhpost9fjubflx, referencedTableName=users', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-79', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.388284', 79, 'EXECUTED', '8:5547b9269c6ffb41b74e7d286ada19d5', 'addForeignKeyConstraint baseTableName=user_address, constraintName=fkpv7y2l6mvly37lngi3doarqhd, referencedTableName=addresses', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-80', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.39225', 80, 'EXECUTED', '8:28eeacb5dbaee9c43e54248c29423763', 'addForeignKeyConstraint baseTableName=utilities, constraintName=fkrgy0b1dp0vgr26yruh73a4lac, referencedTableName=users', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('1536074537109-81', 'Bear (generated)', 'src/main/db/scripts/scheme.xml', '2018-09-05 12:31:01.395665', 81, 'EXECUTED', '8:73824209dd30809f68ce22d2de611a7b', 'addForeignKeyConstraint baseTableName=user_address, constraintName=fkrmincuqpi8m660j1c57xj7twr, referencedTableName=users', '', NULL, '3.6.1', NULL, NULL, '6139860842');
INSERT INTO databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) VALUES ('raw', 'includeAll', 'src/main/db/scripts/data.sql', '2018-09-05 12:31:01.720385', 82, 'EXECUTED', '8:bc8098642179a60106c9b932da9ae9aa', 'sql', '', NULL, '3.6.1', NULL, NULL, '6139860842');


--
-- TOC entry 2338 (class 0 OID 174976)
-- Dependencies: 185
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO databasechangeloglock (id, locked, lockgranted, lockedby) VALUES (1, false, NULL, NULL);


--
-- TOC entry 2390 (class 0 OID 0)
-- Dependencies: 190
-- Name: debt_sequence_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('debt_sequence_item_id_seq', 137, true);


--
-- TOC entry 2361 (class 0 OID 175038)
-- Dependencies: 208
-- Data for Name: debts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (26, '2018-09-07', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (125, '2018-09-06', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (129, '2018-09-06', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (8, '2018-09-06', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (137, NULL, NULL, NULL, 0, 5);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (106, '2018-09-06', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (72, '2018-09-11', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (120, '2018-09-06', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (80, '2018-09-06', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (16, '2018-09-06', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (54, '2018-09-06', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (47, '2018-09-06', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (103, '2018-09-06', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (115, '2018-09-06', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (110, '2018-09-06', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (46, '2018-09-06', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (99, '2018-09-06', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (48, '2018-09-06', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (28, '2018-09-06', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (83, '2018-09-06', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (36, '2018-09-06', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (94, '2018-09-06', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (15, '2018-09-06', NULL, '2018-09-05', -9.2200000000000006, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (77, '2018-09-06', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (30, '2018-09-06', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (4, '2018-09-06', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (119, '2018-09-06', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (95, '2018-09-07', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (73, '2018-09-07', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (40, '2018-09-07', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (56, '2018-09-07', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (122, '2018-09-07', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (53, '2018-09-07', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (62, '2018-09-07', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (123, '2018-09-07', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (92, '2018-09-07', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (23, '2018-09-07', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (127, '2018-09-07', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (101, '2018-09-07', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (20, '2018-09-07', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (44, '2018-09-07', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (82, '2018-09-07', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (25, '2018-09-07', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (58, '2018-09-07', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (1, '2018-09-07', '2018-09-06', NULL, 9.2400000000000002, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (117, '2018-09-07', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (111, '2018-09-07', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (136, '2018-09-07', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (86, '2018-09-07', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (49, '2018-09-07', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (13, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (22, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (91, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (70, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (45, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (27, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (60, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (105, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (93, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (21, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (97, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (75, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (43, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (11, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (135, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (126, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (39, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (132, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (112, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (131, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (3, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (61, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (96, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (67, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (87, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (14, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (107, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (17, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (66, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (89, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (121, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (50, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (33, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (19, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (57, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (124, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (5, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (114, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (51, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (35, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (31, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (65, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (76, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (69, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (37, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (85, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (81, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (32, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (12, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (10, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (42, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (90, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (134, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (18, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (78, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (98, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (133, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (100, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (113, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (63, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (9, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (24, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (55, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (68, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (84, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (118, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (130, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (128, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (38, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (104, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (6, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (102, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (71, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (29, '2018-09-10', '2018-09-06', NULL, 9.4000000000000004, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (41, '2018-09-11', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (7, '2018-09-11', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (108, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (109, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (52, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (34, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (79, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (59, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (116, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (64, '2018-09-10', NULL, NULL, 0, 2);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (88, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (74, '2018-09-10', NULL, NULL, 0, 3);
INSERT INTO debts (id, last_counter_reminder_send, last_debt_reminder_send, last_paid, value, utility_id) VALUES (2, '2018-09-11', NULL, NULL, 0, 3);


--
-- TOC entry 2362 (class 0 OID 175043)
-- Dependencies: 209
-- Data for Name: email_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO email_token (id, token, user_id) VALUES (12, 'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJmaXJzdG15NTU1QGdtYWlsLmNvbSIsImV4cCI6MTUzODgyMjQzOH0.W55nQTv2rZt1K32y8nAXFAaufU8zBKxBsB18tTbXwXfhSBOaLPUqGqLjL2gEzGtycpXmzfV0tJg-loXlPtoosg', 9);


--
-- TOC entry 2363 (class 0 OID 175048)
-- Dependencies: 210
-- Data for Name: flat; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO flat (id, number, house_id) VALUES (1, '', 1);
INSERT INTO flat (id, number, house_id) VALUES (2, '', 2);
INSERT INTO flat (id, number, house_id) VALUES (3, '', 3);
INSERT INTO flat (id, number, house_id) VALUES (4, '24', 4);
INSERT INTO flat (id, number, house_id) VALUES (5, '123', 5);
INSERT INTO flat (id, number, house_id) VALUES (6, '', 6);
INSERT INTO flat (id, number, house_id) VALUES (7, '23', 7);
INSERT INTO flat (id, number, house_id) VALUES (8, '65', 8);
INSERT INTO flat (id, number, house_id) VALUES (9, '5', 9);
INSERT INTO flat (id, number, house_id) VALUES (10, '15', 10);
INSERT INTO flat (id, number, house_id) VALUES (11, '', 11);
INSERT INTO flat (id, number, house_id) VALUES (12, '', 12);
INSERT INTO flat (id, number, house_id) VALUES (13, '', 13);
INSERT INTO flat (id, number, house_id) VALUES (14, '', 14);
INSERT INTO flat (id, number, house_id) VALUES (15, '54', 15);
INSERT INTO flat (id, number, house_id) VALUES (16, '', 16);
INSERT INTO flat (id, number, house_id) VALUES (17, '24', 17);
INSERT INTO flat (id, number, house_id) VALUES (18, '', 18);
INSERT INTO flat (id, number, house_id) VALUES (19, '', 19);
INSERT INTO flat (id, number, house_id) VALUES (20, '', 20);
INSERT INTO flat (id, number, house_id) VALUES (21, '', 21);
INSERT INTO flat (id, number, house_id) VALUES (22, '', 22);
INSERT INTO flat (id, number, house_id) VALUES (23, '2', 23);
INSERT INTO flat (id, number, house_id) VALUES (24, '', 24);
INSERT INTO flat (id, number, house_id) VALUES (25, '25', 25);
INSERT INTO flat (id, number, house_id) VALUES (26, '5', 26);
INSERT INTO flat (id, number, house_id) VALUES (27, '', 27);
INSERT INTO flat (id, number, house_id) VALUES (28, '12', 28);
INSERT INTO flat (id, number, house_id) VALUES (29, '', 29);
INSERT INTO flat (id, number, house_id) VALUES (30, '33', 30);
INSERT INTO flat (id, number, house_id) VALUES (31, '12', 31);
INSERT INTO flat (id, number, house_id) VALUES (32, '12', 32);
INSERT INTO flat (id, number, house_id) VALUES (33, '12', 33);
INSERT INTO flat (id, number, house_id) VALUES (34, '', 34);
INSERT INTO flat (id, number, house_id) VALUES (35, '', 35);
INSERT INTO flat (id, number, house_id) VALUES (36, '12', 36);
INSERT INTO flat (id, number, house_id) VALUES (37, '', 37);
INSERT INTO flat (id, number, house_id) VALUES (38, '', 38);
INSERT INTO flat (id, number, house_id) VALUES (39, '245', 39);
INSERT INTO flat (id, number, house_id) VALUES (40, '100', 40);
INSERT INTO flat (id, number, house_id) VALUES (41, '100', 41);
INSERT INTO flat (id, number, house_id) VALUES (42, '1', 42);
INSERT INTO flat (id, number, house_id) VALUES (43, '', 43);
INSERT INTO flat (id, number, house_id) VALUES (44, '', 44);
INSERT INTO flat (id, number, house_id) VALUES (45, '', 45);
INSERT INTO flat (id, number, house_id) VALUES (46, '2', 46);
INSERT INTO flat (id, number, house_id) VALUES (47, '2', 47);
INSERT INTO flat (id, number, house_id) VALUES (48, '12', 48);
INSERT INTO flat (id, number, house_id) VALUES (49, '1', 49);
INSERT INTO flat (id, number, house_id) VALUES (50, '12', 50);
INSERT INTO flat (id, number, house_id) VALUES (51, '12', 51);
INSERT INTO flat (id, number, house_id) VALUES (52, '100', 52);
INSERT INTO flat (id, number, house_id) VALUES (53, '1', 53);
INSERT INTO flat (id, number, house_id) VALUES (54, '', 54);
INSERT INTO flat (id, number, house_id) VALUES (55, '', 55);
INSERT INTO flat (id, number, house_id) VALUES (56, '5', 56);
INSERT INTO flat (id, number, house_id) VALUES (57, '', 57);
INSERT INTO flat (id, number, house_id) VALUES (58, '', 58);
INSERT INTO flat (id, number, house_id) VALUES (59, '67', 59);
INSERT INTO flat (id, number, house_id) VALUES (60, '45', 60);
INSERT INTO flat (id, number, house_id) VALUES (61, '', 61);
INSERT INTO flat (id, number, house_id) VALUES (62, '231', 62);
INSERT INTO flat (id, number, house_id) VALUES (63, '23', 63);
INSERT INTO flat (id, number, house_id) VALUES (64, '123', 64);
INSERT INTO flat (id, number, house_id) VALUES (65, '123', 65);
INSERT INTO flat (id, number, house_id) VALUES (66, '1', 66);
INSERT INTO flat (id, number, house_id) VALUES (67, '', 67);
INSERT INTO flat (id, number, house_id) VALUES (68, '', 68);
INSERT INTO flat (id, number, house_id) VALUES (69, '100', 69);
INSERT INTO flat (id, number, house_id) VALUES (70, '1', 70);
INSERT INTO flat (id, number, house_id) VALUES (71, '123', 71);
INSERT INTO flat (id, number, house_id) VALUES (72, '', 72);
INSERT INTO flat (id, number, house_id) VALUES (73, '', 73);
INSERT INTO flat (id, number, house_id) VALUES (74, '3', 74);
INSERT INTO flat (id, number, house_id) VALUES (75, '', 75);


--
-- TOC entry 2391 (class 0 OID 0)
-- Dependencies: 191
-- Name: flat_sequence_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('flat_sequence_item_id_seq', 75, true);


--
-- TOC entry 2392 (class 0 OID 0)
-- Dependencies: 192
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 12, true);


--
-- TOC entry 2364 (class 0 OID 175053)
-- Dependencies: 211
-- Data for Name: house; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO house (id, number, street_id) VALUES (1, '131', 2);
INSERT INTO house (id, number, street_id) VALUES (2, '18', 4);
INSERT INTO house (id, number, street_id) VALUES (3, '3', 5);
INSERT INTO house (id, number, street_id) VALUES (4, '1', 6);
INSERT INTO house (id, number, street_id) VALUES (5, '4', 7);
INSERT INTO house (id, number, street_id) VALUES (6, '2', 8);
INSERT INTO house (id, number, street_id) VALUES (7, '12', 9);
INSERT INTO house (id, number, street_id) VALUES (8, '43', 10);
INSERT INTO house (id, number, street_id) VALUES (9, '2', 11);
INSERT INTO house (id, number, street_id) VALUES (10, '4', 12);
INSERT INTO house (id, number, street_id) VALUES (11, '2', 13);
INSERT INTO house (id, number, street_id) VALUES (12, '10', 14);
INSERT INTO house (id, number, street_id) VALUES (13, '5', 15);
INSERT INTO house (id, number, street_id) VALUES (14, '1', 16);
INSERT INTO house (id, number, street_id) VALUES (15, '44', 17);
INSERT INTO house (id, number, street_id) VALUES (16, '12', 18);
INSERT INTO house (id, number, street_id) VALUES (17, '16', 19);
INSERT INTO house (id, number, street_id) VALUES (18, '12', 20);
INSERT INTO house (id, number, street_id) VALUES (19, '12', 21);
INSERT INTO house (id, number, street_id) VALUES (20, '10', 22);
INSERT INTO house (id, number, street_id) VALUES (21, '2', 23);
INSERT INTO house (id, number, street_id) VALUES (22, '100', 24);
INSERT INTO house (id, number, street_id) VALUES (23, '100', 25);
INSERT INTO house (id, number, street_id) VALUES (24, '12', 26);
INSERT INTO house (id, number, street_id) VALUES (25, '2', 27);
INSERT INTO house (id, number, street_id) VALUES (26, '5', 28);
INSERT INTO house (id, number, street_id) VALUES (27, '25', 29);
INSERT INTO house (id, number, street_id) VALUES (28, '44', 30);
INSERT INTO house (id, number, street_id) VALUES (29, '1', 31);
INSERT INTO house (id, number, street_id) VALUES (30, '49', 32);
INSERT INTO house (id, number, street_id) VALUES (31, '15', 33);
INSERT INTO house (id, number, street_id) VALUES (32, '16', 34);
INSERT INTO house (id, number, street_id) VALUES (33, '12', 35);
INSERT INTO house (id, number, street_id) VALUES (34, '67', 36);
INSERT INTO house (id, number, street_id) VALUES (35, '60', 25);
INSERT INTO house (id, number, street_id) VALUES (36, '6', 37);
INSERT INTO house (id, number, street_id) VALUES (37, '1', 38);
INSERT INTO house (id, number, street_id) VALUES (38, '2', 39);
INSERT INTO house (id, number, street_id) VALUES (39, '241', 40);
INSERT INTO house (id, number, street_id) VALUES (40, '243', 40);
INSERT INTO house (id, number, street_id) VALUES (41, '279', 40);
INSERT INTO house (id, number, street_id) VALUES (42, '50', 5);
INSERT INTO house (id, number, street_id) VALUES (43, '1', 41);
INSERT INTO house (id, number, street_id) VALUES (44, '12', 42);
INSERT INTO house (id, number, street_id) VALUES (45, '2', 43);
INSERT INTO house (id, number, street_id) VALUES (46, '12', 44);
INSERT INTO house (id, number, street_id) VALUES (47, '1', 45);
INSERT INTO house (id, number, street_id) VALUES (48, '12', 46);
INSERT INTO house (id, number, street_id) VALUES (49, '1', 47);
INSERT INTO house (id, number, street_id) VALUES (50, '2', 48);
INSERT INTO house (id, number, street_id) VALUES (51, '6', 49);
INSERT INTO house (id, number, street_id) VALUES (52, '100', 50);
INSERT INTO house (id, number, street_id) VALUES (53, '12', 51);
INSERT INTO house (id, number, street_id) VALUES (54, '100', 52);
INSERT INTO house (id, number, street_id) VALUES (55, '120', 52);
INSERT INTO house (id, number, street_id) VALUES (56, '150', 52);
INSERT INTO house (id, number, street_id) VALUES (57, '10', 53);
INSERT INTO house (id, number, street_id) VALUES (58, '96', 54);
INSERT INTO house (id, number, street_id) VALUES (59, '12', 55);
INSERT INTO house (id, number, street_id) VALUES (60, '15', 56);
INSERT INTO house (id, number, street_id) VALUES (61, '98', 57);
INSERT INTO house (id, number, street_id) VALUES (62, '12', 58);
INSERT INTO house (id, number, street_id) VALUES (63, '12', 59);
INSERT INTO house (id, number, street_id) VALUES (64, '16', 60);
INSERT INTO house (id, number, street_id) VALUES (65, '1', 61);
INSERT INTO house (id, number, street_id) VALUES (66, '1', 62);
INSERT INTO house (id, number, street_id) VALUES (67, '12', 63);
INSERT INTO house (id, number, street_id) VALUES (68, '100', 64);
INSERT INTO house (id, number, street_id) VALUES (69, '100', 65);
INSERT INTO house (id, number, street_id) VALUES (70, '1', 66);
INSERT INTO house (id, number, street_id) VALUES (71, '1', 67);
INSERT INTO house (id, number, street_id) VALUES (72, '1600', 69);
INSERT INTO house (id, number, street_id) VALUES (73, '131', 71);
INSERT INTO house (id, number, street_id) VALUES (74, '115', 72);
INSERT INTO house (id, number, street_id) VALUES (75, '144', 72);


--
-- TOC entry 2393 (class 0 OID 0)
-- Dependencies: 193
-- Name: house_sequence_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('house_sequence_item_id_seq', 75, true);


--
-- TOC entry 2394 (class 0 OID 0)
-- Dependencies: 194
-- Name: new_price_sequence_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('new_price_sequence_item_id_seq', 2, true);


--
-- TOC entry 2365 (class 0 OID 175058)
-- Dependencies: 212
-- Data for Name: new_prices; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO new_prices (new_price_id, activation_date, new_price, current_price_id) VALUES (2, '2018-09-30', 7.25, 3);
INSERT INTO new_prices (new_price_id, activation_date, new_price, current_price_id) VALUES (1, '2018-09-30', 7.3499999999999996, 11);


--
-- TOC entry 2366 (class 0 OID 175063)
-- Dependencies: 213
-- Data for Name: payments_histories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO payments_histories (id, checkpath, google_drive_file_id, pay_date, payment_sum, address_id, user_id, utility_id) VALUES (1, '/files/checks/user1@gmail.com/ДнепрОблЭнерго2018-09-04 172458.415.pdf', '18nEiUftyOPf65hcWlYbK-FvLLXKJH_UU', '2018-09-04', 6, 11, 101, 2);
INSERT INTO payments_histories (id, checkpath, google_drive_file_id, pay_date, payment_sum, address_id, user_id, utility_id) VALUES (2, '/files/checks/user1@gmail.com/ДнепрОблЭнерго2018-09-05 130903.217.pdf', '1wz2kGYnFadIwUyf4_68npQkdDSYK66Rp', '2018-09-05', 3, 11, 101, 2);
INSERT INTO payments_histories (id, checkpath, google_drive_file_id, pay_date, payment_sum, address_id, user_id, utility_id) VALUES (3, '/files/checks/user1@gmail.com/ДнепрОблЭнерго2018-09-05 160947.772.pdf', '1DsfPQh8Dd9Dw4oDF9K3CeyCSh9j_zFp6', '2018-09-05', 25, 11, 101, 2);


--
-- TOC entry 2395 (class 0 OID 0)
-- Dependencies: 195
-- Name: payments_history_sequence_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('payments_history_sequence_item_id_seq', 3, true);


--
-- TOC entry 2396 (class 0 OID 0)
-- Dependencies: 196
-- Name: price_sequence_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('price_sequence_item_id_seq', 11, true);


--
-- TOC entry 2367 (class 0 OID 175068)
-- Dependencies: 214
-- Data for Name: prices; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO prices (price_id, active, date, price, utility_id) VALUES (3, true, '2018-09-04', 5.3600000000000003, 3);
INSERT INTO prices (price_id, active, date, price, utility_id) VALUES (7, false, '2018-01-05', 11.119999999999999, 2);
INSERT INTO prices (price_id, active, date, price, utility_id) VALUES (4, false, '2017-11-05', 4.6900000000000004, 2);
INSERT INTO prices (price_id, active, date, price, utility_id) VALUES (2, false, '2018-07-12', 3.3300000000000001, 2);
INSERT INTO prices (price_id, active, date, price, utility_id) VALUES (6, false, '2018-03-05', 10.32, 2);
INSERT INTO prices (price_id, active, date, price, utility_id) VALUES (5, false, '2018-06-05', 7.9800000000000004, 2);
INSERT INTO prices (price_id, active, date, price, utility_id) VALUES (9, true, NULL, 0.10000000000000001, 4);
INSERT INTO prices (price_id, active, date, price, utility_id) VALUES (10, true, NULL, 0.10000000000000001, 5);
INSERT INTO prices (price_id, active, date, price, utility_id) VALUES (8, false, '2018-09-05', 2.3100000000000001, 2);
INSERT INTO prices (price_id, active, date, price, utility_id) VALUES (11, true, '2018-09-05', 2.3500000000000001, 2);


--
-- TOC entry 2368 (class 0 OID 175073)
-- Dependencies: 215
-- Data for Name: rating; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO rating (id, rating, user_id) VALUES (3, 4, 104);
INSERT INTO rating (id, rating, user_id) VALUES (2, 2, 101);
INSERT INTO rating (id, rating, user_id) VALUES (1, 0.5, 109);
INSERT INTO rating (id, rating, user_id) VALUES (4, 0, 111);
INSERT INTO rating (id, rating, user_id) VALUES (5, 0, 112);
INSERT INTO rating (id, rating, user_id) VALUES (6, 0, 102);
INSERT INTO rating (id, rating, user_id) VALUES (7, 0, 110);
INSERT INTO rating (id, rating, user_id) VALUES (8, 0, 103);


--
-- TOC entry 2397 (class 0 OID 0)
-- Dependencies: 197
-- Name: rating_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rating_item_id_seq', 8, true);


--
-- TOC entry 2369 (class 0 OID 175078)
-- Dependencies: 216
-- Data for Name: rating_list_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO rating_list_item (id, rating_value, user_id, rater_user_id) VALUES (3, 0, 109, 104);
INSERT INTO rating_list_item (id, rating_value, user_id, rater_user_id) VALUES (4, 4, 104, 109);
INSERT INTO rating_list_item (id, rating_value, user_id, rater_user_id) VALUES (2, 2, 101, 109);
INSERT INTO rating_list_item (id, rating_value, user_id, rater_user_id) VALUES (1, 0.5, 109, 101);
INSERT INTO rating_list_item (id, rating_value, user_id, rater_user_id) VALUES (5, 0, 111, 101);
INSERT INTO rating_list_item (id, rating_value, user_id, rater_user_id) VALUES (6, 0, 101, 111);
INSERT INTO rating_list_item (id, rating_value, user_id, rater_user_id) VALUES (7, 0, 112, 102);
INSERT INTO rating_list_item (id, rating_value, user_id, rater_user_id) VALUES (8, 0, 102, 112);
INSERT INTO rating_list_item (id, rating_value, user_id, rater_user_id) VALUES (9, 0, 110, 102);
INSERT INTO rating_list_item (id, rating_value, user_id, rater_user_id) VALUES (10, 0, 102, 110);
INSERT INTO rating_list_item (id, rating_value, user_id, rater_user_id) VALUES (11, 0, 111, 103);
INSERT INTO rating_list_item (id, rating_value, user_id, rater_user_id) VALUES (12, 0, 103, 111);
INSERT INTO rating_list_item (id, rating_value, user_id, rater_user_id) VALUES (13, 0, 112, 104);
INSERT INTO rating_list_item (id, rating_value, user_id, rater_user_id) VALUES (14, 0, 104, 112);


--
-- TOC entry 2398 (class 0 OID 0)
-- Dependencies: 198
-- Name: rating_list_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rating_list_item_id_seq', 14, true);


--
-- TOC entry 2370 (class 0 OID 175083)
-- Dependencies: 217
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO region (id, name) VALUES (1, 'Чернівецька область');
INSERT INTO region (id, name) VALUES (2, 'Дніпропетровська область');
INSERT INTO region (id, name) VALUES (3, 'CA');
INSERT INTO region (id, name) VALUES (4, 'Chernivets''ka oblast');


--
-- TOC entry 2399 (class 0 OID 0)
-- Dependencies: 199
-- Name: region_sequence_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('region_sequence_item_id_seq', 4, true);


--
-- TOC entry 2371 (class 0 OID 175088)
-- Dependencies: 218
-- Data for Name: schedule_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (1, '', '2018-09-30', 'DONE', '2018-09-04', 4, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (2, '', '2018-09-29', 'DONE', '2018-09-04', 17, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (3, '', '2018-09-28', 'DONE', '2018-09-04', 9, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (4, '', '2018-09-27', 'CANCELED', '2018-09-04', 16, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (5, '', '2018-09-26', 'CANCELED', '2018-09-04', 13, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (6, '', '2018-09-25', 'CANCELED', '2018-09-04', 15, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (7, '', '2018-09-24', 'DONE', '2018-09-04', 20, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (8, '', '2018-09-21', 'CANCELED', '2018-09-04', 19, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (9, '', '2018-09-21', 'CANCELED', '2018-09-04', 18, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (10, '', '2018-09-21', 'CANCELED', '2018-09-04', 12, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (11, '', '2018-09-21', 'CANCELED', '2018-09-04', 14, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (12, 'Overdue visit', '2018-08-27', 'OVERDUE', '2018-08-27', 18, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (22, 'Overdue visit', '2018-08-27', 'OVERDUE', '2018-08-27', 14, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (18, 'Overdue visit', '2018-08-14', 'OVERDUE', '2018-08-14', 9, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (17, 'Overdue visit', '2018-08-14', 'OVERDUE', '2018-08-14', 13, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (16, 'Overdue visit', '2018-08-14', 'OVERDUE', '2018-08-14', 15, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (23, 'Overdue visit', '2018-08-27', 'OVERDUE', '2018-08-27', 19, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (15, 'Overdue visit', '2018-08-14', 'OVERDUE', '2018-08-14', 20, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (14, 'Overdue visit', '2018-08-14', 'OVERDUE', '2018-08-14', 12, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (13, 'Overdue visit', '2018-08-14', 'OVERDUE', '2018-08-14', 16, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (19, 'Overdue visit', '2018-08-27', 'OVERDUE', '2018-08-27', 9, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (20, 'Overdue visit', '2018-08-27', 'OVERDUE', '2018-08-27', 17, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (21, 'Overdue visit', '2018-08-27', 'OVERDUE', '2018-08-27', 4, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (24, '', '2018-09-05', 'DONE', '2018-09-05', 55, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (25, 'Cancel', '2018-09-10', 'CANCELED', '2018-09-05', 12, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (26, '', '2018-09-25', 'DONE', '2018-09-05', 19, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (27, '<script>alert("Hello");</script>', '2018-09-26', 'DONE', '2018-09-05', 18, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (28, 'Overdue visit', '2018-09-05', 'OVERDUE', '2018-09-06', 5, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (29, 'Overdue visit', '2018-09-06', 'OVERDUE', '2018-09-07', 17, 111);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (30, 'Overdue visit', '2018-09-07', 'OVERDUE', '2018-09-10', 17, 111);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (31, 'Overdue visit', '2018-09-10', 'OVERDUE', '2018-09-11', 13, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (32, 'Overdue visit', '2018-09-10', 'OVERDUE', '2018-09-11', 15, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (33, 'Overdue visit', '2018-09-10', 'OVERDUE', '2018-09-11', 16, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (34, 'Overdue visit', '2018-09-10', 'OVERDUE', '2018-09-11', 20, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (35, 'Overdue visit', '2018-09-27', 'OVERDUE', '2018-10-02', 9, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (36, 'Overdue visit', '2018-09-24', 'OVERDUE', '2018-10-02', 14, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (37, 'Overdue visit', '2018-09-30', 'OVERDUE', '2018-10-02', 15, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (38, 'Overdue visit', '2018-09-28', 'OVERDUE', '2018-10-02', 17, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (39, 'Overdue visit', '2018-09-20', 'OVERDUE', '2018-10-02', 23, 112);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (40, 'Overdue visit', '2018-09-30', 'OVERDUE', '2018-10-02', 27, 110);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (41, 'Overdue visit', '2018-09-27', 'OVERDUE', '2018-10-02', 28, 110);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (42, 'Overdue visit', '2018-09-28', 'OVERDUE', '2018-10-02', 32, 110);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (43, 'Overdue visit', '2018-09-29', 'OVERDUE', '2018-10-02', 33, 110);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (44, 'Overdue visit', '2018-09-26', 'OVERDUE', '2018-10-02', 34, 110);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (45, 'Overdue visit', '2018-09-25', 'OVERDUE', '2018-10-02', 35, 112);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (46, 'Overdue visit', '2018-09-30', 'OVERDUE', '2018-10-02', 43, 111);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (47, 'Overdue visit', '2018-09-25', 'OVERDUE', '2018-10-02', 44, 111);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (48, 'Overdue visit', '2018-09-27', 'OVERDUE', '2018-10-02', 45, 111);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (49, 'Overdue visit', '2018-09-26', 'OVERDUE', '2018-10-02', 48, 111);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (50, 'Overdue visit', '2018-09-28', 'OVERDUE', '2018-10-02', 51, 111);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (51, 'Overdue visit', '2018-09-29', 'OVERDUE', '2018-10-02', 52, 111);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (52, 'Overdue visit', '2018-09-26', 'OVERDUE', '2018-10-02', 58, 112);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (53, 'Overdue visit', '2018-09-23', 'OVERDUE', '2018-10-02', 62, 112);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (54, 'Overdue visit', '2018-09-24', 'OVERDUE', '2018-10-02', 63, 112);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (55, 'Overdue visit', '2018-09-30', 'OVERDUE', '2018-10-02', 64, 112);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (56, 'Overdue visit', '2018-09-29', 'OVERDUE', '2018-10-02', 65, 112);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (57, 'Overdue visit', '2018-09-21', 'OVERDUE', '2018-10-02', 66, 112);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (58, 'Overdue visit', '2018-09-28', 'OVERDUE', '2018-10-02', 67, 112);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (59, 'Overdue visit', '2018-09-22', 'OVERDUE', '2018-10-02', 68, 112);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (60, 'Overdue visit', '2018-09-27', 'OVERDUE', '2018-10-02', 69, 112);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (61, 'Overdue visit', '2018-10-05', 'OVERDUE', '2018-10-07', 5, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (62, 'Overdue visit', '2018-10-05', 'OVERDUE', '2018-10-07', 55, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (63, 'Overdue visit', '2018-10-10', 'OVERDUE', '2018-10-11', 4, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (64, 'Overdue visit', '2018-10-10', 'OVERDUE', '2018-10-11', 12, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (65, 'Overdue visit', '2018-10-10', 'OVERDUE', '2018-10-11', 13, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (66, 'Overdue visit', '2018-10-10', 'OVERDUE', '2018-10-11', 15, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (67, 'Overdue visit', '2018-10-10', 'OVERDUE', '2018-10-11', 16, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (68, 'Overdue visit', '2018-10-10', 'OVERDUE', '2018-10-11', 20, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (69, 'Overdue visit', '2018-11-10', 'OVERDUE', '2018-11-27', 4, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (70, 'Overdue visit', '2018-11-05', 'OVERDUE', '2018-11-27', 5, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (71, 'Overdue visit', '2018-11-10', 'OVERDUE', '2018-11-27', 12, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (72, 'Overdue visit', '2018-11-10', 'OVERDUE', '2018-11-27', 13, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (73, 'Overdue visit', '2018-11-24', 'OVERDUE', '2018-11-27', 14, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (74, 'Overdue visit', '2018-11-10', 'OVERDUE', '2018-11-27', 15, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (75, 'Overdue visit', '2018-11-10', 'OVERDUE', '2018-11-27', 16, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (76, 'Overdue visit', '2018-10-26', 'OVERDUE', '2018-11-27', 18, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (77, 'Overdue visit', '2018-10-25', 'OVERDUE', '2018-11-27', 19, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (78, 'Overdue visit', '2018-11-10', 'OVERDUE', '2018-11-27', 20, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (79, 'Overdue visit', '2018-11-20', 'OVERDUE', '2018-11-27', 23, 112);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (80, 'Overdue visit', '2018-11-26', 'OVERDUE', '2018-11-27', 34, 110);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (81, 'Overdue visit', '2018-11-25', 'OVERDUE', '2018-11-27', 35, 112);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (82, 'Overdue visit', '2018-11-25', 'OVERDUE', '2018-11-27', 44, 111);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (83, 'Overdue visit', '2018-11-26', 'OVERDUE', '2018-11-27', 48, 111);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (84, 'Overdue visit', '2018-11-05', 'OVERDUE', '2018-11-27', 55, 109);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (85, 'Overdue visit', '2018-11-26', 'OVERDUE', '2018-11-27', 58, 112);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (86, 'Overdue visit', '2018-11-23', 'OVERDUE', '2018-11-27', 62, 112);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (87, 'Overdue visit', '2018-11-24', 'OVERDUE', '2018-11-27', 63, 112);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (88, 'Overdue visit', '2018-11-21', 'OVERDUE', '2018-11-27', 66, 112);
INSERT INTO schedule_history (id, comment, event_date, status, submit_date, address_id, user_id) VALUES (89, 'Overdue visit', '2018-11-22', 'OVERDUE', '2018-11-27', 68, 112);


--
-- TOC entry 2372 (class 0 OID 175096)
-- Dependencies: 219
-- Data for Name: schedules; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (38, '2018-11-27', true, 9, 109);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (37, '2018-11-28', true, 17, 109);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (7, '2018-11-30', true, 27, 110);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (15, '2018-11-27', true, 28, 110);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (13, '2018-11-28', true, 32, 110);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (10, '2018-11-29', true, 33, 110);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (20, '2018-11-30', true, 43, 111);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (30, '2018-11-27', true, 45, 111);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (29, '2018-11-28', true, 51, 111);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (23, '2018-11-29', true, 52, 111);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (17, '2018-11-30', true, 64, 112);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (18, '2018-11-29', true, 65, 112);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (19, '2018-11-28', true, 67, 112);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (21, '2018-11-27', true, 69, 112);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (1, '2018-12-10', true, 4, 109);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (51, '2018-12-05', true, 5, 109);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (36, '2018-12-10', true, 12, 109);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (43, '2018-12-10', true, 13, 109);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (41, '2018-12-24', true, 14, 109);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (44, '2018-12-10', true, 15, 109);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (42, '2018-12-10', true, 16, 109);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (39, '2018-12-26', true, 18, 109);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (40, '2018-12-25', true, 19, 109);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (35, '2018-12-10', true, 20, 109);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (32, '2018-12-20', true, 23, 112);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (16, '2018-12-26', true, 34, 110);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (24, '2018-12-25', true, 35, 112);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (33, '2018-12-25', true, 44, 111);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (31, '2018-12-26', true, 48, 111);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (48, '2018-12-05', true, 55, 109);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (22, '2018-12-26', true, 58, 112);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (26, '2018-12-23', true, 62, 112);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (25, '2018-12-24', true, 63, 112);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (28, '2018-12-21', true, 66, 112);
INSERT INTO schedules (id, event_date, is_repeat, address_id, user_id) VALUES (27, '2018-12-22', true, 68, 112);


--
-- TOC entry 2400 (class 0 OID 0)
-- Dependencies: 200
-- Name: schedules_history_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('schedules_history_item_id_seq', 89, true);


--
-- TOC entry 2401 (class 0 OID 0)
-- Dependencies: 201
-- Name: schedules_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('schedules_item_id_seq', 51, true);


--
-- TOC entry 2373 (class 0 OID 175101)
-- Dependencies: 220
-- Data for Name: street; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO street (id, name, city_id) VALUES (2, 'проспект Незалежності', 1);
INSERT INTO street (id, name, city_id) VALUES (4, 'вулиця Ватутіна', 3);
INSERT INTO street (id, name, city_id) VALUES (5, 'вулиця Винниченка', 1);
INSERT INTO street (id, name, city_id) VALUES (6, 'вулиця Поштова', 1);
INSERT INTO street (id, name, city_id) VALUES (7, 'вулиця Гагаріна', 1);
INSERT INTO street (id, name, city_id) VALUES (8, 'вулиця Толстого', 1);
INSERT INTO street (id, name, city_id) VALUES (9, 'вулиця Горького', 1);
INSERT INTO street (id, name, city_id) VALUES (10, 'вулиця Сковороди', 1);
INSERT INTO street (id, name, city_id) VALUES (11, 'вулиця Університетська', 1);
INSERT INTO street (id, name, city_id) VALUES (12, 'вулиця Лисенка', 1);
INSERT INTO street (id, name, city_id) VALUES (13, 'вулиця Глінки', 1);
INSERT INTO street (id, name, city_id) VALUES (14, 'вулиця Котляревського', 1);
INSERT INTO street (id, name, city_id) VALUES (15, 'вулиця Нагірна', 1);
INSERT INTO street (id, name, city_id) VALUES (16, 'Кафедральна вулиця', 1);
INSERT INTO street (id, name, city_id) VALUES (17, 'вулиця Шевченка', 1);
INSERT INTO street (id, name, city_id) VALUES (18, 'вулиця Пушкіна', 1);
INSERT INTO street (id, name, city_id) VALUES (19, 'вулиця Маяковського', 1);
INSERT INTO street (id, name, city_id) VALUES (20, 'вулиця Тобілевича', 1);
INSERT INTO street (id, name, city_id) VALUES (21, 'вулиця Козачука', 1);
INSERT INTO street (id, name, city_id) VALUES (22, 'вулиця Ольжича', 1);
INSERT INTO street (id, name, city_id) VALUES (23, 'вулиця Кошового', 1);
INSERT INTO street (id, name, city_id) VALUES (24, 'вулиця Сторожинецька', 1);
INSERT INTO street (id, name, city_id) VALUES (25, 'вулиця Горіхівська', 1);
INSERT INTO street (id, name, city_id) VALUES (26, 'вулиця Каспрука', 1);
INSERT INTO street (id, name, city_id) VALUES (27, 'вулиця Шухевича', 1);
INSERT INTO street (id, name, city_id) VALUES (28, 'вулиця Рівненська', 1);
INSERT INTO street (id, name, city_id) VALUES (29, 'вулиця Мукачівська', 1);
INSERT INTO street (id, name, city_id) VALUES (30, 'вулиця Прилуцька', 1);
INSERT INTO street (id, name, city_id) VALUES (31, 'вулиця Ковельська', 1);
INSERT INTO street (id, name, city_id) VALUES (32, 'вулиця Хотинська', 1);
INSERT INTO street (id, name, city_id) VALUES (33, 'вулиця Хрещатинська', 1);
INSERT INTO street (id, name, city_id) VALUES (34, 'вулиця Путилівська', 1);
INSERT INTO street (id, name, city_id) VALUES (35, 'вулиця Ставчанська', 1);
INSERT INTO street (id, name, city_id) VALUES (36, 'вулиця Мартовича', 1);
INSERT INTO street (id, name, city_id) VALUES (37, 'вулиця Дзержика', 1);
INSERT INTO street (id, name, city_id) VALUES (38, 'вулиця Вашківська', 1);
INSERT INTO street (id, name, city_id) VALUES (39, 'вулиця Комунальників', 1);
INSERT INTO street (id, name, city_id) VALUES (40, 'вулиця Руська', 1);
INSERT INTO street (id, name, city_id) VALUES (41, 'Трипільська вулиця', 1);
INSERT INTO street (id, name, city_id) VALUES (42, 'Роменська вулиця', 1);
INSERT INTO street (id, name, city_id) VALUES (43, 'Петрозаводська вулиця', 1);
INSERT INTO street (id, name, city_id) VALUES (44, 'Висока вулиця', 1);
INSERT INTO street (id, name, city_id) VALUES (45, 'Немирівська вулиця', 1);
INSERT INTO street (id, name, city_id) VALUES (46, 'Кадіївська вулиця', 1);
INSERT INTO street (id, name, city_id) VALUES (47, 'Алтайська вулиця', 1);
INSERT INTO street (id, name, city_id) VALUES (48, 'Уральська вулиця', 1);
INSERT INTO street (id, name, city_id) VALUES (49, 'Барнаульська вулиця', 1);
INSERT INTO street (id, name, city_id) VALUES (50, 'Сімферопольська вулиця', 1);
INSERT INTO street (id, name, city_id) VALUES (51, 'вулиця Нечая', 1);
INSERT INTO street (id, name, city_id) VALUES (52, 'вулиця Київська', 1);
INSERT INTO street (id, name, city_id) VALUES (53, 'Заставнянська вулиця', 1);
INSERT INTO street (id, name, city_id) VALUES (54, 'вулиця Весняна', 1);
INSERT INTO street (id, name, city_id) VALUES (55, 'вулиця Ходорівська', 1);
INSERT INTO street (id, name, city_id) VALUES (56, 'вулиця Стрийська', 1);
INSERT INTO street (id, name, city_id) VALUES (57, 'вулиця Маковея', 1);
INSERT INTO street (id, name, city_id) VALUES (58, 'вулиця Вербова', 1);
INSERT INTO street (id, name, city_id) VALUES (59, 'Бузкова вулиця', 1);
INSERT INTO street (id, name, city_id) VALUES (60, 'Ясенева вулиця', 1);
INSERT INTO street (id, name, city_id) VALUES (61, 'Фіалкова вулиця', 1);
INSERT INTO street (id, name, city_id) VALUES (62, 'Берегометська вулиця', 1);
INSERT INTO street (id, name, city_id) VALUES (63, 'Ленківська вулиця', 1);
INSERT INTO street (id, name, city_id) VALUES (64, 'Банилівська вулиця', 1);
INSERT INTO street (id, name, city_id) VALUES (65, 'Іркутська вулиця', 1);
INSERT INTO street (id, name, city_id) VALUES (66, 'Калузька вулиця', 1);
INSERT INTO street (id, name, city_id) VALUES (67, 'Снятинська вулиця', 1);
INSERT INTO street (id, name, city_id) VALUES (69, 'Amphitheatre Parkway', 68);
INSERT INTO street (id, name, city_id) VALUES (71, 'Nezalezhnosti Avenue', 70);
INSERT INTO street (id, name, city_id) VALUES (72, 'Holovna Street', 70);


--
-- TOC entry 2374 (class 0 OID 175106)
-- Dependencies: 221
-- Data for Name: unscheduled_addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (1, 4, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (2, 58, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (3, 21, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (4, 41, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (5, 61, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (6, 25, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (7, 69, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (8, 30, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (9, 60, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (10, 46, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (11, 42, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (12, 37, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (13, 31, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (14, 67, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (15, 40, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (16, 71, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (17, 11, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (18, 65, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (19, 35, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (20, 7, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (21, 62, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (22, 52, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (23, 23, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (24, 39, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (25, 38, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (26, 64, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (27, 36, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (28, 6, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (29, 50, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (30, 24, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (31, 51, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (32, 63, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (33, 22, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (34, 56, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (35, 45, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (36, 8, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (37, 49, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (38, 70, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (40, 10, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (41, 68, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (42, 59, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (43, 29, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (44, 54, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (45, 26, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (46, 53, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (48, 43, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (49, 66, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (50, 44, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (51, 57, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (52, 48, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (53, 47, 2);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (54, 37, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (55, 34, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (56, 6, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (57, 50, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (58, 47, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (59, 41, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (60, 36, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (61, 39, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (62, 21, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (63, 30, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (64, 38, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (65, 25, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (66, 61, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (67, 16, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (68, 15, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (69, 13, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (70, 60, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (71, 42, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (72, 5, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (73, 20, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (74, 17, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (75, 57, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (76, 55, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (77, 12, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (78, 11, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (79, 31, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (80, 46, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (81, 54, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (82, 27, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (83, 56, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (84, 14, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (85, 7, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (86, 59, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (87, 22, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (88, 28, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (89, 32, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (90, 9, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (91, 24, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (92, 70, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (93, 71, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (94, 33, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (95, 18, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (96, 19, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (97, 53, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (98, 26, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (99, 29, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (100, 49, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (101, 10, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (102, 8, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (103, 40, 3);
INSERT INTO unscheduled_addresses (id, address_id, utility_id) VALUES (104, 74, 5);


--
-- TOC entry 2402 (class 0 OID 0)
-- Dependencies: 202
-- Name: unscheduled_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('unscheduled_addresses_id_seq', 104, true);


--
-- TOC entry 2375 (class 0 OID 175111)
-- Dependencies: 222
-- Data for Name: user_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO user_address (user_id, address_id) VALUES (101, 4);
INSERT INTO user_address (user_id, address_id) VALUES (101, 5);
INSERT INTO user_address (user_id, address_id) VALUES (101, 6);
INSERT INTO user_address (user_id, address_id) VALUES (101, 7);
INSERT INTO user_address (user_id, address_id) VALUES (101, 8);
INSERT INTO user_address (user_id, address_id) VALUES (101, 9);
INSERT INTO user_address (user_id, address_id) VALUES (101, 10);
INSERT INTO user_address (user_id, address_id) VALUES (101, 11);
INSERT INTO user_address (user_id, address_id) VALUES (101, 12);
INSERT INTO user_address (user_id, address_id) VALUES (101, 13);
INSERT INTO user_address (user_id, address_id) VALUES (101, 14);
INSERT INTO user_address (user_id, address_id) VALUES (101, 15);
INSERT INTO user_address (user_id, address_id) VALUES (101, 16);
INSERT INTO user_address (user_id, address_id) VALUES (101, 17);
INSERT INTO user_address (user_id, address_id) VALUES (101, 18);
INSERT INTO user_address (user_id, address_id) VALUES (101, 19);
INSERT INTO user_address (user_id, address_id) VALUES (101, 20);
INSERT INTO user_address (user_id, address_id) VALUES (102, 21);
INSERT INTO user_address (user_id, address_id) VALUES (102, 22);
INSERT INTO user_address (user_id, address_id) VALUES (102, 23);
INSERT INTO user_address (user_id, address_id) VALUES (102, 24);
INSERT INTO user_address (user_id, address_id) VALUES (102, 25);
INSERT INTO user_address (user_id, address_id) VALUES (102, 26);
INSERT INTO user_address (user_id, address_id) VALUES (102, 27);
INSERT INTO user_address (user_id, address_id) VALUES (102, 28);
INSERT INTO user_address (user_id, address_id) VALUES (102, 29);
INSERT INTO user_address (user_id, address_id) VALUES (102, 30);
INSERT INTO user_address (user_id, address_id) VALUES (102, 31);
INSERT INTO user_address (user_id, address_id) VALUES (102, 32);
INSERT INTO user_address (user_id, address_id) VALUES (102, 33);
INSERT INTO user_address (user_id, address_id) VALUES (102, 34);
INSERT INTO user_address (user_id, address_id) VALUES (102, 35);
INSERT INTO user_address (user_id, address_id) VALUES (102, 36);
INSERT INTO user_address (user_id, address_id) VALUES (102, 37);
INSERT INTO user_address (user_id, address_id) VALUES (103, 38);
INSERT INTO user_address (user_id, address_id) VALUES (103, 39);
INSERT INTO user_address (user_id, address_id) VALUES (103, 40);
INSERT INTO user_address (user_id, address_id) VALUES (103, 41);
INSERT INTO user_address (user_id, address_id) VALUES (103, 42);
INSERT INTO user_address (user_id, address_id) VALUES (103, 43);
INSERT INTO user_address (user_id, address_id) VALUES (103, 44);
INSERT INTO user_address (user_id, address_id) VALUES (103, 45);
INSERT INTO user_address (user_id, address_id) VALUES (103, 46);
INSERT INTO user_address (user_id, address_id) VALUES (103, 47);
INSERT INTO user_address (user_id, address_id) VALUES (103, 48);
INSERT INTO user_address (user_id, address_id) VALUES (103, 49);
INSERT INTO user_address (user_id, address_id) VALUES (103, 50);
INSERT INTO user_address (user_id, address_id) VALUES (103, 51);
INSERT INTO user_address (user_id, address_id) VALUES (103, 52);
INSERT INTO user_address (user_id, address_id) VALUES (103, 53);
INSERT INTO user_address (user_id, address_id) VALUES (104, 54);
INSERT INTO user_address (user_id, address_id) VALUES (104, 55);
INSERT INTO user_address (user_id, address_id) VALUES (104, 56);
INSERT INTO user_address (user_id, address_id) VALUES (104, 57);
INSERT INTO user_address (user_id, address_id) VALUES (104, 58);
INSERT INTO user_address (user_id, address_id) VALUES (104, 59);
INSERT INTO user_address (user_id, address_id) VALUES (104, 60);
INSERT INTO user_address (user_id, address_id) VALUES (104, 61);
INSERT INTO user_address (user_id, address_id) VALUES (104, 62);
INSERT INTO user_address (user_id, address_id) VALUES (104, 63);
INSERT INTO user_address (user_id, address_id) VALUES (104, 64);
INSERT INTO user_address (user_id, address_id) VALUES (104, 65);
INSERT INTO user_address (user_id, address_id) VALUES (104, 66);
INSERT INTO user_address (user_id, address_id) VALUES (104, 67);
INSERT INTO user_address (user_id, address_id) VALUES (104, 68);
INSERT INTO user_address (user_id, address_id) VALUES (104, 69);
INSERT INTO user_address (user_id, address_id) VALUES (104, 70);
INSERT INTO user_address (user_id, address_id) VALUES (104, 71);
INSERT INTO user_address (user_id, address_id) VALUES (109, 15);
INSERT INTO user_address (user_id, address_id) VALUES (110, 31);
INSERT INTO user_address (user_id, address_id) VALUES (111, 51);
INSERT INTO user_address (user_id, address_id) VALUES (112, 63);
INSERT INTO user_address (user_id, address_id) VALUES (6, 74);
INSERT INTO user_address (user_id, address_id) VALUES (6, 75);


--
-- TOC entry 2403 (class 0 OID 0)
-- Dependencies: 203
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_id_seq', 9, true);


--
-- TOC entry 2376 (class 0 OID 175116)
-- Dependencies: 223
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users (user_id, stripecustomerid, avatar, email, last_login, name, password, phone_number, role, surname, status) VALUES (107, NULL, '', 'manager3@gmail.com', NULL, 'Andriy', '$2a$10$80qxcLmmY3l2DNAS08CeWusfSr/uS1mvt3zBQKSih0fiMwZiEACxS', '+380968780876', 'MANAGER', 'Zagarovskiy', 'ACTIVE');
INSERT INTO users (user_id, stripecustomerid, avatar, email, last_login, name, password, phone_number, role, surname, status) VALUES (108, NULL, '', 'manager4@gmail.com', NULL, 'Viktoriya', '$2a$10$80qxcLmmY3l2DNAS08CeWusfSr/uS1mvt3zBQKSih0fiMwZiEACxS', '+380968780876', 'MANAGER', 'Radashko', 'ACTIVE');
INSERT INTO users (user_id, stripecustomerid, avatar, email, last_login, name, password, phone_number, role, surname, status) VALUES (111, NULL, '', 'inspector3@gmail.com', NULL, 'Olga', '$2a$10$80qxcLmmY3l2DNAS08CeWusfSr/uS1mvt3zBQKSih0fiMwZiEACxS', '+380968780876', 'INSPECTOR', 'Ivanova', 'ACTIVE');
INSERT INTO users (user_id, stripecustomerid, avatar, email, last_login, name, password, phone_number, role, surname, status) VALUES (112, NULL, '', 'inspector4@gmail.com', NULL, 'Volodimir', '$2a$10$80qxcLmmY3l2DNAS08CeWusfSr/uS1mvt3zBQKSih0fiMwZiEACxS', '+380968780876', 'INSPECTOR', 'Golovach', 'ACTIVE');
INSERT INTO users (user_id, stripecustomerid, avatar, email, last_login, name, password, phone_number, role, surname, status) VALUES (110, NULL, '', 'inspector2@gmail.com', '2018-09-04', 'Makar', '$2a$10$80qxcLmmY3l2DNAS08CeWusfSr/uS1mvt3zBQKSih0fiMwZiEACxS', '+380968780876', 'INSPECTOR', 'Portnov', 'ACTIVE');
INSERT INTO users (user_id, stripecustomerid, avatar, email, last_login, name, password, phone_number, role, surname, status) VALUES (102, NULL, '', 'user2@gmail.com', '2018-09-04', 'Valera', '$2a$10$80qxcLmmY3l2DNAS08CeWusfSr/uS1mvt3zBQKSih0fiMwZiEACxS', '+380968780812', 'USER', 'Dobkin', 'ACTIVE');
INSERT INTO users (user_id, stripecustomerid, avatar, email, last_login, name, password, phone_number, role, surname, status) VALUES (103, NULL, '', 'user3@gmail.com', '2018-09-04', 'Pavel', '$2a$10$80qxcLmmY3l2DNAS08CeWusfSr/uS1mvt3zBQKSih0fiMwZiEACxS', '+380968780812', 'USER', 'Chernov', 'ACTIVE');
INSERT INTO users (user_id, stripecustomerid, avatar, email, last_login, name, password, phone_number, role, surname, status) VALUES (104, NULL, '', 'user4@gmail.com', '2018-09-04', 'Germiona', '$2a$10$80qxcLmmY3l2DNAS08CeWusfSr/uS1mvt3zBQKSih0fiMwZiEACxS', '+380968780812', 'USER', 'Potter', 'ACTIVE');
INSERT INTO users (user_id, stripecustomerid, avatar, email, last_login, name, password, phone_number, role, surname, status) VALUES (6, 'cus_DY5FDbJRd7aSjr', '1cOjSmfYn6o_2cZRHGsDWuBnWELfO1eUT', 'perwolod@gmail.com', '2018-09-05', 'Volodymyr', NULL, '+380968780876', 'USER', 'Peron', 'ACTIVE');
INSERT INTO users (user_id, stripecustomerid, avatar, email, last_login, name, password, phone_number, role, surname, status) VALUES (7, 'cus_DY5RqEKOgThvk3', NULL, 'stepanoliinyk09@gmail.com', '2018-09-05', 'Stepan', '$2a$10$wj7RBhVmtaoMcYILZRyGnuPpCyWFcP8QNNvM5Ne/d/Nuf5zmKWKe6', '+380990617322', 'MANAGER', 'Oliinyk', 'ACTIVE');
INSERT INTO users (user_id, stripecustomerid, avatar, email, last_login, name, password, phone_number, role, surname, status) VALUES (5, 'cus_DY4wzsOaPMB05G', NULL, 'andrewzabur@gmail.com', '2018-09-05', 'Andrew', '$2a$10$wKoQbgvbs4DV9UuS1I4sPubxvA9u3hx/o0ENcLKuRVDwlrqtw0ozq', '+380990617321', 'INSPECTOR', 'Zabur', 'ACTIVE');
INSERT INTO users (user_id, stripecustomerid, avatar, email, last_login, name, password, phone_number, role, surname, status) VALUES (2, 'cus_DY3vVMHigoI8C0', 'https://lh4.googleusercontent.com/-N5cRws2iguc/AAAAAAAAAAI/AAAAAAAAAEs/agKNmvdb_xM/s96-c/photo.jpg', 'perd@gmail.com', '2018-09-05', 'Volodymyr', '$2a$10$cXpcA8dKspAIUH60C0H0Au1kOMkjzAhlstR61tDKj21QnEj5C/Qka', '+380968780876', 'USER', 'Peron', 'ACTIVE');
INSERT INTO users (user_id, stripecustomerid, avatar, email, last_login, name, password, phone_number, role, surname, status) VALUES (3, 'cus_DY4VUftPO1zDEw', NULL, 'losi@gmail.com
', '2018-09-05', 'Andrew', '$2a$10$qBnvSFjdOlNvmcStQq/L2.TyjN7vfbNAQ8JX7Zqd7joJOQM1bVxgS', '+380990617321', 'USER', 'Zaburyannii', 'ACTIVE');
INSERT INTO users (user_id, stripecustomerid, avatar, email, last_login, name, password, phone_number, role, surname, status) VALUES (109, NULL, '', 'inspector1@gmail.com', '2018-09-05', 'Oleg', '$2a$10$80qxcLmmY3l2DNAS08CeWusfSr/uS1mvt3zBQKSih0fiMwZiEACxS', '+380968780876', 'INSPECTOR', 'Adamov', 'ACTIVE');
INSERT INTO users (user_id, stripecustomerid, avatar, email, last_login, name, password, phone_number, role, surname, status) VALUES (4, 'cus_DY4c7rKFvVUG8H', NULL, 'stepanoliinyk@gmail.com', '2018-09-05', 'Stepan', '$2a$10$Es5WfmDmPWZOtwfXxKdb6eh81UZT72iR6i3gyBUEXKRg6X.rSTjTy', '+380990617321', 'MANAGER', 'Oliinyk', 'BANNED');
INSERT INTO users (user_id, stripecustomerid, avatar, email, last_login, name, password, phone_number, role, surname, status) VALUES (106, NULL, '', 'manager2@gmail.com', '2018-09-05', 'Ilya', '$2a$10$80qxcLmmY3l2DNAS08CeWusfSr/uS1mvt3zBQKSih0fiMwZiEACxS', '+380968780876', 'MANAGER', 'Sherbunchak', 'ACTIVE');
INSERT INTO users (user_id, stripecustomerid, avatar, email, last_login, name, password, phone_number, role, surname, status) VALUES (8, 'cus_DY5njakVLSsuDC', 'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=676366806064395&height=50&width=50&ext=1538740542&hash=AeTplC7AVM8EuP0P', 'proh8530@gmail.com', '2018-09-05', 'Vlad', NULL, '+380968780876', 'USER', 'Prokhnitsky', 'ACTIVE');
INSERT INTO users (user_id, stripecustomerid, avatar, email, last_login, name, password, phone_number, role, surname, status) VALUES (9, 'cus_DjJIWtefLoSH5E', NULL, 'firstmy555@gmail.com', NULL, 'Halyna', '$2a$10$hbhvgPQLPqivYJq55ovJvu4Fn2n.DrlQoDjN2F98/W.zMfn7OIX0a', '+380956204712', 'USER', 'Melnyk', 'NOT_ACTIVE');
INSERT INTO users (user_id, stripecustomerid, avatar, email, last_login, name, password, phone_number, role, surname, status) VALUES (100, NULL, '1IoLi99zQmYel1fbIB7BSAdTGDOhelCug', 'admin1@gmail.com', '2018-10-05', 'Ivan', '$2a$10$80qxcLmmY3l2DNAS08CeWusfSr/uS1mvt3zBQKSih0fiMwZiEACxS', '+380968780876', 'ADMIN', 'Petrov', 'ACTIVE');
INSERT INTO users (user_id, stripecustomerid, avatar, email, last_login, name, password, phone_number, role, surname, status) VALUES (105, NULL, '', 'manager1@gmail.com', '2018-10-05', 'Viktor', '$2a$10$80qxcLmmY3l2DNAS08CeWusfSr/uS1mvt3zBQKSih0fiMwZiEACxS', '+380968780876', 'MANAGER', 'Volchinskiy', 'ACTIVE');
INSERT INTO users (user_id, stripecustomerid, avatar, email, last_login, name, password, phone_number, role, surname, status) VALUES (101, NULL, '', 'user1@gmail.com', '2018-10-05', 'Mariya', '$2a$10$80qxcLmmY3l2DNAS08CeWusfSr/uS1mvt3zBQKSih0fiMwZiEACxS', '+380968780876', 'USER', 'Chuikina', 'ACTIVE');


--
-- TOC entry 2377 (class 0 OID 175124)
-- Dependencies: 224
-- Data for Name: utilities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO utilities (id, is_active, identification_code, logo, name, phone, web_site, address_id, user_id) VALUES (3, true, '01124343255673', '1eW-PKL1KeSRSsiQmhDqeMx2vpviHYyJb', 'Pat "Chernivtsihaz"', '+380 372 549 004', 'https://cv.104.ua/', 3, 106);
INSERT INTO utilities (id, is_active, identification_code, logo, name, phone, web_site, address_id, user_id) VALUES (4, false, '12345678', NULL, 'Googleplex', '+1 650-253-0000', 'http://www.google.com/', 72, 107);
INSERT INTO utilities (id, is_active, identification_code, logo, name, phone, web_site, address_id, user_id) VALUES (2, true, '12345678', '1FVCq3_XGA_fpe1MaYUfGXGsRPMPnkOPo', 'ДнепрОблЭнерго', '+380 564 046 365', 'http://doe.com.ua/', 2, 105);
INSERT INTO utilities (id, is_active, identification_code, logo, name, phone, web_site, address_id, user_id) VALUES (5, false, '11111111111111111111111', NULL, 'Intelekt - Internet Provayder', '+380 99 704 3200', 'http://www.intelekt.net/', 73, 4);


--
-- TOC entry 2378 (class 0 OID 175132)
-- Dependencies: 225
-- Data for Name: utilities_counters; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 2);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 4);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 13);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 15);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 17);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 19);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 21);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 23);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 25);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 27);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 29);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 31);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 33);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 35);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 37);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 39);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 41);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 43);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 45);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 47);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 49);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 51);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 53);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 55);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 57);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 59);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 61);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 63);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 65);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 67);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 69);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 71);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 73);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 75);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 77);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 79);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 81);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 83);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 85);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 87);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 89);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 91);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 93);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 95);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 97);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 99);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 101);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 103);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 105);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 107);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 109);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 111);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 113);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 115);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 117);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 119);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 121);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 123);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 125);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 127);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 129);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 131);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 133);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 135);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 137);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 139);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 141);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 143);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 145);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 147);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 149);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 151);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 153);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 155);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 157);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 159);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 161);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 163);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 165);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 167);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 169);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 171);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 173);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 175);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 177);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 179);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 181);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 183);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 185);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 187);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 189);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 191);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 193);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 195);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 197);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 199);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 201);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 203);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 205);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 207);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 209);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 211);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 213);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 215);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 217);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 219);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 221);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 223);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 225);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 227);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 229);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 231);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 233);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 235);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 237);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 239);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 241);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (2, 243);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 245);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 247);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 249);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 251);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 253);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 255);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 257);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 259);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 261);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 263);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 265);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 267);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 269);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 271);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 273);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 275);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 277);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (3, 279);
INSERT INTO utilities_counters (utility_id, counter_id) VALUES (5, 281);


--
-- TOC entry 2379 (class 0 OID 175137)
-- Dependencies: 226
-- Data for Name: utilities_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO utilities_users (utility_id, user_id) VALUES (3, 111);
INSERT INTO utilities_users (utility_id, user_id) VALUES (3, 112);
INSERT INTO utilities_users (utility_id, user_id) VALUES (2, 109);
INSERT INTO utilities_users (utility_id, user_id) VALUES (2, 110);
INSERT INTO utilities_users (utility_id, user_id) VALUES (2, 5);


--
-- TOC entry 2404 (class 0 OID 0)
-- Dependencies: 204
-- Name: utility_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('utility_item_id_seq', 5, true);


--
-- TOC entry 2134 (class 2606 OID 175027)
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- TOC entry 2136 (class 2606 OID 175032)
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);


--
-- TOC entry 2138 (class 2606 OID 175037)
-- Name: counters counters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY counters
    ADD CONSTRAINT counters_pkey PRIMARY KEY (id);


--
-- TOC entry 2132 (class 2606 OID 174980)
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- TOC entry 2140 (class 2606 OID 175042)
-- Name: debts debts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY debts
    ADD CONSTRAINT debts_pkey PRIMARY KEY (id);


--
-- TOC entry 2142 (class 2606 OID 175047)
-- Name: email_token email_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY email_token
    ADD CONSTRAINT email_token_pkey PRIMARY KEY (id);


--
-- TOC entry 2146 (class 2606 OID 175052)
-- Name: flat flat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY flat
    ADD CONSTRAINT flat_pkey PRIMARY KEY (id);


--
-- TOC entry 2148 (class 2606 OID 175057)
-- Name: house house_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY house
    ADD CONSTRAINT house_pkey PRIMARY KEY (id);


--
-- TOC entry 2150 (class 2606 OID 175062)
-- Name: new_prices new_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY new_prices
    ADD CONSTRAINT new_prices_pkey PRIMARY KEY (new_price_id);


--
-- TOC entry 2152 (class 2606 OID 175067)
-- Name: payments_histories payments_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY payments_histories
    ADD CONSTRAINT payments_histories_pkey PRIMARY KEY (id);


--
-- TOC entry 2154 (class 2606 OID 175072)
-- Name: prices prices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prices
    ADD CONSTRAINT prices_pkey PRIMARY KEY (price_id);


--
-- TOC entry 2160 (class 2606 OID 175082)
-- Name: rating_list_item rating_list_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rating_list_item
    ADD CONSTRAINT rating_list_item_pkey PRIMARY KEY (id);


--
-- TOC entry 2156 (class 2606 OID 175077)
-- Name: rating rating_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rating
    ADD CONSTRAINT rating_pkey PRIMARY KEY (id);


--
-- TOC entry 2162 (class 2606 OID 175087)
-- Name: region region_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY region
    ADD CONSTRAINT region_pkey PRIMARY KEY (id);


--
-- TOC entry 2164 (class 2606 OID 175095)
-- Name: schedule_history schedule_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY schedule_history
    ADD CONSTRAINT schedule_history_pkey PRIMARY KEY (id);


--
-- TOC entry 2166 (class 2606 OID 175100)
-- Name: schedules schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY schedules
    ADD CONSTRAINT schedules_pkey PRIMARY KEY (id);


--
-- TOC entry 2168 (class 2606 OID 175105)
-- Name: street street_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY street
    ADD CONSTRAINT street_pkey PRIMARY KEY (id);


--
-- TOC entry 2144 (class 2606 OID 175141)
-- Name: email_token uk_668u0bx7e9egiitqc9qb81f2m; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY email_token
    ADD CONSTRAINT uk_668u0bx7e9egiitqc9qb81f2m UNIQUE (user_id);


--
-- TOC entry 2174 (class 2606 OID 175143)
-- Name: users uk_6dotkott2kjsp8vw4d0m25fb7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT uk_6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email);


--
-- TOC entry 2158 (class 2606 OID 175145)
-- Name: rating uk_8dfu35xwik8uwlrdloci4ok2i; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rating
    ADD CONSTRAINT uk_8dfu35xwik8uwlrdloci4ok2i UNIQUE (user_id);


--
-- TOC entry 2180 (class 2606 OID 175147)
-- Name: utilities_counters uk_fgmup9aa43riapctj438a4496; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY utilities_counters
    ADD CONSTRAINT uk_fgmup9aa43riapctj438a4496 UNIQUE (counter_id);


--
-- TOC entry 2184 (class 2606 OID 175149)
-- Name: utilities_users uk_ln32yb3toibbu0u8dhy2y53s4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY utilities_users
    ADD CONSTRAINT uk_ln32yb3toibbu0u8dhy2y53s4 UNIQUE (user_id);


--
-- TOC entry 2170 (class 2606 OID 175110)
-- Name: unscheduled_addresses unscheduled_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unscheduled_addresses
    ADD CONSTRAINT unscheduled_addresses_pkey PRIMARY KEY (id);


--
-- TOC entry 2172 (class 2606 OID 175115)
-- Name: user_address user_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_address
    ADD CONSTRAINT user_address_pkey PRIMARY KEY (user_id, address_id);


--
-- TOC entry 2176 (class 2606 OID 175123)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 2182 (class 2606 OID 175136)
-- Name: utilities_counters utilities_counters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY utilities_counters
    ADD CONSTRAINT utilities_counters_pkey PRIMARY KEY (utility_id, counter_id);


--
-- TOC entry 2178 (class 2606 OID 175131)
-- Name: utilities utilities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY utilities
    ADD CONSTRAINT utilities_pkey PRIMARY KEY (id);


--
-- TOC entry 2217 (class 2606 OID 175150)
-- Name: utilities_counters fk1807atc0qcnw4yovwh8d72obe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY utilities_counters
    ADD CONSTRAINT fk1807atc0qcnw4yovwh8d72obe FOREIGN KEY (counter_id) REFERENCES counters(id);


--
-- TOC entry 2215 (class 2606 OID 175155)
-- Name: utilities fk1s0qikif4q73e9ymphj9cep4p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY utilities
    ADD CONSTRAINT fk1s0qikif4q73e9ymphj9cep4p FOREIGN KEY (address_id) REFERENCES addresses(id);


--
-- TOC entry 2199 (class 2606 OID 175160)
-- Name: payments_histories fk2lx5m7ip5f9y5nq96ergaj44y; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY payments_histories
    ADD CONSTRAINT fk2lx5m7ip5f9y5nq96ergaj44y FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- TOC entry 2190 (class 2606 OID 175165)
-- Name: city fk3rysom5kikyjkau1g51atih4h; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY city
    ADD CONSTRAINT fk3rysom5kikyjkau1g51atih4h FOREIGN KEY (region_id) REFERENCES region(id);


--
-- TOC entry 2206 (class 2606 OID 175170)
-- Name: schedule_history fk3va03xy5c6s0k6a5phv6f92ex; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY schedule_history
    ADD CONSTRAINT fk3va03xy5c6s0k6a5phv6f92ex FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- TOC entry 2185 (class 2606 OID 175175)
-- Name: addresses fk4rstcb49bt870l35ywo8f9e9j; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT fk4rstcb49bt870l35ywo8f9e9j FOREIGN KEY (city_id) REFERENCES city(id);


--
-- TOC entry 2191 (class 2606 OID 175180)
-- Name: counters fk5flcne9xrqwg51vt6o2mdwe5w; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY counters
    ADD CONSTRAINT fk5flcne9xrqwg51vt6o2mdwe5w FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- TOC entry 2192 (class 2606 OID 175185)
-- Name: counters fk7b2k5pjmx35h699d3bnsrts9p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY counters
    ADD CONSTRAINT fk7b2k5pjmx35h699d3bnsrts9p FOREIGN KEY (debt_id) REFERENCES debts(id);


--
-- TOC entry 2198 (class 2606 OID 175190)
-- Name: new_prices fk7nubylk92k2p7mjr80yjgqg3q; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY new_prices
    ADD CONSTRAINT fk7nubylk92k2p7mjr80yjgqg3q FOREIGN KEY (current_price_id) REFERENCES prices(price_id);


--
-- TOC entry 2219 (class 2606 OID 175195)
-- Name: utilities_users fk8sxifmm14rrcuf3pf0im7ndoe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY utilities_users
    ADD CONSTRAINT fk8sxifmm14rrcuf3pf0im7ndoe FOREIGN KEY (utility_id) REFERENCES utilities(id);


--
-- TOC entry 2186 (class 2606 OID 175200)
-- Name: addresses fk9chsbxenbwylf5cp6dqya31jf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT fk9chsbxenbwylf5cp6dqya31jf FOREIGN KEY (street_id) REFERENCES street(id);


--
-- TOC entry 2194 (class 2606 OID 175205)
-- Name: debts fk9svo04byim1ukeihaoul4oc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY debts
    ADD CONSTRAINT fk9svo04byim1ukeihaoul4oc FOREIGN KEY (utility_id) REFERENCES utilities(id) ON UPDATE SET NULL ON DELETE SET NULL;


--
-- TOC entry 2204 (class 2606 OID 175210)
-- Name: rating_list_item fka1ppwb9e47k1sypbswhcusxb3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rating_list_item
    ADD CONSTRAINT fka1ppwb9e47k1sypbswhcusxb3 FOREIGN KEY (rater_user_id) REFERENCES users(user_id);


--
-- TOC entry 2200 (class 2606 OID 175215)
-- Name: payments_histories fkafewohdk7acusgg8k2s3r1l7r; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY payments_histories
    ADD CONSTRAINT fkafewohdk7acusgg8k2s3r1l7r FOREIGN KEY (utility_id) REFERENCES utilities(id);


--
-- TOC entry 2218 (class 2606 OID 175220)
-- Name: utilities_counters fkawfg0ahidksvxwd24cvdsr6c0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY utilities_counters
    ADD CONSTRAINT fkawfg0ahidksvxwd24cvdsr6c0 FOREIGN KEY (utility_id) REFERENCES utilities(id);


--
-- TOC entry 2197 (class 2606 OID 175225)
-- Name: house fkcj5nnv2nm4dimlo9ov3mt8kjg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY house
    ADD CONSTRAINT fkcj5nnv2nm4dimlo9ov3mt8kjg FOREIGN KEY (street_id) REFERENCES street(id);


--
-- TOC entry 2208 (class 2606 OID 175230)
-- Name: schedules fkd4y4xekwahv9boo6lc8gfl3jv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY schedules
    ADD CONSTRAINT fkd4y4xekwahv9boo6lc8gfl3jv FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- TOC entry 2193 (class 2606 OID 175235)
-- Name: counters fkdey6ejyym3w93sarow2sivb4h; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY counters
    ADD CONSTRAINT fkdey6ejyym3w93sarow2sivb4h FOREIGN KEY (address_id) REFERENCES addresses(id);


--
-- TOC entry 2205 (class 2606 OID 175240)
-- Name: rating_list_item fkesrcypnm210jbkj07wsnojyll; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rating_list_item
    ADD CONSTRAINT fkesrcypnm210jbkj07wsnojyll FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- TOC entry 2203 (class 2606 OID 175245)
-- Name: rating fkf68lgbsbxl310n0jifwpfqgfh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rating
    ADD CONSTRAINT fkf68lgbsbxl310n0jifwpfqgfh FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- TOC entry 2210 (class 2606 OID 175250)
-- Name: street fkgn6qy2xi8r62dxucjyaq0rupy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY street
    ADD CONSTRAINT fkgn6qy2xi8r62dxucjyaq0rupy FOREIGN KEY (city_id) REFERENCES city(id);


--
-- TOC entry 2187 (class 2606 OID 175255)
-- Name: addresses fkhq39i05aq7366x18ru89sik51; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT fkhq39i05aq7366x18ru89sik51 FOREIGN KEY (flat_id) REFERENCES flat(id);


--
-- TOC entry 2201 (class 2606 OID 175260)
-- Name: payments_histories fkidj1l09jakrmgpalej5uxnlp2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY payments_histories
    ADD CONSTRAINT fkidj1l09jakrmgpalej5uxnlp2 FOREIGN KEY (address_id) REFERENCES addresses(id);


--
-- TOC entry 2209 (class 2606 OID 175265)
-- Name: schedules fkj5rgo1khgty8s38nw6ux1usv6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY schedules
    ADD CONSTRAINT fkj5rgo1khgty8s38nw6ux1usv6 FOREIGN KEY (address_id) REFERENCES addresses(id);


--
-- TOC entry 2202 (class 2606 OID 175270)
-- Name: prices fkjbbte4nqcj5n2gko518atefsl; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY prices
    ADD CONSTRAINT fkjbbte4nqcj5n2gko518atefsl FOREIGN KEY (utility_id) REFERENCES utilities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2207 (class 2606 OID 175275)
-- Name: schedule_history fkky79w5lor3qgkpqrkraxgftdp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY schedule_history
    ADD CONSTRAINT fkky79w5lor3qgkpqrkraxgftdp FOREIGN KEY (address_id) REFERENCES addresses(id);


--
-- TOC entry 2211 (class 2606 OID 175280)
-- Name: unscheduled_addresses fklm0ifg7xay037fq572b6tl1l2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unscheduled_addresses
    ADD CONSTRAINT fklm0ifg7xay037fq572b6tl1l2 FOREIGN KEY (address_id) REFERENCES addresses(id);


--
-- TOC entry 2212 (class 2606 OID 175285)
-- Name: unscheduled_addresses fklo3kiqrca55n1n0ddc55dy519; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unscheduled_addresses
    ADD CONSTRAINT fklo3kiqrca55n1n0ddc55dy519 FOREIGN KEY (utility_id) REFERENCES utilities(id);


--
-- TOC entry 2188 (class 2606 OID 175290)
-- Name: addresses fkmujmyxuagrc4msdogdce6urgr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT fkmujmyxuagrc4msdogdce6urgr FOREIGN KEY (house_id) REFERENCES house(id);


--
-- TOC entry 2189 (class 2606 OID 175295)
-- Name: addresses fkndvlc3rh41djfy85er0n14exa; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT fkndvlc3rh41djfy85er0n14exa FOREIGN KEY (region_id) REFERENCES region(id);


--
-- TOC entry 2196 (class 2606 OID 175300)
-- Name: flat fkp650eo25rh3tg2lsqx1x25a7p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY flat
    ADD CONSTRAINT fkp650eo25rh3tg2lsqx1x25a7p FOREIGN KEY (house_id) REFERENCES house(id);


--
-- TOC entry 2220 (class 2606 OID 175305)
-- Name: utilities_users fkpkyn4k5o7a7c7lbb0lv9ijkq6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY utilities_users
    ADD CONSTRAINT fkpkyn4k5o7a7c7lbb0lv9ijkq6 FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- TOC entry 2195 (class 2606 OID 175310)
-- Name: email_token fkpnii9y1irxajhpost9fjubflx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY email_token
    ADD CONSTRAINT fkpnii9y1irxajhpost9fjubflx FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- TOC entry 2213 (class 2606 OID 175315)
-- Name: user_address fkpv7y2l6mvly37lngi3doarqhd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_address
    ADD CONSTRAINT fkpv7y2l6mvly37lngi3doarqhd FOREIGN KEY (address_id) REFERENCES addresses(id);


--
-- TOC entry 2216 (class 2606 OID 175320)
-- Name: utilities fkrgy0b1dp0vgr26yruh73a4lac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY utilities
    ADD CONSTRAINT fkrgy0b1dp0vgr26yruh73a4lac FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- TOC entry 2214 (class 2606 OID 175325)
-- Name: user_address fkrmincuqpi8m660j1c57xj7twr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_address
    ADD CONSTRAINT fkrmincuqpi8m660j1c57xj7twr FOREIGN KEY (user_id) REFERENCES users(user_id);


-- Completed on 2018-11-27 19:05:17

--
-- PostgreSQL database dump complete
--

