--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Ubuntu 16.2-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.2 (Ubuntu 16.2-1.pgdg22.04+1)

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
-- Name: elte_felho_konyvek; Type: DATABASE; Schema: -; Owner: petiyeti
--

CREATE DATABASE elte_felho_konyvek WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';


ALTER DATABASE elte_felho_konyvek OWNER TO petiyeti;

\connect elte_felho_konyvek

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
-- Name: authors; Type: TABLE; Schema: public; Owner: petiyeti
--

CREATE TABLE public.authors (
    id integer NOT NULL,
    name text NOT NULL,
    birth_year integer,
    biography text
);


ALTER TABLE public.authors OWNER TO petiyeti;

--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: petiyeti
--

CREATE SEQUENCE public.authors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.authors_id_seq OWNER TO petiyeti;

--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: petiyeti
--

ALTER SEQUENCE public.authors_id_seq OWNED BY public.authors.id;


--
-- Name: books; Type: TABLE; Schema: public; Owner: petiyeti
--

CREATE TABLE public.books (
    id integer NOT NULL,
    title text NOT NULL,
    author_id integer NOT NULL,
    genre_id integer NOT NULL,
    publication_year integer,
    isbn text,
    available boolean DEFAULT true
);


ALTER TABLE public.books OWNER TO petiyeti;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: petiyeti
--

CREATE SEQUENCE public.books_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.books_id_seq OWNER TO petiyeti;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: petiyeti
--

ALTER SEQUENCE public.books_id_seq OWNED BY public.books.id;


--
-- Name: genres; Type: TABLE; Schema: public; Owner: petiyeti
--

CREATE TABLE public.genres (
    id integer NOT NULL,
    name text NOT NULL,
    description text
);


ALTER TABLE public.genres OWNER TO petiyeti;

--
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: petiyeti
--

CREATE SEQUENCE public.genres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.genres_id_seq OWNER TO petiyeti;

--
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: petiyeti
--

ALTER SEQUENCE public.genres_id_seq OWNED BY public.genres.id;


--
-- Name: authors id; Type: DEFAULT; Schema: public; Owner: petiyeti
--

ALTER TABLE ONLY public.authors ALTER COLUMN id SET DEFAULT nextval('public.authors_id_seq'::regclass);


--
-- Name: books id; Type: DEFAULT; Schema: public; Owner: petiyeti
--

ALTER TABLE ONLY public.books ALTER COLUMN id SET DEFAULT nextval('public.books_id_seq'::regclass);


--
-- Name: genres id; Type: DEFAULT; Schema: public; Owner: petiyeti
--

ALTER TABLE ONLY public.genres ALTER COLUMN id SET DEFAULT nextval('public.genres_id_seq'::regclass);


--
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: petiyeti
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: petiyeti
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: petiyeti
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- Name: books books_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: petiyeti
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.authors(id);


--
-- Name: books books_author_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: petiyeti
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_author_id_fkey1 FOREIGN KEY (author_id) REFERENCES public.genres(id);


--
-- PostgreSQL database dump complete
--

