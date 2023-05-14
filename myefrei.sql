--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Homebrew)
-- Dumped by pg_dump version 14.7 (Homebrew)

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
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: nas
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO nas;

--
-- Name: eleve; Type: TABLE; Schema: public; Owner: nas
--

CREATE TABLE public.eleve (
    id integer NOT NULL,
    prenom character varying,
    name character varying,
    formation character varying,
    date_debut_formation character varying,
    date_fin_formation character varying,
    id_user integer
);


ALTER TABLE public.eleve OWNER TO nas;

--
-- Name: eleve_id_seq; Type: SEQUENCE; Schema: public; Owner: nas
--

CREATE SEQUENCE public.eleve_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eleve_id_seq OWNER TO nas;

--
-- Name: eleve_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nas
--

ALTER SEQUENCE public.eleve_id_seq OWNED BY public.eleve.id;


--
-- Name: enseignant; Type: TABLE; Schema: public; Owner: nas
--

CREATE TABLE public.enseignant (
    id integer NOT NULL,
    name character varying,
    id_user integer
);


ALTER TABLE public.enseignant OWNER TO nas;

--
-- Name: enseignant_id_seq; Type: SEQUENCE; Schema: public; Owner: nas
--

CREATE SEQUENCE public.enseignant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enseignant_id_seq OWNER TO nas;

--
-- Name: enseignant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nas
--

ALTER SEQUENCE public.enseignant_id_seq OWNED BY public.enseignant.id;


--
-- Name: matiere; Type: TABLE; Schema: public; Owner: nas
--

CREATE TABLE public.matiere (
    id integer NOT NULL,
    name character varying,
    description text
);


ALTER TABLE public.matiere OWNER TO nas;

--
-- Name: matiere_id_seq; Type: SEQUENCE; Schema: public; Owner: nas
--

CREATE SEQUENCE public.matiere_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.matiere_id_seq OWNER TO nas;

--
-- Name: matiere_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nas
--

ALTER SEQUENCE public.matiere_id_seq OWNED BY public.matiere.id;


--
-- Name: salle; Type: TABLE; Schema: public; Owner: nas
--

CREATE TABLE public.salle (
    id integer NOT NULL,
    numero text
);


ALTER TABLE public.salle OWNER TO nas;

--
-- Name: salle_id_seq; Type: SEQUENCE; Schema: public; Owner: nas
--

CREATE SEQUENCE public.salle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.salle_id_seq OWNER TO nas;

--
-- Name: salle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nas
--

ALTER SEQUENCE public.salle_id_seq OWNED BY public.salle.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: nas
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    email character varying,
    password character varying
);


ALTER TABLE public."user" OWNER TO nas;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: nas
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO nas;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nas
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: eleve id; Type: DEFAULT; Schema: public; Owner: nas
--

ALTER TABLE ONLY public.eleve ALTER COLUMN id SET DEFAULT nextval('public.eleve_id_seq'::regclass);


--
-- Name: enseignant id; Type: DEFAULT; Schema: public; Owner: nas
--

ALTER TABLE ONLY public.enseignant ALTER COLUMN id SET DEFAULT nextval('public.enseignant_id_seq'::regclass);


--
-- Name: matiere id; Type: DEFAULT; Schema: public; Owner: nas
--

ALTER TABLE ONLY public.matiere ALTER COLUMN id SET DEFAULT nextval('public.matiere_id_seq'::regclass);


--
-- Name: salle id; Type: DEFAULT; Schema: public; Owner: nas
--

ALTER TABLE ONLY public.salle ALTER COLUMN id SET DEFAULT nextval('public.salle_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: nas
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: nas
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
d06a16a6-b2db-4c8a-be06-efedfac05778	98d1bac58f059a5dfc5a59ed713bf69a7996d0ad04e9ea4be2473ec21750bc46	2023-05-14 11:42:45.764965+02	20230514094245_create_table	\N	\N	2023-05-14 11:42:45.749641+02	1
b5093856-597e-4323-88dc-391d343b748b	93214b2f6b14f95acbe2f6b419eaf013d53396c1be657f16c9dbc49211a0e2c9	2023-05-14 13:43:33.701529+02	20230514114333_change_type_numero_salle	\N	\N	2023-05-14 13:43:33.695038+02	1
\.


--
-- Data for Name: eleve; Type: TABLE DATA; Schema: public; Owner: nas
--

COPY public.eleve (id, prenom, name, formation, date_debut_formation, date_fin_formation, id_user) FROM stdin;
1	k	lf	z	d	f	2
\.


--
-- Data for Name: enseignant; Type: TABLE DATA; Schema: public; Owner: nas
--

COPY public.enseignant (id, name, id_user) FROM stdin;
1	aeedae	1
3	aeedade	2
\.


--
-- Data for Name: matiere; Type: TABLE DATA; Schema: public; Owner: nas
--

COPY public.matiere (id, name, description) FROM stdin;
8	aeddddzea	eie
9	aeddddzea	eie
10	aeddddzea	eie
13	a	a
5	b	b
11	b	b
12	b	b
14	aeddddzea	eie
\.


--
-- Data for Name: salle; Type: TABLE DATA; Schema: public; Owner: nas
--

COPY public.salle (id, numero) FROM stdin;
2	A13
3	A1
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: nas
--

COPY public."user" (id, email, password) FROM stdin;
1	apkepdfdae	ozdjozdjp
2	aeeae	lfl
\.


--
-- Name: eleve_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nas
--

SELECT pg_catalog.setval('public.eleve_id_seq', 2, true);


--
-- Name: enseignant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nas
--

SELECT pg_catalog.setval('public.enseignant_id_seq', 3, true);


--
-- Name: matiere_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nas
--

SELECT pg_catalog.setval('public.matiere_id_seq', 14, true);


--
-- Name: salle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nas
--

SELECT pg_catalog.setval('public.salle_id_seq', 3, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nas
--

SELECT pg_catalog.setval('public.user_id_seq', 2, true);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: nas
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: eleve eleve_pkey; Type: CONSTRAINT; Schema: public; Owner: nas
--

ALTER TABLE ONLY public.eleve
    ADD CONSTRAINT eleve_pkey PRIMARY KEY (id);


--
-- Name: enseignant enseignant_pkey; Type: CONSTRAINT; Schema: public; Owner: nas
--

ALTER TABLE ONLY public.enseignant
    ADD CONSTRAINT enseignant_pkey PRIMARY KEY (id);


--
-- Name: matiere matiere_pkey; Type: CONSTRAINT; Schema: public; Owner: nas
--

ALTER TABLE ONLY public.matiere
    ADD CONSTRAINT matiere_pkey PRIMARY KEY (id);


--
-- Name: salle salle_pkey; Type: CONSTRAINT; Schema: public; Owner: nas
--

ALTER TABLE ONLY public.salle
    ADD CONSTRAINT salle_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: nas
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: eleve_id_user_key; Type: INDEX; Schema: public; Owner: nas
--

CREATE UNIQUE INDEX eleve_id_user_key ON public.eleve USING btree (id_user);


--
-- Name: enseignant_id_user_key; Type: INDEX; Schema: public; Owner: nas
--

CREATE UNIQUE INDEX enseignant_id_user_key ON public.enseignant USING btree (id_user);


--
-- Name: eleve eleve_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nas
--

ALTER TABLE ONLY public.eleve
    ADD CONSTRAINT eleve_id_user_fkey FOREIGN KEY (id_user) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: enseignant enseignant_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nas
--

ALTER TABLE ONLY public.enseignant
    ADD CONSTRAINT enseignant_id_user_fkey FOREIGN KEY (id_user) REFERENCES public."user"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

