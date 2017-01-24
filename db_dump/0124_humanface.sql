--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: humanface; Type: SCHEMA; Schema: -; Owner: web
--

CREATE SCHEMA humanface;


ALTER SCHEMA humanface OWNER TO web;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = humanface, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Appraisers; Type: TABLE; Schema: humanface; Owner: web
--

CREATE TABLE "Appraisers" (
    appraiser_id integer NOT NULL,
    appraiser_name character(255),
    company_name character(255)
);


ALTER TABLE "Appraisers" OWNER TO web;

--
-- Name: Appraisers_appraiser_id_seq; Type: SEQUENCE; Schema: humanface; Owner: web
--

CREATE SEQUENCE "Appraisers_appraiser_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Appraisers_appraiser_id_seq" OWNER TO web;

--
-- Name: Appraisers_appraiser_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: web
--

ALTER SEQUENCE "Appraisers_appraiser_id_seq" OWNED BY "Appraisers".appraiser_id;


--
-- Name: Appraises; Type: TABLE; Schema: humanface; Owner: web
--

CREATE TABLE "Appraises" (
    "appraise-id" integer NOT NULL,
    appraiser_id integer,
    parcel_id integer,
    imps_value money,
    area_of_house numeric(50,0),
    land_value money,
    total_value money,
    reproduction_value money
);


ALTER TABLE "Appraises" OWNER TO web;

--
-- Name: Appraises_appraise-id_seq; Type: SEQUENCE; Schema: humanface; Owner: web
--

CREATE SEQUENCE "Appraises_appraise-id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Appraises_appraise-id_seq" OWNER TO web;

--
-- Name: Appraises_appraise-id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: web
--

ALTER SEQUENCE "Appraises_appraise-id_seq" OWNED BY "Appraises"."appraise-id";


--
-- Name: Buildings; Type: TABLE; Schema: humanface; Owner: web
--

CREATE TABLE "Buildings" (
    building_id integer NOT NULL,
    "st-name" character(255),
    apt_no integer,
    num_units integer,
    area_of_units numeric,
    use_of_building character(255),
    parcel_id integer,
    number_of_rooms integer
);


ALTER TABLE "Buildings" OWNER TO web;

--
-- Name: Buildings_building_id_seq; Type: SEQUENCE; Schema: humanface; Owner: web
--

CREATE SEQUENCE "Buildings_building_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Buildings_building_id_seq" OWNER TO web;

--
-- Name: Buildings_building_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: web
--

ALTER SEQUENCE "Buildings_building_id_seq" OWNED BY "Buildings".building_id;


--
-- Name: Owners ; Type: TABLE; Schema: humanface; Owner: web
--

CREATE TABLE "Owners " (
    owner_id integer NOT NULL,
    owner_name character(255),
    pass_away_date date,
    is_heir character(1)
);


ALTER TABLE "Owners " OWNER TO web;

--
-- Name: Owners _owner_id_seq; Type: SEQUENCE; Schema: humanface; Owner: web
--

CREATE SEQUENCE "Owners _owner_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Owners _owner_id_seq" OWNER TO web;

--
-- Name: Owners _owner_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: web
--

ALTER SEQUENCE "Owners _owner_id_seq" OWNED BY "Owners ".owner_id;


--
-- Name: Parcels; Type: TABLE; Schema: humanface; Owner: web
--

CREATE TABLE "Parcels" (
    parcel_id integer NOT NULL,
    concurred_price money,
    date_concurred date,
    date_title_search date,
    date_offer_made date,
    date_offer_accepted date,
    date_condemn_approval date,
    date_assignedto_attornery date,
    date_petition_filed date,
    date_commis_hearing date,
    date_order_vesting_title date,
    date_final_title_certi date,
    block_no integer,
    parcel_no integer,
    ward_no integer,
    court_id integer,
    date_assigned_for_demolition date,
    date_removed date,
    income money
);


ALTER TABLE "Parcels" OWNER TO web;

--
-- Name: Parcels_parcel_id_seq; Type: SEQUENCE; Schema: humanface; Owner: web
--

CREATE SEQUENCE "Parcels_parcel_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Parcels_parcel_id_seq" OWNER TO web;

--
-- Name: Parcels_parcel_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: web
--

ALTER SEQUENCE "Parcels_parcel_id_seq" OWNED BY "Parcels".parcel_id;


--
-- Name: Tenants; Type: TABLE; Schema: humanface; Owner: web
--

CREATE TABLE "Tenants" (
    tenant_id integer NOT NULL,
    tenant_name character(255),
    date_vacated date,
    rent_per_month money,
    rent_refund money,
    rent_address character(255),
    "building-id" integer
);


ALTER TABLE "Tenants" OWNER TO web;

--
-- Name: Tenants_tenant_id_seq; Type: SEQUENCE; Schema: humanface; Owner: web
--

CREATE SEQUENCE "Tenants_tenant_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Tenants_tenant_id_seq" OWNER TO web;

--
-- Name: Tenants_tenant_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: web
--

ALTER SEQUENCE "Tenants_tenant_id_seq" OWNED BY "Tenants".tenant_id;


--
-- Name: parcel_owner_assoc; Type: TABLE; Schema: humanface; Owner: web
--

CREATE TABLE parcel_owner_assoc (
    id integer NOT NULL,
    parcel_id integer,
    owner_id integer,
    puchase_prices money,
    loan_price money,
    deed_transfer_date date
);


ALTER TABLE parcel_owner_assoc OWNER TO web;

--
-- Name: parcel_owner_assoc_id_seq; Type: SEQUENCE; Schema: humanface; Owner: web
--

CREATE SEQUENCE parcel_owner_assoc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE parcel_owner_assoc_id_seq OWNER TO web;

--
-- Name: parcel_owner_assoc_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: web
--

ALTER SEQUENCE parcel_owner_assoc_id_seq OWNED BY parcel_owner_assoc.id;


--
-- Name: Appraisers appraiser_id; Type: DEFAULT; Schema: humanface; Owner: web
--

ALTER TABLE ONLY "Appraisers" ALTER COLUMN appraiser_id SET DEFAULT nextval('"Appraisers_appraiser_id_seq"'::regclass);


--
-- Name: Appraises appraise-id; Type: DEFAULT; Schema: humanface; Owner: web
--

ALTER TABLE ONLY "Appraises" ALTER COLUMN "appraise-id" SET DEFAULT nextval('"Appraises_appraise-id_seq"'::regclass);


--
-- Name: Buildings building_id; Type: DEFAULT; Schema: humanface; Owner: web
--

ALTER TABLE ONLY "Buildings" ALTER COLUMN building_id SET DEFAULT nextval('"Buildings_building_id_seq"'::regclass);


--
-- Name: Owners  owner_id; Type: DEFAULT; Schema: humanface; Owner: web
--

ALTER TABLE ONLY "Owners " ALTER COLUMN owner_id SET DEFAULT nextval('"Owners _owner_id_seq"'::regclass);


--
-- Name: Parcels parcel_id; Type: DEFAULT; Schema: humanface; Owner: web
--

ALTER TABLE ONLY "Parcels" ALTER COLUMN parcel_id SET DEFAULT nextval('"Parcels_parcel_id_seq"'::regclass);


--
-- Name: Tenants tenant_id; Type: DEFAULT; Schema: humanface; Owner: web
--

ALTER TABLE ONLY "Tenants" ALTER COLUMN tenant_id SET DEFAULT nextval('"Tenants_tenant_id_seq"'::regclass);


--
-- Name: parcel_owner_assoc id; Type: DEFAULT; Schema: humanface; Owner: web
--

ALTER TABLE ONLY parcel_owner_assoc ALTER COLUMN id SET DEFAULT nextval('parcel_owner_assoc_id_seq'::regclass);


--
-- Data for Name: Appraisers; Type: TABLE DATA; Schema: humanface; Owner: web
--

COPY "Appraisers" (appraiser_id, appraiser_name, company_name) FROM stdin;
\.


--
-- Name: Appraisers_appraiser_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: web
--

SELECT pg_catalog.setval('"Appraisers_appraiser_id_seq"', 1, false);


--
-- Data for Name: Appraises; Type: TABLE DATA; Schema: humanface; Owner: web
--

COPY "Appraises" ("appraise-id", appraiser_id, parcel_id, imps_value, area_of_house, land_value, total_value, reproduction_value) FROM stdin;
\.


--
-- Name: Appraises_appraise-id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: web
--

SELECT pg_catalog.setval('"Appraises_appraise-id_seq"', 1, false);


--
-- Data for Name: Buildings; Type: TABLE DATA; Schema: humanface; Owner: web
--

COPY "Buildings" (building_id, "st-name", apt_no, num_units, area_of_units, use_of_building, parcel_id, number_of_rooms) FROM stdin;
\.


--
-- Name: Buildings_building_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: web
--

SELECT pg_catalog.setval('"Buildings_building_id_seq"', 1, false);


--
-- Data for Name: Owners ; Type: TABLE DATA; Schema: humanface; Owner: web
--

COPY "Owners " (owner_id, owner_name, pass_away_date, is_heir) FROM stdin;
\.


--
-- Name: Owners _owner_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: web
--

SELECT pg_catalog.setval('"Owners _owner_id_seq"', 1, false);


--
-- Data for Name: Parcels; Type: TABLE DATA; Schema: humanface; Owner: web
--

COPY "Parcels" (parcel_id, concurred_price, date_concurred, date_title_search, date_offer_made, date_offer_accepted, date_condemn_approval, date_assignedto_attornery, date_petition_filed, date_commis_hearing, date_order_vesting_title, date_final_title_certi, block_no, parcel_no, ward_no, court_id, date_assigned_for_demolition, date_removed, income) FROM stdin;
\.


--
-- Name: Parcels_parcel_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: web
--

SELECT pg_catalog.setval('"Parcels_parcel_id_seq"', 1, false);


--
-- Data for Name: Tenants; Type: TABLE DATA; Schema: humanface; Owner: web
--

COPY "Tenants" (tenant_id, tenant_name, date_vacated, rent_per_month, rent_refund, rent_address, "building-id") FROM stdin;
\.


--
-- Name: Tenants_tenant_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: web
--

SELECT pg_catalog.setval('"Tenants_tenant_id_seq"', 1, false);


--
-- Data for Name: parcel_owner_assoc; Type: TABLE DATA; Schema: humanface; Owner: web
--

COPY parcel_owner_assoc (id, parcel_id, owner_id, puchase_prices, loan_price, deed_transfer_date) FROM stdin;
\.


--
-- Name: parcel_owner_assoc_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: web
--

SELECT pg_catalog.setval('parcel_owner_assoc_id_seq', 1, false);


--
-- Name: Appraisers Appraisers_pkey; Type: CONSTRAINT; Schema: humanface; Owner: web
--

ALTER TABLE ONLY "Appraisers"
    ADD CONSTRAINT "Appraisers_pkey" PRIMARY KEY (appraiser_id);


--
-- Name: Appraises Appraises_pkey; Type: CONSTRAINT; Schema: humanface; Owner: web
--

ALTER TABLE ONLY "Appraises"
    ADD CONSTRAINT "Appraises_pkey" PRIMARY KEY ("appraise-id");


--
-- Name: Buildings Buildings_pkey; Type: CONSTRAINT; Schema: humanface; Owner: web
--

ALTER TABLE ONLY "Buildings"
    ADD CONSTRAINT "Buildings_pkey" PRIMARY KEY (building_id);


--
-- Name: Owners  Owners _pkey; Type: CONSTRAINT; Schema: humanface; Owner: web
--

ALTER TABLE ONLY "Owners "
    ADD CONSTRAINT "Owners _pkey" PRIMARY KEY (owner_id);


--
-- Name: Parcels Parcels_pkey; Type: CONSTRAINT; Schema: humanface; Owner: web
--

ALTER TABLE ONLY "Parcels"
    ADD CONSTRAINT "Parcels_pkey" PRIMARY KEY (parcel_id);


--
-- Name: Tenants Tenants_pkey; Type: CONSTRAINT; Schema: humanface; Owner: web
--

ALTER TABLE ONLY "Tenants"
    ADD CONSTRAINT "Tenants_pkey" PRIMARY KEY (tenant_id);


--
-- Name: parcel_owner_assoc parcel_owner_assoc_pkey; Type: CONSTRAINT; Schema: humanface; Owner: web
--

ALTER TABLE ONLY parcel_owner_assoc
    ADD CONSTRAINT parcel_owner_assoc_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

