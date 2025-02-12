--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--




--
-- Roles
--



--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.18 (Debian 13.18-1.pgdg120+1)
-- Dumped by pg_dump version 13.18 (Debian 13.18-1.pgdg120+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: usr
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO usr;

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: usr
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: usr
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: usr
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "demoDB" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.18 (Debian 13.18-1.pgdg120+1)
-- Dumped by pg_dump version 13.18 (Debian 13.18-1.pgdg120+1)

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
-- Name: demoDB; Type: DATABASE; Schema: -; Owner: usr
--

CREATE DATABASE "demoDB";

ALTER DATABASE "demoDB" OWNER TO usr;

\connect "demoDB"

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
-- Name: User; Type: TABLE; Schema: public; Owner: usr
--

CREATE TABLE public."User" (
    usr_id integer NOT NULL,
    "usr_lastName" character varying(75) NOT NULL,
    "usr_firstName" character varying(75) NOT NULL,
    usr_login character varying(25) NOT NULL,
    usr_password character varying(25) NOT NULL,
    usr_role integer NOT NULL,
    "usr_dateInsert" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    usr_active integer DEFAULT 1
);


ALTER TABLE public."User" OWNER TO usr;

--
-- Name: UserRole; Type: TABLE; Schema: public; Owner: usr
--

CREATE TABLE public."UserRole" (
    uro_id integer NOT NULL,
    uro_description character varying(25) NOT NULL,
    uro_active integer DEFAULT 1 NOT NULL
);


ALTER TABLE public."UserRole" OWNER TO usr;

--
-- Name: UserRole_uro_id_seq; Type: SEQUENCE; Schema: public; Owner: usr
--

CREATE SEQUENCE public."UserRole_uro_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."UserRole_uro_id_seq" OWNER TO usr;

--
-- Name: UserRole_uro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usr
--

ALTER SEQUENCE public."UserRole_uro_id_seq" OWNED BY public."UserRole".uro_id;


--
-- Name: User_usr_id_seq; Type: SEQUENCE; Schema: public; Owner: usr
--

CREATE SEQUENCE public."User_usr_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."User_usr_id_seq" OWNER TO usr;

--
-- Name: User_usr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: usr
--

ALTER SEQUENCE public."User_usr_id_seq" OWNED BY public."User".usr_id;


--
-- Name: User usr_id; Type: DEFAULT; Schema: public; Owner: usr
--

ALTER TABLE ONLY public."User" ALTER COLUMN usr_id SET DEFAULT nextval('public."User_usr_id_seq"'::regclass);


--
-- Name: UserRole uro_id; Type: DEFAULT; Schema: public; Owner: usr
--

ALTER TABLE ONLY public."UserRole" ALTER COLUMN uro_id SET DEFAULT nextval('public."UserRole_uro_id_seq"'::regclass);


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: usr
--

COPY public."User" (usr_id, "usr_lastName", "usr_firstName", usr_login, usr_password, usr_role, "usr_dateInsert", usr_active) FROM stdin;
1	Pupkin	Stanislav	s_pupkin	123	1	2025-01-27 15:04:19.050242	1
3	Ponkratova	Anastasia	a_ponkratova	123	1	2025-01-28 22:15:19.792553	1
4	Soloviev	Daniil	d_solovyev	123	1	2025-01-28 22:30:39.525992	1
\.


--
-- Data for Name: UserRole; Type: TABLE DATA; Schema: public; Owner: usr
--

COPY public."UserRole" (uro_id, uro_description, uro_active) FROM stdin;
1	Administrator	1
\.


--
-- Name: UserRole_uro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: usr
--

SELECT pg_catalog.setval('public."UserRole_uro_id_seq"', 1, true);


--
-- Name: User_usr_id_seq; Type: SEQUENCE SET; Schema: public; Owner: usr
--

SELECT pg_catalog.setval('public."User_usr_id_seq"', 4, true);


--
-- Name: UserRole UserRole_pkey; Type: CONSTRAINT; Schema: public; Owner: usr
--

ALTER TABLE ONLY public."UserRole"
    ADD CONSTRAINT "UserRole_pkey" PRIMARY KEY (uro_id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: usr
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (usr_id);


--
-- Name: User FK_uroRole; Type: FK CONSTRAINT; Schema: public; Owner: usr
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "FK_uroRole" FOREIGN KEY (usr_role) REFERENCES public."UserRole"(uro_id);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.18 (Debian 13.18-1.pgdg120+1)
-- Dumped by pg_dump version 13.18 (Debian 13.18-1.pgdg120+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: usr
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO usr;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: usr
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

