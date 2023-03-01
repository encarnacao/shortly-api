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
    "createdAt" date DEFAULT '2023-02-28'::date NOT NULL
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
    "createdAt" date DEFAULT '2023-02-28'::date NOT NULL
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
    "createdAt" date DEFAULT '2023-02-28'::date NOT NULL
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
    "createdAt" date DEFAULT '2023-02-28'::date NOT NULL
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

INSERT INTO public.links VALUES (12, 'https://pbs.twimg.com/profile_images/1512280642263920640/ymvgzZIc_400x400.jpg', 'lBDfb7FQ', 0, '2023-02-28');
INSERT INTO public.links VALUES (13, 'https://pbs.twimg.com/media/FqAjr-tXoAIgUIP?format=png&name=small', 'uvboOugm', 0, '2023-02-28');
INSERT INTO public.links VALUES (14, 'https://pbs.twimg.com/media/FpiEM3eXwAAbZIs?format=png&name=small', 'eDDHgoZO', 0, '2023-02-28');
INSERT INTO public.links VALUES (11, 'https://sm.ign.com/t/ign_br/news/s/sonic-cent/sonic-central-2022-everything-announced-including-sonic-prim_ed6t.h720.jpg', '8tBJRGs2', 1, '2023-02-28');
INSERT INTO public.links VALUES (15, 'https://pbs.twimg.com/media/FpfqFNaXwAIHa1U?format=jpg&name=4096x4096', 'azBoPXxH', 2, '2023-02-28');


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (5, 2, '2b58b6b8-eb98-4512-af36-36cac38670e8', '2023-02-28');
INSERT INTO public.sessions VALUES (6, 1, '5675f252-3fbb-4dbf-84c3-b61060834d56', '2023-02-28');


--
-- Data for Name: userLinks; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."userLinks" VALUES (10, 2, 11, '2023-02-28');
INSERT INTO public."userLinks" VALUES (11, 1, 12, '2023-02-28');
INSERT INTO public."userLinks" VALUES (12, 1, 13, '2023-02-28');
INSERT INTO public."userLinks" VALUES (13, 1, 14, '2023-02-28');
INSERT INTO public."userLinks" VALUES (14, 2, 15, '2023-02-28');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'caio@caio.com', '$2b$10$T9fwifWSr4pNESzVkq2jHe4GjzgZWDhue4Eq5mJ7RMG5w6o6yeNGi', 'Caio', '2023-02-28');
INSERT INTO public.users VALUES (2, 'caiao@caio.com', '$2b$10$.7FHPt4tlF5eo/nPl.lk..mVw2MBj3/2KVM4MzIB2CJVymyCofAcW', 'Caiao', '2023-02-28');


--
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.links_id_seq', 15, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 6, true);


--
-- Name: userLinks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."userLinks_id_seq"', 14, true);


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

