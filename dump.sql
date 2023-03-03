--
-- PostgreSQL database dump
--

-- Dumped from database version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)

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
-- Name: shorturls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shorturls (
    id integer NOT NULL,
    "userId" integer,
    "shortURL" text NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: shorturls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.shorturls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shorturls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.shorturls_id_seq OWNED BY public.shorturls.id;


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    "userId" integer,
    url text NOT NULL,
    "shortUrlId" integer,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


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
-- Name: shorturls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shorturls ALTER COLUMN id SET DEFAULT nextval('public.shorturls_id_seq'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 52, '5caf7a89-3031-41ad-b8e5-a6903be68fc5', '2023-03-03 05:37:03.709148');
INSERT INTO public.sessions VALUES (2, 53, '6f25fd95-53f2-49ce-a80c-6b0ea12658f5', '2023-03-03 11:30:22.255899');
INSERT INTO public.sessions VALUES (3, 53, '2c72283d-4371-46fb-97be-a1b22181cc47', '2023-03-03 11:33:28.9642');
INSERT INTO public.sessions VALUES (4, 53, 'cce962c4-d5ea-40af-9588-2a63c8d9d950', '2023-03-03 11:33:40.880159');
INSERT INTO public.sessions VALUES (5, 54, '53c7b5d4-ad22-41f3-96db-008e5ed1e95b', '2023-03-03 11:53:53.522355');
INSERT INTO public.sessions VALUES (6, 54, 'd25b27fe-9037-4594-9575-10f2473b435f', '2023-03-03 11:54:12.280479');
INSERT INTO public.sessions VALUES (7, 54, 'ca2f4277-f743-44cd-89c5-eaafc2a827b5', '2023-03-03 11:54:15.394899');


--
-- Data for Name: shorturls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.shorturls VALUES (1, 52, 'gQdTEN', 0, '2023-03-03 06:56:06.913311');
INSERT INTO public.shorturls VALUES (2, 52, '56k74H', 0, '2023-03-03 06:56:24.0898');
INSERT INTO public.shorturls VALUES (3, 52, '5aPI6Y', 0, '2023-03-03 06:56:33.337349');
INSERT INTO public.shorturls VALUES (4, 52, '3xuxH4', 0, '2023-03-03 06:56:39.290234');
INSERT INTO public.shorturls VALUES (5, 52, 'FVZEnE', 0, '2023-03-03 07:00:10.553452');
INSERT INTO public.shorturls VALUES (6, 52, '3netkC', 0, '2023-03-03 09:03:40.087702');
INSERT INTO public.shorturls VALUES (7, 52, 'dEUTkr', 0, '2023-03-03 09:04:42.243977');
INSERT INTO public.shorturls VALUES (9, 52, 'cGK3Mj', 0, '2023-03-03 09:05:33.474866');
INSERT INTO public.shorturls VALUES (10, 52, 'PTds3d', 0, '2023-03-03 09:09:20.394816');
INSERT INTO public.shorturls VALUES (11, 52, 'DfM06r', 0, '2023-03-03 09:09:30.235223');
INSERT INTO public.shorturls VALUES (12, 52, 'tqTJSF', 0, '2023-03-03 09:09:33.881991');
INSERT INTO public.shorturls VALUES (13, 52, 'ZjytdQ', 0, '2023-03-03 09:10:00.554873');
INSERT INTO public.shorturls VALUES (14, 52, 'zCezwV', 0, '2023-03-03 09:10:08.313243');
INSERT INTO public.shorturls VALUES (15, 52, '4HVUHE', 0, '2023-03-03 09:10:33.093044');
INSERT INTO public.shorturls VALUES (16, 52, 'Nqh6f9', 0, '2023-03-03 09:11:39.37031');
INSERT INTO public.shorturls VALUES (17, 52, '59-cB2', 0, '2023-03-03 09:12:07.921423');
INSERT INTO public.shorturls VALUES (18, 52, 'lyb_dN', 0, '2023-03-03 09:12:18.537114');
INSERT INTO public.shorturls VALUES (19, 52, '_WWkvy', 0, '2023-03-03 09:12:19.557498');
INSERT INTO public.shorturls VALUES (20, 52, 'omhB44', 0, '2023-03-03 09:13:54.112265');
INSERT INTO public.shorturls VALUES (21, 52, 'jV93zT', 0, '2023-03-03 09:13:54.92899');
INSERT INTO public.shorturls VALUES (22, 52, 'FxgQkf', 0, '2023-03-03 09:14:05.05105');
INSERT INTO public.shorturls VALUES (23, 52, 'gNMDPM', 0, '2023-03-03 09:15:09.170458');
INSERT INTO public.shorturls VALUES (24, 52, 'KweVQx', 0, '2023-03-03 09:15:33.079441');
INSERT INTO public.shorturls VALUES (25, 52, '7vb81q', 0, '2023-03-03 09:16:35.029664');
INSERT INTO public.shorturls VALUES (26, 52, 'IYuSBq', 0, '2023-03-03 09:16:36.396066');
INSERT INTO public.shorturls VALUES (27, 52, 'OpZWuA', 0, '2023-03-03 09:16:48.297686');
INSERT INTO public.shorturls VALUES (28, 52, 'uGT0lf', 0, '2023-03-03 09:16:49.288634');
INSERT INTO public.shorturls VALUES (29, 52, '2BZZ_d', 0, '2023-03-03 09:16:58.297692');
INSERT INTO public.shorturls VALUES (30, 52, 'Ihhw9E', 0, '2023-03-03 09:16:59.10491');
INSERT INTO public.shorturls VALUES (31, 52, 'n36Xac', 0, '2023-03-03 09:17:09.022236');
INSERT INTO public.shorturls VALUES (32, 52, 'i4C9ul', 0, '2023-03-03 09:17:56.840251');
INSERT INTO public.shorturls VALUES (33, 52, 'KO42fz', 0, '2023-03-03 09:17:57.666822');
INSERT INTO public.shorturls VALUES (34, 52, 'SnSA9V', 0, '2023-03-03 09:18:43.031881');
INSERT INTO public.shorturls VALUES (35, 52, 'CxW3by', 0, '2023-03-03 09:18:44.939455');
INSERT INTO public.shorturls VALUES (36, 52, 'HjiCKp', 0, '2023-03-03 09:19:00.068074');
INSERT INTO public.shorturls VALUES (37, 52, '2JPL-v', 0, '2023-03-03 09:19:09.567066');
INSERT INTO public.shorturls VALUES (38, 52, 'yVkZat', 0, '2023-03-03 09:20:29.263313');
INSERT INTO public.shorturls VALUES (39, 52, 'qXWM_W', 0, '2023-03-03 09:21:04.377671');
INSERT INTO public.shorturls VALUES (40, 52, 'CplNH-', 0, '2023-03-03 09:21:09.876908');
INSERT INTO public.shorturls VALUES (41, 52, 'ghNvAv', 0, '2023-03-03 09:21:30.835998');
INSERT INTO public.shorturls VALUES (42, 52, 't5px0u', 0, '2023-03-03 09:21:53.894574');
INSERT INTO public.shorturls VALUES (43, 52, 'j_fZod', 0, '2023-03-03 09:21:54.765656');
INSERT INTO public.shorturls VALUES (44, 52, 'DAp-HW', 0, '2023-03-03 09:21:55.347552');
INSERT INTO public.shorturls VALUES (45, 52, 'nD9QKZ', 0, '2023-03-03 09:21:55.870465');
INSERT INTO public.shorturls VALUES (46, 52, 'T3ElyZ', 0, '2023-03-03 09:21:56.749312');
INSERT INTO public.shorturls VALUES (47, 52, 'JXjHT_', 0, '2023-03-03 09:21:57.654123');
INSERT INTO public.shorturls VALUES (48, 52, 'o7CT7c', 0, '2023-03-03 09:21:59.456071');
INSERT INTO public.shorturls VALUES (49, 52, 'L7LH3d', 0, '2023-03-03 09:32:13.545549');
INSERT INTO public.shorturls VALUES (50, 52, 'ijVqFB', 0, '2023-03-03 09:32:26.280267');
INSERT INTO public.shorturls VALUES (51, 52, 'ik6flu', 0, '2023-03-03 09:32:39.864495');
INSERT INTO public.shorturls VALUES (52, 52, 'ggVocP', 0, '2023-03-03 09:32:41.792226');
INSERT INTO public.shorturls VALUES (53, 52, 'aCFqhd', 0, '2023-03-03 09:33:03.544299');
INSERT INTO public.shorturls VALUES (54, 52, 'e43bTl', 0, '2023-03-03 09:33:30.627958');
INSERT INTO public.shorturls VALUES (55, 52, 'o7YhGL', 0, '2023-03-03 09:36:09.564816');
INSERT INTO public.shorturls VALUES (56, 52, '4vvKut', 0, '2023-03-03 09:38:18.41543');
INSERT INTO public.shorturls VALUES (57, 52, 'GWuzb7', 0, '2023-03-03 09:38:31.195628');
INSERT INTO public.shorturls VALUES (58, 52, 'QWvnon', 0, '2023-03-03 09:38:35.214728');
INSERT INTO public.shorturls VALUES (59, 52, '8_5xvI', 0, '2023-03-03 09:38:37.332284');
INSERT INTO public.shorturls VALUES (60, 52, '1oGdAA', 0, '2023-03-03 09:38:46.392673');
INSERT INTO public.shorturls VALUES (61, 52, '3W64-Z', 0, '2023-03-03 09:39:14.3318');
INSERT INTO public.shorturls VALUES (62, 52, 'qsjxEq', 0, '2023-03-03 09:43:05.008249');
INSERT INTO public.shorturls VALUES (63, 52, 'F9Dx35', 0, '2023-03-03 09:43:27.195436');
INSERT INTO public.shorturls VALUES (64, 52, 'dX1aWE', 0, '2023-03-03 09:43:29.941307');
INSERT INTO public.shorturls VALUES (65, 52, '0VJgvj', 0, '2023-03-03 09:43:37.618627');
INSERT INTO public.shorturls VALUES (66, 52, '89ZFGm', 0, '2023-03-03 09:43:39.51483');
INSERT INTO public.shorturls VALUES (67, 52, '161MuZ', 0, '2023-03-03 09:43:49.271937');
INSERT INTO public.shorturls VALUES (68, 52, 'H20Nx_', 0, '2023-03-03 09:44:17.097923');
INSERT INTO public.shorturls VALUES (69, 52, 'c2AZG6', 0, '2023-03-03 09:44:18.329004');
INSERT INTO public.shorturls VALUES (70, 52, '9ApqcA', 0, '2023-03-03 09:44:23.048024');
INSERT INTO public.shorturls VALUES (71, 52, 'jYugFa', 0, '2023-03-03 09:44:37.207442');
INSERT INTO public.shorturls VALUES (72, 52, 'yT3IVp', 0, '2023-03-03 09:44:38.922365');
INSERT INTO public.shorturls VALUES (73, 52, 'fvL3CS', 0, '2023-03-03 09:45:05.895186');
INSERT INTO public.shorturls VALUES (74, 52, 'gyKZq4', 0, '2023-03-03 09:45:06.694875');
INSERT INTO public.shorturls VALUES (75, 52, 'm15Lto', 0, '2023-03-03 09:45:23.891928');
INSERT INTO public.shorturls VALUES (76, 52, 'gNuBsS', 0, '2023-03-03 09:45:35.074477');
INSERT INTO public.shorturls VALUES (77, 52, '-dW7Mm', 0, '2023-03-03 10:09:02.150045');
INSERT INTO public.shorturls VALUES (79, 53, 'GoZHgz', 0, '2023-03-03 11:36:11.152627');
INSERT INTO public.shorturls VALUES (81, 54, 'WayVfn', 4, '2023-03-03 11:54:46.566028');
INSERT INTO public.shorturls VALUES (80, 53, 'XEcWnq', 10, '2023-03-03 11:36:20.869988');
INSERT INTO public.shorturls VALUES (82, 54, 'PKMUvi', 5, '2023-03-03 13:09:41.393611');
INSERT INTO public.shorturls VALUES (83, 54, 'UiqJT6', 0, '2023-03-03 14:51:33.897879');
INSERT INTO public.shorturls VALUES (84, 54, 'A2w_oI', 0, '2023-03-03 14:51:34.970789');
INSERT INTO public.shorturls VALUES (86, 54, '9j-ubh', 0, '2023-03-03 14:51:44.171472');
INSERT INTO public.shorturls VALUES (88, 54, 'KLvXlD', 0, '2023-03-03 15:23:00.747259');
INSERT INTO public.shorturls VALUES (89, 54, 'hnvYM0', 0, '2023-03-03 15:23:00.933048');
INSERT INTO public.shorturls VALUES (90, 54, 'zLuLLK', 0, '2023-03-03 15:23:01.095386');
INSERT INTO public.shorturls VALUES (91, 54, 'UG7XZA', 0, '2023-03-03 15:23:01.25569');
INSERT INTO public.shorturls VALUES (92, 54, '96TcUm', 0, '2023-03-03 15:23:01.424513');
INSERT INTO public.shorturls VALUES (93, 54, 'ScLkKV', 0, '2023-03-03 15:23:01.593438');
INSERT INTO public.shorturls VALUES (94, 54, 'qXepar', 0, '2023-03-03 15:23:01.751743');
INSERT INTO public.shorturls VALUES (96, 54, 'VntxvP', 0, '2023-03-03 16:00:51.207865');
INSERT INTO public.shorturls VALUES (97, 54, '3C9T7x', 0, '2023-03-03 16:00:51.368543');
INSERT INTO public.shorturls VALUES (98, 54, '2v3aRX', 0, '2023-03-03 16:00:51.527818');
INSERT INTO public.shorturls VALUES (99, 54, 'UmLuFO', 0, '2023-03-03 16:00:51.68804');
INSERT INTO public.shorturls VALUES (100, 54, 'W0NxnZ', 0, '2023-03-03 16:00:51.828005');
INSERT INTO public.shorturls VALUES (101, 54, '_KDjRy', 0, '2023-03-03 16:00:51.982144');
INSERT INTO public.shorturls VALUES (102, 54, '2LPi_X', 0, '2023-03-03 16:00:52.143472');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (1, 52, 'https://.', 77, '2023-03-03 10:09:02.153674');
INSERT INTO public.urls VALUES (4, NULL, 'https/com', 2, '2023-03-03 10:33:42.884099');
INSERT INTO public.urls VALUES (6, 53, 'https://google.com.', 79, '2023-03-03 11:36:11.166229');
INSERT INTO public.urls VALUES (9, 54, 'https://www.driven.com.br', 82, '2023-03-03 13:09:41.407685');
INSERT INTO public.urls VALUES (23, 54, 'https://www.joao.com.br', 96, '2023-03-03 16:00:51.210699');
INSERT INTO public.urls VALUES (24, 54, 'https://www.joao.com.br', 97, '2023-03-03 16:00:51.38099');
INSERT INTO public.urls VALUES (25, 54, 'https://www.joao.com.br', 98, '2023-03-03 16:00:51.540364');
INSERT INTO public.urls VALUES (26, 54, 'https://www.joao.com.br', 99, '2023-03-03 16:00:51.701114');
INSERT INTO public.urls VALUES (27, 54, 'https://www.joao.com.br', 100, '2023-03-03 16:00:51.830044');
INSERT INTO public.urls VALUES (28, 54, 'https://www.joao.com.br', 101, '2023-03-03 16:00:51.993899');
INSERT INTO public.urls VALUES (29, 54, 'https://www.joao.com.br', 102, '2023-03-03 16:00:52.145285');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'João Silva', 'joao.silva@example.com', '123456', '2023-03-02 03:43:13.536892');
INSERT INTO public.users VALUES (3, 'Pedro Santos', 'pedro.santos@example.com', '7890xyz', '2023-03-02 03:43:13.536892');
INSERT INTO public.users VALUES (8, 'carlossddspo', 'maiksey@g.com', '$2b$10$KBImTGsxd.UVR7bmEMvNvO7r6F8bGY9lev6SgOZJKO2SFK9Jlj8qa', '2023-03-03 01:37:46.769531');
INSERT INTO public.users VALUES (49, 'dada', 'ssfa@ffsfg.com', '$2b$10$kSUftLLL/ye8n6hSe.iDHeXrrLjKm5ZWFVIQF/OrVNgp4KCORaIte', '2023-03-03 04:45:02.71343');
INSERT INTO public.users VALUES (52, 'ipdec', 'ipdec@g.com', '$2b$10$TQv1AVkaT3jZoW5F4qwb4Ot36o/tL8DVp/3OkFgPx/OtT8ctjN/ye', '2023-03-03 04:47:28.89506');
INSERT INTO public.users VALUES (53, 'João', 'joao@driven.com.br', '$2b$10$3gF64WmtNGZdjAolN0yImedzfjnHf.d8/7qhOzn5pfQHnGXfXwyzO', '2023-03-03 11:29:25.191694');
INSERT INTO public.users VALUES (54, 'Pedro', 'pedro@driven.com.br', '$2b$10$XEDaMjWzEBo/EAIq3r2RzOOEacPc6wuqQRC4.yfRySxvnJ3obKDzG', '2023-03-03 11:53:19.841113');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 7, true);


--
-- Name: shorturls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.shorturls_id_seq', 108, true);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 35, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 54, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: shorturls shorturls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shorturls
    ADD CONSTRAINT shorturls_pkey PRIMARY KEY (id);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


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
-- Name: shorturls_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX shorturls_id_idx ON public.shorturls USING btree (id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: shorturls shorturls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shorturls
    ADD CONSTRAINT "shorturls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls urls_shortUrlId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_shortUrlId_fkey" FOREIGN KEY ("shortUrlId") REFERENCES public.shorturls(id);


--
-- Name: urls urls_shorturlid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_shorturlid_fkey FOREIGN KEY ("shortUrlId") REFERENCES public.shorturls(id) ON DELETE CASCADE;


--
-- Name: urls urls_shorturlid_fkey_new; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_shorturlid_fkey_new FOREIGN KEY ("shortUrlId") REFERENCES public.shorturls(id) ON DELETE CASCADE;


--
-- Name: urls urls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT "urls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

