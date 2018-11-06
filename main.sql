--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.8
-- Dumped by pg_dump version 9.6.8

-- Started on 2018-11-06 16:05:54

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
-- TOC entry 2168 (class 1262 OID 117331)
-- Name: dance-scheduler; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "dance-scheduler" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Hungarian_Hungary.1250' LC_CTYPE = 'Hungarian_Hungary.1250';


ALTER DATABASE "dance-scheduler" OWNER TO postgres;

\connect -reuse-previous=on "dbname='dance-scheduler'"

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
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2170 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 117345)
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment (
    name character varying(512) NOT NULL,
    comment character varying(5000) NOT NULL,
    created_date timestamp without time zone NOT NULL,
    on_page character varying(127) NOT NULL,
    id bigint NOT NULL
);


ALTER TABLE public.comment OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 117398)
-- Name: comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_id_seq OWNER TO postgres;

--
-- TOC entry 2171 (class 0 OID 0)
-- Dependencies: 190
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comment_id_seq OWNED BY public.comment.id;


--
-- TOC entry 189 (class 1259 OID 117371)
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    serial_id bigint NOT NULL,
    name character varying(300) NOT NULL,
    year smallint NOT NULL,
    month_list character varying(12) NOT NULL
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 117369)
-- Name: payment_serial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_serial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_serial_id_seq OWNER TO postgres;

--
-- TOC entry 2172 (class 0 OID 0)
-- Dependencies: 188
-- Name: payment_serial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_serial_id_seq OWNED BY public.payment.serial_id;


--
-- TOC entry 191 (class 1259 OID 125570)
-- Name: personal_class; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_class (
    start character varying(300) NOT NULL,
    end_ character varying(300) NOT NULL,
    title character varying(255) NOT NULL,
    color character varying(127) NOT NULL,
    id character varying(255) NOT NULL,
    cssclass character varying(255) NOT NULL,
    serial_id bigint NOT NULL
);


ALTER TABLE public.personal_class OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 125579)
-- Name: personal_class_serial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_class_serial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_class_serial_id_seq OWNER TO postgres;

--
-- TOC entry 2173 (class 0 OID 0)
-- Dependencies: 192
-- Name: personal_class_serial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_class_serial_id_seq OWNED BY public.personal_class.serial_id;


--
-- TOC entry 187 (class 1259 OID 117356)
-- Name: timetable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.timetable (
    serial_id bigint NOT NULL,
    start character varying(300) NOT NULL,
    end_ character varying(300) NOT NULL,
    title character varying(255) NOT NULL,
    color character varying(64) NOT NULL,
    id character varying(255) NOT NULL,
    cssclass character varying(255) NOT NULL
);


ALTER TABLE public.timetable OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 117354)
-- Name: timetable_serial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.timetable_serial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.timetable_serial_id_seq OWNER TO postgres;

--
-- TOC entry 2174 (class 0 OID 0)
-- Dependencies: 186
-- Name: timetable_serial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.timetable_serial_id_seq OWNED BY public.timetable.serial_id;


--
-- TOC entry 2022 (class 2604 OID 117400)
-- Name: comment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment ALTER COLUMN id SET DEFAULT nextval('public.comment_id_seq'::regclass);


--
-- TOC entry 2024 (class 2604 OID 117374)
-- Name: payment serial_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment ALTER COLUMN serial_id SET DEFAULT nextval('public.payment_serial_id_seq'::regclass);


--
-- TOC entry 2025 (class 2604 OID 125581)
-- Name: personal_class serial_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_class ALTER COLUMN serial_id SET DEFAULT nextval('public.personal_class_serial_id_seq'::regclass);


--
-- TOC entry 2023 (class 2604 OID 117359)
-- Name: timetable serial_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable ALTER COLUMN serial_id SET DEFAULT nextval('public.timetable_serial_id_seq'::regclass);


--
-- TOC entry 2155 (class 0 OID 117345)
-- Dependencies: 185
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.comment VALUES ('Géza', 'Test comment in DB 2', '2018-05-09 10:00:00', 'time-table', 2);
INSERT INTO public.comment VALUES ('Béla', 'Test comment in DB 1', '2018-11-04 20:32:17.447245', 'time-table', 1);
INSERT INTO public.comment VALUES ('ADMIN', 'Test on personal-classes page', '2018-11-05 14:10:50.287', 'personal-classes', 7);
INSERT INTO public.comment VALUES ('ADMIN', 'Once more', '2018-11-05 14:18:47.486', 'personal-classes', 9);
INSERT INTO public.comment VALUES ('ADMIN', 'Once more', '2018-11-05 14:19:03.535', 'personal-classes', 10);
INSERT INTO public.comment VALUES ('ADMIN', 'jk', '2018-11-05 14:23:45.84', 'time-table', 11);
INSERT INTO public.comment VALUES ('ADMIN', 'sthg', '2018-11-05 14:30:36.158', 'time-table', 12);
INSERT INTO public.comment VALUES ('ADMIN', 'fdgdfg', '2018-11-05 14:30:59.381', 'personal-classes', 13);
INSERT INTO public.comment VALUES ('ADMIN', 'Parameterized query
If you are passing parameters to your queries you will want to avoid string concatenating parameters into the query text directly. This can (and often does) lead to sql injection vulnerabilities. node-postgres supports paramterized queries, passing your query text unaltered as well as your parameters to the PostgreSQL server where the parameters are safely substituted into the query with battle-tested parameter substitution code within the server itself.', '2018-11-05 14:31:59.532', 'personal-classes', 14);
INSERT INTO public.comment VALUES ('ADMIN', 'ffg', '2018-11-05 14:34:50.115', 'personal-classes', 15);
INSERT INTO public.comment VALUES ('ADMIN', 'btn-darkbtn-darkbtn-darkbtn-darkbtn-darkbtn-dark
btn-darkbtn-dark
v
btn-darkbtn-darkbtn-darkbtn-dark', '2018-11-05 14:38:08.241', 'time-table', 16);
INSERT INTO public.comment VALUES ('ADMIN', 'this.change.detectChanges();this.change.detectChanges();this.change.detectChanges();this.change.detectChanges();
this.change.detectChanges();
this.change.detectChanges();
this.change.detectChanges();
this.change.detectChanges();
this.change.detectChanges();this.change.detectChanges();this.change.detectChanges();', '2018-11-05 14:39:02.977', 'time-table', 17);
INSERT INTO public.comment VALUES ('ADMIN', 'this.change.detectChanges();this.change.detectChanges();this.change.detectChanges();this.change.detectChanges();
vthis.change.detectChanges();this.change.detectChanges();this.change.detectChanges();this.change.detectChanges();
vthis.change.detectChanges();this.change.detectChanges();', '2018-11-05 14:40:24.575', 'time-table', 18);
INSERT INTO public.comment VALUES ('ADMIN', 'If someone hasn''t logged into your app yet, they''ll see this button, and clicking it will open a Login dialog, starting the login flow. People who have already logged in won''t see any button, or you can also choose to show a logout button to them.

If you show a logout button, when people use it to log out, they log out both from your app and from Facebook.

The Login button is only designed to work in connection with the JavaScript SDK — if you''re building a mobile app or can''t use our JavaScript SDK, you should follow the login flow guide for that type of app instead.

The Continue with Facebook button replaces earlier versions of the Login button. For more information, see Migration.', '2018-11-05 14:41:53.478', 'time-table', 19);
INSERT INTO public.comment VALUES ('ADMIN', 'If someone hasn''t logged into your app yet, they''ll see this button, and clicking it will open a Login dialog, starting the login flow. People who have already logged in won''t see any button, or you can also choose to show a logout button to them.

If you show a logout button, when people use it to log out, they log out both from your app and from Facebook.

The Login button is only designed to work in connection with the JavaScript SDK — if you''re building a mobile app or can''t use our JavaScript SDK, you should follow the login flow guide for that type of app instead.

The Continue with Facebook button replaces earlier versions of the Login button. For more information, see Migration.', '2018-11-05 14:43:25.742', 'personal-classes', 20);
INSERT INTO public.comment VALUES ('ADMIN', '<script>alert("Torpe buzi")</script>', '2018-11-05 15:17:28.629', 'time-table', 21);


--
-- TOC entry 2175 (class 0 OID 0)
-- Dependencies: 190
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_id_seq', 21, true);


--
-- TOC entry 2159 (class 0 OID 117371)
-- Dependencies: 189
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.payment VALUES (1, 'Dansator DB 1', 2018, 'TTTFFFFFFFFF');


--
-- TOC entry 2176 (class 0 OID 0)
-- Dependencies: 188
-- Name: payment_serial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_serial_id_seq', 1, false);


--
-- TOC entry 2161 (class 0 OID 125570)
-- Dependencies: 191
-- Data for Name: personal_class; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.personal_class VALUES ('Tue Nov 06 2018 14:30:00', 'Tue Nov 06 2018 15:15:00', 'Robi és Vivi órázik Robival', '{"primary": "#ffd700", "secondary": "#ffd755"}', '3', 'event-element', 2);
INSERT INTO public.personal_class VALUES ('Mon Nov 05 2018 14:30:00', 'Mon Nov 05 2018 15:15:00', 'Dani és Ági órázik Anitával', '{"primary": "#cc98e5", "secondary": "#cf98ef"}', '1', 'event-element', 1);
INSERT INTO public.personal_class VALUES ('Fri Nov 09 2018 17:15:00', 'Fri Nov 09 2018 18:00:00', 'Máté és Kinga órázik Csongorral', '{"primary": "#6495ed", "secondary": "#6495ff"}', '2', 'event-element', 3);


--
-- TOC entry 2177 (class 0 OID 0)
-- Dependencies: 192
-- Name: personal_class_serial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_class_serial_id_seq', 24, true);


--
-- TOC entry 2157 (class 0 OID 117356)
-- Dependencies: 187
-- Data for Name: timetable; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.timetable VALUES (1, '[0, 17, 30]', '[0, 18, 30]', 'Erőnléti Kittivel', '{"primary": "#be4a47", "secondary": "#ff4a47"}', 'Erőnléti Kittivel555', 'event-element');
INSERT INTO public.timetable VALUES (2, '[0, 18, 30]', '[0, 19, 30]', 'Standard Edzés', '{"primary": "#6495ed", "secondary": "#6495ff"}', 'Standard Edzés465', 'event-element');
INSERT INTO public.timetable VALUES (4, '[2, 17, 30]', '[2, 18, 30]', 'Erőnléti Ádámmal', '{"primary": "#8b3a3a", "secondary": "#cb3a3a"}', 'Erőnléti Ádámmal084', 'event-element');
INSERT INTO public.timetable VALUES (3, '[1, 18, 30]', '[1, 19, 30]', 'Standard Közös óra', '{"primary": "#03396c", "secondary": "#03398f"}', 'Standard Közös óra10185', 'event-element');
INSERT INTO public.timetable VALUES (5, '[2, 18, 30]', '[2, 19, 30]', 'Latin Edzés', '{"primary": "#ed7f00", "secondary": "#ff7f00"}', 'Latin Edzés65465', 'event-element');
INSERT INTO public.timetable VALUES (6, '[3, 17, 30]', '[3, 18, 30]', 'Zumba', '{"primary": "#cc98e5", "secondary": "#cf98ef"}', 'Zumba123', 'event-element');
INSERT INTO public.timetable VALUES (7, '[3, 18, 30]', '[3, 19, 30]', 'Latin Közös óra', '{"primary": "#ffd700", "secondary": "#ffd755"}', 'Latin Közös óra1646', 'event-element');
INSERT INTO public.timetable VALUES (8, '[4, 17, 30]', '[4, 18, 30]', 'Standard Edzés', '{"primary": "#6495ed", "secondary": "#6495ff"}', 'Standard Edzés467', 'event-element');
INSERT INTO public.timetable VALUES (9, '[4, 18, 30]', '[4, 19, 30]', 'Latin Edzés', '{"primary": "#ed7f00", "secondary": "#ff7f00"}', 'Latin Edzés65477', 'event-element');


--
-- TOC entry 2178 (class 0 OID 0)
-- Dependencies: 186
-- Name: timetable_serial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.timetable_serial_id_seq', 1, false);


--
-- TOC entry 2027 (class 2606 OID 117408)
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- TOC entry 2035 (class 2606 OID 117376)
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (serial_id);


--
-- TOC entry 2037 (class 2606 OID 125589)
-- Name: personal_class personal_class_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_class
    ADD CONSTRAINT personal_class_pkey PRIMARY KEY (serial_id);


--
-- TOC entry 2029 (class 2606 OID 117368)
-- Name: timetable timetable_end__key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT timetable_end__key UNIQUE (end_);


--
-- TOC entry 2031 (class 2606 OID 117364)
-- Name: timetable timetable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT timetable_pkey PRIMARY KEY (serial_id);


--
-- TOC entry 2033 (class 2606 OID 117366)
-- Name: timetable timetable_start_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT timetable_start_key UNIQUE (start);


-- Completed on 2018-11-06 16:05:54

--
-- PostgreSQL database dump complete
--

