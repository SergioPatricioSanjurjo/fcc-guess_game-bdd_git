--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (20, 'user_1691443743384', 2, 839);
INSERT INTO public.users VALUES (36, 'user_1691444780682', 2, 801);
INSERT INTO public.users VALUES (19, 'user_1691443743385', 5, 326);
INSERT INTO public.users VALUES (35, 'user_1691444780683', 5, 259);
INSERT INTO public.users VALUES (22, 'user_1691443843156', 2, 14);
INSERT INTO public.users VALUES (21, 'user_1691443843157', 5, 283);
INSERT INTO public.users VALUES (38, 'user_1691444821676', 2, 227);
INSERT INTO public.users VALUES (24, 'user_1691443922715', 2, 441);
INSERT INTO public.users VALUES (23, 'user_1691443922716', 5, 138);
INSERT INTO public.users VALUES (37, 'user_1691444821677', 5, 442);
INSERT INTO public.users VALUES (26, 'user_1691443989339', 2, 236);
INSERT INTO public.users VALUES (25, 'user_1691443989340', 5, 152);
INSERT INTO public.users VALUES (18, 'Admin', 3, 10);
INSERT INTO public.users VALUES (40, 'user_1691444859885', 2, 273);
INSERT INTO public.users VALUES (28, 'user_1691444119463', 2, 458);
INSERT INTO public.users VALUES (39, 'user_1691444859886', 5, 134);
INSERT INTO public.users VALUES (27, 'user_1691444119464', 5, 182);
INSERT INTO public.users VALUES (30, 'user_1691444256423', 2, 39);
INSERT INTO public.users VALUES (29, 'user_1691444256424', 5, 288);
INSERT INTO public.users VALUES (42, 'user_1691444868320', 2, 535);
INSERT INTO public.users VALUES (32, 'user_1691444480712', 2, 49);
INSERT INTO public.users VALUES (41, 'user_1691444868321', 5, 196);
INSERT INTO public.users VALUES (31, 'user_1691444480713', 5, 1);
INSERT INTO public.users VALUES (34, 'user_1691444500474', 2, 533);
INSERT INTO public.users VALUES (33, 'user_1691444500475', 5, 194);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 42, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--


