--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.12
-- Dumped by pg_dump version 9.5.12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY humanface.people DROP CONSTRAINT people_pkey;
ALTER TABLE ONLY humanface.parcels DROP CONSTRAINT parcels_pkey;
ALTER TABLE ONLY humanface.image_paths DROP CONSTRAINT image_paths_pkey;
ALTER TABLE ONLY humanface.event_types DROP CONSTRAINT event_types_pkey;
ALTER TABLE ONLY humanface.event_people_assoc DROP CONSTRAINT event_people_assoc_pkey;
ALTER TABLE ONLY humanface.addresses DROP CONSTRAINT addresses_pkey;
ALTER TABLE ONLY humanface.events DROP CONSTRAINT "Event_pkey";
ALTER TABLE humanface.people ALTER COLUMN person_id DROP DEFAULT;
ALTER TABLE humanface.parcels ALTER COLUMN parcel_id DROP DEFAULT;
ALTER TABLE humanface.image_paths ALTER COLUMN image_id DROP DEFAULT;
ALTER TABLE humanface.events ALTER COLUMN event_id DROP DEFAULT;
ALTER TABLE humanface.event_types ALTER COLUMN id DROP DEFAULT;
ALTER TABLE humanface.event_people_assoc ALTER COLUMN id DROP DEFAULT;
ALTER TABLE humanface.addresses ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE humanface.people_id_seq;
DROP TABLE humanface.people;
DROP SEQUENCE humanface.parcels_parcel_id_seq;
DROP TABLE humanface.parcels;
DROP SEQUENCE humanface.image_paths_image_id_seq;
DROP TABLE humanface.image_paths;
DROP SEQUENCE humanface.event_types_id_seq;
DROP TABLE humanface.event_types;
DROP SEQUENCE humanface.event_people_assoc_id_seq;
DROP TABLE humanface.event_people_assoc;
DROP SEQUENCE humanface.addresses_id_seq;
DROP TABLE humanface.addresses;
DROP SEQUENCE humanface."Event_id_seq";
DROP TABLE humanface.events;
DROP SCHEMA humanface;
--
-- Name: humanface; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA humanface;


ALTER SCHEMA humanface OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: events; Type: TABLE; Schema: humanface; Owner: postgres
--

CREATE TABLE humanface.events (
    event_id integer NOT NULL,
    response character(255),
    extra_information text,
    parcel_id integer,
    date date,
    type integer,
    price bigint
);


ALTER TABLE humanface.events OWNER TO postgres;

--
-- Name: Event_id_seq; Type: SEQUENCE; Schema: humanface; Owner: postgres
--

CREATE SEQUENCE humanface."Event_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE humanface."Event_id_seq" OWNER TO postgres;

--
-- Name: Event_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: postgres
--

ALTER SEQUENCE humanface."Event_id_seq" OWNED BY humanface.events.event_id;


--
-- Name: addresses; Type: TABLE; Schema: humanface; Owner: postgres
--

CREATE TABLE humanface.addresses (
    id integer NOT NULL,
    st_num character(64),
    st_name character(255),
    parcel_id integer
);


ALTER TABLE humanface.addresses OWNER TO postgres;

--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: humanface; Owner: postgres
--

CREATE SEQUENCE humanface.addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE humanface.addresses_id_seq OWNER TO postgres;

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: postgres
--

ALTER SEQUENCE humanface.addresses_id_seq OWNED BY humanface.addresses.id;


--
-- Name: event_people_assoc; Type: TABLE; Schema: humanface; Owner: postgres
--

CREATE TABLE humanface.event_people_assoc (
    id integer NOT NULL,
    event_id integer,
    person_id integer,
    role character(64)
);


ALTER TABLE humanface.event_people_assoc OWNER TO postgres;

--
-- Name: event_people_assoc_id_seq; Type: SEQUENCE; Schema: humanface; Owner: postgres
--

CREATE SEQUENCE humanface.event_people_assoc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE humanface.event_people_assoc_id_seq OWNER TO postgres;

--
-- Name: event_people_assoc_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: postgres
--

ALTER SEQUENCE humanface.event_people_assoc_id_seq OWNED BY humanface.event_people_assoc.id;


--
-- Name: event_types; Type: TABLE; Schema: humanface; Owner: postgres
--

CREATE TABLE humanface.event_types (
    id integer NOT NULL,
    type character(255) NOT NULL
);


ALTER TABLE humanface.event_types OWNER TO postgres;

--
-- Name: event_types_id_seq; Type: SEQUENCE; Schema: humanface; Owner: postgres
--

CREATE SEQUENCE humanface.event_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE humanface.event_types_id_seq OWNER TO postgres;

--
-- Name: event_types_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: postgres
--

ALTER SEQUENCE humanface.event_types_id_seq OWNED BY humanface.event_types.id;


--
-- Name: image_paths; Type: TABLE; Schema: humanface; Owner: postgres
--

CREATE TABLE humanface.image_paths (
    image_id integer NOT NULL,
    img_path character varying,
    parcel_id integer
);


ALTER TABLE humanface.image_paths OWNER TO postgres;

--
-- Name: image_paths_image_id_seq; Type: SEQUENCE; Schema: humanface; Owner: postgres
--

CREATE SEQUENCE humanface.image_paths_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE humanface.image_paths_image_id_seq OWNER TO postgres;

--
-- Name: image_paths_image_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: postgres
--

ALTER SEQUENCE humanface.image_paths_image_id_seq OWNED BY humanface.image_paths.image_id;


--
-- Name: parcels; Type: TABLE; Schema: humanface; Owner: postgres
--

CREATE TABLE humanface.parcels (
    parcel_id integer NOT NULL,
    block_no integer NOT NULL,
    parcel_no integer NOT NULL,
    ward_no integer,
    land_use character(64)
);


ALTER TABLE humanface.parcels OWNER TO postgres;

--
-- Name: parcels_parcel_id_seq; Type: SEQUENCE; Schema: humanface; Owner: postgres
--

CREATE SEQUENCE humanface.parcels_parcel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE humanface.parcels_parcel_id_seq OWNER TO postgres;

--
-- Name: parcels_parcel_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: postgres
--

ALTER SEQUENCE humanface.parcels_parcel_id_seq OWNED BY humanface.parcels.parcel_id;


--
-- Name: people; Type: TABLE; Schema: humanface; Owner: postgres
--

CREATE TABLE humanface.people (
    person_id integer NOT NULL,
    name character(255)
);


ALTER TABLE humanface.people OWNER TO postgres;

--
-- Name: people_id_seq; Type: SEQUENCE; Schema: humanface; Owner: postgres
--

CREATE SEQUENCE humanface.people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE humanface.people_id_seq OWNER TO postgres;

--
-- Name: people_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: postgres
--

ALTER SEQUENCE humanface.people_id_seq OWNED BY humanface.people.person_id;


--
-- Name: id; Type: DEFAULT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY humanface.addresses ALTER COLUMN id SET DEFAULT nextval('humanface.addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY humanface.event_people_assoc ALTER COLUMN id SET DEFAULT nextval('humanface.event_people_assoc_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY humanface.event_types ALTER COLUMN id SET DEFAULT nextval('humanface.event_types_id_seq'::regclass);


--
-- Name: event_id; Type: DEFAULT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY humanface.events ALTER COLUMN event_id SET DEFAULT nextval('humanface."Event_id_seq"'::regclass);


--
-- Name: image_id; Type: DEFAULT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY humanface.image_paths ALTER COLUMN image_id SET DEFAULT nextval('humanface.image_paths_image_id_seq'::regclass);


--
-- Name: parcel_id; Type: DEFAULT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY humanface.parcels ALTER COLUMN parcel_id SET DEFAULT nextval('humanface.parcels_parcel_id_seq'::regclass);


--
-- Name: person_id; Type: DEFAULT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY humanface.people ALTER COLUMN person_id SET DEFAULT nextval('humanface.people_id_seq'::regclass);


--
-- Name: Event_pkey; Type: CONSTRAINT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY humanface.events
    ADD CONSTRAINT "Event_pkey" PRIMARY KEY (event_id);


--
-- Name: addresses_pkey; Type: CONSTRAINT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY humanface.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: event_people_assoc_pkey; Type: CONSTRAINT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY humanface.event_people_assoc
    ADD CONSTRAINT event_people_assoc_pkey PRIMARY KEY (id);


--
-- Name: event_types_pkey; Type: CONSTRAINT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY humanface.event_types
    ADD CONSTRAINT event_types_pkey PRIMARY KEY (id);


--
-- Name: image_paths_pkey; Type: CONSTRAINT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY humanface.image_paths
    ADD CONSTRAINT image_paths_pkey PRIMARY KEY (image_id);


--
-- Name: parcels_pkey; Type: CONSTRAINT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY humanface.parcels
    ADD CONSTRAINT parcels_pkey PRIMARY KEY (parcel_id);


--
-- Name: people_pkey; Type: CONSTRAINT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY humanface.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (person_id);


--
-- PostgreSQL database dump complete
--

