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

SELECT pg_catalog.setval('"Event_id_seq"', 1, false);


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



--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('addresses_id_seq', 1, false);


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



--
-- Name: event_people_assoc_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('event_people_assoc_id_seq', 1, false);


--
-- Data for Name: event_types; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

INSERT INTO event_types VALUES (1, 'Transfer of Deed                                                                                                                                                                                                                                               ');
INSERT INTO event_types VALUES (2, 'Offer Made                                                                                                                                                                                                                                                     ');
INSERT INTO event_types VALUES (3, 'Appraisal                                                                                                                                                                                                                                                      ');
INSERT INTO event_types VALUES (4, 'Offer Accepted                                                                                                                                                                                                                                                 ');
INSERT INTO event_types VALUES (5, 'Tenant Moved                                                                                                                                                                                                                                                   ');
INSERT INTO event_types VALUES (6, 'Awarded                                                                                                                                                                                                                                                        ');
INSERT INTO event_types VALUES (7, 'End of Case                                                                                                                                                                                                                                                    ');


--
-- Name: event_types_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('event_types_id_seq', 7, true);


--
-- Data for Name: events; Type: TABLE DATA; Schema: humanface; Owner: postgres
--



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



--
-- Data for Name: parcels_old; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

INSERT INTO parcels_old VALUES (1, '$11,000.00', '1969-03-07', '1969-11-24', '1969-10-22', NULL, NULL, NULL, NULL, NULL, '1971-11-23', '1971-11-23', 1, 51, 4, NULL, '1971-11-23', '1972-07-17', NULL);
INSERT INTO parcels_old VALUES (2, '$15,000.00', '1969-03-07', '1969-09-28', '1969-08-06', NULL, '1970-12-31', NULL, '1971-07-15', '1971-06-09', '1971-06-16', '1971-06-17', 1, 3, 4, NULL, NULL, NULL, NULL);


--
-- Name: parcels_parcel_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('parcels_parcel_id_seq', 1, false);


--
-- Data for Name: people; Type: TABLE DATA; Schema: humanface; Owner: postgres
--



--
-- Name: people_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('people_id_seq', 1, false);


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
-- PostgreSQL database dump complete
--

