--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cms_components; Type: TABLE; Schema: public; Owner: maxpoint; Tablespace: 
--

CREATE TABLE cms_components (
    id integer NOT NULL,
    page_id integer,
    parent_id integer,
    "position" integer,
    type character varying(255),
    data hstore,
    subcomponents hstore,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.cms_components OWNER TO maxpoint;

--
-- Name: cms_components_id_seq; Type: SEQUENCE; Schema: public; Owner: maxpoint
--

CREATE SEQUENCE cms_components_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_components_id_seq OWNER TO maxpoint;

--
-- Name: cms_components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: maxpoint
--

ALTER SEQUENCE cms_components_id_seq OWNED BY cms_components.id;


--
-- Name: cms_localities; Type: TABLE; Schema: public; Owner: maxpoint; Tablespace: 
--

CREATE TABLE cms_localities (
    id integer NOT NULL,
    slug character varying(255),
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.cms_localities OWNER TO maxpoint;

--
-- Name: cms_localities_id_seq; Type: SEQUENCE; Schema: public; Owner: maxpoint
--

CREATE SEQUENCE cms_localities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_localities_id_seq OWNER TO maxpoint;

--
-- Name: cms_localities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: maxpoint
--

ALTER SEQUENCE cms_localities_id_seq OWNED BY cms_localities.id;


--
-- Name: cms_pages; Type: TABLE; Schema: public; Owner: maxpoint; Tablespace: 
--

CREATE TABLE cms_pages (
    id integer NOT NULL,
    locality_id integer,
    parent_id integer,
    slug character varying(255),
    title character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.cms_pages OWNER TO maxpoint;

--
-- Name: cms_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: maxpoint
--

CREATE SEQUENCE cms_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_pages_id_seq OWNER TO maxpoint;

--
-- Name: cms_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: maxpoint
--

ALTER SEQUENCE cms_pages_id_seq OWNED BY cms_pages.id;


--
-- Name: cms_posts; Type: TABLE; Schema: public; Owner: maxpoint; Tablespace: 
--

CREATE TABLE cms_posts (
    id integer NOT NULL,
    locality_id integer,
    slug character varying(255),
    page_title character varying(255),
    page_description text,
    title character varying(255),
    author character varying(255),
    description text,
    body text,
    published boolean,
    published_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.cms_posts OWNER TO maxpoint;

--
-- Name: cms_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: maxpoint
--

CREATE SEQUENCE cms_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_posts_id_seq OWNER TO maxpoint;

--
-- Name: cms_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: maxpoint
--

ALTER SEQUENCE cms_posts_id_seq OWNED BY cms_posts.id;


--
-- Name: cms_users; Type: TABLE; Schema: public; Owner: maxpoint; Tablespace: 
--

CREATE TABLE cms_users (
    id integer NOT NULL,
    email character varying(255),
    name character varying(255),
    password_digest character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.cms_users OWNER TO maxpoint;

--
-- Name: cms_users_id_seq; Type: SEQUENCE; Schema: public; Owner: maxpoint
--

CREATE SEQUENCE cms_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cms_users_id_seq OWNER TO maxpoint;

--
-- Name: cms_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: maxpoint
--

ALTER SEQUENCE cms_users_id_seq OWNED BY cms_users.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: maxpoint; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO maxpoint;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: maxpoint
--

ALTER TABLE ONLY cms_components ALTER COLUMN id SET DEFAULT nextval('cms_components_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: maxpoint
--

ALTER TABLE ONLY cms_localities ALTER COLUMN id SET DEFAULT nextval('cms_localities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: maxpoint
--

ALTER TABLE ONLY cms_pages ALTER COLUMN id SET DEFAULT nextval('cms_pages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: maxpoint
--

ALTER TABLE ONLY cms_posts ALTER COLUMN id SET DEFAULT nextval('cms_posts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: maxpoint
--

ALTER TABLE ONLY cms_users ALTER COLUMN id SET DEFAULT nextval('cms_users_id_seq'::regclass);


--
-- Data for Name: cms_components; Type: TABLE DATA; Schema: public; Owner: maxpoint
--

COPY cms_components (id, page_id, parent_id, "position", type, data, subcomponents, created_at, updated_at) FROM stdin;
1	1	\N	\N	HeaderComponent		\N	2013-04-23 23:45:07.21478	2013-04-23 23:45:07.21478
\.


--
-- Name: cms_components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: maxpoint
--

SELECT pg_catalog.setval('cms_components_id_seq', 1, true);


--
-- Data for Name: cms_localities; Type: TABLE DATA; Schema: public; Owner: maxpoint
--

COPY cms_localities (id, slug, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: cms_localities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: maxpoint
--

SELECT pg_catalog.setval('cms_localities_id_seq', 1, false);


--
-- Data for Name: cms_pages; Type: TABLE DATA; Schema: public; Owner: maxpoint
--

COPY cms_pages (id, locality_id, parent_id, slug, title, created_at, updated_at) FROM stdin;
1	\N	\N	\N	Maxpoint	2013-04-23 23:20:36.107323	2013-04-23 23:20:36.107323
\.


--
-- Name: cms_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: maxpoint
--

SELECT pg_catalog.setval('cms_pages_id_seq', 1, true);


--
-- Data for Name: cms_posts; Type: TABLE DATA; Schema: public; Owner: maxpoint
--

COPY cms_posts (id, locality_id, slug, page_title, page_description, title, author, description, body, published, published_at, created_at, updated_at) FROM stdin;
\.


--
-- Name: cms_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: maxpoint
--

SELECT pg_catalog.setval('cms_posts_id_seq', 1, false);


--
-- Data for Name: cms_users; Type: TABLE DATA; Schema: public; Owner: maxpoint
--

COPY cms_users (id, email, name, password_digest, created_at, updated_at) FROM stdin;
\.


--
-- Name: cms_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: maxpoint
--

SELECT pg_catalog.setval('cms_users_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: maxpoint
--

COPY schema_migrations (version) FROM stdin;
20130423231241
20130423231242
20130423231243
20130423231244
20130423231245
\.


--
-- Name: cms_components_pkey; Type: CONSTRAINT; Schema: public; Owner: maxpoint; Tablespace: 
--

ALTER TABLE ONLY cms_components
    ADD CONSTRAINT cms_components_pkey PRIMARY KEY (id);


--
-- Name: cms_localities_pkey; Type: CONSTRAINT; Schema: public; Owner: maxpoint; Tablespace: 
--

ALTER TABLE ONLY cms_localities
    ADD CONSTRAINT cms_localities_pkey PRIMARY KEY (id);


--
-- Name: cms_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: maxpoint; Tablespace: 
--

ALTER TABLE ONLY cms_pages
    ADD CONSTRAINT cms_pages_pkey PRIMARY KEY (id);


--
-- Name: cms_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: maxpoint; Tablespace: 
--

ALTER TABLE ONLY cms_posts
    ADD CONSTRAINT cms_posts_pkey PRIMARY KEY (id);


--
-- Name: cms_users_pkey; Type: CONSTRAINT; Schema: public; Owner: maxpoint; Tablespace: 
--

ALTER TABLE ONLY cms_users
    ADD CONSTRAINT cms_users_pkey PRIMARY KEY (id);


--
-- Name: index_cms_users_on_email; Type: INDEX; Schema: public; Owner: maxpoint; Tablespace: 
--

CREATE UNIQUE INDEX index_cms_users_on_email ON cms_users USING btree (email);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: maxpoint; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

