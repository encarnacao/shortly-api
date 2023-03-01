--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.links (
    id integer NOT NULL,
    url text NOT NULL,
    "shortUrl" character varying(8) NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2023-03-01 11:28:38.183276'::timestamp without time zone NOT NULL
);


--
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.links_id_seq OWNED BY public.links.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token character varying(36) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2023-03-01 11:28:38.164615'::timestamp without time zone NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: userLinks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."userLinks" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "linkId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2023-03-01 11:28:38.202863'::timestamp without time zone NOT NULL
);


--
-- Name: userLinks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."userLinks_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: userLinks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."userLinks_id_seq" OWNED BY public."userLinks".id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(60) NOT NULL,
    password character varying(60) NOT NULL,
    name character varying(50) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2023-03-01 11:28:38.140232'::timestamp without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links ALTER COLUMN id SET DEFAULT nextval('public.links_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: userLinks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."userLinks" ALTER COLUMN id SET DEFAULT nextval('public."userLinks_id_seq"'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.links VALUES (1, 'https://pbs.twimg.com/media/FpfqFNaXwAIHa1U?format=jpg&name=4096x4096', 'x_lQ2wX8', 3, '2023-03-01 11:28:38.183276');
INSERT INTO public.links VALUES (2, 'https://github.com/encarnacao/shortly-api', 'JpeY5CEj', 2, '2023-03-01 11:28:38.183276');
INSERT INTO public.links VALUES (3, 'https://github.com/encarnacao/', 'TZKBS3nD', 7, '2023-03-01 11:28:38.183276');


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 1, '041a4d96-8bde-4edc-b815-639c7d8f0be3', '2023-03-01 11:28:38.164615');
INSERT INTO public.sessions VALUES (2, 2, '0d43d86b-c20e-43c7-abd2-8b8caee48316', '2023-03-01 11:28:38.164615');


--
-- Data for Name: userLinks; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."userLinks" VALUES (1, 1, 1, '2023-03-01 11:28:38.202863');
INSERT INTO public."userLinks" VALUES (2, 1, 2, '2023-03-01 11:28:38.202863');
INSERT INTO public."userLinks" VALUES (3, 2, 3, '2023-03-01 11:28:38.202863');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'caio@caio.com', '$2b$10$BGGyrhCp50IGIQAiPko5BupHRRMnRW0fFTWKZdVjf5h3u9ykn8l6O', 'Caio', '2023-03-01 11:28:38.140232');
INSERT INTO public.users VALUES (2, 'teste@teste.com', '$2b$10$2h4ox6FpvrECdOL7A5JcUuLJImsQQlFZcT3RihUuG8qrNYg1UlOvO', 'Teste', '2023-03-01 11:28:38.140232');


--
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.links_id_seq', 3, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 2, true);


--
-- Name: userLinks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."userLinks_id_seq"', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: links links_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_pk PRIMARY KEY (id);


--
-- Name: links links_shortUrl_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT "links_shortUrl_key" UNIQUE ("shortUrl");


--
-- Name: sessions sessions_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pk PRIMARY KEY (id);


--
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- Name: sessions sessions_userId_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_key" UNIQUE ("userId");


--
-- Name: userLinks userLinks_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."userLinks"
    ADD CONSTRAINT "userLinks_pk" PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- Name: sessions sessions_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: userLinks userLinks_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."userLinks"
    ADD CONSTRAINT "userLinks_fk0" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: userLinks userLinks_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."userLinks"
    ADD CONSTRAINT "userLinks_fk1" FOREIGN KEY ("linkId") REFERENCES public.links(id);


--
-- PostgreSQL database dump complete
--

