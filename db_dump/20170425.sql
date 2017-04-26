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

SET search_path = humanface, pg_catalog;

ALTER TABLE ONLY humanface.people DROP CONSTRAINT people_pkey;
ALTER TABLE ONLY humanface.parcels DROP CONSTRAINT parcels_pkey;
ALTER TABLE ONLY humanface.parcel_owner_assoc DROP CONSTRAINT parcel_owner_assoc_pkey;
ALTER TABLE ONLY humanface.event_types DROP CONSTRAINT event_types_pkey;
ALTER TABLE ONLY humanface.event_people_assoc DROP CONSTRAINT event_people_assoc_pkey;
ALTER TABLE ONLY humanface.addresses DROP CONSTRAINT addresses_pkey;
ALTER TABLE ONLY humanface.tenants DROP CONSTRAINT "Tenants_pkey";
ALTER TABLE ONLY humanface."property_photos " DROP CONSTRAINT "Property photos _pkey";
ALTER TABLE ONLY humanface.parcels_old DROP CONSTRAINT "Parcels_pkey";
ALTER TABLE ONLY humanface.owners DROP CONSTRAINT "Owners _pkey";
ALTER TABLE ONLY humanface.events DROP CONSTRAINT "Event_pkey";
ALTER TABLE ONLY humanface.buildings DROP CONSTRAINT "Buildings_pkey";
ALTER TABLE ONLY humanface.appraisals DROP CONSTRAINT "Appraises_pkey";
ALTER TABLE ONLY humanface.appraisers DROP CONSTRAINT "Appraisers_pkey";
ALTER TABLE humanface.tenants ALTER COLUMN tenant_id DROP DEFAULT;
ALTER TABLE humanface."property_photos " ALTER COLUMN id DROP DEFAULT;
ALTER TABLE humanface.people ALTER COLUMN person_id DROP DEFAULT;
ALTER TABLE humanface.parcels_old ALTER COLUMN parcel_id DROP DEFAULT;
ALTER TABLE humanface.parcels ALTER COLUMN parcel_id DROP DEFAULT;
ALTER TABLE humanface.parcel_owner_assoc ALTER COLUMN id DROP DEFAULT;
ALTER TABLE humanface.owners ALTER COLUMN owner_id DROP DEFAULT;
ALTER TABLE humanface.events ALTER COLUMN event_id DROP DEFAULT;
ALTER TABLE humanface.event_types ALTER COLUMN id DROP DEFAULT;
ALTER TABLE humanface.event_people_assoc ALTER COLUMN id DROP DEFAULT;
ALTER TABLE humanface.buildings ALTER COLUMN building_id DROP DEFAULT;
ALTER TABLE humanface.appraisers ALTER COLUMN appraiser_id DROP DEFAULT;
ALTER TABLE humanface.appraisals ALTER COLUMN "appraisal-id" DROP DEFAULT;
ALTER TABLE humanface.addresses ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE humanface.people_id_seq;
DROP TABLE humanface.people;
DROP SEQUENCE humanface.parcels_parcel_id_seq;
DROP TABLE humanface.parcels;
DROP SEQUENCE humanface.parcel_owner_assoc_id_seq;
DROP TABLE humanface.parcel_owner_assoc;
DROP SEQUENCE humanface.event_types_id_seq;
DROP TABLE humanface.event_types;
DROP SEQUENCE humanface.event_people_assoc_id_seq;
DROP TABLE humanface.event_people_assoc;
DROP SEQUENCE humanface.addresses_id_seq;
DROP TABLE humanface.addresses;
DROP SEQUENCE humanface."Tenants_tenant_id_seq";
DROP TABLE humanface.tenants;
DROP SEQUENCE humanface."Property photos _id_seq";
DROP TABLE humanface."property_photos ";
DROP SEQUENCE humanface."Parcels_parcel_id_seq";
DROP TABLE humanface.parcels_old;
DROP SEQUENCE humanface."Owners _owner_id_seq";
DROP TABLE humanface.owners;
DROP SEQUENCE humanface."Event_id_seq";
DROP TABLE humanface.events;
DROP SEQUENCE humanface."Buildings_building_id_seq";
DROP TABLE humanface.buildings;
DROP SEQUENCE humanface."Appraises_appraise-id_seq";
DROP TABLE humanface.appraisals;
DROP SEQUENCE humanface."Appraisers_appraiser_id_seq";
DROP TABLE humanface.appraisers;
DROP SCHEMA humanface;
--
-- Name: humanface; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA humanface;


ALTER SCHEMA humanface OWNER TO postgres;

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

SELECT pg_catalog.setval('"Event_id_seq"', 168, true);


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

COPY addresses (id, st_num, st_name, parcel_id) FROM stdin;
1	140                                                             	Asheland Ave.                                                                                                                                                                                                                                                  	1
2	Rear of 140                                                     	Asheland Ave.                                                                                                                                                                                                                                                  	1
4715	180 1/2                                                         	Asheland Avenue                                                                                                                                                                                                                                                	4714
4716	                                                                	                                                                                                                                                                                                                                                               	4714
4717	82                                                              	Livingston St                                                                                                                                                                                                                                                  	4715
4718	                                                                	                                                                                                                                                                                                                                                               	4715
4719	86                                                              	Livingston St                                                                                                                                                                                                                                                  	4716
4720	                                                                	                                                                                                                                                                                                                                                               	4716
9453	Across from 9                                                   	Louie Street Asheville N.C                                                                                                                                                                                                                                     	9439
9454	                                                                	                                                                                                                                                                                                                                                               	9439
14165	118                                                             	Livingston St                                                                                                                                                                                                                                                  	14148
14166	                                                                	                                                                                                                                                                                                                                                               	14148
9455	On Louis street of Randell Street                               	Asheville N.C,                                                                                                                                                                                                                                                 	9440
9456	                                                                	                                                                                                                                                                                                                                                               	9440
14167	Joins 128                                                       	Livingston St                                                                                                                                                                                                                                                  	14149
14168	                                                                	                                                                                                                                                                                                                                                               	14149
9457	28 Louis Street                                                 	Asheville N.C,                                                                                                                                                                                                                                                 	9441
9458	                                                                	                                                                                                                                                                                                                                                               	9441
14169	128                                                             	Livingston St                                                                                                                                                                                                                                                  	14150
14170	                                                                	                                                                                                                                                                                                                                                               	14150
14171	130                                                             	Livingston St                                                                                                                                                                                                                                                  	14151
14172	                                                                	                                                                                                                                                                                                                                                               	14151
9433	94                                                              	Livingston St                                                                                                                                                                                                                                                  	9429
9434	                                                                	                                                                                                                                                                                                                                                               	9429
9435	98                                                              	Livingston St                                                                                                                                                                                                                                                  	9430
9436	                                                                	                                                                                                                                                                                                                                                               	9430
9437	Rear 101 - 104                                                  	Livingston St                                                                                                                                                                                                                                                  	9431
9438	                                                                	                                                                                                                                                                                                                                                               	9431
9439	98                                                              	Livingston St                                                                                                                                                                                                                                                  	9432
9440	                                                                	                                                                                                                                                                                                                                                               	9432
9441	94                                                              	Livingston St                                                                                                                                                                                                                                                  	9433
9442	                                                                	                                                                                                                                                                                                                                                               	9433
9443	100                                                             	Livingston St                                                                                                                                                                                                                                                  	9434
9444	                                                                	                                                                                                                                                                                                                                                               	9434
9445	Adj. 104                                                        	Livingston St                                                                                                                                                                                                                                                  	9435
9446	                                                                	                                                                                                                                                                                                                                                               	9435
9447	108                                                             	Livingston St                                                                                                                                                                                                                                                  	9436
9448	                                                                	                                                                                                                                                                                                                                                               	9436
9449	116                                                             	Livingston St                                                                                                                                                                                                                                                  	9437
9450	                                                                	                                                                                                                                                                                                                                                               	9437
9451	467-491                                                         	s. French Broad Ave.                                                                                                                                                                                                                                           	9438
9452	                                                                	                                                                                                                                                                                                                                                               	9438
\.


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('addresses_id_seq', 14172, true);


--
-- Data for Name: appraisals; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

COPY appraisals ("appraisal-id", appraiser_id, parcel_id, imps_value, area_of_house, land_value, total_value, reproduction_value, income) FROM stdin;
1	1	1	$6,400.00	2500	$4,000.00	$10,400.00	$10,894.00	\N
5	5	2	$2,800.00	1420	$4,200.00	$7,000.00	$11,766.00	\N
6	6	2	$4,100.00	1420	$5,100.00	$9,300.00	$13,817.00	\N
4	4	2	$2,050.00	1420	$4,200.00	$6,250.00	$15,440.00	\N
3	3	1	\N	2500	\N	\N	$9,135.00	\N
2	2	1	$4,800.00	2500	\N	$110,000.00	\N	\N
\.


--
-- Data for Name: appraisers; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

COPY appraisers (appraiser_id, appraiser_name, company_name) FROM stdin;
1	Alan Butterworth                                                                                                                                                                                                                                               	W. T. Duckworth Company                                                                                                                                                                                                                                        
2	H. E. Johnson                                                                                                                                                                                                                                                  	H. E. Johnson                                                                                                                                                                                                                                                  
4	Clyde G Idol Jr                                                                                                                                                                                                                                                	Charles W. Bradshaw. Inc                                                                                                                                                                                                                                       
5	Alan Butterworth                                                                                                                                                                                                                                               	W. T. Duckworth Company                                                                                                                                                                                                                                        
6	H E. Johnson                                                                                                                                                                                                                                                   	H E. Johnson                                                                                                                                                                                                                                                   
3	Charles W. Bradshaw                                                                                                                                                                                                                                            	Charles W. Bradshaw. Inc.                                                                                                                                                                                                                                      
\.


--
-- Data for Name: buildings; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

COPY buildings (building_id, st_name, apt_no, area_of_units, use_of_building, parcel_id, number_of_rooms, address) FROM stdin;
1	Coxe Avenue                                                                                                                                                                                                                                                    	51	2500	commerical                                                                                                                                                                                                                                                     	1	1	\N
2	                                                                                                                                                                                                                                                               	2	1420	commerical                                                                                                                                                                                                                                                     	2	4	\N
\.


--
-- Data for Name: event_people_assoc; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

COPY event_people_assoc (id, event_id, person_id, role) FROM stdin;
1	1	1	owner                                                           
2	1	2	haca                                                            
3	2	3	haca                                                            
4	2	1	owner                                                           
5	3	4	appraiser                                                       
6	3	1	owner                                                           
7	4	5	appraiser                                                       
8	4	1	owner                                                           
9	5	6	appraiser                                                       
10	5	1	owner                                                           
11	6	3	haca                                                            
12	6	1	owner                                                           
13	7	1	owner                                                           
14	7	7	owner                                                           
15	7	8	haca                                                            
16	8	9	owner                                                           
17	8	10	other                                                           
18	8	2	haca                                                            
19	9	10	other                                                           
20	9	2	haca                                                            
21	10	10	other                                                           
22	10	2	haca                                                            
23	11	9	owner                                                           
24	11	2	haca                                                            
25	12	9	owner                                                           
26	12	2	haca                                                            
27	13	9	owner                                                           
28	14	4	appraiser                                                       
29	15	11	appraiser                                                       
30	16	6	appraiser                                                       
31	17	12	\N
32	18	6	appraiser                                                       
33	19	13	appraiser                                                       
34	20	11	appraiser                                                       
35	21	14	owner                                                           
36	21	15	owner                                                           
37	21	16	\N
38	22	2	purchaser                                                       
39	22	17	owner                                                           
40	23	2	purchaser                                                       
41	23	17	owner                                                           
42	24	17	owner                                                           
43	24	2	purchaser                                                       
44	25	2	purchaser                                                       
45	25	17	owner                                                           
46	26	6	appraiser                                                       
47	26	1	owner                                                           
48	27	13	appraiser                                                       
49	27	18	owner                                                           
50	28	11	appraiser                                                       
51	28	18	owner                                                           
52	29	18	owner                                                           
53	29	2	purchaser                                                       
54	30	18	owner                                                           
55	30	2	purchaser                                                       
56	31	1	owner                                                           
57	31	18	purchaser                                                       
58	32	18	owner                                                           
59	32	2	purchaser                                                       
60	33	19	tenant                                                          
61	33	2	owner                                                           
62	34	18	owner                                                           
63	34	2	purchaser                                                       
64	35	13	appraiser                                                       
65	35	20	owner                                                           
66	36	6	appraiser                                                       
67	36	20	owner                                                           
68	37	11	appraiser                                                       
69	37	20	owner                                                           
70	38	2	purchaser                                                       
71	38	20	owner                                                           
72	39	2	purchaser                                                       
73	39	20	owner                                                           
74	40	2	purchaser                                                       
75	40	20	owner                                                           
76	41	2	purchaser                                                       
77	41	20	owner                                                           
78	42	2	purchaser                                                       
79	42	20	owner                                                           
80	43	21	\N
81	44	6	appraiser                                                       
82	44	22	owner                                                           
83	45	13	appraiser                                                       
84	45	23	owner                                                           
85	46	11	appraiser                                                       
86	46	24	owner                                                           
87	47	2	purchaser                                                       
88	47	25	owner                                                           
89	48	26	trustee                                                         
90	48	24	purchaser                                                       
91	49	2	purchaser                                                       
92	49	24	owner                                                           
93	50	23	owner                                                           
94	50	2	purchaser                                                       
95	51	2	purchaser                                                       
96	51	23	owner                                                           
97	52	27	\N
98	53	6	appraiser                                                       
99	54	11	appraiser                                                       
100	55	13	appraiser                                                       
101	56	2	purchaser                                                       
102	56	28	owner                                                           
103	57	29	other                                                           
104	57	28	owner                                                           
105	57	2	purchaser                                                       
106	58	28	owner                                                           
107	58	29	other                                                           
108	58	2	purchaser                                                       
109	59	30	owner                                                           
110	59	28	purchaser                                                       
111	60	31	other                                                           
112	60	28	owner                                                           
113	60	2	purchaser                                                       
114	61	2	purchaser                                                       
115	61	28	owner                                                           
116	62	23	owner                                                           
117	62	2	purchaser                                                       
118	63	32	owner                                                           
119	63	20	purchaser                                                       
120	64	6	appraiser                                                       
121	65	11	appraiser                                                       
122	66	13	appraiser                                                       
123	67	2	purchaser                                                       
124	67	33	owner                                                           
125	67	34	owner                                                           
126	68	35	owner                                                           
127	68	33	purchaser                                                       
128	69	2	purchaser                                                       
129	69	33	owner                                                           
130	70	2	purchaser                                                       
131	70	33	owner                                                           
132	71	2	purchaser                                                       
133	71	33	owner                                                           
134	72	36	tenant                                                          
135	72	2	owner                                                           
136	73	37	owner                                                           
137	73	11	appraiser                                                       
138	74	13	appraiser                                                       
139	74	38	owner                                                           
140	75	6	appraiser                                                       
141	75	39	owner                                                           
142	76	30	owner                                                           
143	76	28	purchaser                                                       
144	77	29	other                                                           
145	77	30	owner                                                           
146	77	28	owner                                                           
147	77	2	purchaser                                                       
148	78	30	owner                                                           
149	78	28	owner                                                           
150	78	2	purchaser                                                       
151	79	2	owner                                                           
152	79	29	other                                                           
153	80	30	owner                                                           
154	80	2	purchaser                                                       
155	81	30	owner                                                           
156	81	2	purchaser                                                       
157	82	13	appraiser                                                       
158	82	40	owner                                                           
159	82	41	owner                                                           
160	83	11	appraiser                                                       
161	83	40	owner                                                           
162	83	41	owner                                                           
163	84	6	appraiser                                                       
164	84	40	owner                                                           
165	84	41	owner                                                           
166	85	2	purchaser                                                       
167	85	40	owner                                                           
168	85	41	owner                                                           
169	86	2	purchaser                                                       
170	86	41	owner                                                           
171	86	40	owner                                                           
172	87	42	owner                                                           
173	87	40	owner                                                           
174	87	41	owner                                                           
175	88	40	owner                                                           
176	88	2	purchaser                                                       
177	88	41	owner                                                           
178	89	2	purchaser                                                       
179	89	40	owner                                                           
180	89	41	owner                                                           
181	89	43	owner                                                           
182	89	42	owner                                                           
183	90	6	appraiser                                                       
184	90	44	owner                                                           
185	91	11	appraiser                                                       
186	91	45	owner                                                           
187	92	13	appraiser                                                       
188	92	46	owner                                                           
189	93	47	owner                                                           
190	93	48	purchaser                                                       
191	94	2	purchaser                                                       
192	94	49	trustee                                                         
193	94	50	trustee                                                         
194	94	51	trustee                                                         
195	94	52	trustee                                                         
196	94	53	trustee                                                         
197	95	2	purchaser                                                       
198	95	51	trustee                                                         
199	95	50	trustee                                                         
200	95	52	trustee                                                         
201	95	53	trustee                                                         
202	95	49	trustee                                                         
203	96	2	purchaser                                                       
204	96	48	owner                                                           
205	97	2	purchaser                                                       
206	97	48	owner                                                           
207	98	54	owner                                                           
208	98	2	purchaser                                                       
209	99	54	owner                                                           
210	100	11	appraiser                                                       
211	100	55	\N
212	101	13	appraiser                                                       
213	102	6	appraiser                                                       
214	103	54	owner                                                           
215	104	56	tenant                                                          
216	104	2	purchaser                                                       
217	105	57	tenant                                                          
218	105	2	purchaser                                                       
219	106	58	tenant                                                          
220	106	2	purchaser                                                       
221	107	59	tenant                                                          
222	107	2	purchaser                                                       
223	108	60	tenant                                                          
224	108	2	purchaser                                                       
225	109	61	tenant                                                          
226	109	2	purchaser                                                       
227	110	62	tenant                                                          
228	111	63	owner                                                           
229	111	2	purchaser                                                       
230	112	64	owner                                                           
231	112	2	purchaser                                                       
232	113	64	owner                                                           
233	113	2	purchaser                                                       
234	114	64	owner                                                           
235	114	2	purchaser                                                       
236	115	63	owner                                                           
237	115	2	purchaser                                                       
238	116	13	appraiser                                                       
239	116	63	owner                                                           
240	117	11	appraiser                                                       
241	117	63	owner                                                           
242	118	6	appraiser                                                       
243	118	63	owner                                                           
244	119	65	owner                                                           
245	119	2	purchaser                                                       
246	119	66	\N
247	120	63	owner                                                           
248	120	2	purchaser                                                       
249	121	67	owner                                                           
250	121	2	purchaser                                                       
251	121	68	trustee                                                         
252	122	68	trustee                                                         
253	122	67	owner                                                           
254	122	2	purchaser                                                       
255	123	69	trustee                                                         
256	123	70	owner                                                           
257	123	2	purchaser                                                       
258	124	68	trustee                                                         
259	124	67	owner                                                           
260	124	2	purchaser                                                       
261	125	68	trustee                                                         
262	125	67	owner                                                           
263	125	2	purchaser                                                       
264	126	13	appraiser                                                       
265	126	68	trustee                                                         
266	126	67	owner                                                           
267	127	11	appraiser                                                       
268	127	68	trustee                                                         
269	127	67	owner                                                           
270	128	6	appraiser                                                       
271	128	68	trustee                                                         
272	128	71	owner                                                           
273	129	68	trustee                                                         
274	129	72	owner                                                           
275	129	2	purchaser                                                       
276	130	68	trustee                                                         
277	130	67	owner                                                           
278	130	2	purchaser                                                       
279	131	73	owner                                                           
280	131	74	owner                                                           
281	131	2	purchaser                                                       
282	132	73	owner                                                           
283	132	74	owner                                                           
284	132	2	purchaser                                                       
285	133	73	owner                                                           
286	133	74	owner                                                           
287	133	2	purchaser                                                       
288	134	6	appraiser                                                       
289	135	11	appraiser                                                       
290	136	13	appraiser                                                       
291	137	75	tenant                                                          
292	137	2	owner                                                           
293	138	76	tenant                                                          
294	138	2	owner                                                           
295	139	2	purchaser                                                       
296	139	77	owner                                                           
297	139	78	owner                                                           
298	140	2	purchaser                                                       
299	140	77	owner                                                           
300	140	78	owner                                                           
301	141	79	owner                                                           
302	141	80	owner                                                           
303	141	77	purchaser                                                       
304	141	78	purchaser                                                       
305	142	2	purchaser                                                       
306	142	81	owner                                                           
307	142	78	owner                                                           
308	143	2	purchaser                                                       
309	143	77	owner                                                           
310	143	78	owner                                                           
311	144	6	appraiser                                                       
312	145	13	appraiser                                                       
313	146	11	appraiser                                                       
314	147	2	purchaser                                                       
315	147	82	owner                                                           
316	147	83	owner                                                           
317	148	2	purchaser                                                       
318	148	82	owner                                                           
319	148	83	owner                                                           
320	149	84	owner                                                           
321	149	85	owner                                                           
322	149	86	purchaser                                                       
323	149	82	purchaser                                                       
324	150	2	purchaser                                                       
325	150	82	owner                                                           
326	150	86	owner                                                           
327	150	87	trustee                                                         
328	151	2	purchaser                                                       
329	151	82	owner                                                           
330	151	86	owner                                                           
331	152	6	appraiser                                                       
332	153	11	appraiser                                                       
333	154	13	appraiser                                                       
334	155	2	purchaser                                                       
335	155	82	owner                                                           
336	155	85	owner                                                           
337	156	2	purchaser                                                       
338	156	82	owner                                                           
339	156	85	owner                                                           
340	157	85	owner                                                           
341	157	82	heir                                                            
342	158	2	purchaser                                                       
343	158	82	owner                                                           
344	158	87	trustee                                                         
345	159	2	purchaser                                                       
346	159	82	owner                                                           
347	159	86	owner                                                           
348	160	6	appraiser                                                       
349	161	11	appraiser                                                       
350	162	13	appraiser                                                       
351	163	2	purchaser                                                       
352	163	88	owner                                                           
353	163	89	owner                                                           
354	164	2	purchaser                                                       
355	164	89	owner                                                           
356	164	88	owner                                                           
357	165	2	purchaser                                                       
358	165	88	owner                                                           
359	165	89	owner                                                           
360	166	90	owner                                                           
361	166	91	owner                                                           
362	166	88	purchaser                                                       
363	166	92	\N
364	167	2	purchaser                                                       
365	167	88	owner                                                           
366	168	2	owner                                                           
367	168	88	tenant                                                          
\.


--
-- Name: event_people_assoc_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('event_people_assoc_id_seq', 367, true);


--
-- Data for Name: event_types; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

COPY event_types (id, type) FROM stdin;
1	Transfer of Deed                                                                                                                                                                                                                                               
2	Offer Made                                                                                                                                                                                                                                                     
3	Appraisal                                                                                                                                                                                                                                                      
5	Tenant Moved                                                                                                                                                                                                                                                   
6	Awarded                                                                                                                                                                                                                                                        
7	End of Case                                                                                                                                                                                                                                                    
4	Decision (Accept/Reject)                                                                                                                                                                                                                                       
\.


--
-- Name: event_types_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('event_types_id_seq', 7, true);


--
-- Data for Name: events; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

COPY events (event_id, response, extra_information, parcel_id, date, type, price) FROM stdin;
1	\N		1	1969-11-14	1	9100
2	\N		1	1969-09-22	2	9100
3	\N		1	1968-08-06	3	8200
4	\N		1	1967-01-14	3	9100
5	\N		1	1965-09-15	3	7050
6	accept                                                                                                                                                                                                                                                         		1	1969-09-22	4	9100
7	\N		1	1969-11-14	7	9100
8	\N		4714	1971-11-29	1	4950
9	\N	Because of defective title, the property was condemned in order to secure legal title	4714	1968-12-16	2	4500
10	complicated                                                                                                                                                                                                                                                    	Because of defective title, it''s been complicated	4714	1968-12-16	4	4500
11	\N		4714	1971-11-29	2	4950
12	accept                                                                                                                                                                                                                                                         		4714	1971-11-29	4	4950
13	\N		4714	1971-11-29	6	4950
14	\N		4714	1968-09-18	3	3900
15	\N		4714	1967-01-10	3	4500
16	\N		4714	1965-09-15	3	2300
17	\N		4714	1971-11-29	7	0
18	\N		4715	1966-06-20	3	4100
19	\N		4715	1968-05-24	3	5000
20	\N		4715	1967-01-03	3	5000
21	\N	Deed transfer between previous owners	4715	1965-03-05	1	0
22	\N		4715	1970-05-08	1	5000
23	\N		4715	1970-04-17	2	5000
24	accept                                                                                                                                                                                                                                                         		4715	1970-04-17	4	5000
25	\N	Total of 2559.76$ awarded to the owner after deductions like revenue stamps, delinquent taxes, deed of trust	4715	1970-05-08	7	2560
26	\N		4716	1966-06-20	3	9650
27	\N		4716	1968-05-21	3	10200
28	\N		4716	1968-05-07	3	10000
29	\N		4716	1968-09-24	2	10200
30	accept                                                                                                                                                                                                                                                         		4716	1968-09-24	4	10200
31	\N	Deed transfer between previous owners	4716	1967-11-22	1	0
32	\N		4716	1968-10-03	1	10200
33	\N	After acquiring the property from Cornelia Loga, HACA rented the property again to Hugh Lasseter for a whopping rent of 100$ per month which was $1.00 per month before acquisition	4716	1968-11-27	5	100
34	\N	Offered amount 10,200$  - (Taxes, revenue stamps, deed of trust) = 8969$	4716	1968-10-03	7	8969
35	\N		9429	1968-05-23	3	6500
36	\N		9429	1965-09-15	3	4625
37	\N		9429	1969-01-03	3	7300
38	\N		9429	1969-10-23	1	7300
39	\N	Offer made $7300 - (taxes and deed charges) = $7232	9429	1969-10-23	7	7232
40	\N		9429	1969-10-09	2	7300
41	accept                                                                                                                                                                                                                                                         		9429	1969-10-09	4	7300
42	\N		9429	1969-10-09	6	7300
43	\N		9429	\N	\N	0
44	\N		9430	1965-09-15	3	5200
45	\N	New Owner	9430	1968-07-16	3	6000
46	\N	Different Owner	9430	1968-05-07	3	3500
47	\N	Deed transferred on behalf of Trans World Acceptance Corporation	9430	1969-04-15	1	5200
48	\N	Deed transfer from Trustee	9430	1967-02-14	1	0
49	\N	Advanced amount of 54$ by Redmond & Stevens Attorneys	9430	1969-04-11	7	5254
50	\N	Possible conflict of property ownership but offer was accepted by Charles McBryson	9430	1968-10-07	2	5200
51	accept                                                                                                                                                                                                                                                         		9430	1968-10-07	4	5200
52	\N		9430	\N	\N	0
53	\N		9431	1965-09-15	3	200
54	\N		9431	1967-01-03	3	700
55	\N		9431	1968-05-28	3	850
56	\N		9431	1970-12-01	1	800
57	\N	This case went to hearing and was awarded 800$ plus interest.	9431	1970-11-25	2	800
58	accept                                                                                                                                                                                                                                                         		9431	1970-11-25	4	800
59	\N	Deed transfer between previous owners before acquisition. Registered date: 06-09-1928	9431	1960-01-01	1	0
60	\N	Awarded this amount at the Commissioners Hearing	9431	1970-11-06	6	811
61	\N		9431	1970-12-01	7	811
62	\N	Owner asked to pay this rent per month after acquisition	9432	1969-04-15	5	20
63	\N	Deed transfer before acquisition. Registered date: 09-19-1947	9433	1960-01-01	1	0
64	\N		9434	1965-09-15	3	5450
65	\N		9434	1968-05-14	3	6000
66	\N		9434	1968-05-30	3	10500
67	\N		9434	1969-03-07	1	8500
68	\N	Deed transfer prior to acquisition	9434	1963-11-16	1	0
69	\N	Offer made $8500 - (taxes + stamp duty) = $8475	9434	1969-03-07	7	8475
70	\N		9434	1968-12-27	2	8500
71	accept                                                                                                                                                                                                                                                         		9434	1968-12-27	4	8500
72	\N	Tenant occupying 102 - 104 Livingston St was asked to pay 50$ per month by HACA after acquisition	9434	1969-04-17	5	50
73	\N	Appraiser mentions owner as City of Asheville	9435	1967-01-03	3	450
74	\N		9435	1968-05-22	3	350
75	\N		9435	1965-09-15	3	350
76	\N	Deed transfer prior to acquisition. Registered date: 12-08-1927	9435	1960-01-01	1	0
77	\N		9435	1973-04-06	2	350
78	accept                                                                                                                                                                                                                                                         		9435	1973-04-06	4	0
79	\N	As the property had many heirs leading to a title problem, the property was sent to hearing after it was acquired by HACA to get a clean title. No changes in the awarded price.	9435	1973-05-03	7	350
80	\N		9435	1973-04-11	1	350
81	\N	Amount awarded at Commissioner''s hearing	9435	1973-03-30	6	350
82	\N		9436	1968-05-24	3	550
83	\N		9436	1967-01-03	3	450
84	\N		9436	1965-09-15	3	450
85	\N		9436	1969-10-23	2	450
86	accept                                                                                                                                                                                                                                                         		9436	1969-10-23	4	450
87	\N	Deed transfer prior to acquisition. Registered date: 05-18-1951	9436	1960-01-01	1	0
88	\N	Offer made $450 - (taxes+stamp duty) = $388	9436	1970-01-06	7	388
89	\N	Deed transferred from 2 ownerships	9436	1970-01-06	1	450
90	\N		9437	1965-09-15	3	7950
91	\N		9437	1967-01-12	3	9600
92	\N		9437	1968-05-22	3	9500
93	\N		9437	1963-02-01	1	0
94	\N		9437	1969-09-16	2	9600
95	accept                                                                                                                                                                                                                                                         		9437	1969-09-16	4	9600
96	\N	offer made $9600 - (taxes + stamp duty) = $9590	9437	1970-01-23	7	9590
97	\N		9437	1970-02-06	1	9600
98	\N		9438	1969-02-13	1	16000
99	\N		9438	1968-12-21	2	16000
100	\N		9438	1968-08-03	3	15000
101	\N		9438	1968-08-07	3	16000
102	\N		9438	1965-09-15	3	15350
103	accept                                                                                                                                                                                                                                                         		9438	1968-12-27	4	16000
104	\N		9438	1969-05-22	5	20
105	\N		9438	1969-05-22	5	15
106	\N		9438	1969-05-22	5	20
107	\N		9438	1969-05-22	5	30
108	\N		9438	1969-05-22	5	25
109	\N		9438	1969-05-22	5	25
110	\N		9438	\N	5	0
111	\N		9439	1973-06-05	1	600
112	\N		9439	1968-09-24	2	500
113	reject                                                                                                                                                                                                                                                         		9439	1969-08-21	4	500
114	\N		9439	1973-05-26	2	600
115	reject                                                                                                                                                                                                                                                         		9439	1973-05-31	4	600
116	\N		9439	1968-07-25	3	500
117	\N		9439	1966-11-04	3	500
118	\N		9439	1966-06-20	3	375
119	\N		9439	1972-05-31	6	600
120	\N		9439	1973-06-05	7	600
121	\N		9440	1972-10-04	1	1661
122	\N		9440	1968-09-24	2	1500
123	reject                                                                                                                                                                                                                                                         		9440	1971-12-09	4	1500
124	\N		9440	1972-09-29	2	1661
125	accept                                                                                                                                                                                                                                                         		9440	1972-10-04	4	1661
126	\N		9440	1968-07-25	3	1500
127	\N		9440	1966-11-04	3	1000
128	\N		9440	1966-06-20	3	700
129	\N		9440	1972-09-29	6	1661
130	\N		9440	1972-10-04	7	1661
131	\N		9441	1968-11-25	1	8300
132	\N		9441	1968-10-05	2	8300
133	accept                                                                                                                                                                                                                                                         		9441	1968-10-07	4	8300
134	\N		14148	1965-09-15	3	5800
135	\N		14148	1968-05-22	3	7000
136	\N		14148	1968-07-22	3	8500
137	\N	Tenant asked to pay 15$ per month after acquisition. HACA originally asked to pay  25$ per month but relocation director took into consideration that the tenant earned limited income and reduced rent to 15$.	14148	1969-06-02	5	15
138	\N	Tenant asked to pay 30$ per month after acquisition. HACA originally asked to pay 40$ per month but relocation director took into consideration that the tenant earned limited income and had a mentally retarded husband to take care so reduced rent to 30$.	14148	1969-05-27	5	30
139	\N		14148	1969-04-22	1	8500
140	\N	Offer made $8500 - (taxes + stamp duty) = $8466	14148	1969-04-10	7	8466
141	\N		14148	1964-12-18	1	2695
142	\N		14148	1969-01-22	2	8500
143	accept                                                                                                                                                                                                                                                         		14148	1969-01-22	4	8500
144	\N		14149	1965-09-15	3	575
145	\N		14149	1968-05-22	3	750
146	\N		14149	1967-01-03	3	600
147	\N		14149	1968-10-09	2	600
148	accept                                                                                                                                                                                                                                                         		14149	1968-10-15	4	600
149	\N	Deed transfer prior to acquisition	14149	1961-10-11	1	310
150	\N	Offer made $600 - (taxes + stamp duty + deed of trust towards Joseph C Reynolds Trustee for Bruce AZ Elmore) = $91.03	14149	1968-11-11	7	91
151	\N		14149	1968-11-11	1	600
152	\N		14150	1965-09-15	3	4825
153	\N		14150	1967-01-03	3	7000
154	\N		14150	1968-05-22	3	5000
155	\N		14150	1968-10-09	2	5500
156	accept                                                                                                                                                                                                                                                         		14150	1968-10-15	4	5500
157	\N	Transfer of Deed by virtue of inheritance due to deceased mother to heir	14150	1964-06-28	1	2053
158	\N	Offer made $5500 - (taxes + stamp duty + Bruce Elmore Trustee of Northwestern Bank) = $4012	14150	1968-11-04	7	4012
159	\N		14150	1968-11-04	1	5500
160	\N		14151	1965-09-15	3	5550
161	\N		14151	1966-12-30	3	7800
162	\N		14151	1968-05-22	3	6500
163	\N		14151	1968-10-28	2	7000
164	accept                                                                                                                                                                                                                                                         		14151	1968-10-28	4	7000
165	\N	Offer made $7000 - (taxes + stamp duty + First Union National Trustee $973) = $6013	14151	1969-01-10	7	6013
166	\N	Previous deed transfer. Registered date: 06/22/1951	14151	1960-01-01	1	1830
167	\N		14151	1969-01-10	1	7000
168	\N	Based on Income approximated to 140 per month	14151	1969-02-12	5	20
\.


--
-- Data for Name: owners; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

COPY owners (owner_id, owner_name, pass_away_date, is_heir) FROM stdin;
1	Willie A. Glenn                                                                                                                                                                                                                                                	\N	N    
2	Bessie Kalogerkais                                                                                                                                                                                                                                             	\N	N    
\.


--
-- Data for Name: parcel_owner_assoc; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

COPY parcel_owner_assoc (id, parcel_id, owner_id, puchase_prices, loan_price, deed_transfer_date) FROM stdin;
1	1	1	$11,000.00	\N	1947-01-03
3	3	3	$8,500.00	\N	1945-08-31
\.


--
-- Name: parcel_owner_assoc_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('parcel_owner_assoc_id_seq', 1, false);


--
-- Data for Name: parcels; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

COPY parcels (parcel_id, block_no, parcel_no, ward_no, land_use) FROM stdin;
1	3	1	4	commercial                                                      
4714	3	10	4	residential                                                     
4715	55	1	4	residential                                                     
4716	55	2	4	residential                                                     
9439	53	2	4	residential                                                     
14148	55	10	4	residential                                                     
9440	53	3	4	residential                                                     
14149	55	11	4	residential                                                     
9441	53	4	4	residential                                                     
14150	55	12	4	residential                                                     
14151	55	13	4	residential                                                     
9429	55	3	4	residential                                                     
9430	55	4	4	residential                                                     
9431	55	5	4	residential                                                     
9432	55	4	4	residential                                                     
9433	55	3	4	residential                                                     
9434	55	6	4	Boarding house and Store                                        
9435	55	7	4	residential                                                     
9436	55	8	4	residential                                                     
9437	55	9	4	residential                                                     
9438	53	1	4	residential                                                     
\.


--
-- Data for Name: parcels_old; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

COPY parcels_old (parcel_id, concurred_price, date_concurred, date_title_search, date_offer_made, date_offer_accepted, date_condemn_approval, date_assignedto_attornery, date_petition_filed, date_commis_hearing, date_order_vesting_title, date_final_title_certi, block_no, parcel_no, ward_no, special_proceeding_no, date_assigned_for_demolition, date_removed, address) FROM stdin;
1	$11,000.00	1969-03-07	1969-11-24	1969-10-22	\N	\N	\N	\N	\N	1971-11-23	1971-11-23	1	51	4	\N	1971-11-23	1972-07-17	\N
2	$15,000.00	1969-03-07	1969-09-28	1969-08-06	\N	1970-12-31	\N	1971-07-15	1971-06-09	1971-06-16	1971-06-17	1	3	4	\N	\N	\N	\N
\.


--
-- Name: parcels_parcel_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('parcels_parcel_id_seq', 14151, true);


--
-- Data for Name: people; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

COPY people (person_id, name) FROM stdin;
1	Hayward Powers                                                                                                                                                                                                                                                 
2	Redevelopment Commission of the City                                                                                                                                                                                                                           
3	Wilbur King                                                                                                                                                                                                                                                    
4	H. E. Johnson                                                                                                                                                                                                                                                  
5	William Duckworth Jr.                                                                                                                                                                                                                                          
6	Charles Bradshaw                                                                                                                                                                                                                                               
7	Jane Powers                                                                                                                                                                                                                                                    
8	Walter?                                                                                                                                                                                                                                                        
9	Virginia Y. Michal                                                                                                                                                                                                                                             
10	James Weston Michal                                                                                                                                                                                                                                            
11	Alan Butterworth                                                                                                                                                                                                                                               
12	                                                                                                                                                                                                                                                               
13	Francis Haeger                                                                                                                                                                                                                                                 
14	Estelle B Smith                                                                                                                                                                                                                                                
15	Fred Barnetter                                                                                                                                                                                                                                                 
16	                                                                                                                                                                                                                                                               
17	Fred Barnette                                                                                                                                                                                                                                                  
18	Cornelia Logan                                                                                                                                                                                                                                                 
19	Hugh Lasseter                                                                                                                                                                                                                                                  
20	Leonard Cook                                                                                                                                                                                                                                                   
21	                                                                                                                                                                                                                                                               
22	William Lee Hamilton                                                                                                                                                                                                                                           
23	Charles McBryson                                                                                                                                                                                                                                               
24	Modern Homes Construction Company                                                                                                                                                                                                                              
25	Trans World Acceptance Corporation                                                                                                                                                                                                                             
26	Wayne Brendle                                                                                                                                                                                                                                                  
27	                                                                                                                                                                                                                                                               
28	Althea Gaither Tilson                                                                                                                                                                                                                                          
29	Superior Court                                                                                                                                                                                                                                                 
30	Ruth Wilson                                                                                                                                                                                                                                                    
31	Hearing Commissioner                                                                                                                                                                                                                                           
32	Luther Finger                                                                                                                                                                                                                                                  
33	Greer Johnson                                                                                                                                                                                                                                                  
34	Eleanor L Johnson                                                                                                                                                                                                                                              
35	John H Thonmpson                                                                                                                                                                                                                                               
36	Henry A Howard                                                                                                                                                                                                                                                 
37	City of Asheville                                                                                                                                                                                                                                              
38	William P Gaither                                                                                                                                                                                                                                              
39	William Gaither                                                                                                                                                                                                                                                
40	Lonza Norman                                                                                                                                                                                                                                                   
41	Flora M Norman                                                                                                                                                                                                                                                 
42	Idellar Kennedy                                                                                                                                                                                                                                                
43	TrueHart Kennedy                                                                                                                                                                                                                                               
44	New Mt Olive Baptist Church                                                                                                                                                                                                                                    
45	New Mt Oliver Baptist church                                                                                                                                                                                                                                   
46	New Mt Oliver Baptist Church                                                                                                                                                                                                                                   
47	George Pennell                                                                                                                                                                                                                                                 
48	Trustees of New Mt Oliver Baptist Church                                                                                                                                                                                                                       
49	Robert Foster                                                                                                                                                                                                                                                  
50	Bruce T Pagan                                                                                                                                                                                                                                                  
51	Clarence Williams                                                                                                                                                                                                                                              
52	Dewey Hanks                                                                                                                                                                                                                                                    
53	McKinley Ellis                                                                                                                                                                                                                                                 
54	Sallie Argintar                                                                                                                                                                                                                                                
55	                                                                                                                                                                                                                                                               
56	James Harris                                                                                                                                                                                                                                                   
57	Emma Orr                                                                                                                                                                                                                                                       
58	Addie Ballenger                                                                                                                                                                                                                                                
59	Charles Green                                                                                                                                                                                                                                                  
60	Ernest Jackson                                                                                                                                                                                                                                                 
61	Lenedith Logan                                                                                                                                                                                                                                                 
62	Herbert Robinson                                                                                                                                                                                                                                               
63	Vera E Harris                                                                                                                                                                                                                                                  
64	Vera E. Harris                                                                                                                                                                                                                                                 
65	Vera E Harris                                                                                                                                                                                                                                                  
66	                                                                                                                                                                                                                                                               
67	Irwin Monk                                                                                                                                                                                                                                                     
68	Fred Monk                                                                                                                                                                                                                                                      
69	Fred Monk                                                                                                                                                                                                                                                      
70	Irwin Monk                                                                                                                                                                                                                                                     
71	Irwin Fred                                                                                                                                                                                                                                                     
72	Irwin Fred                                                                                                                                                                                                                                                     
73	Edward Rogers                                                                                                                                                                                                                                                  
74	Sadie Rogers                                                                                                                                                                                                                                                   
75	Eula C Moore                                                                                                                                                                                                                                                   
76	Pearl Marshall                                                                                                                                                                                                                                                 
77	Don C Young                                                                                                                                                                                                                                                    
78	A. C. Graver                                                                                                                                                                                                                                                   
79	William Howard McAvoy                                                                                                                                                                                                                                          
80	Pearl McAvoy                                                                                                                                                                                                                                                   
81	Don C young                                                                                                                                                                                                                                                    
82	Raymond M Bland                                                                                                                                                                                                                                                
83	Louis Bland                                                                                                                                                                                                                                                    
84	John L Bland                                                                                                                                                                                                                                                   
85	Belvie Bland                                                                                                                                                                                                                                                   
86	Louise Bland                                                                                                                                                                                                                                                   
87	Joseph C Reynolds                                                                                                                                                                                                                                              
88	Artie Jones                                                                                                                                                                                                                                                    
89	Celester Jones                                                                                                                                                                                                                                                 
90	Elijah Ulyses Jones                                                                                                                                                                                                                                            
91	Gladys Jones                                                                                                                                                                                                                                                   
92	                                                                                                                                                                                                                                                               
\.


--
-- Name: people_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('people_id_seq', 92, true);


--
-- Data for Name: property_photos ; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

COPY "property_photos " (id, property_id, path) FROM stdin;
\.


--
-- Data for Name: tenants; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

COPY tenants (tenant_id, tenant_name, date_vacated, rent_per_month, rent_refund, rent_address, building_id) FROM stdin;
1	Willie A. Glenn                                                                                                                                                                                                                                                	\N	$100.00	$13,200.00	231 Coxe Avenue                                                                                                                                                                                                                                                	1
\.


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
-- PostgreSQL database dump complete
--

