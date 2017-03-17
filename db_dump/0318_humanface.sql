--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = humanface, pg_catalog;

ALTER TABLE ONLY humanface.parcel_owner_assoc DROP CONSTRAINT parcel_owner_assoc_pkey;
ALTER TABLE ONLY humanface.tenants DROP CONSTRAINT "Tenants_pkey";
ALTER TABLE ONLY humanface."property_photos " DROP CONSTRAINT "Property photos _pkey";
ALTER TABLE ONLY humanface.parcels DROP CONSTRAINT "Parcels_pkey";
ALTER TABLE ONLY humanface.owners DROP CONSTRAINT "Owners _pkey";
ALTER TABLE ONLY humanface.buildings DROP CONSTRAINT "Buildings_pkey";
ALTER TABLE ONLY humanface.appraises DROP CONSTRAINT "Appraises_pkey";
ALTER TABLE ONLY humanface.appraisers DROP CONSTRAINT "Appraisers_pkey";
ALTER TABLE humanface.tenants ALTER COLUMN tenant_id DROP DEFAULT;
ALTER TABLE humanface."property_photos " ALTER COLUMN id DROP DEFAULT;
ALTER TABLE humanface.parcels ALTER COLUMN parcel_id DROP DEFAULT;
ALTER TABLE humanface.parcel_owner_assoc ALTER COLUMN id DROP DEFAULT;
ALTER TABLE humanface.owners ALTER COLUMN owner_id DROP DEFAULT;
ALTER TABLE humanface.buildings ALTER COLUMN building_id DROP DEFAULT;
ALTER TABLE humanface.appraises ALTER COLUMN "appraise-id" DROP DEFAULT;
ALTER TABLE humanface.appraisers ALTER COLUMN appraiser_id DROP DEFAULT;
DROP SEQUENCE humanface.parcel_owner_assoc_id_seq;
DROP TABLE humanface.parcel_owner_assoc;
DROP SEQUENCE humanface."Tenants_tenant_id_seq";
DROP TABLE humanface.tenants;
DROP SEQUENCE humanface."Property photos _id_seq";
DROP TABLE humanface."property_photos ";
DROP SEQUENCE humanface."Parcels_parcel_id_seq";
DROP TABLE humanface.parcels;
DROP SEQUENCE humanface."Owners _owner_id_seq";
DROP TABLE humanface.owners;
DROP SEQUENCE humanface."Buildings_building_id_seq";
DROP TABLE humanface.buildings;
DROP SEQUENCE humanface."Appraises_appraise-id_seq";
DROP TABLE humanface.appraises;
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
-- Name: appraisers; Type: TABLE; Schema: humanface; Owner: postgres; Tablespace: 
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
-- Name: appraises; Type: TABLE; Schema: humanface; Owner: postgres; Tablespace: 
--

CREATE TABLE appraises (
    "appraise-id" integer NOT NULL,
    appraiser_id integer,
    parcel_id integer,
    imps_value money,
    area_of_house numeric(50,0),
    land_value money,
    total_value money,
    reproduction_value money
);


ALTER TABLE appraises OWNER TO postgres;

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

ALTER SEQUENCE "Appraises_appraise-id_seq" OWNED BY appraises."appraise-id";


--
-- Name: buildings; Type: TABLE; Schema: humanface; Owner: postgres; Tablespace: 
--

CREATE TABLE buildings (
    building_id integer NOT NULL,
    st_name character(255),
    apt_no integer,
    num_units integer,
    area_of_units numeric,
    use_of_building character(255),
    parcel_id integer,
    number_of_rooms integer
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
-- Name: owners; Type: TABLE; Schema: humanface; Owner: postgres; Tablespace: 
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
-- Name: parcels; Type: TABLE; Schema: humanface; Owner: postgres; Tablespace: 
--

CREATE TABLE parcels (
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
    income money
);


ALTER TABLE parcels OWNER TO postgres;

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

ALTER SEQUENCE "Parcels_parcel_id_seq" OWNED BY parcels.parcel_id;


--
-- Name: property_photos ; Type: TABLE; Schema: humanface; Owner: postgres; Tablespace: 
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
-- Name: tenants; Type: TABLE; Schema: humanface; Owner: postgres; Tablespace: 
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
-- Name: parcel_owner_assoc; Type: TABLE; Schema: humanface; Owner: postgres; Tablespace: 
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
-- Name: appraiser_id; Type: DEFAULT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY appraisers ALTER COLUMN appraiser_id SET DEFAULT nextval('"Appraisers_appraiser_id_seq"'::regclass);


--
-- Name: appraise-id; Type: DEFAULT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY appraises ALTER COLUMN "appraise-id" SET DEFAULT nextval('"Appraises_appraise-id_seq"'::regclass);


--
-- Name: building_id; Type: DEFAULT; Schema: humanface; Owner: postgres
--

ALTER TABLE ONLY buildings ALTER COLUMN building_id SET DEFAULT nextval('"Buildings_building_id_seq"'::regclass);


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

ALTER TABLE ONLY parcels ALTER COLUMN parcel_id SET DEFAULT nextval('"Parcels_parcel_id_seq"'::regclass);


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
-- Data for Name: appraisers; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

INSERT INTO appraisers VALUES (1, 'Alan Butterworth                                                                                                                                                                                                                                               ', 'W. T. Duckworth Company                                                                                                                                                                                                                                        ');
INSERT INTO appraisers VALUES (2, 'H. E. Johnson                                                                                                                                                                                                                                                  ', 'H. E. Johnson                                                                                                                                                                                                                                                  ');
INSERT INTO appraisers VALUES (4, 'Clyde G Idol Jr                                                                                                                                                                                                                                                ', 'Charles W. Bradshaw. Inc                                                                                                                                                                                                                                       ');
INSERT INTO appraisers VALUES (5, 'Alan Butterworth                                                                                                                                                                                                                                               ', 'W. T. Duckworth Company                                                                                                                                                                                                                                        ');
INSERT INTO appraisers VALUES (6, 'H E. Johnson                                                                                                                                                                                                                                                   ', 'H E. Johnson                                                                                                                                                                                                                                                   ');
INSERT INTO appraisers VALUES (3, 'Charles W. Bradshaw                                                                                                                                                                                                                                            ', 'Charles W. Bradshaw. Inc.                                                                                                                                                                                                                                      ');


--
-- Data for Name: appraises; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

INSERT INTO appraises VALUES (1, 1, 1, '$6,400.00', 2500, '$4,000.00', '$10,400.00', '$10,894.00');
INSERT INTO appraises VALUES (5, 5, 2, '$2,800.00', 1420, '$4,200.00', '$7,000.00', '$11,766.00');
INSERT INTO appraises VALUES (6, 6, 2, '$4,100.00', 1420, '$5,100.00', '$9,300.00', '$13,817.00');
INSERT INTO appraises VALUES (4, 4, 2, '$2,050.00', 1420, '$4,200.00', '$6,250.00', '$15,440.00');
INSERT INTO appraises VALUES (3, 3, 1, NULL, 2500, NULL, NULL, '$9,135.00');
INSERT INTO appraises VALUES (2, 2, 1, '$4,800.00', 2500, NULL, '$110,000.00', NULL);


--
-- Data for Name: buildings; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

INSERT INTO buildings VALUES (1, 'Coxe Avenue                                                                                                                                                                                                                                                    ', 51, 1, 2500, 'commerical                                                                                                                                                                                                                                                     ', 1, 1);
INSERT INTO buildings VALUES (2, '                                                                                                                                                                                                                                                               ', 2, 1, 1420, 'commerical                                                                                                                                                                                                                                                     ', 2, 4);


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

INSERT INTO parcels VALUES (1, '$11,000.00', '1969-03-07', '1969-11-24', '1969-10-22', NULL, NULL, NULL, NULL, NULL, '1971-11-23', '1971-11-23', 1, 51, 4, NULL, '1971-11-23', '1972-07-17', '$10,800.00');
INSERT INTO parcels VALUES (2, '$15,000.00', '1969-03-07', '1969-09-28', '1969-08-06', NULL, '1970-12-31', NULL, '1971-07-15', '1971-06-09', '1971-06-16', '1971-06-17', 1, 3, 4, NULL, NULL, NULL, NULL);


--
-- Data for Name: property_photos ; Type: TABLE DATA; Schema: humanface; Owner: postgres
--



--
-- Data for Name: tenants; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

INSERT INTO tenants VALUES (1, 'Willie A. Glenn                                                                                                                                                                                                                                                ', NULL, '$100.00', '$13,200.00', '231 Coxe Avenue                                                                                                                                                                                                                                                ', 1);


--
-- Name: Appraisers_pkey; Type: CONSTRAINT; Schema: humanface; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY appraisers
    ADD CONSTRAINT "Appraisers_pkey" PRIMARY KEY (appraiser_id);


--
-- Name: Appraises_pkey; Type: CONSTRAINT; Schema: humanface; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY appraises
    ADD CONSTRAINT "Appraises_pkey" PRIMARY KEY ("appraise-id");


--
-- Name: Buildings_pkey; Type: CONSTRAINT; Schema: humanface; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY buildings
    ADD CONSTRAINT "Buildings_pkey" PRIMARY KEY (building_id);


--
-- Name: Owners _pkey; Type: CONSTRAINT; Schema: humanface; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY owners
    ADD CONSTRAINT "Owners _pkey" PRIMARY KEY (owner_id);


--
-- Name: Parcels_pkey; Type: CONSTRAINT; Schema: humanface; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY parcels
    ADD CONSTRAINT "Parcels_pkey" PRIMARY KEY (parcel_id);


--
-- Name: Property photos _pkey; Type: CONSTRAINT; Schema: humanface; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "property_photos "
    ADD CONSTRAINT "Property photos _pkey" PRIMARY KEY (id);


--
-- Name: Tenants_pkey; Type: CONSTRAINT; Schema: humanface; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tenants
    ADD CONSTRAINT "Tenants_pkey" PRIMARY KEY (tenant_id);


--
-- Name: parcel_owner_assoc_pkey; Type: CONSTRAINT; Schema: humanface; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY parcel_owner_assoc
    ADD CONSTRAINT parcel_owner_assoc_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

