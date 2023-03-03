--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer,
    token text,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
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
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text,
    email text NOT NULL,
    "hashPassword" text,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
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
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 52, '5caf7a89-3031-41ad-b8e5-a6903be68fc5', '2023-03-03 05:37:03.709148');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'João Silva', 'joao.silva@example.com', '123456', '2023-03-02 03:43:13.536892');
INSERT INTO public.users VALUES (2, 'Maria Souza', 'maria.souza@example.com', 'abcdef', '2023-03-02 03:43:13.536892');
INSERT INTO public.users VALUES (3, 'Pedro Santos', 'pedro.santos@example.com', '7890xyz', '2023-03-02 03:43:13.536892');
INSERT INTO public.users VALUES (8, 'carlossddspo', 'maiksey@g.com', '$2b$10$KBImTGsxd.UVR7bmEMvNvO7r6F8bGY9lev6SgOZJKO2SFK9Jlj8qa', '2023-03-03 01:37:46.769531');
INSERT INTO public.users VALUES (49, 'dada', 'ssfa@ffsfg.com', '$2b$10$kSUftLLL/ye8n6hSe.iDHeXrrLjKm5ZWFVIQF/OrVNgp4KCORaIte', '2023-03-03 04:45:02.71343');
INSERT INTO public.users VALUES (50, 'hi', 'ssfa@fsfg.com', '$2b$10$KVEWlBIbXPl4xDHtvwB.QuH0Gh71ZOefih.z4NU1dnMnXl5WoBfxO', '2023-03-03 04:45:28.118799');
INSERT INTO public.users VALUES (51, 'f', 'ssa@fsfg.com', '$2b$10$wxinVqUHe0g6p84J7Q6Hoe5dCQ5I.qyQmYBYwL3g0vD9lj4f04/pu', '2023-03-03 04:46:59.097939');
INSERT INTO public.users VALUES (52, 'ipdec', 'ipdec@g.com', '$2b$10$TQv1AVkaT3jZoW5F4qwb4Ot36o/tL8DVp/3OkFgPx/OtT8ctjN/ye', '2023-03-03 04:47:28.89506');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 52, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

