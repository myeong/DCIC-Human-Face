--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: humanface; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA humanface;


ALTER SCHEMA humanface OWNER TO postgres;

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
-- Name: appraisers; Type: TABLE; Schema: humanface; Owner: postgres
--

CREATE TABLE appraisers (
    appraiser_id integer NOT NULL,
    appraiser_name character(255),
    company_name character(255)
);


ALTER TABLE appraisers OWNER TO postgres;

--
-- Name: Appraisers_appraiser_id_seq; Type: SEQUENCE; Schema: humanface; Owner: postgres
--

CREATE SEQUENCE "Appraisers_appraiser_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Appraisers_appraiser_id_seq" OWNER TO postgres;

--
-- Name: Appraisers_appraiser_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: postgres
--

ALTER SEQUENCE "Appraisers_appraiser_id_seq" OWNED BY appraisers.appraiser_id;


--
-- Name: appraisals; Type: TABLE; Schema: humanface; Owner: postgres
--

CREATE TABLE appraisals (
    "appraisal-id" integer NOT NULL,
    appraiser_id integer,
    parcel_id integer,
    imps_value money,
    area_of_house numeric(50,0),
    land_value money,
    total_value money,
    reproduction_value money,
    income money
);


ALTER TABLE appraisals OWNER TO postgres;

--
-- Name: Appraises_appraise-id_seq; Type: SEQUENCE; Schema: humanface; Owner: postgres
--

CREATE SEQUENCE "Appraises_appraise-id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Appraises_appraise-id_seq" OWNER TO postgres;

--
-- Name: Appraises_appraise-id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: postgres
--

ALTER SEQUENCE "Appraises_appraise-id_seq" OWNED BY appraisals."appraisal-id";


--
-- Name: buildings; Type: TABLE; Schema: humanface; Owner: postgres
--

CREATE TABLE buildings (
    building_id integer NOT NULL,
    st_name character(255),
    apt_no integer,
    area_of_units numeric,
    use_of_building character(255),
    parcel_id integer,
    number_of_rooms integer,
    address character(255)
);


ALTER TABLE buildings OWNER TO postgres;

--
-- Name: Buildings_building_id_seq; Type: SEQUENCE; Schema: humanface; Owner: postgres
--

CREATE SEQUENCE "Buildings_building_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Buildings_building_id_seq" OWNER TO postgres;

--
-- Name: Buildings_building_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: postgres
--

ALTER SEQUENCE "Buildings_building_id_seq" OWNED BY buildings.building_id;


--
-- Name: events; Type: TABLE; Schema: humanface; Owner: postgres
--

CREATE TABLE events (
    event_id integer NOT NULL,
    response character(255),
    extra_information text,
    parcel_id integer,
    date date,
    type integer,
    price bigint
);


ALTER TABLE events OWNER TO postgres;

--
-- Name: Event_id_seq; Type: SEQUENCE; Schema: humanface; Owner: postgres
--

CREATE SEQUENCE "Event_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Event_id_seq" OWNER TO postgres;

--
-- Name: Event_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: postgres
--

ALTER SEQUENCE "Event_id_seq" OWNED BY events.event_id;


--
-- Name: owners; Type: TABLE; Schema: humanface; Owner: postgres
--

CREATE TABLE owners (
    owner_id integer NOT NULL,
    owner_name character(255),
    pass_away_date date,
    is_heir character(5)
);


ALTER TABLE owners OWNER TO postgres;

--
-- Name: Owners _owner_id_seq; Type: SEQUENCE; Schema: humanface; Owner: postgres
--

CREATE SEQUENCE "Owners _owner_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Owners _owner_id_seq" OWNER TO postgres;

--
-- Name: Owners _owner_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: postgres
--

ALTER SEQUENCE "Owners _owner_id_seq" OWNED BY owners.owner_id;


--
-- Name: parcels_old; Type: TABLE; Schema: humanface; Owner: postgres
--

CREATE TABLE parcels_old (
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
    special_proceeding_no integer,
    date_assigned_for_demolition date,
    date_removed date,
    address character(255)
);


ALTER TABLE parcels_old OWNER TO postgres;

--
-- Name: Parcels_parcel_id_seq; Type: SEQUENCE; Schema: humanface; Owner: postgres
--

CREATE SEQUENCE "Parcels_parcel_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Parcels_parcel_id_seq" OWNER TO postgres;

--
-- Name: Parcels_parcel_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: postgres
--

ALTER SEQUENCE "Parcels_parcel_id_seq" OWNED BY parcels_old.parcel_id;


--
-- Name: property_photos ; Type: TABLE; Schema: humanface; Owner: postgres
--

CREATE TABLE "property_photos " (
    id integer NOT NULL,
    property_id integer,
    path character(255)
);


ALTER TABLE "property_photos " OWNER TO postgres;

--
-- Name: Property photos _id_seq; Type: SEQUENCE; Schema: humanface; Owner: postgres
--

CREATE SEQUENCE "Property photos _id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Property photos _id_seq" OWNER TO postgres;

--
-- Name: Property photos _id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: postgres
--

ALTER SEQUENCE "Property photos _id_seq" OWNED BY "property_photos ".id;


--
-- Name: tenants; Type: TABLE; Schema: humanface; Owner: postgres
--

CREATE TABLE tenants (
    tenant_id integer NOT NULL,
    tenant_name character(255),
    date_vacated date,
    rent_per_month money,
    rent_refund money,
    rent_address character(255),
    building_id integer
);


ALTER TABLE tenants OWNER TO postgres;

--
-- Name: Tenants_tenant_id_seq; Type: SEQUENCE; Schema: humanface; Owner: postgres
--

CREATE SEQUENCE "Tenants_tenant_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Tenants_tenant_id_seq" OWNER TO postgres;

--
-- Name: Tenants_tenant_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: postgres
--

ALTER SEQUENCE "Tenants_tenant_id_seq" OWNED BY tenants.tenant_id;


--
-- Name: addresses; Type: TABLE; Schema: humanface; Owner: postgres
--

CREATE TABLE addresses (
    id integer NOT NULL,
    st_num character(64),
    st_name character(255),
    parcel_id integer
);


ALTER TABLE addresses OWNER TO postgres;

--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: humanface; Owner: postgres
--

CREATE SEQUENCE addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE addresses_id_seq OWNER TO postgres;

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: postgres
--

ALTER SEQUENCE addresses_id_seq OWNED BY addresses.id;


--
-- Name: event_people_assoc; Type: TABLE; Schema: humanface; Owner: postgres
--

CREATE TABLE event_people_assoc (
    id integer NOT NULL,
    event_id integer,
    person_id integer,
    role character(64)
);


ALTER TABLE event_people_assoc OWNER TO postgres;

--
-- Name: event_people_assoc_id_seq; Type: SEQUENCE; Schema: humanface; Owner: postgres
--

CREATE SEQUENCE event_people_assoc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE event_people_assoc_id_seq OWNER TO postgres;

--
-- Name: event_people_assoc_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: postgres
--

ALTER SEQUENCE event_people_assoc_id_seq OWNED BY event_people_assoc.id;


--
-- Name: event_types; Type: TABLE; Schema: humanface; Owner: postgres
--

CREATE TABLE event_types (
    id integer NOT NULL,
    type character(255) NOT NULL
);


ALTER TABLE event_types OWNER TO postgres;

--
-- Name: event_types_id_seq; Type: SEQUENCE; Schema: humanface; Owner: postgres
--

CREATE SEQUENCE event_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE event_types_id_seq OWNER TO postgres;

--
-- Name: event_types_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: postgres
--

ALTER SEQUENCE event_types_id_seq OWNED BY event_types.id;


--
-- Name: parcel_owner_assoc; Type: TABLE; Schema: humanface; Owner: postgres
--

CREATE TABLE parcel_owner_assoc (
    id integer NOT NULL,
    parcel_id integer,
    owner_id integer,
    puchase_prices money,
    loan_price money,
    deed_transfer_date date
);


ALTER TABLE parcel_owner_assoc OWNER TO postgres;

--
-- Name: parcel_owner_assoc_id_seq; Type: SEQUENCE; Schema: humanface; Owner: postgres
--

CREATE SEQUENCE parcel_owner_assoc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE parcel_owner_assoc_id_seq OWNER TO postgres;

--
-- Name: parcel_owner_assoc_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: postgres
--

ALTER SEQUENCE parcel_owner_assoc_id_seq OWNED BY parcel_owner_assoc.id;


--
-- Name: parcels; Type: TABLE; Schema: humanface; Owner: postgres
--

CREATE TABLE parcels (
    parcel_id integer NOT NULL,
    block_no integer NOT NULL,
    parcel_no integer NOT NULL,
    ward_no integer,
    land_use character(64)
);


ALTER TABLE parcels OWNER TO postgres;

--
-- Name: parcels_parcel_id_seq; Type: SEQUENCE; Schema: humanface; Owner: postgres
--

CREATE SEQUENCE parcels_parcel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE parcels_parcel_id_seq OWNER TO postgres;

--
-- Name: parcels_parcel_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: postgres
--

ALTER SEQUENCE parcels_parcel_id_seq OWNED BY parcels.parcel_id;


--
-- Name: people; Type: TABLE; Schema: humanface; Owner: postgres
--

CREATE TABLE people (
    person_id integer NOT NULL,
    name character(255)
);


ALTER TABLE people OWNER TO postgres;

--
-- Name: people_id_seq; Type: SEQUENCE; Schema: humanface; Owner: postgres
--

CREATE SEQUENCE people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE people_id_seq OWNER TO postgres;

--
-- Name: people_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: postgres
--

ALTER SEQUENCE people_id_seq OWNED BY people.person_id;


--
-- Name: id; Type: DEFAULT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY addresses ALTER COLUMN id SET DEFAULT nextval('addresses_id_seq'::regclass);


--
-- Name: appraisal-id; Type: DEFAULT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY appraisals ALTER COLUMN "appraisal-id" SET DEFAULT nextval('"Appraises_appraise-id_seq"'::regclass);


--
-- Name: appraiser_id; Type: DEFAULT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY appraisers ALTER COLUMN appraiser_id SET DEFAULT nextval('"Appraisers_appraiser_id_seq"'::regclass);


--
-- Name: building_id; Type: DEFAULT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY buildings ALTER COLUMN building_id SET DEFAULT nextval('"Buildings_building_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY event_people_assoc ALTER COLUMN id SET DEFAULT nextval('event_people_assoc_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY event_types ALTER COLUMN id SET DEFAULT nextval('event_types_id_seq'::regclass);


--
-- Name: event_id; Type: DEFAULT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY events ALTER COLUMN event_id SET DEFAULT nextval('"Event_id_seq"'::regclass);


--
-- Name: owner_id; Type: DEFAULT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY owners ALTER COLUMN owner_id SET DEFAULT nextval('"Owners _owner_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY parcel_owner_assoc ALTER COLUMN id SET DEFAULT nextval('parcel_owner_assoc_id_seq'::regclass);


--
-- Name: parcel_id; Type: DEFAULT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY parcels ALTER COLUMN parcel_id SET DEFAULT nextval('parcels_parcel_id_seq'::regclass);


--
-- Name: parcel_id; Type: DEFAULT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY parcels_old ALTER COLUMN parcel_id SET DEFAULT nextval('"Parcels_parcel_id_seq"'::regclass);


--
-- Name: person_id; Type: DEFAULT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY people ALTER COLUMN person_id SET DEFAULT nextval('people_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY "property_photos " ALTER COLUMN id SET DEFAULT nextval('"Property photos _id_seq"'::regclass);


--
-- Name: tenant_id; Type: DEFAULT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY tenants ALTER COLUMN tenant_id SET DEFAULT nextval('"Tenants_tenant_id_seq"'::regclass);


--
-- Name: Appraisers_appraiser_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('"Appraisers_appraiser_id_seq"', 1, true);


--
-- Name: Appraises_appraise-id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('"Appraises_appraise-id_seq"', 1, true);


--
-- Name: Buildings_building_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('"Buildings_building_id_seq"', 1, false);


--
-- Name: Event_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('"Event_id_seq"', 400, true);


--
-- Name: Owners _owner_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('"Owners _owner_id_seq"', 1, false);


--
-- Name: Parcels_parcel_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('"Parcels_parcel_id_seq"', 1, false);


--
-- Name: Property photos _id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('"Property photos _id_seq"', 1, false);


--
-- Name: Tenants_tenant_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('"Tenants_tenant_id_seq"', 1, false);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

INSERT INTO addresses VALUES (1, '140                                                             ', 'Asheland Ave.                                                                                                                                                                                                                                                  ', 1);
INSERT INTO addresses VALUES (2, 'Rear of 140                                                     ', 'Asheland Ave.                                                                                                                                                                                                                                                  ', 1);
INSERT INTO addresses VALUES (4715, '180 1/2                                                         ', 'Asheland Avenue                                                                                                                                                                                                                                                ', 4714);
INSERT INTO addresses VALUES (4716, '                                                                ', '                                                                                                                                                                                                                                                               ', 4714);
INSERT INTO addresses VALUES (4717, '82                                                              ', 'Livingston St                                                                                                                                                                                                                                                  ', 4715);
INSERT INTO addresses VALUES (4718, '                                                                ', '                                                                                                                                                                                                                                                               ', 4715);
INSERT INTO addresses VALUES (4719, '86                                                              ', 'Livingston St                                                                                                                                                                                                                                                  ', 4716);
INSERT INTO addresses VALUES (4720, '                                                                ', '                                                                                                                                                                                                                                                               ', 4716);
INSERT INTO addresses VALUES (9453, 'Across from 9                                                   ', 'Louie Street Asheville N.C                                                                                                                                                                                                                                     ', 9439);
INSERT INTO addresses VALUES (9454, '                                                                ', '                                                                                                                                                                                                                                                               ', 9439);
INSERT INTO addresses VALUES (14165, '118                                                             ', 'Livingston St                                                                                                                                                                                                                                                  ', 14148);
INSERT INTO addresses VALUES (14166, '                                                                ', '                                                                                                                                                                                                                                                               ', 14148);
INSERT INTO addresses VALUES (14211, 'N/W Cor.                                                        ', 'Depost St. and Southern Street                                                                                                                                                                                                                                 ', 14171);
INSERT INTO addresses VALUES (14212, '                                                                ', '                                                                                                                                                                                                                                                               ', 14171);
INSERT INTO addresses VALUES (9455, 'On Louis street of Randell Street                               ', 'Asheville N.C,                                                                                                                                                                                                                                                 ', 9440);
INSERT INTO addresses VALUES (9456, '                                                                ', '                                                                                                                                                                                                                                                               ', 9440);
INSERT INTO addresses VALUES (14167, 'Joins 128                                                       ', 'Livingston St                                                                                                                                                                                                                                                  ', 14149);
INSERT INTO addresses VALUES (14168, '                                                                ', '                                                                                                                                                                                                                                                               ', 14149);
INSERT INTO addresses VALUES (14213, 'Across from 20                                                  ', 'Palmer Street                                                                                                                                                                                                                                                  ', 14172);
INSERT INTO addresses VALUES (14214, '                                                                ', '                                                                                                                                                                                                                                                               ', 14172);
INSERT INTO addresses VALUES (9457, '28 Louis Street                                                 ', 'Asheville N.C,                                                                                                                                                                                                                                                 ', 9441);
INSERT INTO addresses VALUES (9458, '                                                                ', '                                                                                                                                                                                                                                                               ', 9441);
INSERT INTO addresses VALUES (14169, '128                                                             ', 'Livingston St                                                                                                                                                                                                                                                  ', 14150);
INSERT INTO addresses VALUES (14170, '                                                                ', '                                                                                                                                                                                                                                                               ', 14150);
INSERT INTO addresses VALUES (14215, 'Adjoins 5                                                       ', 'Palmer Street                                                                                                                                                                                                                                                  ', 14173);
INSERT INTO addresses VALUES (14216, '                                                                ', '                                                                                                                                                                                                                                                               ', 14173);
INSERT INTO addresses VALUES (14171, '130                                                             ', 'Livingston St                                                                                                                                                                                                                                                  ', 14151);
INSERT INTO addresses VALUES (14172, '                                                                ', '                                                                                                                                                                                                                                                               ', 14151);
INSERT INTO addresses VALUES (14217, '493                                                             ', 'S. French Broad Avenue                                                                                                                                                                                                                                         ', 14174);
INSERT INTO addresses VALUES (14218, '                                                                ', '                                                                                                                                                                                                                                                               ', 14174);
INSERT INTO addresses VALUES (14173, '114, 114 1/2, 120                                               ', 'Louie Street (Curve)                                                                                                                                                                                                                                           ', 14152);
INSERT INTO addresses VALUES (14174, '                                                                ', '                                                                                                                                                                                                                                                               ', 14152);
INSERT INTO addresses VALUES (14219, 'Across from 508                                                 ', 'South French Broad                                                                                                                                                                                                                                             ', 14175);
INSERT INTO addresses VALUES (14220, '                                                                ', '                                                                                                                                                                                                                                                               ', 14175);
INSERT INTO addresses VALUES (14175, '108                                                             ', 'Louie St (Curve)                                                                                                                                                                                                                                               ', 14153);
INSERT INTO addresses VALUES (14176, '                                                                ', '                                                                                                                                                                                                                                                               ', 14153);
INSERT INTO addresses VALUES (14221, 'Across from 498                                                 ', 'S. French Broad Ave                                                                                                                                                                                                                                            ', 14176);
INSERT INTO addresses VALUES (14222, '                                                                ', '                                                                                                                                                                                                                                                               ', 14176);
INSERT INTO addresses VALUES (14177, '109                                                             ', 'Louie St (Curve)                                                                                                                                                                                                                                               ', 14154);
INSERT INTO addresses VALUES (14178, '                                                                ', '                                                                                                                                                                                                                                                               ', 14154);
INSERT INTO addresses VALUES (14223, '12                                                              ', 'Water St.                                                                                                                                                                                                                                                      ', 14177);
INSERT INTO addresses VALUES (14224, '                                                                ', '                                                                                                                                                                                                                                                               ', 14177);
INSERT INTO addresses VALUES (14179, '96                                                              ', 'Louie (Curve) St                                                                                                                                                                                                                                               ', 14155);
INSERT INTO addresses VALUES (14180, '                                                                ', '                                                                                                                                                                                                                                                               ', 14155);
INSERT INTO addresses VALUES (14181, 'Adjoins 96                                                      ', 'Louie St                                                                                                                                                                                                                                                       ', 14156);
INSERT INTO addresses VALUES (14182, '                                                                ', '                                                                                                                                                                                                                                                               ', 14156);
INSERT INTO addresses VALUES (14227, '73                                                              ', 'Black St.                                                                                                                                                                                                                                                      ', 14179);
INSERT INTO addresses VALUES (14228, '                                                                ', '                                                                                                                                                                                                                                                               ', 14179);
INSERT INTO addresses VALUES (14183, '62                                                              ', 'Graham Street                                                                                                                                                                                                                                                  ', 14157);
INSERT INTO addresses VALUES (14184, '                                                                ', '                                                                                                                                                                                                                                                               ', 14157);
INSERT INTO addresses VALUES (14229, '138                                                             ', 'Livingstone Street                                                                                                                                                                                                                                             ', 14180);
INSERT INTO addresses VALUES (14230, '                                                                ', '                                                                                                                                                                                                                                                               ', 14180);
INSERT INTO addresses VALUES (14185, '78                                                              ', 'Louie St                                                                                                                                                                                                                                                       ', 14158);
INSERT INTO addresses VALUES (14186, '                                                                ', '                                                                                                                                                                                                                                                               ', 14158);
INSERT INTO addresses VALUES (14231, '52                                                              ', 'Livingston St.                                                                                                                                                                                                                                                 ', 14181);
INSERT INTO addresses VALUES (14232, '                                                                ', '                                                                                                                                                                                                                                                               ', 14181);
INSERT INTO addresses VALUES (14187, '74                                                              ', 'Louie St                                                                                                                                                                                                                                                       ', 14159);
INSERT INTO addresses VALUES (14188, '                                                                ', '                                                                                                                                                                                                                                                               ', 14159);
INSERT INTO addresses VALUES (14189, '58                                                              ', 'Louie St                                                                                                                                                                                                                                                       ', 14160);
INSERT INTO addresses VALUES (14190, '                                                                ', '                                                                                                                                                                                                                                                               ', 14160);
INSERT INTO addresses VALUES (14191, '48                                                              ', 'Corner of Louie Street and Depot street                                                                                                                                                                                                                        ', 14161);
INSERT INTO addresses VALUES (14192, '                                                                ', '                                                                                                                                                                                                                                                               ', 14161);
INSERT INTO addresses VALUES (14193, '3                                                               ', 'Graham Place                                                                                                                                                                                                                                                   ', 14162);
INSERT INTO addresses VALUES (14194, '                                                                ', '                                                                                                                                                                                                                                                               ', 14162);
INSERT INTO addresses VALUES (14195, '5                                                               ', 'Alley off Depot at Louise Street or Graham Place                                                                                                                                                                                                               ', 14163);
INSERT INTO addresses VALUES (14196, '                                                                ', '                                                                                                                                                                                                                                                               ', 14163);
INSERT INTO addresses VALUES (14197, '5                                                               ', 'Alley off Depot at Louie Street or Graham Place                                                                                                                                                                                                                ', 14164);
INSERT INTO addresses VALUES (14198, '                                                                ', '                                                                                                                                                                                                                                                               ', 14164);
INSERT INTO addresses VALUES (14199, '7                                                               ', 'Graham St                                                                                                                                                                                                                                                      ', 14165);
INSERT INTO addresses VALUES (14200, '                                                                ', '                                                                                                                                                                                                                                                               ', 14165);
INSERT INTO addresses VALUES (14201, 'Adjoins 58                                                      ', 'Graham Place                                                                                                                                                                                                                                                   ', 14166);
INSERT INTO addresses VALUES (14202, '                                                                ', '                                                                                                                                                                                                                                                               ', 14166);
INSERT INTO addresses VALUES (14203, 'Adjoins 58                                                      ', 'Graham Place                                                                                                                                                                                                                                                   ', 14167);
INSERT INTO addresses VALUES (14204, '                                                                ', '                                                                                                                                                                                                                                                               ', 14167);
INSERT INTO addresses VALUES (14205, 'Adjoins 58                                                      ', 'Graham Place                                                                                                                                                                                                                                                   ', 14168);
INSERT INTO addresses VALUES (14206, '                                                                ', '                                                                                                                                                                                                                                                               ', 14168);
INSERT INTO addresses VALUES (14207, 'N/E Cor.                                                        ', 'Southern St. and Graham Street                                                                                                                                                                                                                                 ', 14169);
INSERT INTO addresses VALUES (14208, '                                                                ', '                                                                                                                                                                                                                                                               ', 14169);
INSERT INTO addresses VALUES (9433, '94                                                              ', 'Livingston St                                                                                                                                                                                                                                                  ', 9429);
INSERT INTO addresses VALUES (9434, '                                                                ', '                                                                                                                                                                                                                                                               ', 9429);
INSERT INTO addresses VALUES (9435, '98                                                              ', 'Livingston St                                                                                                                                                                                                                                                  ', 9430);
INSERT INTO addresses VALUES (9436, '                                                                ', '                                                                                                                                                                                                                                                               ', 9430);
INSERT INTO addresses VALUES (9437, 'Rear 101 - 104                                                  ', 'Livingston St                                                                                                                                                                                                                                                  ', 9431);
INSERT INTO addresses VALUES (9438, '                                                                ', '                                                                                                                                                                                                                                                               ', 9431);
INSERT INTO addresses VALUES (9439, '98                                                              ', 'Livingston St                                                                                                                                                                                                                                                  ', 9432);
INSERT INTO addresses VALUES (9440, '                                                                ', '                                                                                                                                                                                                                                                               ', 9432);
INSERT INTO addresses VALUES (9441, '94                                                              ', 'Livingston St                                                                                                                                                                                                                                                  ', 9433);
INSERT INTO addresses VALUES (9442, '                                                                ', '                                                                                                                                                                                                                                                               ', 9433);
INSERT INTO addresses VALUES (9443, '100                                                             ', 'Livingston St                                                                                                                                                                                                                                                  ', 9434);
INSERT INTO addresses VALUES (9444, '                                                                ', '                                                                                                                                                                                                                                                               ', 9434);
INSERT INTO addresses VALUES (9445, 'Adj. 104                                                        ', 'Livingston St                                                                                                                                                                                                                                                  ', 9435);
INSERT INTO addresses VALUES (9446, '                                                                ', '                                                                                                                                                                                                                                                               ', 9435);
INSERT INTO addresses VALUES (9447, '108                                                             ', 'Livingston St                                                                                                                                                                                                                                                  ', 9436);
INSERT INTO addresses VALUES (9448, '                                                                ', '                                                                                                                                                                                                                                                               ', 9436);
INSERT INTO addresses VALUES (9449, '116                                                             ', 'Livingston St                                                                                                                                                                                                                                                  ', 9437);
INSERT INTO addresses VALUES (9450, '                                                                ', '                                                                                                                                                                                                                                                               ', 9437);
INSERT INTO addresses VALUES (9451, '467-491                                                         ', 's. French Broad Ave.                                                                                                                                                                                                                                           ', 9438);
INSERT INTO addresses VALUES (9452, '                                                                ', '                                                                                                                                                                                                                                                               ', 9438);
INSERT INTO addresses VALUES (14209, 'N/S                                                             ', 'Southern Street                                                                                                                                                                                                                                                ', 14170);
INSERT INTO addresses VALUES (14210, '                                                                ', '                                                                                                                                                                                                                                                               ', 14170);


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('addresses_id_seq', 14232, true);


--
-- Data for Name: appraisals; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

INSERT INTO appraisals VALUES (1, 1, 1, '$6,400.00', 2500, '$4,000.00', '$10,400.00', '$10,894.00', NULL);
INSERT INTO appraisals VALUES (5, 5, 2, '$2,800.00', 1420, '$4,200.00', '$7,000.00', '$11,766.00', NULL);
INSERT INTO appraisals VALUES (6, 6, 2, '$4,100.00', 1420, '$5,100.00', '$9,300.00', '$13,817.00', NULL);
INSERT INTO appraisals VALUES (4, 4, 2, '$2,050.00', 1420, '$4,200.00', '$6,250.00', '$15,440.00', NULL);
INSERT INTO appraisals VALUES (3, 3, 1, NULL, 2500, NULL, NULL, '$9,135.00', NULL);
INSERT INTO appraisals VALUES (2, 2, 1, '$4,800.00', 2500, NULL, '$110,000.00', NULL, NULL);


--
-- Data for Name: appraisers; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

INSERT INTO appraisers VALUES (1, 'Alan Butterworth                                                                                                                                                                                                                                               ', 'W. T. Duckworth Company                                                                                                                                                                                                                                        ');
INSERT INTO appraisers VALUES (2, 'H. E. Johnson                                                                                                                                                                                                                                                  ', 'H. E. Johnson                                                                                                                                                                                                                                                  ');
INSERT INTO appraisers VALUES (4, 'Clyde G Idol Jr                                                                                                                                                                                                                                                ', 'Charles W. Bradshaw. Inc                                                                                                                                                                                                                                       ');
INSERT INTO appraisers VALUES (5, 'Alan Butterworth                                                                                                                                                                                                                                               ', 'W. T. Duckworth Company                                                                                                                                                                                                                                        ');
INSERT INTO appraisers VALUES (6, 'H E. Johnson                                                                                                                                                                                                                                                   ', 'H E. Johnson                                                                                                                                                                                                                                                   ');
INSERT INTO appraisers VALUES (3, 'Charles W. Bradshaw                                                                                                                                                                                                                                            ', 'Charles W. Bradshaw. Inc.                                                                                                                                                                                                                                      ');


--
-- Data for Name: buildings; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

INSERT INTO buildings VALUES (1, 'Coxe Avenue                                                                                                                                                                                                                                                    ', 51, 2500, 'commerical                                                                                                                                                                                                                                                     ', 1, 1, NULL);
INSERT INTO buildings VALUES (2, '                                                                                                                                                                                                                                                               ', 2, 1420, 'commerical                                                                                                                                                                                                                                                     ', 2, 4, NULL);


--
-- Data for Name: event_people_assoc; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

INSERT INTO event_people_assoc VALUES (1, 1, 1, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (2, 1, 2, 'haca                                                            ');
INSERT INTO event_people_assoc VALUES (3, 2, 3, 'haca                                                            ');
INSERT INTO event_people_assoc VALUES (4, 2, 1, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (5, 3, 4, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (6, 3, 1, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (7, 4, 5, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (8, 4, 1, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (9, 5, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (10, 5, 1, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (11, 6, 3, 'haca                                                            ');
INSERT INTO event_people_assoc VALUES (12, 6, 1, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (13, 7, 1, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (14, 7, 7, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (15, 7, 8, 'haca                                                            ');
INSERT INTO event_people_assoc VALUES (16, 8, 9, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (17, 8, 10, 'other                                                           ');
INSERT INTO event_people_assoc VALUES (18, 8, 2, 'haca                                                            ');
INSERT INTO event_people_assoc VALUES (19, 9, 10, 'other                                                           ');
INSERT INTO event_people_assoc VALUES (20, 9, 2, 'haca                                                            ');
INSERT INTO event_people_assoc VALUES (21, 10, 10, 'other                                                           ');
INSERT INTO event_people_assoc VALUES (22, 10, 2, 'haca                                                            ');
INSERT INTO event_people_assoc VALUES (23, 11, 9, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (24, 11, 2, 'haca                                                            ');
INSERT INTO event_people_assoc VALUES (25, 12, 9, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (26, 12, 2, 'haca                                                            ');
INSERT INTO event_people_assoc VALUES (27, 13, 9, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (28, 14, 4, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (29, 15, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (30, 16, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (31, 17, 12, NULL);
INSERT INTO event_people_assoc VALUES (32, 18, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (33, 19, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (34, 20, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (35, 21, 14, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (36, 21, 15, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (37, 21, 16, NULL);
INSERT INTO event_people_assoc VALUES (38, 22, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (39, 22, 17, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (40, 23, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (41, 23, 17, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (42, 24, 17, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (43, 24, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (44, 25, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (45, 25, 17, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (46, 26, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (47, 26, 1, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (48, 27, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (49, 27, 18, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (50, 28, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (51, 28, 18, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (52, 29, 18, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (53, 29, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (54, 30, 18, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (55, 30, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (56, 31, 1, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (57, 31, 18, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (58, 32, 18, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (59, 32, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (60, 33, 19, 'tenant                                                          ');
INSERT INTO event_people_assoc VALUES (61, 33, 2, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (62, 34, 18, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (63, 34, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (64, 35, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (65, 35, 20, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (66, 36, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (67, 36, 20, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (68, 37, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (69, 37, 20, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (70, 38, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (71, 38, 20, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (72, 39, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (73, 39, 20, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (74, 40, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (75, 40, 20, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (76, 41, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (77, 41, 20, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (78, 42, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (79, 42, 20, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (80, 43, 21, NULL);
INSERT INTO event_people_assoc VALUES (81, 44, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (82, 44, 22, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (83, 45, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (84, 45, 23, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (85, 46, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (86, 46, 24, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (87, 47, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (88, 47, 25, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (89, 48, 26, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (90, 48, 24, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (91, 49, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (92, 49, 24, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (93, 50, 23, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (94, 50, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (95, 51, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (96, 51, 23, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (97, 52, 27, NULL);
INSERT INTO event_people_assoc VALUES (98, 53, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (99, 54, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (100, 55, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (101, 56, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (102, 56, 28, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (103, 57, 29, 'other                                                           ');
INSERT INTO event_people_assoc VALUES (104, 57, 28, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (105, 57, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (106, 58, 28, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (107, 58, 29, 'other                                                           ');
INSERT INTO event_people_assoc VALUES (108, 58, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (109, 59, 30, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (110, 59, 28, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (111, 60, 31, 'other                                                           ');
INSERT INTO event_people_assoc VALUES (112, 60, 28, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (113, 60, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (114, 61, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (115, 61, 28, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (116, 62, 23, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (117, 62, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (118, 63, 32, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (119, 63, 20, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (120, 64, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (121, 65, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (122, 66, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (123, 67, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (124, 67, 33, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (125, 67, 34, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (126, 68, 35, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (127, 68, 33, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (128, 69, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (129, 69, 33, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (130, 70, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (131, 70, 33, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (132, 71, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (133, 71, 33, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (134, 72, 36, 'tenant                                                          ');
INSERT INTO event_people_assoc VALUES (135, 72, 2, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (136, 73, 37, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (137, 73, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (138, 74, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (139, 74, 38, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (140, 75, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (141, 75, 39, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (142, 76, 30, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (143, 76, 28, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (144, 77, 29, 'other                                                           ');
INSERT INTO event_people_assoc VALUES (145, 77, 30, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (146, 77, 28, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (147, 77, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (148, 78, 30, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (149, 78, 28, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (150, 78, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (151, 79, 2, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (152, 79, 29, 'other                                                           ');
INSERT INTO event_people_assoc VALUES (153, 80, 30, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (154, 80, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (155, 81, 30, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (156, 81, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (157, 82, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (158, 82, 40, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (159, 82, 41, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (160, 83, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (161, 83, 40, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (162, 83, 41, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (163, 84, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (164, 84, 40, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (165, 84, 41, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (166, 85, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (167, 85, 40, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (168, 85, 41, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (169, 86, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (170, 86, 41, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (171, 86, 40, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (172, 87, 42, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (173, 87, 40, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (174, 87, 41, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (175, 88, 40, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (176, 88, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (177, 88, 41, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (178, 89, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (179, 89, 40, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (180, 89, 41, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (181, 89, 43, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (182, 89, 42, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (183, 90, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (184, 90, 44, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (185, 91, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (186, 91, 45, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (187, 92, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (188, 92, 46, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (189, 93, 47, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (190, 93, 48, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (191, 94, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (192, 94, 49, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (193, 94, 50, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (194, 94, 51, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (195, 94, 52, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (196, 94, 53, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (197, 95, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (198, 95, 51, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (199, 95, 50, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (200, 95, 52, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (201, 95, 53, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (202, 95, 49, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (203, 96, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (204, 96, 48, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (205, 97, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (206, 97, 48, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (207, 98, 54, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (208, 98, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (209, 99, 54, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (210, 100, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (211, 100, 55, NULL);
INSERT INTO event_people_assoc VALUES (212, 101, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (213, 102, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (214, 103, 54, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (215, 104, 56, 'tenant                                                          ');
INSERT INTO event_people_assoc VALUES (216, 104, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (217, 105, 57, 'tenant                                                          ');
INSERT INTO event_people_assoc VALUES (218, 105, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (219, 106, 58, 'tenant                                                          ');
INSERT INTO event_people_assoc VALUES (220, 106, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (221, 107, 59, 'tenant                                                          ');
INSERT INTO event_people_assoc VALUES (222, 107, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (223, 108, 60, 'tenant                                                          ');
INSERT INTO event_people_assoc VALUES (224, 108, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (225, 109, 61, 'tenant                                                          ');
INSERT INTO event_people_assoc VALUES (226, 109, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (227, 110, 62, 'tenant                                                          ');
INSERT INTO event_people_assoc VALUES (228, 111, 63, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (229, 111, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (230, 112, 64, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (231, 112, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (232, 113, 64, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (233, 113, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (234, 114, 64, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (235, 114, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (236, 115, 63, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (237, 115, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (238, 116, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (239, 116, 63, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (240, 117, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (241, 117, 63, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (242, 118, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (243, 118, 63, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (244, 119, 65, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (245, 119, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (246, 119, 66, NULL);
INSERT INTO event_people_assoc VALUES (247, 120, 63, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (248, 120, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (249, 121, 67, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (250, 121, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (251, 121, 68, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (252, 122, 68, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (253, 122, 67, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (254, 122, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (255, 123, 69, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (256, 123, 70, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (257, 123, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (258, 124, 68, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (259, 124, 67, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (260, 124, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (261, 125, 68, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (262, 125, 67, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (263, 125, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (264, 126, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (265, 126, 68, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (266, 126, 67, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (267, 127, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (268, 127, 68, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (269, 127, 67, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (270, 128, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (271, 128, 68, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (272, 128, 71, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (273, 129, 68, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (274, 129, 72, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (275, 129, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (276, 130, 68, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (277, 130, 67, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (278, 130, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (279, 131, 73, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (280, 131, 74, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (281, 131, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (282, 132, 73, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (283, 132, 74, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (284, 132, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (285, 133, 73, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (286, 133, 74, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (287, 133, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (288, 134, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (289, 135, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (290, 136, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (291, 137, 75, 'tenant                                                          ');
INSERT INTO event_people_assoc VALUES (292, 137, 2, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (293, 138, 76, 'tenant                                                          ');
INSERT INTO event_people_assoc VALUES (294, 138, 2, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (295, 139, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (296, 139, 77, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (297, 139, 78, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (298, 140, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (299, 140, 77, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (300, 140, 78, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (301, 141, 79, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (302, 141, 80, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (303, 141, 77, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (304, 141, 78, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (305, 142, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (306, 142, 81, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (307, 142, 78, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (308, 143, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (309, 143, 77, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (310, 143, 78, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (311, 144, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (312, 145, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (313, 146, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (314, 147, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (315, 147, 82, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (316, 147, 83, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (317, 148, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (318, 148, 82, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (319, 148, 83, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (320, 149, 84, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (321, 149, 85, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (322, 149, 86, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (323, 149, 82, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (324, 150, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (325, 150, 82, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (326, 150, 86, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (327, 150, 87, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (328, 151, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (329, 151, 82, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (330, 151, 86, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (331, 152, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (332, 153, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (333, 154, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (334, 155, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (335, 155, 82, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (336, 155, 85, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (337, 156, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (338, 156, 82, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (339, 156, 85, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (340, 157, 85, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (341, 157, 82, 'heir                                                            ');
INSERT INTO event_people_assoc VALUES (342, 158, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (343, 158, 82, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (344, 158, 87, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (345, 159, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (346, 159, 82, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (347, 159, 86, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (348, 160, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (349, 161, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (350, 162, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (351, 163, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (352, 163, 88, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (353, 163, 89, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (354, 164, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (355, 164, 89, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (356, 164, 88, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (357, 165, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (358, 165, 88, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (359, 165, 89, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (360, 166, 90, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (361, 166, 91, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (362, 166, 88, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (363, 166, 92, NULL);
INSERT INTO event_people_assoc VALUES (364, 167, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (365, 167, 88, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (366, 168, 2, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (367, 168, 88, 'tenant                                                          ');
INSERT INTO event_people_assoc VALUES (368, 169, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (369, 169, 93, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (370, 170, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (371, 170, 94, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (372, 171, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (373, 171, 93, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (374, 172, 93, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (375, 172, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (376, 173, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (377, 173, 93, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (378, 174, 95, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (379, 174, 93, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (380, 175, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (381, 175, 93, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (382, 175, 34, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (383, 176, 29, 'other                                                           ');
INSERT INTO event_people_assoc VALUES (384, 176, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (385, 176, 93, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (386, 177, 29, 'other                                                           ');
INSERT INTO event_people_assoc VALUES (387, 177, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (388, 177, 96, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (389, 178, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (390, 178, 97, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (391, 178, 98, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (392, 179, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (393, 179, 97, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (394, 179, 98, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (395, 180, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (396, 180, 97, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (397, 180, 98, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (398, 181, 97, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (399, 181, 98, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (400, 181, 99, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (401, 181, 100, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (402, 182, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (403, 182, 97, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (404, 183, 97, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (405, 183, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (406, 184, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (407, 184, 97, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (408, 185, 97, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (409, 185, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (410, 186, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (411, 187, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (412, 188, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (413, 189, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (414, 189, 101, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (415, 189, 102, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (416, 190, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (417, 190, 101, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (418, 190, 102, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (419, 191, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (420, 191, 101, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (421, 191, 102, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (422, 192, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (423, 192, 101, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (424, 192, 102, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (425, 193, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (426, 194, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (427, 195, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (428, 196, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (429, 196, 103, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (430, 197, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (431, 197, 103, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (432, 198, 104, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (433, 198, 103, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (434, 198, 105, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (435, 199, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (436, 199, 103, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (437, 200, 106, 'tenant                                                          ');
INSERT INTO event_people_assoc VALUES (438, 200, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (439, 200, 103, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (440, 201, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (441, 201, 103, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (442, 202, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (443, 203, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (444, 204, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (445, 205, 107, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (446, 205, 108, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (447, 205, 109, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (448, 206, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (449, 206, 108, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (450, 207, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (451, 207, 108, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (452, 208, 108, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (453, 208, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (454, 209, 29, 'other                                                           ');
INSERT INTO event_people_assoc VALUES (455, 209, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (456, 209, 108, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (457, 210, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (458, 211, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (459, 212, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (460, 213, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (461, 214, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (462, 214, 110, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (463, 215, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (464, 215, 110, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (465, 216, 111, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (466, 216, 110, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (467, 217, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (468, 217, 110, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (469, 218, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (470, 218, 112, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (471, 218, 110, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (472, 219, 113, NULL);
INSERT INTO event_people_assoc VALUES (473, 220, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (474, 221, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (475, 222, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (476, 223, 114, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (477, 223, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (478, 223, 115, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (479, 224, 114, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (480, 224, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (481, 224, 115, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (482, 225, 116, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (483, 225, 117, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (484, 226, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (485, 226, 114, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (486, 226, 115, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (487, 227, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (488, 227, 115, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (489, 227, 114, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (490, 228, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (491, 228, 118, NULL);
INSERT INTO event_people_assoc VALUES (492, 229, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (493, 230, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (494, 231, 119, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (495, 231, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (496, 231, 120, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (497, 232, 119, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (498, 232, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (499, 232, 120, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (500, 233, 116, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (501, 233, 119, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (502, 233, 120, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (503, 234, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (504, 234, 120, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (505, 234, 119, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (506, 235, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (507, 235, 119, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (508, 235, 120, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (509, 236, 121, 'tenant                                                          ');
INSERT INTO event_people_assoc VALUES (510, 236, 2, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (511, 237, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (512, 238, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (513, 239, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (514, 240, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (515, 240, 122, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (516, 240, 123, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (517, 240, 124, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (518, 240, 125, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (519, 240, 126, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (520, 240, 127, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (521, 241, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (522, 241, 127, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (523, 241, 126, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (524, 241, 125, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (525, 241, 122, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (526, 241, 123, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (527, 241, 124, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (528, 242, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (529, 242, 122, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (530, 243, 128, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (531, 243, 122, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (532, 243, 129, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (533, 244, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (534, 244, 122, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (535, 244, 123, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (536, 244, 124, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (537, 244, 126, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (538, 244, 127, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (539, 244, 125, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (540, 245, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (541, 246, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (542, 247, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (543, 248, 130, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (544, 248, 131, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (545, 248, 132, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (546, 248, 133, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (547, 248, 134, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (548, 249, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (549, 249, 131, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (550, 249, 132, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (551, 249, 133, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (552, 250, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (553, 250, 131, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (554, 250, 132, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (555, 250, 133, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (556, 251, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (557, 251, 131, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (558, 252, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (559, 252, 132, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (560, 252, 133, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (561, 252, 131, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (562, 253, 135, NULL);
INSERT INTO event_people_assoc VALUES (563, 254, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (564, 255, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (565, 256, 136, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (566, 257, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (567, 258, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (568, 258, 137, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (569, 258, 138, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (570, 259, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (571, 259, 137, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (572, 259, 139, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (573, 260, 140, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (574, 260, 137, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (575, 260, 139, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (576, 261, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (577, 261, 137, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (578, 261, 139, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (579, 262, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (580, 262, 137, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (581, 262, 139, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (582, 263, 141, 'tenant                                                          ');
INSERT INTO event_people_assoc VALUES (583, 263, 2, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (584, 264, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (585, 265, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (586, 266, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (587, 267, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (588, 267, 142, 'heir                                                            ');
INSERT INTO event_people_assoc VALUES (589, 267, 143, 'heir                                                            ');
INSERT INTO event_people_assoc VALUES (590, 267, 144, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (591, 268, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (592, 268, 144, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (593, 268, 142, 'heir                                                            ');
INSERT INTO event_people_assoc VALUES (594, 268, 143, 'heir                                                            ');
INSERT INTO event_people_assoc VALUES (595, 269, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (596, 269, 144, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (597, 269, 142, 'heir                                                            ');
INSERT INTO event_people_assoc VALUES (598, 269, 143, 'heir                                                            ');
INSERT INTO event_people_assoc VALUES (599, 270, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (600, 270, 144, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (601, 270, 142, 'heir                                                            ');
INSERT INTO event_people_assoc VALUES (602, 270, 143, 'heir                                                            ');
INSERT INTO event_people_assoc VALUES (603, 271, 145, NULL);
INSERT INTO event_people_assoc VALUES (604, 272, 146, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (605, 272, 144, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (606, 273, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (607, 274, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (608, 275, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (609, 276, 142, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (610, 276, 143, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (611, 276, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (612, 277, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (613, 277, 142, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (614, 277, 143, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (615, 278, 147, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (616, 278, 142, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (617, 278, 143, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (618, 279, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (619, 279, 142, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (620, 279, 143, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (621, 280, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (622, 280, 142, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (623, 280, 143, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (624, 281, 127, 'tenant                                                          ');
INSERT INTO event_people_assoc VALUES (625, 281, 2, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (626, 282, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (627, 283, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (628, 284, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (629, 285, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (630, 285, 148, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (631, 285, 149, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (632, 285, 150, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (633, 286, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (634, 286, 148, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (635, 286, 149, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (636, 286, 150, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (637, 287, 151, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (638, 287, 152, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (639, 288, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (640, 288, 153, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (641, 288, 150, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (642, 289, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (643, 289, 148, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (644, 289, 149, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (645, 289, 150, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (646, 290, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (647, 291, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (648, 292, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (649, 293, 154, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (650, 293, 155, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (651, 294, 154, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (652, 294, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (653, 295, 154, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (654, 295, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (655, 296, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (656, 296, 154, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (657, 297, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (658, 297, 154, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (659, 298, 156, NULL);
INSERT INTO event_people_assoc VALUES (660, 299, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (661, 300, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (662, 300, 157, NULL);
INSERT INTO event_people_assoc VALUES (663, 301, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (664, 302, 155, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (665, 302, 158, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (666, 302, 159, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (667, 303, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (668, 303, 158, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (669, 303, 159, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (670, 304, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (671, 304, 158, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (672, 304, 159, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (673, 305, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (674, 305, 158, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (675, 305, 159, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (676, 306, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (677, 306, 160, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (678, 306, 159, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (679, 307, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (680, 308, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (681, 309, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (682, 310, 161, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (683, 310, 162, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (684, 311, 163, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (685, 311, 164, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (686, 311, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (687, 312, 29, 'other                                                           ');
INSERT INTO event_people_assoc VALUES (688, 312, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (689, 312, 163, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (690, 312, 164, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (691, 313, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (692, 314, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (693, 315, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (694, 316, 165, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (695, 316, 166, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (696, 317, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (697, 317, 166, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (698, 318, 29, 'other                                                           ');
INSERT INTO event_people_assoc VALUES (699, 318, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (700, 318, 166, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (701, 319, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (702, 319, 166, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (703, 320, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (704, 320, 166, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (705, 321, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (706, 322, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (707, 323, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (708, 324, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (709, 324, 132, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (710, 324, 131, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (711, 324, 133, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (712, 324, 134, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (713, 325, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (714, 325, 131, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (715, 325, 132, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (716, 325, 133, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (717, 325, 134, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (718, 326, 167, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (719, 326, 134, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (720, 326, 132, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (721, 326, 131, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (722, 327, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (723, 327, 131, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (724, 327, 132, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (725, 327, 133, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (726, 328, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (727, 328, 131, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (728, 328, 132, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (729, 328, 133, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (730, 328, 134, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (731, 329, 168, NULL);
INSERT INTO event_people_assoc VALUES (732, 330, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (733, 331, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (734, 332, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (735, 333, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (736, 333, 169, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (737, 333, 170, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (738, 334, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (739, 334, 169, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (740, 334, 170, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (741, 335, 169, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (742, 335, 128, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (743, 335, 170, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (744, 336, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (745, 336, 128, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (746, 336, 170, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (747, 337, 128, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (748, 337, 170, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (749, 337, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (750, 338, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (751, 339, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (752, 340, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (753, 341, 171, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (754, 341, 172, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (755, 342, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (756, 342, 172, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (757, 343, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (758, 343, 172, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (759, 344, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (760, 344, 172, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (761, 345, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (762, 345, 172, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (763, 346, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (764, 347, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (765, 348, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (766, 349, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (767, 349, 173, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (768, 349, 174, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (769, 350, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (770, 350, 173, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (771, 350, 174, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (772, 351, 175, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (773, 351, 173, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (774, 351, 174, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (775, 352, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (776, 352, 173, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (777, 352, 174, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (778, 353, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (779, 353, 173, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (780, 353, 174, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (781, 354, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (782, 355, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (783, 356, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (784, 357, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (785, 357, 176, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (786, 358, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (787, 358, 176, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (788, 359, 177, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (789, 359, 176, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (790, 360, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (791, 360, 176, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (792, 361, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (793, 361, 176, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (794, 362, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (795, 363, 178, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (796, 364, 13, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (797, 365, 179, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (798, 365, 180, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (799, 366, 29, 'other                                                           ');
INSERT INTO event_people_assoc VALUES (800, 366, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (801, 366, 180, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (802, 367, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (803, 367, 181, 'heir                                                            ');
INSERT INTO event_people_assoc VALUES (804, 367, 180, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (805, 368, 29, 'other                                                           ');
INSERT INTO event_people_assoc VALUES (806, 368, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (807, 368, 180, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (808, 369, 4, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (809, 370, 4, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (810, 371, 182, NULL);
INSERT INTO event_people_assoc VALUES (811, 372, 183, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (812, 372, 184, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (813, 372, 185, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (814, 372, 186, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (815, 372, 187, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (816, 373, 178, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (817, 373, 185, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (818, 373, 186, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (819, 374, 188, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (820, 374, 185, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (821, 375, 189, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (822, 376, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (823, 376, 185, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (824, 377, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (825, 377, 185, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (826, 378, 185, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (827, 378, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (828, 379, 190, NULL);
INSERT INTO event_people_assoc VALUES (837, 384, 191, 'trustee                                                         ');
INSERT INTO event_people_assoc VALUES (838, 384, 192, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (839, 384, 193, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (840, 385, 193, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (841, 385, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (842, 386, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (843, 386, 193, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (844, 387, 193, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (845, 387, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (846, 388, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (847, 388, 193, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (848, 389, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (849, 389, 193, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (850, 390, 188, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (851, 390, 192, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (852, 390, 193, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (853, 391, 195, NULL);
INSERT INTO event_people_assoc VALUES (854, 392, 196, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (855, 392, 197, 'heir                                                            ');
INSERT INTO event_people_assoc VALUES (856, 393, 197, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (857, 393, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (858, 394, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (859, 394, 197, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (860, 395, 6, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (861, 395, 197, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (862, 396, 11, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (863, 396, 197, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (864, 397, 188, 'appraiser                                                       ');
INSERT INTO event_people_assoc VALUES (865, 397, 197, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (866, 398, 197, 'owner                                                           ');
INSERT INTO event_people_assoc VALUES (867, 398, 2, 'purchaser                                                       ');
INSERT INTO event_people_assoc VALUES (868, 399, 198, NULL);
INSERT INTO event_people_assoc VALUES (869, 400, 199, NULL);


--
-- Name: event_people_assoc_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('event_people_assoc_id_seq', 869, true);


--
-- Data for Name: event_types; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

INSERT INTO event_types VALUES (1, 'Transfer of Deed                                                                                                                                                                                                                                               ');
INSERT INTO event_types VALUES (2, 'Offer Made                                                                                                                                                                                                                                                     ');
INSERT INTO event_types VALUES (3, 'Appraisal                                                                                                                                                                                                                                                      ');
INSERT INTO event_types VALUES (5, 'Tenant Moved                                                                                                                                                                                                                                                   ');
INSERT INTO event_types VALUES (6, 'Awarded                                                                                                                                                                                                                                                        ');
INSERT INTO event_types VALUES (7, 'End of Case                                                                                                                                                                                                                                                    ');
INSERT INTO event_types VALUES (4, 'Decision (Accept/Reject)                                                                                                                                                                                                                                       ');


--
-- Name: event_types_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('event_types_id_seq', 7, true);


--
-- Data for Name: events; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

INSERT INTO events VALUES (1, NULL, '', 1, '1969-11-14', 1, 9100);
INSERT INTO events VALUES (2, NULL, '', 1, '1969-09-22', 2, 9100);
INSERT INTO events VALUES (3, NULL, '', 1, '1968-08-06', 3, 8200);
INSERT INTO events VALUES (4, NULL, '', 1, '1967-01-14', 3, 9100);
INSERT INTO events VALUES (5, NULL, '', 1, '1965-09-15', 3, 7050);
INSERT INTO events VALUES (6, 'accept                                                                                                                                                                                                                                                         ', '', 1, '1969-09-22', 4, 9100);
INSERT INTO events VALUES (7, NULL, '', 1, '1969-11-14', 7, 9100);
INSERT INTO events VALUES (8, NULL, '', 4714, '1971-11-29', 1, 4950);
INSERT INTO events VALUES (9, NULL, 'Because of defective title, the property was condemned in order to secure legal title', 4714, '1968-12-16', 2, 4500);
INSERT INTO events VALUES (10, 'complicated                                                                                                                                                                                                                                                    ', 'Because of defective title, it''''s been complicated', 4714, '1968-12-16', 4, 4500);
INSERT INTO events VALUES (11, NULL, '', 4714, '1971-11-29', 2, 4950);
INSERT INTO events VALUES (12, 'accept                                                                                                                                                                                                                                                         ', '', 4714, '1971-11-29', 4, 4950);
INSERT INTO events VALUES (13, NULL, '', 4714, '1971-11-29', 6, 4950);
INSERT INTO events VALUES (14, NULL, '', 4714, '1968-09-18', 3, 3900);
INSERT INTO events VALUES (15, NULL, '', 4714, '1967-01-10', 3, 4500);
INSERT INTO events VALUES (16, NULL, '', 4714, '1965-09-15', 3, 2300);
INSERT INTO events VALUES (17, NULL, '', 4714, '1971-11-29', 7, 0);
INSERT INTO events VALUES (18, NULL, '', 4715, '1966-06-20', 3, 4100);
INSERT INTO events VALUES (19, NULL, '', 4715, '1968-05-24', 3, 5000);
INSERT INTO events VALUES (20, NULL, '', 4715, '1967-01-03', 3, 5000);
INSERT INTO events VALUES (21, NULL, 'Deed transfer between previous owners', 4715, '1965-03-05', 1, 0);
INSERT INTO events VALUES (22, NULL, '', 4715, '1970-05-08', 1, 5000);
INSERT INTO events VALUES (23, NULL, '', 4715, '1970-04-17', 2, 5000);
INSERT INTO events VALUES (24, 'accept                                                                                                                                                                                                                                                         ', '', 4715, '1970-04-17', 4, 5000);
INSERT INTO events VALUES (25, NULL, 'Total of 2559.76$ awarded to the owner after deductions like revenue stamps, delinquent taxes, deed of trust', 4715, '1970-05-08', 7, 2560);
INSERT INTO events VALUES (26, NULL, '', 4716, '1966-06-20', 3, 9650);
INSERT INTO events VALUES (27, NULL, '', 4716, '1968-05-21', 3, 10200);
INSERT INTO events VALUES (28, NULL, '', 4716, '1968-05-07', 3, 10000);
INSERT INTO events VALUES (29, NULL, '', 4716, '1968-09-24', 2, 10200);
INSERT INTO events VALUES (30, 'accept                                                                                                                                                                                                                                                         ', '', 4716, '1968-09-24', 4, 10200);
INSERT INTO events VALUES (31, NULL, 'Deed transfer between previous owners', 4716, '1967-11-22', 1, 0);
INSERT INTO events VALUES (32, NULL, '', 4716, '1968-10-03', 1, 10200);
INSERT INTO events VALUES (33, NULL, 'After acquiring the property from Cornelia Loga, HACA rented the property again to Hugh Lasseter for a whopping rent of 100$ per month which was $1.00 per month before acquisition', 4716, '1968-11-27', 5, 100);
INSERT INTO events VALUES (34, NULL, 'Offered amount 10,200$  - (Taxes, revenue stamps, deed of trust) = 8969$', 4716, '1968-10-03', 7, 8969);
INSERT INTO events VALUES (35, NULL, '', 9429, '1968-05-23', 3, 6500);
INSERT INTO events VALUES (36, NULL, '', 9429, '1965-09-15', 3, 4625);
INSERT INTO events VALUES (37, NULL, '', 9429, '1969-01-03', 3, 7300);
INSERT INTO events VALUES (38, NULL, '', 9429, '1969-10-23', 1, 7300);
INSERT INTO events VALUES (39, NULL, 'Offer made $7300 - (taxes and deed charges) = $7232', 9429, '1969-10-23', 7, 7232);
INSERT INTO events VALUES (40, NULL, '', 9429, '1969-10-09', 2, 7300);
INSERT INTO events VALUES (41, 'accept                                                                                                                                                                                                                                                         ', '', 9429, '1969-10-09', 4, 7300);
INSERT INTO events VALUES (42, NULL, '', 9429, '1969-10-09', 6, 7300);
INSERT INTO events VALUES (43, NULL, '', 9429, NULL, NULL, 0);
INSERT INTO events VALUES (44, NULL, '', 9430, '1965-09-15', 3, 5200);
INSERT INTO events VALUES (45, NULL, 'New Owner', 9430, '1968-07-16', 3, 6000);
INSERT INTO events VALUES (46, NULL, 'Different Owner', 9430, '1968-05-07', 3, 3500);
INSERT INTO events VALUES (47, NULL, 'Deed transferred on behalf of Trans World Acceptance Corporation', 9430, '1969-04-15', 1, 5200);
INSERT INTO events VALUES (48, NULL, 'Deed transfer from Trustee', 9430, '1967-02-14', 1, 0);
INSERT INTO events VALUES (49, NULL, 'Advanced amount of 54$ by Redmond & Stevens Attorneys', 9430, '1969-04-11', 7, 5254);
INSERT INTO events VALUES (50, NULL, 'Possible conflict of property ownership but offer was accepted by Charles McBryson', 9430, '1968-10-07', 2, 5200);
INSERT INTO events VALUES (51, 'accept                                                                                                                                                                                                                                                         ', '', 9430, '1968-10-07', 4, 5200);
INSERT INTO events VALUES (52, NULL, '', 9430, NULL, NULL, 0);
INSERT INTO events VALUES (53, NULL, '', 9431, '1965-09-15', 3, 200);
INSERT INTO events VALUES (54, NULL, '', 9431, '1967-01-03', 3, 700);
INSERT INTO events VALUES (55, NULL, '', 9431, '1968-05-28', 3, 850);
INSERT INTO events VALUES (56, NULL, '', 9431, '1970-12-01', 1, 800);
INSERT INTO events VALUES (57, NULL, 'This case went to hearing and was awarded 800$ plus interest.', 9431, '1970-11-25', 2, 800);
INSERT INTO events VALUES (58, 'accept                                                                                                                                                                                                                                                         ', '', 9431, '1970-11-25', 4, 800);
INSERT INTO events VALUES (59, NULL, 'Deed transfer between previous owners before acquisition. Registered date: 06-09-1928', 9431, '1960-01-01', 1, 0);
INSERT INTO events VALUES (60, NULL, 'Awarded this amount at the Commissioners Hearing', 9431, '1970-11-06', 6, 811);
INSERT INTO events VALUES (61, NULL, '', 9431, '1970-12-01', 7, 811);
INSERT INTO events VALUES (62, NULL, 'Owner asked to pay this rent per month after acquisition', 9432, '1969-04-15', 5, 20);
INSERT INTO events VALUES (63, NULL, 'Deed transfer before acquisition. Registered date: 09-19-1947', 9433, '1960-01-01', 1, 0);
INSERT INTO events VALUES (64, NULL, '', 9434, '1965-09-15', 3, 5450);
INSERT INTO events VALUES (65, NULL, '', 9434, '1968-05-14', 3, 6000);
INSERT INTO events VALUES (66, NULL, '', 9434, '1968-05-30', 3, 10500);
INSERT INTO events VALUES (67, NULL, '', 9434, '1969-03-07', 1, 8500);
INSERT INTO events VALUES (68, NULL, 'Deed transfer prior to acquisition', 9434, '1963-11-16', 1, 0);
INSERT INTO events VALUES (69, NULL, 'Offer made $8500 - (taxes + stamp duty) = $8475', 9434, '1969-03-07', 7, 8475);
INSERT INTO events VALUES (70, NULL, '', 9434, '1968-12-27', 2, 8500);
INSERT INTO events VALUES (355, NULL, '', 14175, '1968-07-31', 3, 1050);
INSERT INTO events VALUES (356, NULL, '', 14175, '1966-11-17', 3, 1100);
INSERT INTO events VALUES (71, 'accept                                                                                                                                                                                                                                                         ', '', 9434, '1968-12-27', 4, 8500);
INSERT INTO events VALUES (72, NULL, 'Tenant occupying 102 - 104 Livingston St was asked to pay 50$ per month by HACA after acquisition', 9434, '1969-04-17', 5, 50);
INSERT INTO events VALUES (73, NULL, 'Appraiser mentions owner as City of Asheville', 9435, '1967-01-03', 3, 450);
INSERT INTO events VALUES (74, NULL, '', 9435, '1968-05-22', 3, 350);
INSERT INTO events VALUES (75, NULL, '', 9435, '1965-09-15', 3, 350);
INSERT INTO events VALUES (76, NULL, 'Deed transfer prior to acquisition. Registered date: 12-08-1927', 9435, '1960-01-01', 1, 0);
INSERT INTO events VALUES (77, NULL, '', 9435, '1973-04-06', 2, 350);
INSERT INTO events VALUES (78, 'accept                                                                                                                                                                                                                                                         ', '', 9435, '1973-04-06', 4, 0);
INSERT INTO events VALUES (79, NULL, 'As the property had many heirs leading to a title problem, the property was sent to hearing after it was acquired by HACA to get a clean title. No changes in the awarded price.', 9435, '1973-05-03', 7, 350);
INSERT INTO events VALUES (80, NULL, '', 9435, '1973-04-11', 1, 350);
INSERT INTO events VALUES (81, NULL, 'Amount awarded at Commissioner''''s hearing', 9435, '1973-03-30', 6, 350);
INSERT INTO events VALUES (82, NULL, '', 9436, '1968-05-24', 3, 550);
INSERT INTO events VALUES (83, NULL, '', 9436, '1967-01-03', 3, 450);
INSERT INTO events VALUES (84, NULL, '', 9436, '1965-09-15', 3, 450);
INSERT INTO events VALUES (85, NULL, '', 9436, '1969-10-23', 2, 450);
INSERT INTO events VALUES (86, 'accept                                                                                                                                                                                                                                                         ', '', 9436, '1969-10-23', 4, 450);
INSERT INTO events VALUES (87, NULL, 'Deed transfer prior to acquisition. Registered date: 05-18-1951', 9436, '1960-01-01', 1, 0);
INSERT INTO events VALUES (88, NULL, 'Offer made $450 - (taxes+stamp duty) = $388', 9436, '1970-01-06', 7, 388);
INSERT INTO events VALUES (89, NULL, 'Deed transferred from 2 ownerships', 9436, '1970-01-06', 1, 450);
INSERT INTO events VALUES (90, NULL, '', 9437, '1965-09-15', 3, 7950);
INSERT INTO events VALUES (91, NULL, '', 9437, '1967-01-12', 3, 9600);
INSERT INTO events VALUES (92, NULL, '', 9437, '1968-05-22', 3, 9500);
INSERT INTO events VALUES (93, NULL, '', 9437, '1963-02-01', 1, 0);
INSERT INTO events VALUES (94, NULL, '', 9437, '1969-09-16', 2, 9600);
INSERT INTO events VALUES (95, 'accept                                                                                                                                                                                                                                                         ', '', 9437, '1969-09-16', 4, 9600);
INSERT INTO events VALUES (96, NULL, 'offer made $9600 - (taxes + stamp duty) = $9590', 9437, '1970-01-23', 7, 9590);
INSERT INTO events VALUES (97, NULL, '', 9437, '1970-02-06', 1, 9600);
INSERT INTO events VALUES (98, NULL, '', 9438, '1969-02-13', 1, 16000);
INSERT INTO events VALUES (99, NULL, '', 9438, '1968-12-21', 2, 16000);
INSERT INTO events VALUES (100, NULL, '', 9438, '1968-08-03', 3, 15000);
INSERT INTO events VALUES (101, NULL, '', 9438, '1968-08-07', 3, 16000);
INSERT INTO events VALUES (102, NULL, '', 9438, '1965-09-15', 3, 15350);
INSERT INTO events VALUES (103, 'accept                                                                                                                                                                                                                                                         ', '', 9438, '1968-12-27', 4, 16000);
INSERT INTO events VALUES (104, NULL, '', 9438, '1969-05-22', 5, 20);
INSERT INTO events VALUES (105, NULL, '', 9438, '1969-05-22', 5, 15);
INSERT INTO events VALUES (106, NULL, '', 9438, '1969-05-22', 5, 20);
INSERT INTO events VALUES (107, NULL, '', 9438, '1969-05-22', 5, 30);
INSERT INTO events VALUES (108, NULL, '', 9438, '1969-05-22', 5, 25);
INSERT INTO events VALUES (109, NULL, '', 9438, '1969-05-22', 5, 25);
INSERT INTO events VALUES (110, NULL, '', 9438, NULL, 5, 0);
INSERT INTO events VALUES (111, NULL, '', 9439, '1973-06-05', 1, 600);
INSERT INTO events VALUES (112, NULL, '', 9439, '1968-09-24', 2, 500);
INSERT INTO events VALUES (113, 'reject                                                                                                                                                                                                                                                         ', '', 9439, '1969-08-21', 4, 500);
INSERT INTO events VALUES (114, NULL, '', 9439, '1973-05-26', 2, 600);
INSERT INTO events VALUES (115, 'reject                                                                                                                                                                                                                                                         ', '', 9439, '1973-05-31', 4, 600);
INSERT INTO events VALUES (116, NULL, '', 9439, '1968-07-25', 3, 500);
INSERT INTO events VALUES (117, NULL, '', 9439, '1966-11-04', 3, 500);
INSERT INTO events VALUES (118, NULL, '', 9439, '1966-06-20', 3, 375);
INSERT INTO events VALUES (119, NULL, '', 9439, '1972-05-31', 6, 600);
INSERT INTO events VALUES (120, NULL, '', 9439, '1973-06-05', 7, 600);
INSERT INTO events VALUES (121, NULL, '', 9440, '1972-10-04', 1, 1661);
INSERT INTO events VALUES (122, NULL, '', 9440, '1968-09-24', 2, 1500);
INSERT INTO events VALUES (123, 'reject                                                                                                                                                                                                                                                         ', '', 9440, '1971-12-09', 4, 1500);
INSERT INTO events VALUES (124, NULL, '', 9440, '1972-09-29', 2, 1661);
INSERT INTO events VALUES (125, 'accept                                                                                                                                                                                                                                                         ', '', 9440, '1972-10-04', 4, 1661);
INSERT INTO events VALUES (126, NULL, '', 9440, '1968-07-25', 3, 1500);
INSERT INTO events VALUES (127, NULL, '', 9440, '1966-11-04', 3, 1000);
INSERT INTO events VALUES (128, NULL, '', 9440, '1966-06-20', 3, 700);
INSERT INTO events VALUES (129, NULL, '', 9440, '1972-09-29', 6, 1661);
INSERT INTO events VALUES (130, NULL, '', 9440, '1972-10-04', 7, 1661);
INSERT INTO events VALUES (131, NULL, '', 9441, '1968-11-25', 1, 8300);
INSERT INTO events VALUES (132, NULL, '', 9441, '1968-10-05', 2, 8300);
INSERT INTO events VALUES (133, 'accept                                                                                                                                                                                                                                                         ', '', 9441, '1968-10-07', 4, 8300);
INSERT INTO events VALUES (134, NULL, '', 14148, '1965-09-15', 3, 5800);
INSERT INTO events VALUES (135, NULL, '', 14148, '1968-05-22', 3, 7000);
INSERT INTO events VALUES (136, NULL, '', 14148, '1968-07-22', 3, 8500);
INSERT INTO events VALUES (137, NULL, 'Tenant asked to pay 15$ per month after acquisition. HACA originally asked to pay  25$ per month but relocation director took into consideration that the tenant earned limited income and reduced rent to 15$.', 14148, '1969-06-02', 5, 15);
INSERT INTO events VALUES (357, NULL, '', 14175, '1969-03-27', 2, 1100);
INSERT INTO events VALUES (138, NULL, 'Tenant asked to pay 30$ per month after acquisition. HACA originally asked to pay 40$ per month but relocation director took into consideration that the tenant earned limited income and had a mentally retarded husband to take care so reduced rent to 30$.', 14148, '1969-05-27', 5, 30);
INSERT INTO events VALUES (139, NULL, '', 14148, '1969-04-22', 1, 8500);
INSERT INTO events VALUES (140, NULL, 'Offer made $8500 - (taxes + stamp duty) = $8466', 14148, '1969-04-10', 7, 8466);
INSERT INTO events VALUES (141, NULL, '', 14148, '1964-12-18', 1, 2695);
INSERT INTO events VALUES (142, NULL, '', 14148, '1969-01-22', 2, 8500);
INSERT INTO events VALUES (143, 'accept                                                                                                                                                                                                                                                         ', '', 14148, '1969-01-22', 4, 8500);
INSERT INTO events VALUES (144, NULL, '', 14149, '1965-09-15', 3, 575);
INSERT INTO events VALUES (145, NULL, '', 14149, '1968-05-22', 3, 750);
INSERT INTO events VALUES (146, NULL, '', 14149, '1967-01-03', 3, 600);
INSERT INTO events VALUES (147, NULL, '', 14149, '1968-10-09', 2, 600);
INSERT INTO events VALUES (148, 'accept                                                                                                                                                                                                                                                         ', '', 14149, '1968-10-15', 4, 600);
INSERT INTO events VALUES (149, NULL, 'Deed transfer prior to acquisition', 14149, '1961-10-11', 1, 310);
INSERT INTO events VALUES (150, NULL, 'Offer made $600 - (taxes + stamp duty + deed of trust towards Joseph C Reynolds Trustee for Bruce AZ Elmore) = $91.03', 14149, '1968-11-11', 7, 91);
INSERT INTO events VALUES (151, NULL, '', 14149, '1968-11-11', 1, 600);
INSERT INTO events VALUES (152, NULL, '', 14150, '1965-09-15', 3, 4825);
INSERT INTO events VALUES (153, NULL, '', 14150, '1967-01-03', 3, 7000);
INSERT INTO events VALUES (154, NULL, '', 14150, '1968-05-22', 3, 5000);
INSERT INTO events VALUES (155, NULL, '', 14150, '1968-10-09', 2, 5500);
INSERT INTO events VALUES (156, 'accept                                                                                                                                                                                                                                                         ', '', 14150, '1968-10-15', 4, 5500);
INSERT INTO events VALUES (157, NULL, 'Transfer of Deed by virtue of inheritance due to deceased mother to heir', 14150, '1964-06-28', 1, 2053);
INSERT INTO events VALUES (158, NULL, 'Offer made $5500 - (taxes + stamp duty + Bruce Elmore Trustee of Northwestern Bank) = $4012', 14150, '1968-11-04', 7, 4012);
INSERT INTO events VALUES (159, NULL, '', 14150, '1968-11-04', 1, 5500);
INSERT INTO events VALUES (160, NULL, '', 14151, '1965-09-15', 3, 5550);
INSERT INTO events VALUES (161, NULL, '', 14151, '1966-12-30', 3, 7800);
INSERT INTO events VALUES (162, NULL, '', 14151, '1968-05-22', 3, 6500);
INSERT INTO events VALUES (163, NULL, '', 14151, '1968-10-28', 2, 7000);
INSERT INTO events VALUES (164, 'accept                                                                                                                                                                                                                                                         ', '', 14151, '1968-10-28', 4, 7000);
INSERT INTO events VALUES (165, NULL, 'Offer made $7000 - (taxes + stamp duty + First Union National Trustee $973) = $6013', 14151, '1969-01-10', 7, 6013);
INSERT INTO events VALUES (166, NULL, 'Previous deed transfer. Registered date: 06/22/1951', 14151, '1960-01-01', 1, 1830);
INSERT INTO events VALUES (167, NULL, '', 14151, '1969-01-10', 1, 7000);
INSERT INTO events VALUES (168, NULL, 'Based on Income approximated to 140 per month', 14151, '1969-02-12', 5, 20);
INSERT INTO events VALUES (169, NULL, '', 14152, '1968-09-06', 3, 11000);
INSERT INTO events VALUES (170, NULL, '', 14152, '1965-09-15', 3, 5850);
INSERT INTO events VALUES (171, NULL, '', 14152, '1966-10-20', 3, 9700);
INSERT INTO events VALUES (172, NULL, '', 14152, '1968-12-27', 2, 10000);
INSERT INTO events VALUES (173, 'complicated                                                                                                                                                                                                                                                    ', 'Problems with the title; Case took to Commissioner hearing to resolve title problems, but offer was accepted and final awarded amount was the same.', 14152, '1968-12-27', 4, 10000);
INSERT INTO events VALUES (174, NULL, 'Deed transfer prior to acquisition', 14152, '1966-01-14', 1, 0);
INSERT INTO events VALUES (175, NULL, '', 14152, '1970-07-20', 1, 10000);
INSERT INTO events VALUES (176, NULL, '', 14152, '1971-04-14', 6, 10000);
INSERT INTO events VALUES (177, NULL, '', 14152, '1971-04-14', 7, 10000);
INSERT INTO events VALUES (178, NULL, '', 14153, '1965-09-15', 3, 3100);
INSERT INTO events VALUES (179, NULL, '', 14153, '1968-08-09', 3, 5500);
INSERT INTO events VALUES (180, NULL, '', 14153, '1966-10-20', 3, 5000);
INSERT INTO events VALUES (181, NULL, '', 14153, '1946-05-11', 1, 2037);
INSERT INTO events VALUES (182, NULL, '', 14153, '1969-07-24', 2, 5500);
INSERT INTO events VALUES (183, 'accept                                                                                                                                                                                                                                                         ', '', 14153, '1969-07-24', 4, 5500);
INSERT INTO events VALUES (184, NULL, 'Offer made $5500 - (taxes + stamp duty + inheritance tax return filed for Mamie Holloway) = $5383', 14153, '1969-08-21', 7, 5383);
INSERT INTO events VALUES (185, NULL, '', 14153, '1969-08-21', 1, 5500);
INSERT INTO events VALUES (186, NULL, '', 14154, '1965-09-15', 3, 4700);
INSERT INTO events VALUES (187, NULL, '', 14154, '1966-10-20', 3, 6500);
INSERT INTO events VALUES (188, NULL, '', 14154, '1968-08-14', 3, 6750);
INSERT INTO events VALUES (189, NULL, '', 14154, '1969-07-23', 2, 6750);
INSERT INTO events VALUES (190, 'accept                                                                                                                                                                                                                                                         ', '', 14154, '1969-07-23', 4, 6750);
INSERT INTO events VALUES (191, NULL, '', 14154, '1969-08-13', 1, 6750);
INSERT INTO events VALUES (192, NULL, 'No Closing statement available to calculate the net amount paid to the seller', 14154, '1969-08-13', 7, 6750);
INSERT INTO events VALUES (193, NULL, '', 14155, '1965-09-15', 3, 1800);
INSERT INTO events VALUES (194, NULL, '', 14155, '1966-10-22', 3, 3700);
INSERT INTO events VALUES (195, NULL, '', 14155, '1968-08-14', 3, 2500);
INSERT INTO events VALUES (196, NULL, '', 14155, '1968-12-11', 2, 2500);
INSERT INTO events VALUES (197, 'accept                                                                                                                                                                                                                                                         ', '', 14155, '1968-12-11', 4, 2500);
INSERT INTO events VALUES (198, NULL, 'Deed transfer prior to acquisition', 14155, '1919-04-30', 1, 1020);
INSERT INTO events VALUES (199, NULL, 'Offer made $2500 - (taxes +stamp duty) = $2460 paid to seller', 14155, '1969-01-29', 7, 2460);
INSERT INTO events VALUES (200, NULL, 'Tenant and HACA made an agreement for tenant to pay $15.00 per month to occupy this property', 14155, '1969-02-11', 5, 15);
INSERT INTO events VALUES (201, NULL, '', 14155, '1969-01-28', 1, 2500);
INSERT INTO events VALUES (202, NULL, '', 14156, '1965-09-15', 3, 1000);
INSERT INTO events VALUES (203, NULL, '', 14156, '1966-10-22', 3, 1500);
INSERT INTO events VALUES (204, NULL, '', 14156, '1968-08-15', 3, 1200);
INSERT INTO events VALUES (205, NULL, 'Deed transfer prior to acquisition', 14156, '1960-12-15', 1, 495);
INSERT INTO events VALUES (206, NULL, '', 14156, '1973-11-29', 1, 1750);
INSERT INTO events VALUES (207, NULL, '', 14156, '1970-11-05', 2, 1500);
INSERT INTO events VALUES (208, 'complicated                                                                                                                                                                                                                                                    ', 'Offer initially rejected and took to hearing', 14156, '1970-11-05', 4, 0);
INSERT INTO events VALUES (209, NULL, 'After a re-assessment by Francis Haegar on the current market value, court awarded a total of $1750 to this property', 14156, '1973-11-27', 6, 1750);
INSERT INTO events VALUES (210, NULL, 'Re-appraisal', 14156, '1973-07-11', 3, 1750);
INSERT INTO events VALUES (211, NULL, '', 14157, '1965-09-15', 3, 2050);
INSERT INTO events VALUES (212, NULL, '', 14157, '1968-08-15', 3, 3000);
INSERT INTO events VALUES (213, NULL, '', 14157, '1966-10-25', 3, 4600);
INSERT INTO events VALUES (214, NULL, '', 14157, '1969-09-15', 2, 3000);
INSERT INTO events VALUES (215, 'accept                                                                                                                                                                                                                                                         ', '', 14157, '1969-09-15', 4, 3000);
INSERT INTO events VALUES (216, NULL, 'Deed transfer prior to acquisition', 14157, '1965-03-11', 1, 1512);
INSERT INTO events VALUES (217, NULL, 'Offer made $3000 - (Taxes + stamp duty + Deed trust for Herschel Harkins) = $2316', 14157, '1969-09-26', 7, 2316);
INSERT INTO events VALUES (218, NULL, '', 14157, '1969-09-26', 1, 3000);
INSERT INTO events VALUES (219, NULL, '', 14157, NULL, NULL, 0);
INSERT INTO events VALUES (220, NULL, '', 14158, '1965-09-15', 3, 5250);
INSERT INTO events VALUES (221, NULL, '', 14158, '1966-10-22', 3, 7000);
INSERT INTO events VALUES (222, NULL, '', 14158, '1968-08-15', 3, 7500);
INSERT INTO events VALUES (223, NULL, '', 14158, '1970-10-26', 2, 7500);
INSERT INTO events VALUES (224, 'accept                                                                                                                                                                                                                                                         ', '', 14158, '1970-10-26', 4, 7500);
INSERT INTO events VALUES (225, NULL, '', 14158, '1919-08-18', 1, 0);
INSERT INTO events VALUES (226, NULL, 'Offer made $7500 - (taxes + stamp duty) = $7410', 14158, '1970-11-06', 7, 7410);
INSERT INTO events VALUES (227, NULL, '', 14158, '1970-11-06', 1, 7500);
INSERT INTO events VALUES (228, NULL, '', 14159, '1965-09-15', 3, 4950);
INSERT INTO events VALUES (229, NULL, '', 14159, '1966-10-20', 3, 6000);
INSERT INTO events VALUES (230, NULL, '', 14159, '1968-08-15', 3, 5500);
INSERT INTO events VALUES (231, NULL, '', 14159, '1968-10-24', 2, 6000);
INSERT INTO events VALUES (232, 'accept                                                                                                                                                                                                                                                         ', '', 14159, '1968-10-24', 4, 6000);
INSERT INTO events VALUES (233, NULL, 'Deed transfer prior to acquisition', 14159, '1919-07-15', 1, 1900);
INSERT INTO events VALUES (234, NULL, 'Offer made $6000 - (taxes + stamp duty) = $5932', 14159, '1968-12-09', 7, 5932);
INSERT INTO events VALUES (235, NULL, '', 14159, '1968-12-09', 1, 6000);
INSERT INTO events VALUES (236, NULL, 'Tent fixed at $30 per month', 14159, '1969-01-11', 5, 30);
INSERT INTO events VALUES (237, NULL, '', 14160, '1965-09-15', 3, 1600);
INSERT INTO events VALUES (238, NULL, '', 14160, '1966-10-25', 3, 5000);
INSERT INTO events VALUES (239, NULL, '', 14160, '1968-08-15', 3, 4500);
INSERT INTO events VALUES (240, NULL, '', 14160, '1969-11-10', 2, 5000);
INSERT INTO events VALUES (241, 'accept                                                                                                                                                                                                                                                         ', '', 14160, '1969-11-10', 4, 5000);
INSERT INTO events VALUES (242, NULL, 'Offer made $5000 - (taxes + stamp duty) = $4717', 14160, '1969-12-19', 7, 4717);
INSERT INTO events VALUES (243, NULL, '', 14160, '1952-08-23', 1, 1030);
INSERT INTO events VALUES (244, NULL, '', 14160, '1970-01-15', 1, 5000);
INSERT INTO events VALUES (245, NULL, '', 14161, '1965-09-15', 3, 350);
INSERT INTO events VALUES (246, NULL, '', 14161, '1968-08-15', 3, 600);
INSERT INTO events VALUES (247, NULL, '', 14161, '1966-10-25', 3, 800);
INSERT INTO events VALUES (248, NULL, 'Deed transfer prior to acquisition', 14161, '1955-12-29', 1, 0);
INSERT INTO events VALUES (249, NULL, '', 14161, '1969-11-26', 2, 700);
INSERT INTO events VALUES (250, 'accept                                                                                                                                                                                                                                                         ', '', 14161, '1969-11-26', 4, 700);
INSERT INTO events VALUES (251, NULL, 'Offer made $700 - (taxes + duty) = $698', 14161, '1970-01-22', 7, 698);
INSERT INTO events VALUES (252, NULL, '', 14161, '1970-02-11', 1, 700);
INSERT INTO events VALUES (253, NULL, '', 14161, NULL, NULL, 0);
INSERT INTO events VALUES (254, NULL, '', 14162, '1965-09-15', 3, 2500);
INSERT INTO events VALUES (255, NULL, '', 14162, '1966-10-27', 3, 3800);
INSERT INTO events VALUES (256, NULL, '', 14162, '1969-10-09', 3, 425);
INSERT INTO events VALUES (257, NULL, '', 14162, '1968-08-15', 3, 400);
INSERT INTO events VALUES (258, NULL, '', 14162, '1969-11-25', 2, 425);
INSERT INTO events VALUES (259, 'accept                                                                                                                                                                                                                                                         ', '', 14162, '1969-11-25', 4, 425);
INSERT INTO events VALUES (260, NULL, 'Deed transfer prior to acquisition', 14162, '1960-11-03', 1, 1100);
INSERT INTO events VALUES (261, NULL, 'Offer made $425 - (taxes + stamp duty) = $340', 14162, '1969-12-10', 7, 340);
INSERT INTO events VALUES (262, NULL, '', 14162, '1969-12-10', 1, 425);
INSERT INTO events VALUES (263, NULL, 'Tenant asked to pay $15 after acquisition for this property', 14162, '1969-12-29', 5, 15);
INSERT INTO events VALUES (264, NULL, '', 14163, '1965-09-15', 3, 3600);
INSERT INTO events VALUES (265, NULL, '', 14163, '1966-10-25', 3, 5500);
INSERT INTO events VALUES (266, NULL, '', 14163, '1968-08-15', 3, 3000);
INSERT INTO events VALUES (267, NULL, '', 14163, '1969-05-12', 2, 5000);
INSERT INTO events VALUES (268, 'accept                                                                                                                                                                                                                                                         ', '', 14163, '1969-05-13', 4, 5000);
INSERT INTO events VALUES (269, NULL, '', 14163, '1969-08-12', 1, 5000);
INSERT INTO events VALUES (270, NULL, 'Offer made $5000 - (taxes + stamp duty) = $4862', 14163, '1969-08-12', 7, 4862);
INSERT INTO events VALUES (271, NULL, '', 14163, NULL, NULL, 0);
INSERT INTO events VALUES (272, NULL, '', 14164, '1956-08-30', 1, 1385);
INSERT INTO events VALUES (273, NULL, '', 14165, '1968-08-15', 3, 5500);
INSERT INTO events VALUES (274, NULL, '', 14165, '1966-10-25', 3, 5000);
INSERT INTO events VALUES (275, NULL, '', 14165, '1965-09-15', 3, 3100);
INSERT INTO events VALUES (276, NULL, '', 14165, '1969-05-12', 2, 5500);
INSERT INTO events VALUES (277, 'accept                                                                                                                                                                                                                                                         ', '', 14165, '1969-05-13', 4, 5500);
INSERT INTO events VALUES (278, NULL, 'Deed transfer prior to acquisition', 14165, '1948-04-16', 1, 1060);
INSERT INTO events VALUES (279, NULL, 'Offer made $5500 - (taxes + stamp duty) = $5477', 14165, '1969-06-27', 7, 5477);
INSERT INTO events VALUES (280, NULL, '', 14165, '1969-06-27', 1, 5500);
INSERT INTO events VALUES (281, NULL, 'Tenant asked to pay originally 25$ per month but relocation director reconsidered the fact that the tenant only lives on retirement benefits of $127 for two weeks and has 6 people to support and reduces the rent to $15 per month', 14165, '1969-07-24', 5, 15);
INSERT INTO events VALUES (282, NULL, 'To be best considered as Street according to appraiser', 14166, '1965-09-15', 3, 0);
INSERT INTO events VALUES (283, NULL, '', 14166, '1966-10-25', 3, 400);
INSERT INTO events VALUES (284, NULL, '', 14166, '1968-08-16', 3, 400);
INSERT INTO events VALUES (285, NULL, '', 14166, '1969-08-06', 2, 400);
INSERT INTO events VALUES (286, 'accept                                                                                                                                                                                                                                                         ', '', 14166, '1969-08-11', 4, 400);
INSERT INTO events VALUES (287, NULL, '', 14166, '1928-06-21', 1, 60);
INSERT INTO events VALUES (288, NULL, 'Offer made $400 - (taxes + stamp duty) = $398', 14166, '1969-09-03', 7, 398);
INSERT INTO events VALUES (289, NULL, '', 14166, '1969-09-19', 1, 400);
INSERT INTO events VALUES (290, NULL, '', 14167, '1966-10-25', 3, 400);
INSERT INTO events VALUES (291, NULL, '', 14167, '1965-09-15', 3, 260);
INSERT INTO events VALUES (292, NULL, '', 14167, '1968-08-16', 3, 400);
INSERT INTO events VALUES (293, NULL, 'Deed transfer prior to acquisition', 14167, '1954-03-03', 1, 58);
INSERT INTO events VALUES (294, NULL, '', 14167, '1969-12-03', 2, 400);
INSERT INTO events VALUES (295, 'accept                                                                                                                                                                                                                                                         ', '', 14167, '1969-12-09', 4, 400);
INSERT INTO events VALUES (296, NULL, 'Offer made $400 - (taxes + stamp duty) = $372', 14167, '1970-01-27', 7, 372);
INSERT INTO events VALUES (297, NULL, '', 14167, '1970-02-04', 1, 400);
INSERT INTO events VALUES (298, NULL, '', 14167, NULL, NULL, 0);
INSERT INTO events VALUES (299, NULL, '', 14168, '1965-09-15', 3, 200);
INSERT INTO events VALUES (300, NULL, '', 14168, '1966-10-25', 3, 400);
INSERT INTO events VALUES (301, NULL, '', 14168, '1968-08-16', 3, 350);
INSERT INTO events VALUES (302, NULL, 'Deed transfer prior to acquisition', 14168, '1954-03-03', 1, 58);
INSERT INTO events VALUES (303, NULL, '', 14168, '1970-05-18', 2, 400);
INSERT INTO events VALUES (304, 'accept                                                                                                                                                                                                                                                         ', '', 14168, '1970-05-18', 4, 400);
INSERT INTO events VALUES (305, NULL, 'Offer made $400 - (taxes + stamp duty) = $385', 14168, '1970-01-30', 7, 385);
INSERT INTO events VALUES (306, NULL, '', 14168, '1970-07-21', 1, 400);
INSERT INTO events VALUES (307, NULL, '', 14169, '1965-09-15', 3, 125);
INSERT INTO events VALUES (308, NULL, '', 14169, '1966-10-25', 3, 700);
INSERT INTO events VALUES (309, NULL, '', 14169, '1968-08-16', 3, 450);
INSERT INTO events VALUES (310, NULL, 'Registered date: 09-11-1907. Deed transfer prior to acquisition', 14169, '1910-01-01', 1, 60);
INSERT INTO events VALUES (311, NULL, '', 14169, '1973-07-24', 1, 450);
INSERT INTO events VALUES (312, NULL, 'Case was filed and heard at Superior court to decide on the final award', 14169, '1973-08-16', 6, 457);
INSERT INTO events VALUES (313, NULL, '', 14170, '1965-09-15', 3, 125);
INSERT INTO events VALUES (314, NULL, '', 14170, '1968-08-13', 3, 350);
INSERT INTO events VALUES (315, NULL, '', 14170, '1966-10-25', 3, 500);
INSERT INTO events VALUES (316, NULL, 'Deed transfer prior to acquisition', 14170, '1927-09-06', 1, 123);
INSERT INTO events VALUES (317, NULL, '', 14170, '1971-10-26', 1, 350);
INSERT INTO events VALUES (318, NULL, 'Amount awarded after case went to hearing', 14170, '1971-10-26', 6, 354);
INSERT INTO events VALUES (319, NULL, '', 14170, '1968-10-24', 2, 500);
INSERT INTO events VALUES (320, 'complicated                                                                                                                                                                                                                                                    ', 'Offer was probably rejected and the case took to hearing', 14170, '1968-10-24', 4, 500);
INSERT INTO events VALUES (321, NULL, '', 14171, '1966-10-25', 3, 5000);
INSERT INTO events VALUES (322, NULL, '', 14171, '1967-08-16', 3, 5000);
INSERT INTO events VALUES (323, NULL, '', 14171, '1965-09-15', 3, 1750);
INSERT INTO events VALUES (324, NULL, '', 14171, '1969-11-25', 2, 5000);
INSERT INTO events VALUES (325, 'accept                                                                                                                                                                                                                                                         ', '', 14171, '1969-11-26', 4, 5000);
INSERT INTO events VALUES (326, NULL, '', 14171, '1955-12-29', 1, 1211);
INSERT INTO events VALUES (327, NULL, 'Offer made $5000 - (taxes + stamp duty) = $4992', 14171, '1970-01-22', 7, 4992);
INSERT INTO events VALUES (328, NULL, '', 14171, '1970-02-11', 1, 5000);
INSERT INTO events VALUES (329, NULL, '', 14171, NULL, NULL, 0);
INSERT INTO events VALUES (330, NULL, '', 14172, '1966-11-04', 3, 750);
INSERT INTO events VALUES (331, NULL, '', 14172, '1966-06-20', 3, 600);
INSERT INTO events VALUES (332, NULL, '', 14172, '1968-07-29', 3, 400);
INSERT INTO events VALUES (333, NULL, '', 14172, '1969-01-17', 2, 700);
INSERT INTO events VALUES (334, 'accept                                                                                                                                                                                                                                                         ', '', 14172, '1969-01-17', 4, 700);
INSERT INTO events VALUES (335, NULL, 'Deed transfer from William Shuford to John Shuford and Wachovia Bank after demise of William Shuford', 14172, '1967-01-06', 1, 158);
INSERT INTO events VALUES (336, NULL, 'Offer made $700 - (pending taxes + stamp duty) = $598', 14172, '1969-07-08', 7, 598);
INSERT INTO events VALUES (337, NULL, '', 14172, '1969-07-10', 1, 700);
INSERT INTO events VALUES (338, NULL, '', 14173, '1966-06-20', 3, 600);
INSERT INTO events VALUES (339, NULL, '', 14173, '1966-11-05', 3, 750);
INSERT INTO events VALUES (340, NULL, '', 14173, '1968-07-29', 3, 400);
INSERT INTO events VALUES (341, NULL, 'Deed transfer prior to acquisition', 14173, '1936-04-03', 1, 210);
INSERT INTO events VALUES (342, NULL, '', 14173, '1970-04-21', 2, 700);
INSERT INTO events VALUES (343, 'accept                                                                                                                                                                                                                                                         ', '', 14173, '1970-04-23', 4, 700);
INSERT INTO events VALUES (344, NULL, 'Offer made $700 - (taxes + stamp duty) = $696', 14173, '1970-05-18', 7, 696);
INSERT INTO events VALUES (345, NULL, '', 14173, '1970-05-18', 1, 700);
INSERT INTO events VALUES (346, NULL, '', 14174, '1965-09-15', 3, 1575);
INSERT INTO events VALUES (347, NULL, '', 14174, '1966-11-17', 3, 4000);
INSERT INTO events VALUES (348, NULL, '', 14174, '1968-07-31', 3, 4500);
INSERT INTO events VALUES (349, NULL, '', 14174, '1969-04-21', 2, 4500);
INSERT INTO events VALUES (350, 'accept                                                                                                                                                                                                                                                         ', '', 14174, '1969-04-21', 4, 4500);
INSERT INTO events VALUES (351, NULL, 'Deed transfer prior to acquisition', 14174, '1940-02-29', 1, 1493);
INSERT INTO events VALUES (352, NULL, 'Offer made $5000 - (delinquent taxes + stamp duty) = $3432', 14174, '1969-05-23', 7, 3432);
INSERT INTO events VALUES (353, NULL, '', 14174, '1969-05-23', 1, 5000);
INSERT INTO events VALUES (354, NULL, '', 14175, '1965-09-15', 3, 1650);
INSERT INTO events VALUES (358, 'accept                                                                                                                                                                                                                                                         ', '', 14175, '1969-03-27', 4, 1100);
INSERT INTO events VALUES (359, NULL, 'Deed transfer prior to acquisition', 14175, '1968-07-15', 1, 323);
INSERT INTO events VALUES (360, NULL, 'Offer made $1100 - (delinquent taxes + stamp duty) = $1052', 14175, '1969-05-20', 7, 1052);
INSERT INTO events VALUES (361, NULL, '', 14175, '1969-05-20', 1, 1100);
INSERT INTO events VALUES (362, NULL, '', 14176, '1966-11-17', 3, 1000);
INSERT INTO events VALUES (363, NULL, '', 14176, '1974-06-12', 3, 1220);
INSERT INTO events VALUES (364, NULL, '', 14176, '1968-07-31', 3, 1100);
INSERT INTO events VALUES (365, NULL, 'Deed transfer prior to acquisition, but this property was condemned as there was a price mismatch between the titles procures by different attorneys', 14176, '1955-05-02', 1, 445);
INSERT INTO events VALUES (366, NULL, 'Initial awarded amount based on the hearing by superior court commissioner', 14176, '1977-04-20', 6, 1750);
INSERT INTO events VALUES (367, NULL, '', 14176, '1977-04-26', 1, 1750);
INSERT INTO events VALUES (368, NULL, 'Final award amount on this property after a second hearing', 14176, '1977-06-07', 6, 2258);
INSERT INTO events VALUES (369, NULL, '', 14176, '1974-04-19', 3, 1525);
INSERT INTO events VALUES (370, NULL, 'Reassessment of the same property upon second hearing', 14176, '1977-04-11', 3, 1750);
INSERT INTO events VALUES (371, NULL, '', 14176, NULL, NULL, 0);
INSERT INTO events VALUES (372, NULL, '', 14177, '1955-02-09', 1, 0);
INSERT INTO events VALUES (373, NULL, '', 14177, '1974-02-06', 3, 4500);
INSERT INTO events VALUES (374, NULL, '', 14177, '1974-04-02', 3, 5000);
INSERT INTO events VALUES (375, NULL, '', 14177, '1974-04-18', 3, 5000);
INSERT INTO events VALUES (376, NULL, '', 14177, '1974-07-27', 2, 5000);
INSERT INTO events VALUES (377, 'accept                                                                                                                                                                                                                                                         ', '', 14177, '1974-07-29', 4, 5000);
INSERT INTO events VALUES (378, NULL, '', 14177, '1974-08-16', 1, 0);
INSERT INTO events VALUES (379, NULL, '', 14177, '1974-08-16', 7, 0);
INSERT INTO events VALUES (384, NULL, '', 14179, '1934-02-13', 1, 0);
INSERT INTO events VALUES (385, NULL, '', 14179, '1969-03-03', 1, 0);
INSERT INTO events VALUES (386, NULL, '', 14179, '1968-12-20', 2, 4000);
INSERT INTO events VALUES (387, 'accept                                                                                                                                                                                                                                                         ', '', 14179, '1968-12-27', 4, 4000);
INSERT INTO events VALUES (388, NULL, '', 14179, '1966-12-13', 3, 4000);
INSERT INTO events VALUES (389, NULL, '', 14179, '1965-09-15', 3, 2550);
INSERT INTO events VALUES (390, NULL, '', 14179, '1968-07-09', 3, 3750);
INSERT INTO events VALUES (391, NULL, '', 14179, '1969-03-03', 7, 0);
INSERT INTO events VALUES (392, NULL, '', 14180, '1963-11-09', 1, 0);
INSERT INTO events VALUES (393, NULL, '', 14180, '1968-10-31', 1, 0);
INSERT INTO events VALUES (394, NULL, '', 14180, '1968-10-01', 2, 11600);
INSERT INTO events VALUES (395, NULL, '', 14180, '1965-09-15', 3, 11600);
INSERT INTO events VALUES (396, NULL, '', 14180, '1966-12-30', 3, 11300);
INSERT INTO events VALUES (397, NULL, '', 14180, '1968-05-23', 3, 11000);
INSERT INTO events VALUES (398, 'accept                                                                                                                                                                                                                                                         ', '', 14180, '1968-10-02', 4, 11600);
INSERT INTO events VALUES (399, NULL, '', 14180, '1968-10-31', 7, 0);
INSERT INTO events VALUES (400, NULL, '', 14181, '1976-04-22', 1, 0);


--
-- Data for Name: owners; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

INSERT INTO owners VALUES (1, 'Willie A. Glenn                                                                                                                                                                                                                                                ', NULL, 'N    ');
INSERT INTO owners VALUES (2, 'Bessie Kalogerkais                                                                                                                                                                                                                                             ', NULL, 'N    ');


--
-- Data for Name: parcel_owner_assoc; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

INSERT INTO parcel_owner_assoc VALUES (1, 1, 1, '$11,000.00', NULL, '1947-01-03');
INSERT INTO parcel_owner_assoc VALUES (3, 3, 3, '$8,500.00', NULL, '1945-08-31');


--
-- Name: parcel_owner_assoc_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('parcel_owner_assoc_id_seq', 1, false);


--
-- Data for Name: parcels; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

INSERT INTO parcels VALUES (1, 3, 1, 4, 'commercial                                                      ');
INSERT INTO parcels VALUES (4714, 3, 10, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (4715, 55, 1, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (4716, 55, 2, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (9439, 53, 2, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14148, 55, 10, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (9440, 53, 3, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14149, 55, 11, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (9441, 53, 4, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14150, 55, 12, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14151, 55, 13, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14152, 50, 2, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14153, 50, 3, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14154, 50, 4, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14155, 50, 5, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14156, 50, 6, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14157, 50, 7, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14158, 50, 8, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14159, 50, 9, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14160, 50, 10, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14161, 50, 11, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14162, 50, 12, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14163, 50, 13, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14164, 50, 13, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14165, 50, 14, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14166, 50, 15, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14167, 50, 16, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14168, 50, 17, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14169, 50, 18, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14170, 50, 19, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14171, 50, 20, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14172, 53, 11, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14173, 53, 12, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14174, 53, 16, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14175, 53, 15, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14176, 53, 152, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14177, 56, 17, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14179, 55, 48, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14180, 55, 15, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (14181, 56, 2, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (9429, 55, 3, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (9430, 55, 4, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (9431, 55, 5, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (9432, 55, 4, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (9433, 55, 3, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (9434, 55, 6, 4, 'Boarding house and Store                                        ');
INSERT INTO parcels VALUES (9435, 55, 7, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (9436, 55, 8, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (9437, 55, 9, 4, 'residential                                                     ');
INSERT INTO parcels VALUES (9438, 53, 1, 4, 'residential                                                     ');


--
-- Data for Name: parcels_old; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

INSERT INTO parcels_old VALUES (1, '$11,000.00', '1969-03-07', '1969-11-24', '1969-10-22', NULL, NULL, NULL, NULL, NULL, '1971-11-23', '1971-11-23', 1, 51, 4, NULL, '1971-11-23', '1972-07-17', NULL);
INSERT INTO parcels_old VALUES (2, '$15,000.00', '1969-03-07', '1969-09-28', '1969-08-06', NULL, '1970-12-31', NULL, '1971-07-15', '1971-06-09', '1971-06-16', '1971-06-17', 1, 3, 4, NULL, NULL, NULL, NULL);


--
-- Name: parcels_parcel_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('parcels_parcel_id_seq', 14181, true);


--
-- Data for Name: people; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

INSERT INTO people VALUES (1, 'Hayward Powers                                                                                                                                                                                                                                                 ');
INSERT INTO people VALUES (2, 'Redevelopment Commission of the City                                                                                                                                                                                                                           ');
INSERT INTO people VALUES (3, 'Wilbur King                                                                                                                                                                                                                                                    ');
INSERT INTO people VALUES (4, 'H. E. Johnson                                                                                                                                                                                                                                                  ');
INSERT INTO people VALUES (5, 'William Duckworth Jr.                                                                                                                                                                                                                                          ');
INSERT INTO people VALUES (6, 'Charles Bradshaw                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (7, 'Jane Powers                                                                                                                                                                                                                                                    ');
INSERT INTO people VALUES (8, 'Walter?                                                                                                                                                                                                                                                        ');
INSERT INTO people VALUES (9, 'Virginia Y. Michal                                                                                                                                                                                                                                             ');
INSERT INTO people VALUES (10, 'James Weston Michal                                                                                                                                                                                                                                            ');
INSERT INTO people VALUES (11, 'Alan Butterworth                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (12, '                                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (13, 'Francis Haeger                                                                                                                                                                                                                                                 ');
INSERT INTO people VALUES (14, 'Estelle B Smith                                                                                                                                                                                                                                                ');
INSERT INTO people VALUES (15, 'Fred Barnetter                                                                                                                                                                                                                                                 ');
INSERT INTO people VALUES (16, '                                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (17, 'Fred Barnette                                                                                                                                                                                                                                                  ');
INSERT INTO people VALUES (18, 'Cornelia Logan                                                                                                                                                                                                                                                 ');
INSERT INTO people VALUES (19, 'Hugh Lasseter                                                                                                                                                                                                                                                  ');
INSERT INTO people VALUES (20, 'Leonard Cook                                                                                                                                                                                                                                                   ');
INSERT INTO people VALUES (21, '                                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (22, 'William Lee Hamilton                                                                                                                                                                                                                                           ');
INSERT INTO people VALUES (23, 'Charles McBryson                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (24, 'Modern Homes Construction Company                                                                                                                                                                                                                              ');
INSERT INTO people VALUES (25, 'Trans World Acceptance Corporation                                                                                                                                                                                                                             ');
INSERT INTO people VALUES (26, 'Wayne Brendle                                                                                                                                                                                                                                                  ');
INSERT INTO people VALUES (27, '                                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (28, 'Althea Gaither Tilson                                                                                                                                                                                                                                          ');
INSERT INTO people VALUES (29, 'Superior Court                                                                                                                                                                                                                                                 ');
INSERT INTO people VALUES (30, 'Ruth Wilson                                                                                                                                                                                                                                                    ');
INSERT INTO people VALUES (31, 'Hearing Commissioner                                                                                                                                                                                                                                           ');
INSERT INTO people VALUES (32, 'Luther Finger                                                                                                                                                                                                                                                  ');
INSERT INTO people VALUES (33, 'Greer Johnson                                                                                                                                                                                                                                                  ');
INSERT INTO people VALUES (34, 'Eleanor L Johnson                                                                                                                                                                                                                                              ');
INSERT INTO people VALUES (35, 'John H Thonmpson                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (36, 'Henry A Howard                                                                                                                                                                                                                                                 ');
INSERT INTO people VALUES (37, 'City of Asheville                                                                                                                                                                                                                                              ');
INSERT INTO people VALUES (38, 'William P Gaither                                                                                                                                                                                                                                              ');
INSERT INTO people VALUES (39, 'William Gaither                                                                                                                                                                                                                                                ');
INSERT INTO people VALUES (40, 'Lonza Norman                                                                                                                                                                                                                                                   ');
INSERT INTO people VALUES (41, 'Flora M Norman                                                                                                                                                                                                                                                 ');
INSERT INTO people VALUES (42, 'Idellar Kennedy                                                                                                                                                                                                                                                ');
INSERT INTO people VALUES (43, 'TrueHart Kennedy                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (44, 'New Mt Olive Baptist Church                                                                                                                                                                                                                                    ');
INSERT INTO people VALUES (45, 'New Mt Oliver Baptist church                                                                                                                                                                                                                                   ');
INSERT INTO people VALUES (46, 'New Mt Oliver Baptist Church                                                                                                                                                                                                                                   ');
INSERT INTO people VALUES (47, 'George Pennell                                                                                                                                                                                                                                                 ');
INSERT INTO people VALUES (48, 'Trustees of New Mt Oliver Baptist Church                                                                                                                                                                                                                       ');
INSERT INTO people VALUES (49, 'Robert Foster                                                                                                                                                                                                                                                  ');
INSERT INTO people VALUES (50, 'Bruce T Pagan                                                                                                                                                                                                                                                  ');
INSERT INTO people VALUES (51, 'Clarence Williams                                                                                                                                                                                                                                              ');
INSERT INTO people VALUES (52, 'Dewey Hanks                                                                                                                                                                                                                                                    ');
INSERT INTO people VALUES (53, 'McKinley Ellis                                                                                                                                                                                                                                                 ');
INSERT INTO people VALUES (54, 'Sallie Argintar                                                                                                                                                                                                                                                ');
INSERT INTO people VALUES (55, '                                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (56, 'James Harris                                                                                                                                                                                                                                                   ');
INSERT INTO people VALUES (57, 'Emma Orr                                                                                                                                                                                                                                                       ');
INSERT INTO people VALUES (58, 'Addie Ballenger                                                                                                                                                                                                                                                ');
INSERT INTO people VALUES (59, 'Charles Green                                                                                                                                                                                                                                                  ');
INSERT INTO people VALUES (60, 'Ernest Jackson                                                                                                                                                                                                                                                 ');
INSERT INTO people VALUES (61, 'Lenedith Logan                                                                                                                                                                                                                                                 ');
INSERT INTO people VALUES (62, 'Herbert Robinson                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (63, 'Vera E Harris                                                                                                                                                                                                                                                  ');
INSERT INTO people VALUES (64, 'Vera E. Harris                                                                                                                                                                                                                                                 ');
INSERT INTO people VALUES (65, 'Vera E Harris                                                                                                                                                                                                                                                  ');
INSERT INTO people VALUES (66, '                                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (67, 'Irwin Monk                                                                                                                                                                                                                                                     ');
INSERT INTO people VALUES (68, 'Fred Monk                                                                                                                                                                                                                                                      ');
INSERT INTO people VALUES (69, 'Fred Monk                                                                                                                                                                                                                                                      ');
INSERT INTO people VALUES (70, 'Irwin Monk                                                                                                                                                                                                                                                     ');
INSERT INTO people VALUES (71, 'Irwin Fred                                                                                                                                                                                                                                                     ');
INSERT INTO people VALUES (72, 'Irwin Fred                                                                                                                                                                                                                                                     ');
INSERT INTO people VALUES (73, 'Edward Rogers                                                                                                                                                                                                                                                  ');
INSERT INTO people VALUES (74, 'Sadie Rogers                                                                                                                                                                                                                                                   ');
INSERT INTO people VALUES (75, 'Eula C Moore                                                                                                                                                                                                                                                   ');
INSERT INTO people VALUES (76, 'Pearl Marshall                                                                                                                                                                                                                                                 ');
INSERT INTO people VALUES (77, 'Don C Young                                                                                                                                                                                                                                                    ');
INSERT INTO people VALUES (78, 'A. C. Graver                                                                                                                                                                                                                                                   ');
INSERT INTO people VALUES (79, 'William Howard McAvoy                                                                                                                                                                                                                                          ');
INSERT INTO people VALUES (80, 'Pearl McAvoy                                                                                                                                                                                                                                                   ');
INSERT INTO people VALUES (81, 'Don C young                                                                                                                                                                                                                                                    ');
INSERT INTO people VALUES (82, 'Raymond M Bland                                                                                                                                                                                                                                                ');
INSERT INTO people VALUES (83, 'Louis Bland                                                                                                                                                                                                                                                    ');
INSERT INTO people VALUES (84, 'John L Bland                                                                                                                                                                                                                                                   ');
INSERT INTO people VALUES (85, 'Belvie Bland                                                                                                                                                                                                                                                   ');
INSERT INTO people VALUES (86, 'Louise Bland                                                                                                                                                                                                                                                   ');
INSERT INTO people VALUES (87, 'Joseph C Reynolds                                                                                                                                                                                                                                              ');
INSERT INTO people VALUES (88, 'Artie Jones                                                                                                                                                                                                                                                    ');
INSERT INTO people VALUES (89, 'Celester Jones                                                                                                                                                                                                                                                 ');
INSERT INTO people VALUES (90, 'Elijah Ulyses Jones                                                                                                                                                                                                                                            ');
INSERT INTO people VALUES (91, 'Gladys Jones                                                                                                                                                                                                                                                   ');
INSERT INTO people VALUES (92, '                                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (93, 'Johnson P Greer Jr                                                                                                                                                                                                                                             ');
INSERT INTO people VALUES (94, 'Estelle Williams Est                                                                                                                                                                                                                                           ');
INSERT INTO people VALUES (95, 'Paul J Smith, Commissioner                                                                                                                                                                                                                                     ');
INSERT INTO people VALUES (96, 'Johnson P Greer JR                                                                                                                                                                                                                                             ');
INSERT INTO people VALUES (97, 'Lewis Holloway                                                                                                                                                                                                                                                 ');
INSERT INTO people VALUES (98, 'Mamie Holloway                                                                                                                                                                                                                                                 ');
INSERT INTO people VALUES (99, 'Elizabeth Shuford Nichols                                                                                                                                                                                                                                      ');
INSERT INTO people VALUES (100, 'Herman G Nichols                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (101, 'Millard Wilkins                                                                                                                                                                                                                                                ');
INSERT INTO people VALUES (102, 'Magnolia Wilkins                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (103, 'M. Gist                                                                                                                                                                                                                                                        ');
INSERT INTO people VALUES (104, 'M. H. Kelly and Mary Kelly                                                                                                                                                                                                                                     ');
INSERT INTO people VALUES (105, 'Annie Gist                                                                                                                                                                                                                                                     ');
INSERT INTO people VALUES (106, 'Claude Williams                                                                                                                                                                                                                                                ');
INSERT INTO people VALUES (107, 'G. J. Bates and Eva P. Bates                                                                                                                                                                                                                                   ');
INSERT INTO people VALUES (108, 'Carlos Palaez                                                                                                                                                                                                                                                  ');
INSERT INTO people VALUES (109, 'Jesse Lee Palaez                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (110, 'Mary Talbert                                                                                                                                                                                                                                                   ');
INSERT INTO people VALUES (111, 'Mildred Wurzberg                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (112, 'Eddie Talbert                                                                                                                                                                                                                                                  ');
INSERT INTO people VALUES (113, '                                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (114, 'Lillian Wells                                                                                                                                                                                                                                                  ');
INSERT INTO people VALUES (115, 'Z. W. Wells                                                                                                                                                                                                                                                    ');
INSERT INTO people VALUES (116, 'W. E. Shuford and Cora J. Shuford                                                                                                                                                                                                                              ');
INSERT INTO people VALUES (117, 'Z. W. Wells and Lillian Wells                                                                                                                                                                                                                                  ');
INSERT INTO people VALUES (118, '                                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (119, 'Beulah Alexander                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (120, 'John Alexander                                                                                                                                                                                                                                                 ');
INSERT INTO people VALUES (121, 'Wade Lytle                                                                                                                                                                                                                                                     ');
INSERT INTO people VALUES (122, 'Archie Chambers                                                                                                                                                                                                                                                ');
INSERT INTO people VALUES (123, 'Gussie Mae Chambers                                                                                                                                                                                                                                            ');
INSERT INTO people VALUES (124, 'Miriam Chambers                                                                                                                                                                                                                                                ');
INSERT INTO people VALUES (125, 'Edward Chambers                                                                                                                                                                                                                                                ');
INSERT INTO people VALUES (126, 'Gladys Chambers Green                                                                                                                                                                                                                                          ');
INSERT INTO people VALUES (127, 'Mack Green                                                                                                                                                                                                                                                     ');
INSERT INTO people VALUES (128, 'John F Shuford and Caney B Shuford                                                                                                                                                                                                                             ');
INSERT INTO people VALUES (129, 'Fay Chambers                                                                                                                                                                                                                                                   ');
INSERT INTO people VALUES (130, 'T. N. James and Emily C. James                                                                                                                                                                                                                                 ');
INSERT INTO people VALUES (131, 'First Presbyterian Church of Lincolnton                                                                                                                                                                                                                        ');
INSERT INTO people VALUES (132, 'Terrell Wilkins                                                                                                                                                                                                                                                ');
INSERT INTO people VALUES (133, 'E. M. Browne                                                                                                                                                                                                                                                   ');
INSERT INTO people VALUES (134, 'A. L. Tait                                                                                                                                                                                                                                                     ');
INSERT INTO people VALUES (135, '                                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (136, 'Wayne Bramlett                                                                                                                                                                                                                                                 ');
INSERT INTO people VALUES (137, 'Bernell Swinson                                                                                                                                                                                                                                                ');
INSERT INTO people VALUES (138, 'Jannie Siwnson                                                                                                                                                                                                                                                 ');
INSERT INTO people VALUES (139, 'Jannie Swinson                                                                                                                                                                                                                                                 ');
INSERT INTO people VALUES (140, 'M. F. Meredith and Dorothy N Meredith                                                                                                                                                                                                                          ');
INSERT INTO people VALUES (141, 'Thorsen Flooring Company                                                                                                                                                                                                                                       ');
INSERT INTO people VALUES (142, 'Leo Lowery                                                                                                                                                                                                                                                     ');
INSERT INTO people VALUES (143, 'Virginia Lowery                                                                                                                                                                                                                                                ');
INSERT INTO people VALUES (144, 'Rosa Lowery                                                                                                                                                                                                                                                    ');
INSERT INTO people VALUES (145, '                                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (146, 'Harry D Jones et al                                                                                                                                                                                                                                            ');
INSERT INTO people VALUES (147, 'C. Baber and Mary Winton Baber                                                                                                                                                                                                                                 ');
INSERT INTO people VALUES (148, 'Rita H Lee                                                                                                                                                                                                                                                     ');
INSERT INTO people VALUES (149, 'Walter S Lee                                                                                                                                                                                                                                                   ');
INSERT INTO people VALUES (150, 'Rae B Lee                                                                                                                                                                                                                                                      ');
INSERT INTO people VALUES (151, 'P. L. Hendrick and Laura Hendrick                                                                                                                                                                                                                              ');
INSERT INTO people VALUES (152, 'W. S. Lee                                                                                                                                                                                                                                                      ');
INSERT INTO people VALUES (153, 'W. S. Lee Jr                                                                                                                                                                                                                                                   ');
INSERT INTO people VALUES (154, 'Aileen Lipscombe                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (155, 'Lola B. McCracken                                                                                                                                                                                                                                              ');
INSERT INTO people VALUES (156, '                                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (157, '                                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (158, 'Randolph F Williams                                                                                                                                                                                                                                            ');
INSERT INTO people VALUES (159, 'Dorothy Williams                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (160, 'Randolph Williams                                                                                                                                                                                                                                              ');
INSERT INTO people VALUES (161, 'Jacob Gilbert and Betsy Gilbert                                                                                                                                                                                                                                ');
INSERT INTO people VALUES (162, 'W. E. Logan                                                                                                                                                                                                                                                    ');
INSERT INTO people VALUES (163, 'Carl Marsdon Logan                                                                                                                                                                                                                                             ');
INSERT INTO people VALUES (164, 'Josie V Logan                                                                                                                                                                                                                                                  ');
INSERT INTO people VALUES (165, 'Harry L Nettles and Margaret G Nettles                                                                                                                                                                                                                         ');
INSERT INTO people VALUES (166, 'Southside, Inc.                                                                                                                                                                                                                                                ');
INSERT INTO people VALUES (167, 'T N James and Emily C James                                                                                                                                                                                                                                    ');
INSERT INTO people VALUES (168, '                                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (169, 'William P Shuford                                                                                                                                                                                                                                              ');
INSERT INTO people VALUES (170, 'Wachovia Bank                                                                                                                                                                                                                                                  ');
INSERT INTO people VALUES (171, 'Alonzo McCoy                                                                                                                                                                                                                                                   ');
INSERT INTO people VALUES (172, 'Fannie M McCoy                                                                                                                                                                                                                                                 ');
INSERT INTO people VALUES (173, 'R. W. Willis                                                                                                                                                                                                                                                   ');
INSERT INTO people VALUES (174, 'Mary Frances Willis                                                                                                                                                                                                                                            ');
INSERT INTO people VALUES (175, 'C. C. Willis (Widower)                                                                                                                                                                                                                                         ');
INSERT INTO people VALUES (176, 'Paul Rout                                                                                                                                                                                                                                                      ');
INSERT INTO people VALUES (177, 'Amy Ramsey                                                                                                                                                                                                                                                     ');
INSERT INTO people VALUES (178, 'Edward Sale                                                                                                                                                                                                                                                    ');
INSERT INTO people VALUES (179, 'R. D. Burgin                                                                                                                                                                                                                                                   ');
INSERT INTO people VALUES (180, 'Ira I Angel                                                                                                                                                                                                                                                    ');
INSERT INTO people VALUES (181, 'Lessie K Angel                                                                                                                                                                                                                                                 ');
INSERT INTO people VALUES (182, '                                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (183, 'Riley Foster                                                                                                                                                                                                                                                   ');
INSERT INTO people VALUES (184, 'Sophia Foster                                                                                                                                                                                                                                                  ');
INSERT INTO people VALUES (185, 'Mozella Toland                                                                                                                                                                                                                                                 ');
INSERT INTO people VALUES (186, 'Margo Collins                                                                                                                                                                                                                                                  ');
INSERT INTO people VALUES (187, 'Ray Patricia Hunting                                                                                                                                                                                                                                           ');
INSERT INTO people VALUES (188, 'Francis Naeger                                                                                                                                                                                                                                                 ');
INSERT INTO people VALUES (189, 'R. Moore                                                                                                                                                                                                                                                       ');
INSERT INTO people VALUES (190, '                                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (191, 'T. B. Galloway                                                                                                                                                                                                                                                 ');
INSERT INTO people VALUES (192, 'William Acker                                                                                                                                                                                                                                                  ');
INSERT INTO people VALUES (193, 'Sallie Acker                                                                                                                                                                                                                                                   ');
INSERT INTO people VALUES (194, '                                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (195, '                                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (196, 'Zachriah Curry                                                                                                                                                                                                                                                 ');
INSERT INTO people VALUES (197, 'Emma Curry                                                                                                                                                                                                                                                     ');
INSERT INTO people VALUES (198, '                                                                                                                                                                                                                                                               ');
INSERT INTO people VALUES (199, '                                                                                                                                                                                                                                                               ');


--
-- Name: people_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('people_id_seq', 199, true);


--
-- Data for Name: property_photos ; Type: TABLE DATA; Schema: humanface; Owner: postgres
--



--
-- Data for Name: tenants; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

INSERT INTO tenants VALUES (1, 'Willie A. Glenn                                                                                                                                                                                                                                                ', NULL, '$100.00', '$13,200.00', '231 Coxe Avenue                                                                                                                                                                                                                                                ', 1);


--
-- Name: Appraisers_pkey; Type: CONSTRAINT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY appraisers
    ADD CONSTRAINT "Appraisers_pkey" PRIMARY KEY (appraiser_id);


--
-- Name: Appraises_pkey; Type: CONSTRAINT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY appraisals
    ADD CONSTRAINT "Appraises_pkey" PRIMARY KEY ("appraisal-id");


--
-- Name: Buildings_pkey; Type: CONSTRAINT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY buildings
    ADD CONSTRAINT "Buildings_pkey" PRIMARY KEY (building_id);


--
-- Name: Event_pkey; Type: CONSTRAINT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY events
    ADD CONSTRAINT "Event_pkey" PRIMARY KEY (event_id);


--
-- Name: Owners _pkey; Type: CONSTRAINT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY owners
    ADD CONSTRAINT "Owners _pkey" PRIMARY KEY (owner_id);


--
-- Name: Parcels_pkey; Type: CONSTRAINT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY parcels_old
    ADD CONSTRAINT "Parcels_pkey" PRIMARY KEY (parcel_id);


--
-- Name: Property photos _pkey; Type: CONSTRAINT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY "property_photos "
    ADD CONSTRAINT "Property photos _pkey" PRIMARY KEY (id);


--
-- Name: Tenants_pkey; Type: CONSTRAINT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY tenants
    ADD CONSTRAINT "Tenants_pkey" PRIMARY KEY (tenant_id);


--
-- Name: addresses_pkey; Type: CONSTRAINT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: event_people_assoc_pkey; Type: CONSTRAINT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY event_people_assoc
    ADD CONSTRAINT event_people_assoc_pkey PRIMARY KEY (id);


--
-- Name: event_types_pkey; Type: CONSTRAINT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY event_types
    ADD CONSTRAINT event_types_pkey PRIMARY KEY (id);


--
-- Name: parcel_owner_assoc_pkey; Type: CONSTRAINT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY parcel_owner_assoc
    ADD CONSTRAINT parcel_owner_assoc_pkey PRIMARY KEY (id);


--
-- Name: parcels_pkey; Type: CONSTRAINT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY parcels
    ADD CONSTRAINT parcels_pkey PRIMARY KEY (parcel_id);


--
-- Name: people_pkey; Type: CONSTRAINT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY people
    ADD CONSTRAINT people_pkey PRIMARY KEY (person_id);


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

