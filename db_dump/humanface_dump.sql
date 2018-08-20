--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: humanface; Type: SCHEMA; Schema: -; Owner: humanface
--

CREATE SCHEMA humanface;


ALTER SCHEMA humanface OWNER TO humanface;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: appraisers; Type: TABLE; Schema: humanface; Owner: humanface; Tablespace: 
--

CREATE TABLE humanface.appraisers (
    appraiser_id integer NOT NULL,
    appraiser_name character(255),
    company_name character(255)
);


ALTER TABLE humanface.appraisers OWNER TO humanface;

--
-- Name: Appraisers_appraiser_id_seq; Type: SEQUENCE; Schema: humanface; Owner: humanface
--

CREATE SEQUENCE humanface."Appraisers_appraiser_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE humanface."Appraisers_appraiser_id_seq" OWNER TO humanface;

--
-- Name: Appraisers_appraiser_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: humanface
--

ALTER SEQUENCE humanface."Appraisers_appraiser_id_seq" OWNED BY humanface.appraisers.appraiser_id;


--
-- Name: appraisals; Type: TABLE; Schema: humanface; Owner: humanface; Tablespace: 
--

CREATE TABLE humanface.appraisals (
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


ALTER TABLE humanface.appraisals OWNER TO humanface;

--
-- Name: Appraises_appraise-id_seq; Type: SEQUENCE; Schema: humanface; Owner: humanface
--

CREATE SEQUENCE humanface."Appraises_appraise-id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE humanface."Appraises_appraise-id_seq" OWNER TO humanface;

--
-- Name: Appraises_appraise-id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: humanface
--

ALTER SEQUENCE humanface."Appraises_appraise-id_seq" OWNED BY humanface.appraisals."appraisal-id";


--
-- Name: buildings; Type: TABLE; Schema: humanface; Owner: humanface; Tablespace: 
--

CREATE TABLE humanface.buildings (
    building_id integer NOT NULL,
    st_name character(255),
    apt_no integer,
    area_of_units numeric,
    use_of_building character(255),
    parcel_id integer,
    number_of_rooms integer,
    address character(255)
);


ALTER TABLE humanface.buildings OWNER TO humanface;

--
-- Name: Buildings_building_id_seq; Type: SEQUENCE; Schema: humanface; Owner: humanface
--

CREATE SEQUENCE humanface."Buildings_building_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE humanface."Buildings_building_id_seq" OWNER TO humanface;

--
-- Name: Buildings_building_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: humanface
--

ALTER SEQUENCE humanface."Buildings_building_id_seq" OWNED BY humanface.buildings.building_id;


--
-- Name: events; Type: TABLE; Schema: humanface; Owner: humanface; Tablespace: 
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


ALTER TABLE humanface.events OWNER TO humanface;

--
-- Name: Event_id_seq; Type: SEQUENCE; Schema: humanface; Owner: humanface
--

CREATE SEQUENCE humanface."Event_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE humanface."Event_id_seq" OWNER TO humanface;

--
-- Name: Event_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: humanface
--

ALTER SEQUENCE humanface."Event_id_seq" OWNED BY humanface.events.event_id;


--
-- Name: owners; Type: TABLE; Schema: humanface; Owner: humanface; Tablespace: 
--

CREATE TABLE humanface.owners (
    owner_id integer NOT NULL,
    owner_name character(255),
    pass_away_date date,
    is_heir character(5)
);


ALTER TABLE humanface.owners OWNER TO humanface;

--
-- Name: Owners _owner_id_seq; Type: SEQUENCE; Schema: humanface; Owner: humanface
--

CREATE SEQUENCE humanface."Owners _owner_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE humanface."Owners _owner_id_seq" OWNER TO humanface;

--
-- Name: Owners _owner_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: humanface
--

ALTER SEQUENCE humanface."Owners _owner_id_seq" OWNED BY humanface.owners.owner_id;


--
-- Name: parcels_old; Type: TABLE; Schema: humanface; Owner: humanface; Tablespace: 
--

CREATE TABLE humanface.parcels_old (
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


ALTER TABLE humanface.parcels_old OWNER TO humanface;

--
-- Name: Parcels_parcel_id_seq; Type: SEQUENCE; Schema: humanface; Owner: humanface
--

CREATE SEQUENCE humanface."Parcels_parcel_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE humanface."Parcels_parcel_id_seq" OWNER TO humanface;

--
-- Name: Parcels_parcel_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: humanface
--

ALTER SEQUENCE humanface."Parcels_parcel_id_seq" OWNED BY humanface.parcels_old.parcel_id;


--
-- Name: property_photos ; Type: TABLE; Schema: humanface; Owner: humanface; Tablespace: 
--

CREATE TABLE humanface."property_photos " (
    id integer NOT NULL,
    property_id integer,
    path character(255)
);


ALTER TABLE humanface."property_photos " OWNER TO humanface;

--
-- Name: Property photos _id_seq; Type: SEQUENCE; Schema: humanface; Owner: humanface
--

CREATE SEQUENCE humanface."Property photos _id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE humanface."Property photos _id_seq" OWNER TO humanface;

--
-- Name: Property photos _id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: humanface
--

ALTER SEQUENCE humanface."Property photos _id_seq" OWNED BY humanface."property_photos ".id;


--
-- Name: tenants; Type: TABLE; Schema: humanface; Owner: humanface; Tablespace: 
--

CREATE TABLE humanface.tenants (
    tenant_id integer NOT NULL,
    tenant_name character(255),
    date_vacated date,
    rent_per_month money,
    rent_refund money,
    rent_address character(255),
    building_id integer
);


ALTER TABLE humanface.tenants OWNER TO humanface;

--
-- Name: Tenants_tenant_id_seq; Type: SEQUENCE; Schema: humanface; Owner: humanface
--

CREATE SEQUENCE humanface."Tenants_tenant_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE humanface."Tenants_tenant_id_seq" OWNER TO humanface;

--
-- Name: Tenants_tenant_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: humanface
--

ALTER SEQUENCE humanface."Tenants_tenant_id_seq" OWNED BY humanface.tenants.tenant_id;


--
-- Name: addresses; Type: TABLE; Schema: humanface; Owner: humanface; Tablespace: 
--

CREATE TABLE humanface.addresses (
    id integer NOT NULL,
    st_num character(64),
    st_name character(255),
    parcel_id integer
);


ALTER TABLE humanface.addresses OWNER TO humanface;

--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: humanface; Owner: humanface
--

CREATE SEQUENCE humanface.addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE humanface.addresses_id_seq OWNER TO humanface;

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: humanface
--

ALTER SEQUENCE humanface.addresses_id_seq OWNED BY humanface.addresses.id;


--
-- Name: event_people_assoc; Type: TABLE; Schema: humanface; Owner: humanface; Tablespace: 
--

CREATE TABLE humanface.event_people_assoc (
    id integer NOT NULL,
    event_id integer,
    person_id integer,
    role character(64)
);


ALTER TABLE humanface.event_people_assoc OWNER TO humanface;

--
-- Name: event_people_assoc_id_seq; Type: SEQUENCE; Schema: humanface; Owner: humanface
--

CREATE SEQUENCE humanface.event_people_assoc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE humanface.event_people_assoc_id_seq OWNER TO humanface;

--
-- Name: event_people_assoc_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: humanface
--

ALTER SEQUENCE humanface.event_people_assoc_id_seq OWNED BY humanface.event_people_assoc.id;


--
-- Name: event_types; Type: TABLE; Schema: humanface; Owner: humanface; Tablespace: 
--

CREATE TABLE humanface.event_types (
    id integer NOT NULL,
    type character(255) NOT NULL
);


ALTER TABLE humanface.event_types OWNER TO humanface;

--
-- Name: event_types_id_seq; Type: SEQUENCE; Schema: humanface; Owner: humanface
--

CREATE SEQUENCE humanface.event_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE humanface.event_types_id_seq OWNER TO humanface;

--
-- Name: event_types_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: humanface
--

ALTER SEQUENCE humanface.event_types_id_seq OWNED BY humanface.event_types.id;


--
-- Name: image_paths; Type: TABLE; Schema: humanface; Owner: humanface; Tablespace: 
--

CREATE TABLE humanface.image_paths (
    image_id integer NOT NULL,
    img_path character varying,
    parcel_id integer
);


ALTER TABLE humanface.image_paths OWNER TO humanface;

--
-- Name: image_paths_image_id_seq; Type: SEQUENCE; Schema: humanface; Owner: humanface
--

CREATE SEQUENCE humanface.image_paths_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE humanface.image_paths_image_id_seq OWNER TO humanface;

--
-- Name: image_paths_image_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: humanface
--

ALTER SEQUENCE humanface.image_paths_image_id_seq OWNED BY humanface.image_paths.image_id;


--
-- Name: parcel_owner_assoc; Type: TABLE; Schema: humanface; Owner: humanface; Tablespace: 
--

CREATE TABLE humanface.parcel_owner_assoc (
    id integer NOT NULL,
    parcel_id integer,
    owner_id integer,
    puchase_prices money,
    loan_price money,
    deed_transfer_date date
);


ALTER TABLE humanface.parcel_owner_assoc OWNER TO humanface;

--
-- Name: parcel_owner_assoc_id_seq; Type: SEQUENCE; Schema: humanface; Owner: humanface
--

CREATE SEQUENCE humanface.parcel_owner_assoc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE humanface.parcel_owner_assoc_id_seq OWNER TO humanface;

--
-- Name: parcel_owner_assoc_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: humanface
--

ALTER SEQUENCE humanface.parcel_owner_assoc_id_seq OWNED BY humanface.parcel_owner_assoc.id;


--
-- Name: parcels; Type: TABLE; Schema: humanface; Owner: humanface; Tablespace: 
--

CREATE TABLE humanface.parcels (
    parcel_id integer NOT NULL,
    block_no integer NOT NULL,
    parcel_no integer NOT NULL,
    ward_no integer,
    land_use character(64)
);


ALTER TABLE humanface.parcels OWNER TO humanface;

--
-- Name: parcels_parcel_id_seq; Type: SEQUENCE; Schema: humanface; Owner: humanface
--

CREATE SEQUENCE humanface.parcels_parcel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE humanface.parcels_parcel_id_seq OWNER TO humanface;

--
-- Name: parcels_parcel_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: humanface
--

ALTER SEQUENCE humanface.parcels_parcel_id_seq OWNED BY humanface.parcels.parcel_id;


--
-- Name: people; Type: TABLE; Schema: humanface; Owner: humanface; Tablespace: 
--

CREATE TABLE humanface.people (
    person_id integer NOT NULL,
    name character(255)
);


ALTER TABLE humanface.people OWNER TO humanface;

--
-- Name: people_id_seq; Type: SEQUENCE; Schema: humanface; Owner: humanface
--

CREATE SEQUENCE humanface.people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE humanface.people_id_seq OWNER TO humanface;

--
-- Name: people_id_seq; Type: SEQUENCE OWNED BY; Schema: humanface; Owner: humanface
--

ALTER SEQUENCE humanface.people_id_seq OWNED BY humanface.people.person_id;


--
-- Name: id; Type: DEFAULT; Schema: humanface; Owner: humanface
--

ALTER TABLE ONLY humanface.addresses ALTER COLUMN id SET DEFAULT nextval('humanface.addresses_id_seq'::regclass);


--
-- Name: appraisal-id; Type: DEFAULT; Schema: humanface; Owner: humanface
--

ALTER TABLE ONLY humanface.appraisals ALTER COLUMN "appraisal-id" SET DEFAULT nextval('humanface."Appraises_appraise-id_seq"'::regclass);


--
-- Name: appraiser_id; Type: DEFAULT; Schema: humanface; Owner: humanface
--

ALTER TABLE ONLY humanface.appraisers ALTER COLUMN appraiser_id SET DEFAULT nextval('humanface."Appraisers_appraiser_id_seq"'::regclass);


--
-- Name: building_id; Type: DEFAULT; Schema: humanface; Owner: humanface
--

ALTER TABLE ONLY humanface.buildings ALTER COLUMN building_id SET DEFAULT nextval('humanface."Buildings_building_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: humanface; Owner: humanface
--

ALTER TABLE ONLY humanface.event_people_assoc ALTER COLUMN id SET DEFAULT nextval('humanface.event_people_assoc_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: humanface; Owner: humanface
--

ALTER TABLE ONLY humanface.event_types ALTER COLUMN id SET DEFAULT nextval('humanface.event_types_id_seq'::regclass);


--
-- Name: event_id; Type: DEFAULT; Schema: humanface; Owner: humanface
--

ALTER TABLE ONLY humanface.events ALTER COLUMN event_id SET DEFAULT nextval('humanface."Event_id_seq"'::regclass);


--
-- Name: image_id; Type: DEFAULT; Schema: humanface; Owner: humanface
--

ALTER TABLE ONLY humanface.image_paths ALTER COLUMN image_id SET DEFAULT nextval('humanface.image_paths_image_id_seq'::regclass);


--
-- Name: owner_id; Type: DEFAULT; Schema: humanface; Owner: humanface
--

ALTER TABLE ONLY humanface.owners ALTER COLUMN owner_id SET DEFAULT nextval('humanface."Owners _owner_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: humanface; Owner: humanface
--

ALTER TABLE ONLY humanface.parcel_owner_assoc ALTER COLUMN id SET DEFAULT nextval('humanface.parcel_owner_assoc_id_seq'::regclass);


--
-- Name: parcel_id; Type: DEFAULT; Schema: humanface; Owner: humanface
--

ALTER TABLE ONLY humanface.parcels ALTER COLUMN parcel_id SET DEFAULT nextval('humanface.parcels_parcel_id_seq'::regclass);


--
-- Name: parcel_id; Type: DEFAULT; Schema: humanface; Owner: humanface
--

ALTER TABLE ONLY humanface.parcels_old ALTER COLUMN parcel_id SET DEFAULT nextval('humanface."Parcels_parcel_id_seq"'::regclass);


--
-- Name: person_id; Type: DEFAULT; Schema: humanface; Owner: humanface
--

ALTER TABLE ONLY humanface.people ALTER COLUMN person_id SET DEFAULT nextval('humanface.people_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: humanface; Owner: humanface
--

ALTER TABLE ONLY humanface."property_photos " ALTER COLUMN id SET DEFAULT nextval('humanface."Property photos _id_seq"'::regclass);


--
-- Name: tenant_id; Type: DEFAULT; Schema: humanface; Owner: humanface
--

ALTER TABLE ONLY humanface.tenants ALTER COLUMN tenant_id SET DEFAULT nextval('humanface."Tenants_tenant_id_seq"'::regclass);


--
-- Name: Appraisers_appraiser_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: humanface
--

SELECT pg_catalog.setval('humanface."Appraisers_appraiser_id_seq"', 1, true);


--
-- Name: Appraises_appraise-id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: humanface
--

SELECT pg_catalog.setval('humanface."Appraises_appraise-id_seq"', 1, true);


--
-- Name: Buildings_building_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: humanface
--

SELECT pg_catalog.setval('humanface."Buildings_building_id_seq"', 1, false);


--
-- Name: Event_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: humanface
--

SELECT pg_catalog.setval('humanface."Event_id_seq"', 400, true);


--
-- Name: Owners _owner_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: humanface
--

SELECT pg_catalog.setval('humanface."Owners _owner_id_seq"', 1, false);


--
-- Name: Parcels_parcel_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: humanface
--

SELECT pg_catalog.setval('humanface."Parcels_parcel_id_seq"', 1, false);


--
-- Name: Property photos _id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: humanface
--

SELECT pg_catalog.setval('humanface."Property photos _id_seq"', 1, false);


--
-- Name: Tenants_tenant_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: humanface
--

SELECT pg_catalog.setval('humanface."Tenants_tenant_id_seq"', 1, false);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: humanface; Owner: humanface
--

COPY humanface.addresses (id, st_num, st_name, parcel_id) FROM stdin;
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
14211	N/W Cor.                                                        	Depost St. and Southern Street                                                                                                                                                                                                                                 	14171
14212	                                                                	                                                                                                                                                                                                                                                               	14171
9455	On Louis street of Randell Street                               	Asheville N.C,                                                                                                                                                                                                                                                 	9440
9456	                                                                	                                                                                                                                                                                                                                                               	9440
14167	Joins 128                                                       	Livingston St                                                                                                                                                                                                                                                  	14149
14168	                                                                	                                                                                                                                                                                                                                                               	14149
14213	Across from 20                                                  	Palmer Street                                                                                                                                                                                                                                                  	14172
14214	                                                                	                                                                                                                                                                                                                                                               	14172
9457	28 Louis Street                                                 	Asheville N.C,                                                                                                                                                                                                                                                 	9441
9458	                                                                	                                                                                                                                                                                                                                                               	9441
14169	128                                                             	Livingston St                                                                                                                                                                                                                                                  	14150
14170	                                                                	                                                                                                                                                                                                                                                               	14150
14215	Adjoins 5                                                       	Palmer Street                                                                                                                                                                                                                                                  	14173
14216	                                                                	                                                                                                                                                                                                                                                               	14173
14171	130                                                             	Livingston St                                                                                                                                                                                                                                                  	14151
14172	                                                                	                                                                                                                                                                                                                                                               	14151
14217	493                                                             	S. French Broad Avenue                                                                                                                                                                                                                                         	14174
14218	                                                                	                                                                                                                                                                                                                                                               	14174
14173	114, 114 1/2, 120                                               	Louie Street (Curve)                                                                                                                                                                                                                                           	14152
14174	                                                                	                                                                                                                                                                                                                                                               	14152
14219	Across from 508                                                 	South French Broad                                                                                                                                                                                                                                             	14175
14220	                                                                	                                                                                                                                                                                                                                                               	14175
14175	108                                                             	Louie St (Curve)                                                                                                                                                                                                                                               	14153
14176	                                                                	                                                                                                                                                                                                                                                               	14153
14221	Across from 498                                                 	S. French Broad Ave                                                                                                                                                                                                                                            	14176
14222	                                                                	                                                                                                                                                                                                                                                               	14176
14177	109                                                             	Louie St (Curve)                                                                                                                                                                                                                                               	14154
14178	                                                                	                                                                                                                                                                                                                                                               	14154
14223	12                                                              	Water St.                                                                                                                                                                                                                                                      	14177
14224	                                                                	                                                                                                                                                                                                                                                               	14177
14179	96                                                              	Louie (Curve) St                                                                                                                                                                                                                                               	14155
14180	                                                                	                                                                                                                                                                                                                                                               	14155
14181	Adjoins 96                                                      	Louie St                                                                                                                                                                                                                                                       	14156
14182	                                                                	                                                                                                                                                                                                                                                               	14156
14227	73                                                              	Black St.                                                                                                                                                                                                                                                      	14179
14228	                                                                	                                                                                                                                                                                                                                                               	14179
14183	62                                                              	Graham Street                                                                                                                                                                                                                                                  	14157
14184	                                                                	                                                                                                                                                                                                                                                               	14157
14229	138                                                             	Livingstone Street                                                                                                                                                                                                                                             	14180
14230	                                                                	                                                                                                                                                                                                                                                               	14180
14185	78                                                              	Louie St                                                                                                                                                                                                                                                       	14158
14186	                                                                	                                                                                                                                                                                                                                                               	14158
14231	52                                                              	Livingston St.                                                                                                                                                                                                                                                 	14181
14232	                                                                	                                                                                                                                                                                                                                                               	14181
14187	74                                                              	Louie St                                                                                                                                                                                                                                                       	14159
14188	                                                                	                                                                                                                                                                                                                                                               	14159
14189	58                                                              	Louie St                                                                                                                                                                                                                                                       	14160
14190	                                                                	                                                                                                                                                                                                                                                               	14160
14191	48                                                              	Corner of Louie Street and Depot street                                                                                                                                                                                                                        	14161
14192	                                                                	                                                                                                                                                                                                                                                               	14161
14193	3                                                               	Graham Place                                                                                                                                                                                                                                                   	14162
14194	                                                                	                                                                                                                                                                                                                                                               	14162
14195	5                                                               	Alley off Depot at Louise Street or Graham Place                                                                                                                                                                                                               	14163
14196	                                                                	                                                                                                                                                                                                                                                               	14163
14197	5                                                               	Alley off Depot at Louie Street or Graham Place                                                                                                                                                                                                                	14164
14198	                                                                	                                                                                                                                                                                                                                                               	14164
14199	7                                                               	Graham St                                                                                                                                                                                                                                                      	14165
14200	                                                                	                                                                                                                                                                                                                                                               	14165
14201	Adjoins 58                                                      	Graham Place                                                                                                                                                                                                                                                   	14166
14202	                                                                	                                                                                                                                                                                                                                                               	14166
14203	Adjoins 58                                                      	Graham Place                                                                                                                                                                                                                                                   	14167
14204	                                                                	                                                                                                                                                                                                                                                               	14167
14205	Adjoins 58                                                      	Graham Place                                                                                                                                                                                                                                                   	14168
14206	                                                                	                                                                                                                                                                                                                                                               	14168
14207	N/E Cor.                                                        	Southern St. and Graham Street                                                                                                                                                                                                                                 	14169
14208	                                                                	                                                                                                                                                                                                                                                               	14169
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
14209	N/S                                                             	Southern Street                                                                                                                                                                                                                                                	14170
14210	                                                                	                                                                                                                                                                                                                                                               	14170
\.


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: humanface
--

SELECT pg_catalog.setval('humanface.addresses_id_seq', 14232, true);


--
-- Data for Name: appraisals; Type: TABLE DATA; Schema: humanface; Owner: humanface
--

COPY humanface.appraisals ("appraisal-id", appraiser_id, parcel_id, imps_value, area_of_house, land_value, total_value, reproduction_value, income) FROM stdin;
1	1	1	$6,400.00	2500	$4,000.00	$10,400.00	$10,894.00	\N
5	5	2	$2,800.00	1420	$4,200.00	$7,000.00	$11,766.00	\N
6	6	2	$4,100.00	1420	$5,100.00	$9,300.00	$13,817.00	\N
4	4	2	$2,050.00	1420	$4,200.00	$6,250.00	$15,440.00	\N
3	3	1	\N	2500	\N	\N	$9,135.00	\N
2	2	1	$4,800.00	2500	\N	$110,000.00	\N	\N
\.


--
-- Data for Name: appraisers; Type: TABLE DATA; Schema: humanface; Owner: humanface
--

COPY humanface.appraisers (appraiser_id, appraiser_name, company_name) FROM stdin;
1	Alan Butterworth                                                                                                                                                                                                                                               	W. T. Duckworth Company                                                                                                                                                                                                                                        
2	H. E. Johnson                                                                                                                                                                                                                                                  	H. E. Johnson                                                                                                                                                                                                                                                  
4	Clyde G Idol Jr                                                                                                                                                                                                                                                	Charles W. Bradshaw. Inc                                                                                                                                                                                                                                       
5	Alan Butterworth                                                                                                                                                                                                                                               	W. T. Duckworth Company                                                                                                                                                                                                                                        
6	H E. Johnson                                                                                                                                                                                                                                                   	H E. Johnson                                                                                                                                                                                                                                                   
3	Charles W. Bradshaw                                                                                                                                                                                                                                            	Charles W. Bradshaw. Inc.                                                                                                                                                                                                                                      
\.


--
-- Data for Name: buildings; Type: TABLE DATA; Schema: humanface; Owner: humanface
--

COPY humanface.buildings (building_id, st_name, apt_no, area_of_units, use_of_building, parcel_id, number_of_rooms, address) FROM stdin;
1	Coxe Avenue                                                                                                                                                                                                                                                    	51	2500	commerical                                                                                                                                                                                                                                                     	1	1	\N
2	                                                                                                                                                                                                                                                               	2	1420	commerical                                                                                                                                                                                                                                                     	2	4	\N
\.


--
-- Data for Name: event_people_assoc; Type: TABLE DATA; Schema: humanface; Owner: humanface
--

COPY humanface.event_people_assoc (id, event_id, person_id, role) FROM stdin;
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
368	169	13	appraiser                                                       
369	169	93	owner                                                           
370	170	6	appraiser                                                       
371	170	94	owner                                                           
372	171	11	appraiser                                                       
373	171	93	owner                                                           
374	172	93	owner                                                           
375	172	2	purchaser                                                       
376	173	2	purchaser                                                       
377	173	93	owner                                                           
378	174	95	owner                                                           
379	174	93	owner                                                           
380	175	2	purchaser                                                       
381	175	93	owner                                                           
382	175	34	owner                                                           
383	176	29	other                                                           
384	176	2	purchaser                                                       
385	176	93	owner                                                           
386	177	29	other                                                           
387	177	2	purchaser                                                       
388	177	96	owner                                                           
389	178	6	appraiser                                                       
390	178	97	owner                                                           
391	178	98	owner                                                           
392	179	13	appraiser                                                       
393	179	97	owner                                                           
394	179	98	owner                                                           
395	180	11	appraiser                                                       
396	180	97	owner                                                           
397	180	98	owner                                                           
398	181	97	purchaser                                                       
399	181	98	purchaser                                                       
400	181	99	owner                                                           
401	181	100	owner                                                           
402	182	2	purchaser                                                       
403	182	97	owner                                                           
404	183	97	owner                                                           
405	183	2	purchaser                                                       
406	184	2	purchaser                                                       
407	184	97	owner                                                           
408	185	97	owner                                                           
409	185	2	purchaser                                                       
410	186	6	appraiser                                                       
411	187	11	appraiser                                                       
412	188	13	appraiser                                                       
413	189	2	purchaser                                                       
414	189	101	owner                                                           
415	189	102	owner                                                           
416	190	2	purchaser                                                       
417	190	101	owner                                                           
418	190	102	owner                                                           
419	191	2	purchaser                                                       
420	191	101	owner                                                           
421	191	102	owner                                                           
422	192	2	purchaser                                                       
423	192	101	owner                                                           
424	192	102	owner                                                           
425	193	6	appraiser                                                       
426	194	11	appraiser                                                       
427	195	13	appraiser                                                       
428	196	2	purchaser                                                       
429	196	103	owner                                                           
430	197	2	purchaser                                                       
431	197	103	owner                                                           
432	198	104	owner                                                           
433	198	103	owner                                                           
434	198	105	owner                                                           
435	199	2	purchaser                                                       
436	199	103	owner                                                           
437	200	106	tenant                                                          
438	200	2	purchaser                                                       
439	200	103	owner                                                           
440	201	2	purchaser                                                       
441	201	103	owner                                                           
442	202	6	appraiser                                                       
443	203	11	appraiser                                                       
444	204	13	appraiser                                                       
445	205	107	owner                                                           
446	205	108	owner                                                           
447	205	109	owner                                                           
448	206	2	purchaser                                                       
449	206	108	owner                                                           
450	207	2	purchaser                                                       
451	207	108	owner                                                           
452	208	108	owner                                                           
453	208	2	purchaser                                                       
454	209	29	other                                                           
455	209	2	purchaser                                                       
456	209	108	owner                                                           
457	210	13	appraiser                                                       
458	211	6	appraiser                                                       
459	212	13	appraiser                                                       
460	213	11	appraiser                                                       
461	214	2	purchaser                                                       
462	214	110	owner                                                           
463	215	2	purchaser                                                       
464	215	110	owner                                                           
465	216	111	owner                                                           
466	216	110	purchaser                                                       
467	217	2	purchaser                                                       
468	217	110	owner                                                           
469	218	2	purchaser                                                       
470	218	112	owner                                                           
471	218	110	owner                                                           
472	219	113	\N
473	220	6	appraiser                                                       
474	221	11	appraiser                                                       
475	222	13	appraiser                                                       
476	223	114	owner                                                           
477	223	2	purchaser                                                       
478	223	115	owner                                                           
479	224	114	owner                                                           
480	224	2	purchaser                                                       
481	224	115	owner                                                           
482	225	116	owner                                                           
483	225	117	purchaser                                                       
484	226	2	purchaser                                                       
485	226	114	owner                                                           
486	226	115	owner                                                           
487	227	2	purchaser                                                       
488	227	115	owner                                                           
489	227	114	owner                                                           
490	228	6	appraiser                                                       
491	228	118	\N
492	229	11	appraiser                                                       
493	230	13	appraiser                                                       
494	231	119	owner                                                           
495	231	2	purchaser                                                       
496	231	120	owner                                                           
497	232	119	owner                                                           
498	232	2	purchaser                                                       
499	232	120	owner                                                           
500	233	116	owner                                                           
501	233	119	purchaser                                                       
502	233	120	purchaser                                                       
503	234	2	purchaser                                                       
504	234	120	owner                                                           
505	234	119	owner                                                           
506	235	2	purchaser                                                       
507	235	119	owner                                                           
508	235	120	owner                                                           
509	236	121	tenant                                                          
510	236	2	owner                                                           
511	237	6	appraiser                                                       
512	238	11	appraiser                                                       
513	239	13	appraiser                                                       
514	240	2	purchaser                                                       
515	240	122	owner                                                           
516	240	123	owner                                                           
517	240	124	owner                                                           
518	240	125	owner                                                           
519	240	126	owner                                                           
520	240	127	owner                                                           
521	241	2	purchaser                                                       
522	241	127	owner                                                           
523	241	126	owner                                                           
524	241	125	owner                                                           
525	241	122	owner                                                           
526	241	123	owner                                                           
527	241	124	owner                                                           
528	242	2	purchaser                                                       
529	242	122	owner                                                           
530	243	128	owner                                                           
531	243	122	purchaser                                                       
532	243	129	purchaser                                                       
533	244	2	purchaser                                                       
534	244	122	owner                                                           
535	244	123	owner                                                           
536	244	124	owner                                                           
537	244	126	owner                                                           
538	244	127	owner                                                           
539	244	125	owner                                                           
540	245	6	appraiser                                                       
541	246	13	appraiser                                                       
542	247	11	appraiser                                                       
543	248	130	owner                                                           
544	248	131	purchaser                                                       
545	248	132	trustee                                                         
546	248	133	trustee                                                         
547	248	134	trustee                                                         
548	249	2	purchaser                                                       
549	249	131	owner                                                           
550	249	132	trustee                                                         
551	249	133	trustee                                                         
552	250	2	purchaser                                                       
553	250	131	owner                                                           
554	250	132	trustee                                                         
555	250	133	trustee                                                         
556	251	2	purchaser                                                       
557	251	131	owner                                                           
558	252	2	purchaser                                                       
559	252	132	trustee                                                         
560	252	133	trustee                                                         
561	252	131	owner                                                           
562	253	135	\N
563	254	6	appraiser                                                       
564	255	11	appraiser                                                       
565	256	136	appraiser                                                       
566	257	13	appraiser                                                       
567	258	2	purchaser                                                       
568	258	137	owner                                                           
569	258	138	owner                                                           
570	259	2	purchaser                                                       
571	259	137	owner                                                           
572	259	139	owner                                                           
573	260	140	owner                                                           
574	260	137	purchaser                                                       
575	260	139	purchaser                                                       
576	261	2	purchaser                                                       
577	261	137	owner                                                           
578	261	139	owner                                                           
579	262	2	purchaser                                                       
580	262	137	owner                                                           
581	262	139	owner                                                           
582	263	141	tenant                                                          
583	263	2	owner                                                           
584	264	6	appraiser                                                       
585	265	11	appraiser                                                       
586	266	13	appraiser                                                       
587	267	2	purchaser                                                       
588	267	142	heir                                                            
589	267	143	heir                                                            
590	267	144	owner                                                           
591	268	2	purchaser                                                       
592	268	144	owner                                                           
593	268	142	heir                                                            
594	268	143	heir                                                            
595	269	2	purchaser                                                       
596	269	144	owner                                                           
597	269	142	heir                                                            
598	269	143	heir                                                            
599	270	2	purchaser                                                       
600	270	144	owner                                                           
601	270	142	heir                                                            
602	270	143	heir                                                            
603	271	145	\N
604	272	146	owner                                                           
605	272	144	purchaser                                                       
606	273	13	appraiser                                                       
607	274	11	appraiser                                                       
608	275	6	appraiser                                                       
609	276	142	owner                                                           
610	276	143	owner                                                           
611	276	2	purchaser                                                       
612	277	2	purchaser                                                       
613	277	142	owner                                                           
614	277	143	owner                                                           
615	278	147	owner                                                           
616	278	142	purchaser                                                       
617	278	143	purchaser                                                       
618	279	2	purchaser                                                       
619	279	142	owner                                                           
620	279	143	owner                                                           
621	280	2	purchaser                                                       
622	280	142	owner                                                           
623	280	143	owner                                                           
624	281	127	tenant                                                          
625	281	2	owner                                                           
626	282	6	appraiser                                                       
627	283	11	appraiser                                                       
628	284	13	appraiser                                                       
629	285	2	purchaser                                                       
630	285	148	owner                                                           
631	285	149	owner                                                           
632	285	150	owner                                                           
633	286	2	purchaser                                                       
634	286	148	owner                                                           
635	286	149	owner                                                           
636	286	150	owner                                                           
637	287	151	owner                                                           
638	287	152	purchaser                                                       
639	288	2	purchaser                                                       
640	288	153	owner                                                           
641	288	150	owner                                                           
642	289	2	purchaser                                                       
643	289	148	owner                                                           
644	289	149	owner                                                           
645	289	150	owner                                                           
646	290	11	appraiser                                                       
647	291	6	appraiser                                                       
648	292	13	appraiser                                                       
649	293	154	purchaser                                                       
650	293	155	owner                                                           
651	294	154	owner                                                           
652	294	2	purchaser                                                       
653	295	154	owner                                                           
654	295	2	purchaser                                                       
655	296	2	purchaser                                                       
656	296	154	owner                                                           
657	297	2	purchaser                                                       
658	297	154	owner                                                           
659	298	156	\N
660	299	6	appraiser                                                       
661	300	11	appraiser                                                       
662	300	157	\N
663	301	13	appraiser                                                       
664	302	155	owner                                                           
665	302	158	purchaser                                                       
666	302	159	purchaser                                                       
667	303	2	purchaser                                                       
668	303	158	owner                                                           
669	303	159	owner                                                           
670	304	2	purchaser                                                       
671	304	158	owner                                                           
672	304	159	owner                                                           
673	305	2	purchaser                                                       
674	305	158	owner                                                           
675	305	159	owner                                                           
676	306	2	purchaser                                                       
677	306	160	owner                                                           
678	306	159	owner                                                           
679	307	6	appraiser                                                       
680	308	11	appraiser                                                       
681	309	13	appraiser                                                       
682	310	161	owner                                                           
683	310	162	purchaser                                                       
684	311	163	owner                                                           
685	311	164	owner                                                           
686	311	2	purchaser                                                       
687	312	29	other                                                           
688	312	2	purchaser                                                       
689	312	163	owner                                                           
690	312	164	owner                                                           
691	313	6	appraiser                                                       
692	314	13	appraiser                                                       
693	315	11	appraiser                                                       
694	316	165	owner                                                           
695	316	166	purchaser                                                       
696	317	2	purchaser                                                       
697	317	166	owner                                                           
698	318	29	other                                                           
699	318	2	purchaser                                                       
700	318	166	owner                                                           
701	319	2	purchaser                                                       
702	319	166	owner                                                           
703	320	2	purchaser                                                       
704	320	166	owner                                                           
705	321	11	appraiser                                                       
706	322	13	appraiser                                                       
707	323	6	appraiser                                                       
708	324	2	purchaser                                                       
709	324	132	trustee                                                         
710	324	131	owner                                                           
711	324	133	trustee                                                         
712	324	134	trustee                                                         
713	325	2	purchaser                                                       
714	325	131	owner                                                           
715	325	132	trustee                                                         
716	325	133	trustee                                                         
717	325	134	trustee                                                         
718	326	167	owner                                                           
719	326	134	trustee                                                         
720	326	132	trustee                                                         
721	326	131	purchaser                                                       
722	327	2	purchaser                                                       
723	327	131	owner                                                           
724	327	132	trustee                                                         
725	327	133	trustee                                                         
726	328	2	purchaser                                                       
727	328	131	owner                                                           
728	328	132	trustee                                                         
729	328	133	trustee                                                         
730	328	134	trustee                                                         
731	329	168	\N
732	330	11	appraiser                                                       
733	331	6	appraiser                                                       
734	332	13	appraiser                                                       
735	333	2	purchaser                                                       
736	333	169	owner                                                           
737	333	170	trustee                                                         
738	334	2	purchaser                                                       
739	334	169	owner                                                           
740	334	170	trustee                                                         
741	335	169	owner                                                           
742	335	128	purchaser                                                       
743	335	170	trustee                                                         
744	336	2	purchaser                                                       
745	336	128	owner                                                           
746	336	170	trustee                                                         
747	337	128	owner                                                           
748	337	170	trustee                                                         
749	337	2	purchaser                                                       
750	338	6	appraiser                                                       
751	339	11	appraiser                                                       
752	340	13	appraiser                                                       
753	341	171	owner                                                           
754	341	172	purchaser                                                       
755	342	2	purchaser                                                       
756	342	172	owner                                                           
757	343	2	purchaser                                                       
758	343	172	owner                                                           
759	344	2	purchaser                                                       
760	344	172	owner                                                           
761	345	2	purchaser                                                       
762	345	172	owner                                                           
763	346	6	appraiser                                                       
764	347	11	appraiser                                                       
765	348	13	appraiser                                                       
766	349	2	purchaser                                                       
767	349	173	owner                                                           
768	349	174	owner                                                           
769	350	2	purchaser                                                       
770	350	173	owner                                                           
771	350	174	owner                                                           
772	351	175	owner                                                           
773	351	173	purchaser                                                       
774	351	174	purchaser                                                       
775	352	2	purchaser                                                       
776	352	173	owner                                                           
777	352	174	owner                                                           
778	353	2	purchaser                                                       
779	353	173	owner                                                           
780	353	174	owner                                                           
781	354	6	appraiser                                                       
782	355	13	appraiser                                                       
783	356	11	appraiser                                                       
784	357	2	purchaser                                                       
785	357	176	owner                                                           
786	358	2	purchaser                                                       
787	358	176	owner                                                           
788	359	177	owner                                                           
789	359	176	purchaser                                                       
790	360	2	purchaser                                                       
791	360	176	owner                                                           
792	361	2	purchaser                                                       
793	361	176	owner                                                           
794	362	11	appraiser                                                       
795	363	178	appraiser                                                       
796	364	13	appraiser                                                       
797	365	179	owner                                                           
798	365	180	purchaser                                                       
799	366	29	other                                                           
800	366	2	purchaser                                                       
801	366	180	owner                                                           
802	367	2	purchaser                                                       
803	367	181	heir                                                            
804	367	180	owner                                                           
805	368	29	other                                                           
806	368	2	purchaser                                                       
807	368	180	owner                                                           
808	369	4	appraiser                                                       
809	370	4	appraiser                                                       
810	371	182	\N
811	372	183	owner                                                           
812	372	184	owner                                                           
813	372	185	purchaser                                                       
814	372	186	purchaser                                                       
815	372	187	purchaser                                                       
816	373	178	appraiser                                                       
817	373	185	owner                                                           
818	373	186	owner                                                           
819	374	188	appraiser                                                       
820	374	185	owner                                                           
821	375	189	appraiser                                                       
822	376	2	purchaser                                                       
823	376	185	owner                                                           
824	377	2	purchaser                                                       
825	377	185	owner                                                           
826	378	185	owner                                                           
827	378	2	purchaser                                                       
828	379	190	\N
837	384	191	trustee                                                         
838	384	192	purchaser                                                       
839	384	193	purchaser                                                       
840	385	193	owner                                                           
841	385	2	purchaser                                                       
842	386	2	purchaser                                                       
843	386	193	owner                                                           
844	387	193	owner                                                           
845	387	2	purchaser                                                       
846	388	11	appraiser                                                       
847	388	193	owner                                                           
848	389	6	appraiser                                                       
849	389	193	owner                                                           
850	390	188	appraiser                                                       
851	390	192	owner                                                           
852	390	193	owner                                                           
853	391	195	\N
854	392	196	owner                                                           
855	392	197	heir                                                            
856	393	197	owner                                                           
857	393	2	purchaser                                                       
858	394	2	purchaser                                                       
859	394	197	owner                                                           
860	395	6	appraiser                                                       
861	395	197	owner                                                           
862	396	11	appraiser                                                       
863	396	197	owner                                                           
864	397	188	appraiser                                                       
865	397	197	owner                                                           
866	398	197	owner                                                           
867	398	2	purchaser                                                       
868	399	198	\N
869	400	199	\N
\.


--
-- Name: event_people_assoc_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: humanface
--

SELECT pg_catalog.setval('humanface.event_people_assoc_id_seq', 869, true);


--
-- Data for Name: event_types; Type: TABLE DATA; Schema: humanface; Owner: humanface
--

COPY humanface.event_types (id, type) FROM stdin;
1	Transfer of Deed                                                                                                                                                                                                                                               
2	Offer Made                                                                                                                                                                                                                                                     
3	Appraisal                                                                                                                                                                                                                                                      
5	Tenant Moved                                                                                                                                                                                                                                                   
6	Awarded                                                                                                                                                                                                                                                        
7	End of Case                                                                                                                                                                                                                                                    
4	Decision (Accept/Reject)                                                                                                                                                                                                                                       
\.


--
-- Name: event_types_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: humanface
--

SELECT pg_catalog.setval('humanface.event_types_id_seq', 7, true);


--
-- Data for Name: events; Type: TABLE DATA; Schema: humanface; Owner: humanface
--

COPY humanface.events (event_id, response, extra_information, parcel_id, date, type, price) FROM stdin;
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
355	\N		14175	1968-07-31	3	1050
356	\N		14175	1966-11-17	3	1100
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
357	\N		14175	1969-03-27	2	1100
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
391	\N		14179	1969-03-03	7	0
392	\N		14180	1963-11-09	1	0
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
169	\N		14152	1968-09-06	3	11000
170	\N		14152	1965-09-15	3	5850
171	\N		14152	1966-10-20	3	9700
172	\N		14152	1968-12-27	2	10000
173	complicated                                                                                                                                                                                                                                                    	Problems with the title; Case took to Commissioner hearing to resolve title problems, but offer was accepted and final awarded amount was the same.	14152	1968-12-27	4	10000
174	\N	Deed transfer prior to acquisition	14152	1966-01-14	1	0
175	\N		14152	1970-07-20	1	10000
176	\N		14152	1971-04-14	6	10000
177	\N		14152	1971-04-14	7	10000
178	\N		14153	1965-09-15	3	3100
179	\N		14153	1968-08-09	3	5500
180	\N		14153	1966-10-20	3	5000
181	\N		14153	1946-05-11	1	2037
182	\N		14153	1969-07-24	2	5500
183	accept                                                                                                                                                                                                                                                         		14153	1969-07-24	4	5500
184	\N	Offer made $5500 - (taxes + stamp duty + inheritance tax return filed for Mamie Holloway) = $5383	14153	1969-08-21	7	5383
185	\N		14153	1969-08-21	1	5500
186	\N		14154	1965-09-15	3	4700
187	\N		14154	1966-10-20	3	6500
188	\N		14154	1968-08-14	3	6750
189	\N		14154	1969-07-23	2	6750
190	accept                                                                                                                                                                                                                                                         		14154	1969-07-23	4	6750
191	\N		14154	1969-08-13	1	6750
192	\N	No Closing statement available to calculate the net amount paid to the seller	14154	1969-08-13	7	6750
193	\N		14155	1965-09-15	3	1800
194	\N		14155	1966-10-22	3	3700
195	\N		14155	1968-08-14	3	2500
196	\N		14155	1968-12-11	2	2500
197	accept                                                                                                                                                                                                                                                         		14155	1968-12-11	4	2500
198	\N	Deed transfer prior to acquisition	14155	1919-04-30	1	1020
199	\N	Offer made $2500 - (taxes +stamp duty) = $2460 paid to seller	14155	1969-01-29	7	2460
200	\N	Tenant and HACA made an agreement for tenant to pay $15.00 per month to occupy this property	14155	1969-02-11	5	15
201	\N		14155	1969-01-28	1	2500
202	\N		14156	1965-09-15	3	1000
203	\N		14156	1966-10-22	3	1500
204	\N		14156	1968-08-15	3	1200
205	\N	Deed transfer prior to acquisition	14156	1960-12-15	1	495
206	\N		14156	1973-11-29	1	1750
207	\N		14156	1970-11-05	2	1500
208	complicated                                                                                                                                                                                                                                                    	Offer initially rejected and took to hearing	14156	1970-11-05	4	0
209	\N	After a re-assessment by Francis Haegar on the current market value, court awarded a total of $1750 to this property	14156	1973-11-27	6	1750
210	\N	Re-appraisal	14156	1973-07-11	3	1750
211	\N		14157	1965-09-15	3	2050
212	\N		14157	1968-08-15	3	3000
213	\N		14157	1966-10-25	3	4600
214	\N		14157	1969-09-15	2	3000
215	accept                                                                                                                                                                                                                                                         		14157	1969-09-15	4	3000
216	\N	Deed transfer prior to acquisition	14157	1965-03-11	1	1512
217	\N	Offer made $3000 - (Taxes + stamp duty + Deed trust for Herschel Harkins) = $2316	14157	1969-09-26	7	2316
218	\N		14157	1969-09-26	1	3000
219	\N		14157	\N	\N	0
220	\N		14158	1965-09-15	3	5250
221	\N		14158	1966-10-22	3	7000
222	\N		14158	1968-08-15	3	7500
223	\N		14158	1970-10-26	2	7500
224	accept                                                                                                                                                                                                                                                         		14158	1970-10-26	4	7500
225	\N		14158	1919-08-18	1	0
226	\N	Offer made $7500 - (taxes + stamp duty) = $7410	14158	1970-11-06	7	7410
227	\N		14158	1970-11-06	1	7500
228	\N		14159	1965-09-15	3	4950
229	\N		14159	1966-10-20	3	6000
230	\N		14159	1968-08-15	3	5500
231	\N		14159	1968-10-24	2	6000
232	accept                                                                                                                                                                                                                                                         		14159	1968-10-24	4	6000
233	\N	Deed transfer prior to acquisition	14159	1919-07-15	1	1900
234	\N	Offer made $6000 - (taxes + stamp duty) = $5932	14159	1968-12-09	7	5932
235	\N		14159	1968-12-09	1	6000
236	\N	Tent fixed at $30 per month	14159	1969-01-11	5	30
237	\N		14160	1965-09-15	3	1600
238	\N		14160	1966-10-25	3	5000
239	\N		14160	1968-08-15	3	4500
240	\N		14160	1969-11-10	2	5000
241	accept                                                                                                                                                                                                                                                         		14160	1969-11-10	4	5000
242	\N	Offer made $5000 - (taxes + stamp duty) = $4717	14160	1969-12-19	7	4717
243	\N		14160	1952-08-23	1	1030
244	\N		14160	1970-01-15	1	5000
245	\N		14161	1965-09-15	3	350
246	\N		14161	1968-08-15	3	600
247	\N		14161	1966-10-25	3	800
248	\N	Deed transfer prior to acquisition	14161	1955-12-29	1	0
249	\N		14161	1969-11-26	2	700
250	accept                                                                                                                                                                                                                                                         		14161	1969-11-26	4	700
251	\N	Offer made $700 - (taxes + duty) = $698	14161	1970-01-22	7	698
252	\N		14161	1970-02-11	1	700
253	\N		14161	\N	\N	0
254	\N		14162	1965-09-15	3	2500
255	\N		14162	1966-10-27	3	3800
256	\N		14162	1969-10-09	3	425
257	\N		14162	1968-08-15	3	400
258	\N		14162	1969-11-25	2	425
259	accept                                                                                                                                                                                                                                                         		14162	1969-11-25	4	425
260	\N	Deed transfer prior to acquisition	14162	1960-11-03	1	1100
261	\N	Offer made $425 - (taxes + stamp duty) = $340	14162	1969-12-10	7	340
262	\N		14162	1969-12-10	1	425
263	\N	Tenant asked to pay $15 after acquisition for this property	14162	1969-12-29	5	15
264	\N		14163	1965-09-15	3	3600
265	\N		14163	1966-10-25	3	5500
266	\N		14163	1968-08-15	3	3000
267	\N		14163	1969-05-12	2	5000
268	accept                                                                                                                                                                                                                                                         		14163	1969-05-13	4	5000
269	\N		14163	1969-08-12	1	5000
270	\N	Offer made $5000 - (taxes + stamp duty) = $4862	14163	1969-08-12	7	4862
271	\N		14163	\N	\N	0
272	\N		14164	1956-08-30	1	1385
273	\N		14165	1968-08-15	3	5500
274	\N		14165	1966-10-25	3	5000
275	\N		14165	1965-09-15	3	3100
276	\N		14165	1969-05-12	2	5500
277	accept                                                                                                                                                                                                                                                         		14165	1969-05-13	4	5500
278	\N	Deed transfer prior to acquisition	14165	1948-04-16	1	1060
279	\N	Offer made $5500 - (taxes + stamp duty) = $5477	14165	1969-06-27	7	5477
280	\N		14165	1969-06-27	1	5500
281	\N	Tenant asked to pay originally 25$ per month but relocation director reconsidered the fact that the tenant only lives on retirement benefits of $127 for two weeks and has 6 people to support and reduces the rent to $15 per month	14165	1969-07-24	5	15
282	\N	To be best considered as Street according to appraiser	14166	1965-09-15	3	0
283	\N		14166	1966-10-25	3	400
284	\N		14166	1968-08-16	3	400
285	\N		14166	1969-08-06	2	400
286	accept                                                                                                                                                                                                                                                         		14166	1969-08-11	4	400
287	\N		14166	1928-06-21	1	60
288	\N	Offer made $400 - (taxes + stamp duty) = $398	14166	1969-09-03	7	398
289	\N		14166	1969-09-19	1	400
290	\N		14167	1966-10-25	3	400
291	\N		14167	1965-09-15	3	260
292	\N		14167	1968-08-16	3	400
293	\N	Deed transfer prior to acquisition	14167	1954-03-03	1	58
294	\N		14167	1969-12-03	2	400
295	accept                                                                                                                                                                                                                                                         		14167	1969-12-09	4	400
296	\N	Offer made $400 - (taxes + stamp duty) = $372	14167	1970-01-27	7	372
297	\N		14167	1970-02-04	1	400
298	\N		14167	\N	\N	0
299	\N		14168	1965-09-15	3	200
300	\N		14168	1966-10-25	3	400
301	\N		14168	1968-08-16	3	350
302	\N	Deed transfer prior to acquisition	14168	1954-03-03	1	58
303	\N		14168	1970-05-18	2	400
393	\N		14180	1968-10-31	1	0
394	\N		14180	1968-10-01	2	11600
395	\N		14180	1965-09-15	3	11600
304	accept                                                                                                                                                                                                                                                         		14168	1970-05-18	4	400
305	\N	Offer made $400 - (taxes + stamp duty) = $385	14168	1970-01-30	7	385
306	\N		14168	1970-07-21	1	400
307	\N		14169	1965-09-15	3	125
308	\N		14169	1966-10-25	3	700
309	\N		14169	1968-08-16	3	450
310	\N	Registered date: 09-11-1907. Deed transfer prior to acquisition	14169	1910-01-01	1	60
311	\N		14169	1973-07-24	1	450
312	\N	Case was filed and heard at Superior court to decide on the final award	14169	1973-08-16	6	457
313	\N		14170	1965-09-15	3	125
314	\N		14170	1968-08-13	3	350
315	\N		14170	1966-10-25	3	500
316	\N	Deed transfer prior to acquisition	14170	1927-09-06	1	123
317	\N		14170	1971-10-26	1	350
318	\N	Amount awarded after case went to hearing	14170	1971-10-26	6	354
319	\N		14170	1968-10-24	2	500
320	complicated                                                                                                                                                                                                                                                    	Offer was probably rejected and the case took to hearing	14170	1968-10-24	4	500
321	\N		14171	1966-10-25	3	5000
322	\N		14171	1967-08-16	3	5000
323	\N		14171	1965-09-15	3	1750
324	\N		14171	1969-11-25	2	5000
325	accept                                                                                                                                                                                                                                                         		14171	1969-11-26	4	5000
326	\N		14171	1955-12-29	1	1211
327	\N	Offer made $5000 - (taxes + stamp duty) = $4992	14171	1970-01-22	7	4992
328	\N		14171	1970-02-11	1	5000
329	\N		14171	\N	\N	0
330	\N		14172	1966-11-04	3	750
331	\N		14172	1966-06-20	3	600
332	\N		14172	1968-07-29	3	400
333	\N		14172	1969-01-17	2	700
334	accept                                                                                                                                                                                                                                                         		14172	1969-01-17	4	700
335	\N	Deed transfer from William Shuford to John Shuford and Wachovia Bank after demise of William Shuford	14172	1967-01-06	1	158
336	\N	Offer made $700 - (pending taxes + stamp duty) = $598	14172	1969-07-08	7	598
337	\N		14172	1969-07-10	1	700
338	\N		14173	1966-06-20	3	600
339	\N		14173	1966-11-05	3	750
340	\N		14173	1968-07-29	3	400
341	\N	Deed transfer prior to acquisition	14173	1936-04-03	1	210
342	\N		14173	1970-04-21	2	700
343	accept                                                                                                                                                                                                                                                         		14173	1970-04-23	4	700
344	\N	Offer made $700 - (taxes + stamp duty) = $696	14173	1970-05-18	7	696
345	\N		14173	1970-05-18	1	700
346	\N		14174	1965-09-15	3	1575
347	\N		14174	1966-11-17	3	4000
348	\N		14174	1968-07-31	3	4500
349	\N		14174	1969-04-21	2	4500
350	accept                                                                                                                                                                                                                                                         		14174	1969-04-21	4	4500
351	\N	Deed transfer prior to acquisition	14174	1940-02-29	1	1493
352	\N	Offer made $5000 - (delinquent taxes + stamp duty) = $3432	14174	1969-05-23	7	3432
353	\N		14174	1969-05-23	1	5000
354	\N		14175	1965-09-15	3	1650
358	accept                                                                                                                                                                                                                                                         		14175	1969-03-27	4	1100
359	\N	Deed transfer prior to acquisition	14175	1968-07-15	1	323
360	\N	Offer made $1100 - (delinquent taxes + stamp duty) = $1052	14175	1969-05-20	7	1052
361	\N		14175	1969-05-20	1	1100
362	\N		14176	1966-11-17	3	1000
363	\N		14176	1974-06-12	3	1220
364	\N		14176	1968-07-31	3	1100
365	\N	Deed transfer prior to acquisition, but this property was condemned as there was a price mismatch between the titles procures by different attorneys	14176	1955-05-02	1	445
366	\N	Initial awarded amount based on the hearing by superior court commissioner	14176	1977-04-20	6	1750
367	\N		14176	1977-04-26	1	1750
368	\N	Final award amount on this property after a second hearing	14176	1977-06-07	6	2258
369	\N		14176	1974-04-19	3	1525
370	\N	Reassessment of the same property upon second hearing	14176	1977-04-11	3	1750
371	\N		14176	\N	\N	0
372	\N		14177	1955-02-09	1	0
373	\N		14177	1974-02-06	3	4500
374	\N		14177	1974-04-02	3	5000
375	\N		14177	1974-04-18	3	5000
376	\N		14177	1974-07-27	2	5000
377	accept                                                                                                                                                                                                                                                         		14177	1974-07-29	4	5000
378	\N		14177	1974-08-16	1	0
379	\N		14177	1974-08-16	7	0
384	\N		14179	1934-02-13	1	0
385	\N		14179	1969-03-03	1	0
386	\N		14179	1968-12-20	2	4000
387	accept                                                                                                                                                                                                                                                         		14179	1968-12-27	4	4000
388	\N		14179	1966-12-13	3	4000
389	\N		14179	1965-09-15	3	2550
390	\N		14179	1968-07-09	3	3750
396	\N		14180	1966-12-30	3	11300
397	\N		14180	1968-05-23	3	11000
398	accept                                                                                                                                                                                                                                                         		14180	1968-10-02	4	11600
399	\N		14180	1968-10-31	7	0
400	\N		14181	1976-04-22	1	0
\.


--
-- Data for Name: image_paths; Type: TABLE DATA; Schema: humanface; Owner: humanface
--

COPY humanface.image_paths (image_id, img_path, parcel_id) FROM stdin;
0	u	0
1	/var/www/html/images/properties/B10_P12_021976_1.png	14182
2	/var/www/html/images/properties/B10_P12_022576_1.png	14182
3	/var/www/html/images/properties/B10_P12_062066_1.png	14182
4	/var/www/html/images/properties/B10_P12_101866_1.png	14182
5	/var/www/html/images/properties/B10_P13_062066_1.png	14183
6	/var/www/html/images/properties/B10_P13_101966_1.png	14183
7	/var/www/html/images/properties/B10_P14_021767_1.png	14184
8	/var/www/html/images/properties/B10_P14_021767_2.png	14184
9	/var/www/html/images/properties/B10_P14_061368_1.png	14184
10	/var/www/html/images/properties/B10_P14_061368_2.png	14184
11	/var/www/html/images/properties/B10_P14_091565_1.png	14184
12	/var/www/html/images/properties/B10_P14_091565_2.png	14184
13	/var/www/html/images/properties/B10_P15_091565_1.png	14185
14	/var/www/html/images/properties/B10_P15_101966_1.png	14185
15	/var/www/html/images/properties/B10_P16_061368_1.png	14186
16	/var/www/html/images/properties/B10_P16_101966_1.png	14186
17	/var/www/html/images/properties/B10_P17_020767_1.png	14187
18	/var/www/html/images/properties/B10_P17_091565_1.png	14187
19	/var/www/html/images/properties/B10_P18_091565_1.png	14188
20	/var/www/html/images/properties/B10_P18_101866_1.png	14188
21	/var/www/html/images/properties/B10_P19_061363_1.png	14189
22	/var/www/html/images/properties/B10_P19_061363_2.png	14189
23	/var/www/html/images/properties/B10_P19_091565_1.png	14189
24	/var/www/html/images/properties/B10_P2_062066_1.png	14190
25	/var/www/html/images/properties/B10_P2_062268_1.png	14190
26	/var/www/html/images/properties/B10_P3_062028_1.png	14191
27	/var/www/html/images/properties/B10_P3_062066_1.png	14191
28	/var/www/html/images/properties/B10_P3_072076_1.png	14191
29	/var/www/html/images/properties/B10_P3_072076_2.png	14191
30	/var/www/html/images/properties/B10_P3_080476_1.png	14191
31	/var/www/html/images/properties/B10_P3_101166_1.png	14191
32	/var/www/html/images/properties/B10_P4_021667_1.png	14192
33	/var/www/html/images/properties/B10_P4_062066_1.png	14192
34	/var/www/html/images/properties/B10_P6_021567_1.png	14193
35	/var/www/html/images/properties/B10_P6_062066_1.png	14193
36	/var/www/html/images/properties/B10_P6_062068_1.png	14193
37	/var/www/html/images/properties/B11_P10_052868_1.png	14194
38	/var/www/html/images/properties/B11_P10_091565_1.png	14194
39	/var/www/html/images/properties/B11_P11_111368_1.png	14195
40	/var/www/html/images/properties/B11_P11_111466_1.png	14195
41	/var/www/html/images/properties/B11_P12_022576_1.png	14196
42	/var/www/html/images/properties/B11_P12_091565_1.png	14196
43	/var/www/html/images/properties/B11_P12_111368_1.png	14196
44	/var/www/html/images/properties/B11_P12_111466_1.png	14196
45	/var/www/html/images/properties/B11_P14_052868_1.png	14197
46	/var/www/html/images/properties/B11_P14_091565_1.png	14197
47	/var/www/html/images/properties/B11_P15_052868_1.png	14198
48	/var/www/html/images/properties/B11_P15_091565_1.png	14198
49	/var/www/html/images/properties/B11_P16_052868_1.png	14199
50	/var/www/html/images/properties/B11_P16_091676_1.png	14199
51	/var/www/html/images/properties/B11_P16_101166_1.png	14199
52	/var/www/html/images/properties/B11_P17_052968_1.png	14200
53	/var/www/html/images/properties/B11_P17_080676_1.png	14200
54	/var/www/html/images/properties/B11_P17_101766_1.png	14200
55	/var/www/html/images/properties/B11_P18_052968_1.png	14201
56	/var/www/html/images/properties/B11_P18_091565_1.png	14201
57	/var/www/html/images/properties/B11_P19_090676_1.png	14202
58	/var/www/html/images/properties/B11_P19_091565_1.png	14202
59	/var/www/html/images/properties/B11_P19_101266_1.png	14202
60	/var/www/html/images/properties/B11_P20_021467_1.png	14203
61	/var/www/html/images/properties/B11_P20_091565_1.png	14203
62	/var/www/html/images/properties/B11_P21_021467_1.png	14204
63	/var/www/html/images/properties/B11_P21_052968_1.png	14204
64	/var/www/html/images/properties/B11_P22_091565_1.png	14205
65	/var/www/html/images/properties/B11_P22_091676_1.png	14205
66	/var/www/html/images/properties/B11_P22_091676_2.png	14205
67	/var/www/html/images/properties/B11_P22_101066_1.png	14205
68	/var/www/html/images/properties/B11_P23_052968_1.png	14206
69	/var/www/html/images/properties/B11_P23_091565_1.png	14206
70	/var/www/html/images/properties/B11_P24_052968_1.png	14207
71	/var/www/html/images/properties/B11_P24_091565_1.png	14207
72	/var/www/html/images/properties/B11_P25_060668_1.png	14208
73	/var/www/html/images/properties/B11_P25_091565_1.png	14208
74	/var/www/html/images/properties/B11_P27_060768_1.png	14209
75	/var/www/html/images/properties/B11_P27_091565_1.png	14209
76	/var/www/html/images/properties/B11_P28_060768_1.png	14210
77	/var/www/html/images/properties/B11_P28_091565_1.png	14210
78	/var/www/html/images/properties/B11_P29_060668_1.png	14211
79	/var/www/html/images/properties/B11_P29_091565_1.png	14211
80	/var/www/html/images/properties/B11_P2_112274_1.png	14212
81	/var/www/html/images/properties/B11_P2_112274_2.png	14212
82	/var/www/html/images/properties/B11_P2_112274_3.png	14212
83	/var/www/html/images/properties/B11_P2_112274_4.png	14212
84	/var/www/html/images/properties/B11_P2_112274_5.png	14212
85	/var/www/html/images/properties/B11_P2_112274_6.png	14212
86	/var/www/html/images/properties/B11_P2_112274_7.png	14212
87	/var/www/html/images/properties/B11_P2_112274_8.png	14212
88	/var/www/html/images/properties/B11_P2_112274_9.png	14212
89	/var/www/html/images/properties/B11_P30_060668_1.png	14213
90	/var/www/html/images/properties/B11_P30_091565_1.png	14213
91	/var/www/html/images/properties/B11_P31_020767_1.png	14214
92	/var/www/html/images/properties/B11_P31_020767_2.png	14214
93	/var/www/html/images/properties/B11_P31_060768_1.png	14214
94	/var/www/html/images/properties/B11_P32_060768_1.png	14215
95	/var/www/html/images/properties/B11_P32_091565_1.png	14215
96	/var/www/html/images/properties/B11_P33_060668_1.png	14216
97	/var/www/html/images/properties/B11_P33_091565_1.png	14216
98	/var/www/html/images/properties/B11_P34_060668_1.png	14217
99	/var/www/html/images/properties/B11_P34_091565_1.png	14217
100	/var/www/html/images/properties/B11_P35_060668_1.png	14218
101	/var/www/html/images/properties/B11_P35_091565_1.png	14218
102	/var/www/html/images/properties/B11_P36_061168_1.png	14219
103	/var/www/html/images/properties/B11_P36_091565_1.png	14219
104	/var/www/html/images/properties/B11_P36_101766_1.png	14219
105	/var/www/html/images/properties/B11_P36_112276_1.png	14219
106	/var/www/html/images/properties/B11_P37_061168_1.png	14220
107	/var/www/html/images/properties/B11_P37_062066_1.png	14220
108	/var/www/html/images/properties/B11_P37_111766_1.png	14220
109	/var/www/html/images/properties/B11_P38_061168_1.png	14221
110	/var/www/html/images/properties/B11_P38_101766_1.png	14221
111	/var/www/html/images/properties/B11_P38_122876_1.png	14221
112	/var/www/html/images/properties/B11_P38_122876_2.png	14221
113	/var/www/html/images/properties/B11_P39_061168_1.png	14222
114	/var/www/html/images/properties/B11_P39_101866_1.png	14222
115	/var/www/html/images/properties/B11_P3_020867_1.png	14223
116	/var/www/html/images/properties/B11_P3_032175_1.png	14223
117	/var/www/html/images/properties/B11_P3_032175_2.png	14223
118	/var/www/html/images/properties/B11_P3_041575_1.png	14223
119	/var/www/html/images/properties/B11_P3_052868_1.png	14223
120	/var/www/html/images/properties/B11_P3_091565_1.png	14223
121	/var/www/html/images/properties/B11_P40_032175_1.png	14224
122	/var/www/html/images/properties/B11_P40_032175_2.png	14224
123	/var/www/html/images/properties/B11_P40_041575_1.png	14224
124	/var/www/html/images/properties/B11_P40_061168_1.png	14224
125	/var/www/html/images/properties/B11_P40_101866_1.png	14224
126	/var/www/html/images/properties/B11_P41_030575_1.png	14225
127	/var/www/html/images/properties/B11_P41_030675_1.png	14225
128	/var/www/html/images/properties/B11_P41_061168_1.png	14225
129	/var/www/html/images/properties/B11_P41_091565_1.png	14225
130	/var/www/html/images/properties/B11_P41_101866_1.png	14225
131	/var/www/html/images/properties/B11_P42_091565_1.png	14226
132	/var/www/html/images/properties/B11_P42_100866_1.png	14226
133	/var/www/html/images/properties/B11_P43_060668_1.png	14227
134	/var/www/html/images/properties/B11_P43_091565_1.png	14227
135	/var/www/html/images/properties/B11_P43_101866_1.png	14227
136	/var/www/html/images/properties/B11_P44_061168_1.png	14228
137	/var/www/html/images/properties/B11_P44_100766_1.png	14228
138	/var/www/html/images/properties/B11_P45_060668_1.png	14229
139	/var/www/html/images/properties/B11_P45_100866_1.png	14229
140	/var/www/html/images/properties/B11_P4_052968_1.png	14230
141	/var/www/html/images/properties/B11_P4_091565_1.png	14230
142	/var/www/html/images/properties/B11_P5_091565_1.png	14231
143	/var/www/html/images/properties/B11_P5_102066_1.png	14231
144	/var/www/html/images/properties/B11_P6_052968_1.png	14232
145	/var/www/html/images/properties/B11_P6_090676_1.png	14232
146	/var/www/html/images/properties/B11_P6_091565_1.png	14232
147	/var/www/html/images/properties/B11_P6_102066_1.png	14232
148	/var/www/html/images/properties/B11_P7_052968_1.png	14233
149	/var/www/html/images/properties/B11_P7_091565_1.png	14233
150	/var/www/html/images/properties/B11_P7_091676_1.png	14233
151	/var/www/html/images/properties/B11_P7_102066_1.png	14233
152	/var/www/html/images/properties/B11_P8_021067_1.png	14234
153	/var/www/html/images/properties/B11_P8_021067_2.png	14234
154	/var/www/html/images/properties/B11_P8_052868_1.png	14234
155	/var/www/html/images/properties/B11_P8_091565_1.png	14234
156	/var/www/html/images/properties/B11_P8_091565_2.png	14234
157	/var/www/html/images/properties/B11_P9_020570_1.png	14235
158	/var/www/html/images/properties/B11_P9_020570_2.png	14235
159	/var/www/html/images/properties/B11_P9_091565_1.png	14235
160	/var/www/html/images/properties/B11_P9_111368_1.png	14235
161	/var/www/html/images/properties/B14_P12_052476_1.png	14236
162	/var/www/html/images/properties/B14_P12_052476_2.png	14236
163	/var/www/html/images/properties/B14_P12_052476_3.png	14236
164	/var/www/html/images/properties/B14_P12_052476_4.png	14236
165	/var/www/html/images/properties/B14_P12_052476_5.png	14236
166	/var/www/html/images/properties/B14_P12_052476_6.png	14236
167	/var/www/html/images/properties/B14_P12_052476_7.png	14236
168	/var/www/html/images/properties/B14_P12_052476_8.png	14236
169	/var/www/html/images/properties/B14_P12_052476_9.png	14236
170	/var/www/html/images/properties/B14_P12_062376_1.png	14236
171	/var/www/html/images/properties/B14_P13_061776_1.png	14237
172	/var/www/html/images/properties/B14_P13_061776_2.png	14237
173	/var/www/html/images/properties/B14_P13_061776_3.png	14237
174	/var/www/html/images/properties/B14_P13_061776_4.png	14237
175	/var/www/html/images/properties/B14_P13_061776_5.png	14237
176	/var/www/html/images/properties/B14_P13_061776_6.png	14237
177	/var/www/html/images/properties/B14_P13_061776_7.png	14237
178	/var/www/html/images/properties/B14_P13_061776_8.png	14237
179	/var/www/html/images/properties/B14_P14_061776_1.png	14238
180	/var/www/html/images/properties/B14_P14_061776_2.png	14238
181	/var/www/html/images/properties/B14_P14_061776_3.png	14238
182	/var/www/html/images/properties/B14_P14_061776_4.png	14238
183	/var/www/html/images/properties/B14_P14_061776_5.png	14238
184	/var/www/html/images/properties/B14_P14_061776_6.png	14238
185	/var/www/html/images/properties/B14_P14_061776_7.png	14238
186	/var/www/html/images/properties/B14_P14_061776_8.png	14238
187	/var/www/html/images/properties/B14_P15_062876_1.png	14239
188	/var/www/html/images/properties/B14_P15_062876_10.png	14239
189	/var/www/html/images/properties/B14_P15_062876_2.png	14239
190	/var/www/html/images/properties/B14_P15_062876_3.png	14239
191	/var/www/html/images/properties/B14_P15_062876_4.png	14239
192	/var/www/html/images/properties/B14_P15_062876_5.png	14239
193	/var/www/html/images/properties/B14_P15_062876_6.png	14239
194	/var/www/html/images/properties/B14_P15_062876_7.png	14239
195	/var/www/html/images/properties/B14_P15_062876_8.png	14239
196	/var/www/html/images/properties/B14_P15_062876_9.png	14239
197	/var/www/html/images/properties/B14_P16_111874_1.png	14240
198	/var/www/html/images/properties/B14_P16_112774_1.png	14240
199	/var/www/html/images/properties/B14_P1_052476_1.png	14241
200	/var/www/html/images/properties/B14_P1_052476_2.png	14241
201	/var/www/html/images/properties/B14_P1_052476_3.png	14241
202	/var/www/html/images/properties/B14_P1_052476_4.png	14241
203	/var/www/html/images/properties/B14_P1_052476_5.png	14241
204	/var/www/html/images/properties/B14_P1_071776_1.png	14241
205	/var/www/html/images/properties/B14_P1_071776_2.png	14241
206	/var/www/html/images/properties/B14_P1_071776_3.png	14241
207	/var/www/html/images/properties/B14_P1_071776_4.png	14241
208	/var/www/html/images/properties/B14_P2_112274_1.png	14242
209	/var/www/html/images/properties/B14_P2_112274_2.png	14242
210	/var/www/html/images/properties/B14_P2_112274_3.png	14242
211	/var/www/html/images/properties/B14_P2_112274_4.png	14242
212	/var/www/html/images/properties/B14_P2_112274_5.png	14242
213	/var/www/html/images/properties/B14_P2_112274_6.png	14242
214	/var/www/html/images/properties/B14_P2_112274_7.png	14242
215	/var/www/html/images/properties/B14_P2_112274_8.png	14242
216	/var/www/html/images/properties/B15_P12_072077_1.png	14243
217	/var/www/html/images/properties/B15_P12_081177_1.png	14243
218	/var/www/html/images/properties/B15_P13_072177_1.png	14244
219	/var/www/html/images/properties/B15_P13_072177_2.png	14244
220	/var/www/html/images/properties/B15_P13_072177_3.png	14244
221	/var/www/html/images/properties/B15_P13_072177_4.png	14244
222	/var/www/html/images/properties/B15_P14_020868_1.png	14245
223	/var/www/html/images/properties/B15_P14_091565_1.png	14245
224	/var/www/html/images/properties/B15_P15_091565_1.png	14246
225	/var/www/html/images/properties/B15_P15_092868_1.png	14246
226	/var/www/html/images/properties/B15_P16_092868_1.png	14247
227	/var/www/html/images/properties/B15_P17_092868_1.png	14248
228	/var/www/html/images/properties/B15_P17_092868_2.png	14248
229	/var/www/html/images/properties/B15_P17_101166_1.png	14248
230	/var/www/html/images/properties/B15_P17_101166_2.png	14248
231	/var/www/html/images/properties/B15_P18_070866_1.png	14249
232	/var/www/html/images/properties/B15_P18_090275_1.png	14249
233	/var/www/html/images/properties/B15_P18_090275_2.png	14249
234	/var/www/html/images/properties/B15_P18_092868_1.png	14249
235	/var/www/html/images/properties/B15_P19_021373_1.png	14250
236	/var/www/html/images/properties/B15_P19_102666_1.png	14250
237	/var/www/html/images/properties/B15_P1_011074_1.png	14251
238	/var/www/html/images/properties/B15_P1_011074_2.png	14251
239	/var/www/html/images/properties/B15_P1_020674_1.png	14251
240	/var/www/html/images/properties/B15_P2_090275_1.png	14252
241	/var/www/html/images/properties/B15_P2_090275_2.png	14252
242	/var/www/html/images/properties/B15_P2_090275_3.png	14252
243	/var/www/html/images/properties/B15_P2_090275_4.png	14252
244	/var/www/html/images/properties/B15_P2_090275_5.png	14252
245	/var/www/html/images/properties/B15_P2_090275_6.png	14252
246	/var/www/html/images/properties/B15_P2_090275_7.png	14252
247	/var/www/html/images/properties/B15_P2_091565_1.png	14252
248	/var/www/html/images/properties/B15_P2_092868_1.png	14252
249	/var/www/html/images/properties/B15_P2_092868_2.png	14252
250	/var/www/html/images/properties/B15_P2_101166_1.png	14252
251	/var/www/html/images/properties/B15_P2_101166_2.png	14252
252	/var/www/html/images/properties/B15_P7_011874_1.png	14253
253	/var/www/html/images/properties/B15_P7_011874_2.png	14253
254	/var/www/html/images/properties/B15_P7_020674_1.png	14253
255	/var/www/html/images/properties/B15_P8_081570_1.png	14254
256	/var/www/html/images/properties/B15_P8_081770_.1.png	14254
257	/var/www/html/images/properties/B16_P10_082168_1.png	14255
258	/var/www/html/images/properties/B16_P10_091565_1.png	14255
259	/var/www/html/images/properties/B16_P10_091565_2.png	14255
260	/var/www/html/images/properties/B16_P11_063068_1.png	14256
261	/var/www/html/images/properties/B16_P11_091565_1.png	14256
262	/var/www/html/images/properties/B16_P11_092668_1.png	14256
263	/var/www/html/images/properties/B16_P11_092668_2.png	14256
264	/var/www/html/images/properties/B16_P12_091565_1.png	14257
265	/var/www/html/images/properties/B16_P12_091565_2.png	14257
266	/var/www/html/images/properties/B16_P13_082168_1.png	14258
267	/var/www/html/images/properties/B16_P13_091565_1.png	14258
268	/var/www/html/images/properties/B16_P13_091565_2.png	14258
269	/var/www/html/images/properties/B16_P14_062968_1.png	14259
270	/var/www/html/images/properties/B16_P14_082668_1.png	14259
271	/var/www/html/images/properties/B16_P15_082768_1.png	14260
272	/var/www/html/images/properties/B16_P15_091565_1.png	14260
273	/var/www/html/images/properties/B16_P16_071168_1.png	14261
274	/var/www/html/images/properties/B16_P16_091565_1.png	14261
275	/var/www/html/images/properties/B16_P17_020674_1.png	14262
276	/var/www/html/images/properties/B16_P17_020674_2.png	14262
277	/var/www/html/images/properties/B16_P17_062968_1.png	14262
278	/var/www/html/images/properties/B16_P17_080373_1.png	14262
279	/var/www/html/images/properties/B16_P17_080373_2.png	14262
280	/var/www/html/images/properties/B16_P17_080373_3.png	14262
281	/var/www/html/images/properties/B16_P17_090268_1.png	14262
282	/var/www/html/images/properties/B16_P18_061868_1.png	14263
283	/var/www/html/images/properties/B16_P18_090268_1.png	14263
284	/var/www/html/images/properties/B16_P18_091565_1.png	14263
285	/var/www/html/images/properties/B16_P19_070568_1.png	14264
286	/var/www/html/images/properties/B16_P19_091565_1.png	14264
287	/var/www/html/images/properties/B16_P1_052068_1.png	14265
288	/var/www/html/images/properties/B16_P1_061368_1.png	14265
289	/var/www/html/images/properties/B16_P20_022475_1.png	14266
290	/var/www/html/images/properties/B16_P20_061868_1.png	14266
291	/var/www/html/images/properties/B16_P20_090268_1.png	14266
292	/var/www/html/images/properties/B16_P20_091565_1.png	14266
293	/var/www/html/images/properties/B16_P20_100274_1.png	14266
294	/var/www/html/images/properties/B16_P20_100274_2.png	14266
295	/var/www/html/images/properties/B16_P20_100274_3.png	14266
296	/var/www/html/images/properties/B16_P2_051668_1.png	14267
297	/var/www/html/images/properties/B16_P2_061368_1.png	14267
298	/var/www/html/images/properties/B16_P3_061868_1.png	14268
299	/var/www/html/images/properties/B16_P3_082368_1.png	14268
300	/var/www/html/images/properties/B16_P4_081068_1.png	14269
301	/var/www/html/images/properties/B16_P4_082168_1.png	14269
302	/var/www/html/images/properties/B16_P5_070268_1.png	14270
303	/var/www/html/images/properties/B16_P5_071575_1.png	14270
304	/var/www/html/images/properties/B16_P5_071575_2.png	14270
305	/var/www/html/images/properties/B16_P5_071575_3.png	14270
306	/var/www/html/images/properties/B16_P5_071575_4.png	14270
307	/var/www/html/images/properties/B16_P5_071575_5.png	14270
308	/var/www/html/images/properties/B16_P5_071575_6.png	14270
309	/var/www/html/images/properties/B16_P5_082868_1.png	14270
310	/var/www/html/images/properties/B16_P5_091565_1.png	14270
311	/var/www/html/images/properties/B16_P6_061468_1.png	14271
312	/var/www/html/images/properties/B16_P6_081968_1.png	14271
313	/var/www/html/images/properties/B16_P6_091565_1.png	14271
314	/var/www/html/images/properties/B16_P7_061468_1.png	14272
315	/var/www/html/images/properties/B16_P7_061468_2.png	14272
316	/var/www/html/images/properties/B16_P7_072875_1.png	14272
317	/var/www/html/images/properties/B16_P7_072875_2.png	14272
318	/var/www/html/images/properties/B16_P7_072875_3.png	14272
319	/var/www/html/images/properties/B16_P7_072875_4.png	14272
320	/var/www/html/images/properties/B16_P7_082268_1.png	14272
321	/var/www/html/images/properties/B16_P7_091565_1.png	14272
322	/var/www/html/images/properties/B16_P7_091565_2.png	14272
323	/var/www/html/images/properties/B16_P8_061468_1.png	14273
324	/var/www/html/images/properties/B16_P8_082068_1.png	14273
325	/var/www/html/images/properties/B16_P9_061468_1.png	14274
326	/var/www/html/images/properties/B16_P9_082068_1.png	14274
327	/var/www/html/images/properties/B17_P10_082068_1.png	14275
328	/var/www/html/images/properties/B17_P10_091565_1.png	14275
329	/var/www/html/images/properties/B17_P11_082768_1.png	14276
330	/var/www/html/images/properties/B17_P11_091565_2.png	14276
331	/var/www/html/images/properties/B17_P12_070668_1.png	14277
332	/var/www/html/images/properties/B17_P12_091565_1.png	14277
333	/var/www/html/images/properties/B17_P13_021867_1.png	14278
334	/var/www/html/images/properties/B17_P13_071368_1.png	14278
335	/var/www/html/images/properties/B17_P13_091565_1.png	14278
336	/var/www/html/images/properties/B17_P14_070668_1.png	14279
337	/var/www/html/images/properties/B17_P15_082168_1.png	14280
338	/var/www/html/images/properties/B17_P15_091565_1.png	14280
339	/var/www/html/images/properties/B17_P15_091565_2.png	14280
340	/var/www/html/images/properties/B17_P15_nodate_1.png	14280
341	/var/www/html/images/properties/B17_P15_nodate_2.png	14280
342	/var/www/html/images/properties/B17_P15_nodate_3.png	14280
343	/var/www/html/images/properties/B17_P15_nodate_4.png	14280
344	/var/www/html/images/properties/B17_P15_nodate_5.png	14280
345	/var/www/html/images/properties/B17_P15_nodate_6.png	14280
346	/var/www/html/images/properties/B17_P17_070568_1.png	14281
347	/var/www/html/images/properties/B17_P17_071868_1.png	14281
348	/var/www/html/images/properties/B17_P19_070568_1.png	14282
349	/var/www/html/images/properties/B17_P19_070568_2.png	14282
350	/var/www/html/images/properties/B17_P19_082868_1.png	14282
351	/var/www/html/images/properties/B17_P19_082868_2.png	14282
352	/var/www/html/images/properties/B17_P19_091565_1.png	14282
353	/var/www/html/images/properties/B17_P1_061968_1.png	14283
354	/var/www/html/images/properties/B17_P1_080368_1.png	14283
355	/var/www/html/images/properties/B17_P20_070368_1.png	14284
356	/var/www/html/images/properties/B17_P20_091565_1.png	14284
357	/var/www/html/images/properties/B17_P21_070368_1.png	14285
358	/var/www/html/images/properties/B17_P21_091565_1.png	14285
359	/var/www/html/images/properties/B17_P22_070468_1.png	14286
360	/var/www/html/images/properties/B17_P22_091565_1.png	14286
361	/var/www/html/images/properties/B17_P23_080368_1.png	14287
362	/var/www/html/images/properties/B17_P23_091565_1.png	14287
363	/var/www/html/images/properties/B17_P24_080368_1.png	14288
364	/var/www/html/images/properties/B17_P24_091565_1.png	14288
365	/var/www/html/images/properties/B17_P25_073168_1.png	14289
366	/var/www/html/images/properties/B17_P25_091565_1.png	14289
367	/var/www/html/images/properties/B17_P25_091565_2.png	14289
368	/var/www/html/images/properties/B17_P25_092168_1.png	14289
369	/var/www/html/images/properties/B17_P26_013077_1.png	14290
370	/var/www/html/images/properties/B17_P26_080368_1.png	14290
371	/var/www/html/images/properties/B17_P26_091565_1.png	14290
372	/var/www/html/images/properties/B17_P27_080568_1.png	14291
373	/var/www/html/images/properties/B17_P27_091565_1.png	14291
374	/var/www/html/images/properties/B17_P27_122876_1.png	14291
375	/var/www/html/images/properties/B17_P27_122876_2.png	14291
376	/var/www/html/images/properties/B17_P28_071368_1.png	14292
377	/var/www/html/images/properties/B17_P28_091565_1.png	14292
378	/var/www/html/images/properties/B17_P29_071268_1.png	14293
379	/var/www/html/images/properties/B17_P29_080568_1.png	14293
380	/var/www/html/images/properties/B17_P29_091565_1.png	14293
381	/var/www/html/images/properties/B17_P2_072768_1.png	14294
382	/var/www/html/images/properties/B17_P2_091565_1.png	14294
383	/var/www/html/images/properties/B17_P30_071268_1.png	14295
384	/var/www/html/images/properties/B17_P30_091565_1.png	14295
385	/var/www/html/images/properties/B17_P32_071268_1.png	14296
386	/var/www/html/images/properties/B17_P32_080568_1.png	14296
387	/var/www/html/images/properties/B17_P33_071668_1.png	14297
388	/var/www/html/images/properties/B17_P33_081468_1.png	14297
389	/var/www/html/images/properties/B17_P34_071668_1.png	14298
390	/var/www/html/images/properties/B17_P34_081068_1.png	14298
391	/var/www/html/images/properties/B17_P35_071768_1.png	14299
392	/var/www/html/images/properties/B17_P35_081668_1.png	14299
393	/var/www/html/images/properties/B17_P36_071868_1.png	14300
394	/var/www/html/images/properties/B17_P36_083168_1.png	14300
395	/var/www/html/images/properties/B17_P37_071068_1.png	14301
396	/var/www/html/images/properties/B17_P37_081068_1.png	14301
397	/var/www/html/images/properties/B17_P3_072768_1.png	14302
398	/var/www/html/images/properties/B17_P3_082775_1.png	14302
399	/var/www/html/images/properties/B17_P3_082775_2.png	14302
400	/var/www/html/images/properties/B17_P3_091565_1.png	14302
401	/var/www/html/images/properties/B17_P3_101475_1.png	14302
402	/var/www/html/images/properties/B17_P3_101475_2.png	14302
403	/var/www/html/images/properties/B17_P4_071568_1.png	14303
404	/var/www/html/images/properties/B17_P4_091565_1.png	14303
405	/var/www/html/images/properties/B17_P5_071168_1.png	14304
406	/var/www/html/images/properties/B17_P5_091565_1.png	14304
407	/var/www/html/images/properties/B17_P6_071268_1.png	14305
408	/var/www/html/images/properties/B17_P6_072768_1.png	14305
409	/var/www/html/images/properties/B17_P6_091565_1.png	14305
410	/var/www/html/images/properties/B17_P6_091565_2.png	14305
411	/var/www/html/images/properties/B17_P8_070668_1.png	14306
412	/var/www/html/images/properties/B17_P8_091565_1.png	14306
413	/var/www/html/images/properties/B17_P9A_081968_1.png	14307
414	/var/www/html/images/properties/B17_P9B_071168_1.png	14307
415	/var/www/html/images/properties/B17_P9B_081968_1.png	14307
416	/var/www/html/images/properties/B17_P9B_091565_1.png	14307
417	/var/www/html/images/properties/B18_P3_041868_1.png	14308
418	/var/www/html/images/properties/B18_P3_091565_1.png	14308
419	/var/www/html/images/properties/B18_P3_120568_1.png	14308
420	/var/www/html/images/properties/B18_P4_091565_1.png	14309
421	/var/www/html/images/properties/B18_P4_091565_2.png	14309
422	/var/www/html/images/properties/B18_P4_121268_1.png	14309
423	/var/www/html/images/properties/B18_P4_121268_2.png	14309
424	/var/www/html/images/properties/B18_P4_121268_3.png	14309
425	/var/www/html/images/properties/B18_P5_032768_1.png	14310
426	/var/www/html/images/properties/B18_P5_121368_1.png	14310
427	/var/www/html/images/properties/B18_P6_032968_1.png	14311
428	/var/www/html/images/properties/B18_P6_091565_1.png	14311
429	/var/www/html/images/properties/B18_P7_041568_1.png	14312
430	/var/www/html/images/properties/B18_P7_120568_1.png	14312
431	/var/www/html/images/properties/B19_P10_031968_1.png	14313
432	/var/www/html/images/properties/B19_P10_091565_1.png	14313
433	/var/www/html/images/properties/B19_P11_040168_1.png	14314
434	/var/www/html/images/properties/B19_P11_091565_1.png	14314
435	/var/www/html/images/properties/B19_P13_081570_1.png	14315
436	/var/www/html/images/properties/B19_P13_081570_10.png	14315
437	/var/www/html/images/properties/B19_P13_081570_2.png	14315
438	/var/www/html/images/properties/B19_P13_081570_3.png	14315
439	/var/www/html/images/properties/B19_P13_081570_4.png	14315
440	/var/www/html/images/properties/B19_P13_081570_5.png	14315
441	/var/www/html/images/properties/B19_P13_081570_6.png	14315
442	/var/www/html/images/properties/B19_P13_081570_7.png	14315
443	/var/www/html/images/properties/B19_P13_081570_8.png	14315
444	/var/www/html/images/properties/B19_P13_081570_9.png	14315
445	/var/www/html/images/properties/B19_P14_030274_1.png	14316
446	/var/www/html/images/properties/B19_P14_030274_2.png	14316
447	/var/www/html/images/properties/B19_P14_041474_1.png	14316
448	/var/www/html/images/properties/B19_P17_031968_1.png	14317
449	/var/www/html/images/properties/B19_P17_080368_1.png	14317
450	/var/www/html/images/properties/B19_P17_080368_2.png	14317
451	/var/www/html/images/properties/B19_P17_091565_1.png	14317
452	/var/www/html/images/properties/B19_P18_061464_2.png	14318
453	/var/www/html/images/properties/B19_P18_061474_1.png	14318
454	/var/www/html/images/properties/B19_P18_062066_1.png	14318
455	/var/www/html/images/properties/B19_P18_080368_1.png	14318
456	/var/www/html/images/properties/B19_P1_031968_1.png	14319
457	/var/www/html/images/properties/B19_P1_081068_1.png	14319
458	/var/www/html/images/properties/B19_P22_061274_1.png	14320
459	/var/www/html/images/properties/B19_P22_061474_1.png	14320
460	/var/www/html/images/properties/B19_P23_031968_1.png	14321
461	/var/www/html/images/properties/B19_P23_041170_1.png	14321
462	/var/www/html/images/properties/B19_P23_041170_2.png	14321
463	/var/www/html/images/properties/B19_P23_091565_1.png	14321
464	/var/www/html/images/properties/B19_P23_100568_1.png	14321
465	/var/www/html/images/properties/B19_P24_010168_1.png	14322
466	/var/www/html/images/properties/B19_P24_091565_1.png	14322
467	/var/www/html/images/properties/B19_P25_031968_1.png	14323
468	/var/www/html/images/properties/B19_P25_081068_1.png	14323
469	/var/www/html/images/properties/B19_P26_010168_1.png	14324
470	/var/www/html/images/properties/B19_P26_081068_1.png	14324
471	/var/www/html/images/properties/B19_P26_091565_1.png	14324
472	/var/www/html/images/properties/B19_P27_031968_1.png	14325
473	/var/www/html/images/properties/B19_P27_062066_1.png	14325
474	/var/www/html/images/properties/B19_P28_032868_1.png	14326
475	/var/www/html/images/properties/B19_P28_091565_1.png	14326
476	/var/www/html/images/properties/B19_P29_010868_1.png	14327
477	/var/www/html/images/properties/B19_P29_080868_1.png	14327
478	/var/www/html/images/properties/B19_P2_082368_1.png	14328
479	/var/www/html/images/properties/B19_P2_082468_1.png	14328
480	/var/www/html/images/properties/B19_P3_030774_1.png	14329
481	/var/www/html/images/properties/B19_P3_041474_1.png	14329
482	/var/www/html/images/properties/B19_P5_031868_1.png	14330
483	/var/www/html/images/properties/B19_P5_091565_1.png	14330
484	/var/www/html/images/properties/B19_P6_032968_1.png	14331
485	/var/www/html/images/properties/B19_P6_091565_1.png	14331
486	/var/www/html/images/properties/B19_P9_031968_1.png	14332
487	/var/www/html/images/properties/B19_P9_091565_1.png	14332
488	/var/www/html/images/properties/B1_P10_022874_1.png	14333
489	/var/www/html/images/properties/B1_P10_022874_2.png	14333
490	/var/www/html/images/properties/B1_P11_011267_1.png	14334
491	/var/www/html/images/properties/B1_P11_091565_1.png	14334
492	/var/www/html/images/properties/B1_P11_100168_1.png	14334
493	/var/www/html/images/properties/B1_P12_010676_1.png	14335
494	/var/www/html/images/properties/B1_P12_010676_2.png	14335
495	/var/www/html/images/properties/B1_P12_010676_3.png	14335
496	/var/www/html/images/properties/B1_P12_010676_4.png	14335
497	/var/www/html/images/properties/B1_P12_030174_1.png	14335
498	/var/www/html/images/properties/B1_P12_030174_2.png	14335
499	/var/www/html/images/properties/B1_P12_041474_1.png	14335
500	/var/www/html/images/properties/B1_P12_041474_2.png	14335
501	/var/www/html/images/properties/B1_P12_041474_3.png	14335
502	/var/www/html/images/properties/B1_P12_121275_1.png	14335
503	/var/www/html/images/properties/B1_P12_121275_2.png	14335
504	/var/www/html/images/properties/B1_P12_121275_3.png	14335
505	/var/www/html/images/properties/B1_P13A_121373_1.png	14336
506	/var/www/html/images/properties/B1_P13_020674_1.png	14336
507	/var/www/html/images/properties/B1_P14_011569_1.png	14337
508	/var/www/html/images/properties/B1_P14_011769_1.png	14337
509	/var/www/html/images/properties/B1_P14_100568_1.png	14337
510	/var/www/html/images/properties/B1_P15_011767_1.png	14338
511	/var/www/html/images/properties/B1_P15_091565_1.png	14338
512	/var/www/html/images/properties/B1_P15_091868_1.png	14338
513	/var/www/html/images/properties/B1_P16_011267_1.png	14339
514	/var/www/html/images/properties/B1_P16_072276_1.png	14339
515	/var/www/html/images/properties/B1_P16_072276_2.png	14339
516	/var/www/html/images/properties/B1_P16_091565_1.png	14339
517	/var/www/html/images/properties/B1_P17_011267_1.png	14340
518	/var/www/html/images/properties/B1_P17_091565_1.png	14340
519	/var/www/html/images/properties/B1_P17_091565_2.png	14340
520	/var/www/html/images/properties/B1_P17_100168_1.png	14340
521	/var/www/html/images/properties/B1_P18_011267_1.png	14341
522	/var/www/html/images/properties/B1_P18_091565_1.png	14341
523	/var/www/html/images/properties/B1_P18_100168_1.png	14341
524	/var/www/html/images/properties/B1_P19_091565_1.png	14342
525	/var/www/html/images/properties/B1_P19_091565_2.png	14342
526	/var/www/html/images/properties/B1_P19_100468_1.png	14342
527	/var/www/html/images/properties/B1_P20_011767_1.png	14343
528	/var/www/html/images/properties/B1_P20_091565_1.png	14343
529	/var/www/html/images/properties/B1_P20_110968_1.png	14343
530	/var/www/html/images/properties/B1_P21_091565_1.png	14344
531	/var/www/html/images/properties/B1_P21_091868_1.png	14344
532	/var/www/html/images/properties/B1_P21_091868_2.png	14344
533	/var/www/html/images/properties/B1_P22_011067_1.png	14345
534	/var/www/html/images/properties/B1_P22_020570_1.png	14345
535	/var/www/html/images/properties/B1_P22_020570_2.png	14345
536	/var/www/html/images/properties/B1_P22_091567_1.png	14345
537	/var/www/html/images/properties/B1_P22_100468_1.png	14345
538	/var/www/html/images/properties/B1_P22_101976_1.png	14345
539	/var/www/html/images/properties/B1_P22_101976_2.png	14345
540	/var/www/html/images/properties/B1_P24_091565_1.png	14346
541	/var/www/html/images/properties/B1_P24_101068_1.png	14346
542	/var/www/html/images/properties/B1_P24_101068_2.png	14346
543	/var/www/html/images/properties/B1_P25_091565_1.png	14347
544	/var/www/html/images/properties/B1_P25_101668_1.png	14347
545	/var/www/html/images/properties/B1_P27_051375_1.png	14348
546	/var/www/html/images/properties/B1_P27_051375_2.png	14348
547	/var/www/html/images/properties/B1_P28_072676_1.png	14349
548	/var/www/html/images/properties/B1_P28_072676_2.png	14349
549	/var/www/html/images/properties/B1_P28_091565_1.png	14349
550	/var/www/html/images/properties/B1_P28_091868_1.png	14349
551	/var/www/html/images/properties/B1_P29_011067_1.png	14350
552	/var/www/html/images/properties/B1_P29_091868_1.png	14350
553	/var/www/html/images/properties/B1_P29_092876_1.png	14350
554	/var/www/html/images/properties/B1_P2_073168_1.png	14351
555	/var/www/html/images/properties/B1_P2_091565_1.png	14351
556	/var/www/html/images/properties/B1_P2_110968_1.png	14351
557	/var/www/html/images/properties/B1_P30_071268_1.png	14352
558	/var/www/html/images/properties/B1_P30_091565_1.png	14352
559	/var/www/html/images/properties/B1_P31_010467_1.png	14353
560	/var/www/html/images/properties/B1_P31_100568_1.png	14353
561	/var/www/html/images/properties/B1_P32_010767_1.png	14354
562	/var/www/html/images/properties/B1_P32_061274_1.png	14354
563	/var/www/html/images/properties/B1_P32_091565_1.png	14354
564	/var/www/html/images/properties/B1_P32_091868_1.png	14354
565	/var/www/html/images/properties/B1_P33_091565_1.png	14355
566	/var/www/html/images/properties/B1_P33_101168_1.png	14355
567	/var/www/html/images/properties/B1_P34_100168_1.png	14356
568	/var/www/html/images/properties/B1_P35_091565_1.png	14357
569	/var/www/html/images/properties/B1_P35_091868_1.png	14357
570	/var/www/html/images/properties/B1_P36_070868_1.png	14358
571	/var/www/html/images/properties/B1_P36_091565_1.png	14358
572	/var/www/html/images/properties/B1_P37_091565_1.png	14359
573	/var/www/html/images/properties/B1_P37_091868_1.png	14359
574	/var/www/html/images/properties/B1_P38_020570_1.png	14360
575	/var/www/html/images/properties/B1_P38_070868_1.png	14360
576	/var/www/html/images/properties/B1_P38_091565_1.png	14360
577	/var/www/html/images/properties/B1_P39_091565_1.png	14361
578	/var/www/html/images/properties/B1_P39_101468_1.png	14361
579	/var/www/html/images/properties/B1_P3_071268_1.png	14362
580	/var/www/html/images/properties/B1_P3_091565_1.png	14362
581	/var/www/html/images/properties/B1_P3_091565_2.png	14362
582	/var/www/html/images/properties/B1_P3_091565_3.png	14362
583	/var/www/html/images/properties/B1_P3_110268_1.png	14362
584	/var/www/html/images/properties/B1_P40_091565_1.png	14363
585	/var/www/html/images/properties/B1_P40_091668_1.png	14363
586	/var/www/html/images/properties/B1_P41_091565_1.png	14364
587	/var/www/html/images/properties/B1_P41_091568_1.png	14364
588	/var/www/html/images/properties/B1_P41_102268_1.png	14364
589	/var/www/html/images/properties/B1_P42_081868_1.png	14365
590	/var/www/html/images/properties/B1_P43_091565_1.png	14366
591	/var/www/html/images/properties/B1_P43_091868_1.png	14366
592	/var/www/html/images/properties/B1_P44_012467_1.png	14367
593	/var/www/html/images/properties/B1_P45_091868_1.png	14368
594	/var/www/html/images/properties/B1_P46_070868_1.png	14369
595	/var/www/html/images/properties/B1_P46_091565_1.png	14369
596	/var/www/html/images/properties/B1_P46_091565_2.png	14369
597	/var/www/html/images/properties/B1_P46_091565_3.png	14369
598	/var/www/html/images/properties/B1_P47_091565_1.png	14370
599	/var/www/html/images/properties/B1_P47_091565_2.png	14370
600	/var/www/html/images/properties/B1_P47_102268_1.png	14370
601	/var/www/html/images/properties/B1_P48_050175_1.png	14371
602	/var/www/html/images/properties/B1_P48_050175_2.png	14371
603	/var/www/html/images/properties/B1_P48_050175_3.png	14371
604	/var/www/html/images/properties/B1_P48_070868_1.png	14371
605	/var/www/html/images/properties/B1_P48_070868_2.png	14371
606	/var/www/html/images/properties/B1_P48_081574_1.png	14371
607	/var/www/html/images/properties/B1_P48_091565_1.png	14371
608	/var/www/html/images/properties/B1_P48_101968_1.png	14371
609	/var/www/html/images/properties/B1_P49_091565_1.png	14372
610	/var/www/html/images/properties/B1_P49_102268_1.png	14372
611	/var/www/html/images/properties/B1_P4_071568_1.png	14373
612	/var/www/html/images/properties/B1_P4_091565_1.png	14373
613	/var/www/html/images/properties/B1_P4_091565_2.png	14373
614	/var/www/html/images/properties/B1_P4_091565_3.png	14373
615	/var/www/html/images/properties/B1_P4_110268_1.png	14373
616	/var/www/html/images/properties/B1_P4_110268_2.png	14373
617	/var/www/html/images/properties/B1_P50_091565_1.png	14374
618	/var/www/html/images/properties/B1_P50_091565_2.png	14374
619	/var/www/html/images/properties/B1_P50_102268_1.png	14374
620	/var/www/html/images/properties/B1_P51_091565_1.png	14375
621	/var/www/html/images/properties/B1_P51_102268_1.png	14375
622	/var/www/html/images/properties/B1_P5_071668_1.png	14376
623	/var/www/html/images/properties/B1_P5_102268_1.png	14376
624	/var/www/html/images/properties/B1_P6_030474_1.png	14377
625	/var/www/html/images/properties/B1_P6_030474_2.png	14377
626	/var/www/html/images/properties/B1_P6_041474_1.png	14377
627	/var/www/html/images/properties/B1_P7_042374_1.png	14378
628	/var/www/html/images/properties/B1_P7_042374_2.png	14378
629	/var/www/html/images/properties/B1_P7_080574_1.png	14378
630	/var/www/html/images/properties/B1_P8_072568_1.png	14379
631	/var/www/html/images/properties/B1_P8_091565_1.png	14379
632	/var/www/html/images/properties/B1_P9_100168_1.png	14380
633	/var/www/html/images/properties/B20_P1_040776_1.png	14381
634	/var/www/html/images/properties/B20_P1_040776_2.png	14381
635	/var/www/html/images/properties/B20_P1_040776_3.png	14381
636	/var/www/html/images/properties/B20_P1_072475_1.png	14381
637	/var/www/html/images/properties/B20_P1_072475_10.png	14381
638	/var/www/html/images/properties/B20_P1_072475_11.png	14381
639	/var/www/html/images/properties/B20_P1_072475_12.png	14381
640	/var/www/html/images/properties/B20_P1_072475_13.png	14381
641	/var/www/html/images/properties/B20_P1_072475_2.png	14381
642	/var/www/html/images/properties/B20_P1_072475_3.png	14381
643	/var/www/html/images/properties/B20_P1_072475_4.png	14381
644	/var/www/html/images/properties/B20_P1_072475_5.png	14381
645	/var/www/html/images/properties/B20_P1_072475_6.png	14381
646	/var/www/html/images/properties/B20_P1_072475_7.png	14381
647	/var/www/html/images/properties/B20_P1_072475_8.png	14381
648	/var/www/html/images/properties/B20_P1_072475_9.png	14381
649	/var/www/html/images/properties/B20_P24_041674_1.png	14382
650	/var/www/html/images/properties/B20_P24_041674_2.png	14382
651	/var/www/html/images/properties/B20_P24_061274_1.png	14382
652	/var/www/html/images/properties/B20_P2_051669_1.png	14383
653	/var/www/html/images/properties/B20_P2_060269_1.png	14383
654	/var/www/html/images/properties/B20_P6_080168_1.png	14384
655	/var/www/html/images/properties/B20_P6_091565_1.png	14384
656	/var/www/html/images/properties/B20_P7_080168_1.png	14385
657	/var/www/html/images/properties/B20_P7_080168_2.png	14385
658	/var/www/html/images/properties/B20_P7_091565_1.png	14385
659	/var/www/html/images/properties/B21_P13_041268_1.png	14386
660	/var/www/html/images/properties/B21_P13_041268_2.png	14386
661	/var/www/html/images/properties/B21_P13_041268_3.png	14386
662	/var/www/html/images/properties/B21_P13_041268_4.png	14386
663	/var/www/html/images/properties/B21_P13_050568_1.png	14386
664	/var/www/html/images/properties/B21_P14_072568_1.png	14387
665	/var/www/html/images/properties/B21_P14_091565_1.png	14387
666	/var/www/html/images/properties/B21_P6_020270_1.png	14388
667	/var/www/html/images/properties/B25_P10_060168_1.png	14389
668	/var/www/html/images/properties/B25_P10_091565_1.png	14389
669	/var/www/html/images/properties/B25_P1_052968_1.png	14390
670	/var/www/html/images/properties/B25_P1_091565_1.png	14390
671	/var/www/html/images/properties/B25_P2_072568_1.png	14391
672	/var/www/html/images/properties/B25_P2_091565_1.png	14391
673	/var/www/html/images/properties/B25_P3_020674_1.png	14392
674	/var/www/html/images/properties/B25_P3_080373_1.png	14392
675	/var/www/html/images/properties/B25_P3_080373_2.png	14392
676	/var/www/html/images/properties/B25_P3_080373_3.png	14392
677	/var/www/html/images/properties/B25_P3_091565_1.png	14392
678	/var/www/html/images/properties/B25_P4_053068_1.png	14393
679	/var/www/html/images/properties/B25_P4_091565_1.png	14393
680	/var/www/html/images/properties/B25_P4_120768_1.png	14393
681	/var/www/html/images/properties/B25_P4_120768_2.png	14393
682	/var/www/html/images/properties/B25_P5_091565_1.png	14394
683	/var/www/html/images/properties/B25_P6_021467_1.png	14395
684	/var/www/html/images/properties/B25_P6_060168_1.png	14395
685	/var/www/html/images/properties/B25_P7_021976_1.png	14396
686	/var/www/html/images/properties/B25_P7_022576_1.png	14396
687	/var/www/html/images/properties/B25_P7_060168_1.png	14396
688	/var/www/html/images/properties/B25_P7_101066_1.png	14396
689	/var/www/html/images/properties/B25_P8_021467_1.png	14397
690	/var/www/html/images/properties/B25_P8_060168_1.png	14397
691	/var/www/html/images/properties/B25_P9_060168_1.png	14398
692	/var/www/html/images/properties/B25_P9_091565_1.png	14398
693	/var/www/html/images/properties/B26_P1_022367_1.png	14399
694	/var/www/html/images/properties/B26_P1_022367_2.png	14399
695	/var/www/html/images/properties/B26_P1_091565_1.png	14399
696	/var/www/html/images/properties/B26_P1_091565_2.png	14399
697	/var/www/html/images/properties/B26_P2_022567_1.png	14400
698	/var/www/html/images/properties/B26_P2_091565_1.png	14400
699	/var/www/html/images/properties/B26_P3_052968_1.png	14401
700	/var/www/html/images/properties/B26_P3_101866_1.png	14401
701	/var/www/html/images/properties/B26_P3_101866_2.png	14401
702	/var/www/html/images/properties/B26_P4_052968_1.png	14402
703	/var/www/html/images/properties/B26_P4_100866_1.png	14402
704	/var/www/html/images/properties/B26_P5_061175_1.png	14403
705	/var/www/html/images/properties/B26_P5_061175_2.png	14403
706	/var/www/html/images/properties/B26_P5_061175_3.png	14403
707	/var/www/html/images/properties/B26_P5_061175_4.png	14403
708	/var/www/html/images/properties/B26_P5_061175_5.png	14403
709	/var/www/html/images/properties/B26_P5_100866_1.png	14403
710	/var/www/html/images/properties/B26_P6_021567_1.png	14404
711	/var/www/html/images/properties/B26_P6_091565_1.png	14404
712	/var/www/html/images/properties/B26_P7_021767_1.png	14405
713	/var/www/html/images/properties/B26_P7_053068_1.png	14405
714	/var/www/html/images/properties/B26_P8_021667_1.png	14406
715	/var/www/html/images/properties/B26_P8_052968_1.png	14406
716	/var/www/html/images/properties/B27_P10_062066_1.png	14407
717	/var/www/html/images/properties/B27_P10_101166_1.png	14407
718	/var/www/html/images/properties/B27_P10_101166_2.png	14407
719	/var/www/html/images/properties/B27_P11_062978_1.png	14408
720	/var/www/html/images/properties/B27_P11_062978_2.png	14408
721	/var/www/html/images/properties/B27_P11_062978_3.png	14408
722	/var/www/html/images/properties/B27_P11_062978_4.png	14408
723	/var/www/html/images/properties/B27_P11_062978_5.png	14408
724	/var/www/html/images/properties/B27_P11_062978_6.png	14408
725	/var/www/html/images/properties/B27_P11_062978_7.png	14408
726	/var/www/html/images/properties/B27_P11_101877_1.png	14408
727	/var/www/html/images/properties/B27_P11_101877_2.png	14408
728	/var/www/html/images/properties/B27_P11_101877_3.png	14408
729	/var/www/html/images/properties/B27_P11_101877_4.png	14408
730	/var/www/html/images/properties/B27_P11_101877_5.png	14408
731	/var/www/html/images/properties/B27_P11_101877_6.png	14408
732	/var/www/html/images/properties/B27_P12_022167_1.png	14409
733	/var/www/html/images/properties/B27_P12_040974_1.png	14409
734	/var/www/html/images/properties/B27_P12_040974_2.png	14409
735	/var/www/html/images/properties/B27_P12_061274_1.png	14409
736	/var/www/html/images/properties/B27_P12_061274_2.png	14409
737	/var/www/html/images/properties/B27_P12_091565_1.png	14409
738	/var/www/html/images/properties/B27_P12_101868_1.png	14409
739	/var/www/html/images/properties/B27_P12_101868_2.png	14409
740	/var/www/html/images/properties/B27_P13_030667_1.png	14410
741	/var/www/html/images/properties/B27_P13_091565_1.png	14410
742	/var/www/html/images/properties/B27_P14_062968_1.png	14411
743	/var/www/html/images/properties/B27_P14_091565_1.png	14411
744	/var/www/html/images/properties/B27_P15_091565_1.png	14412
745	/var/www/html/images/properties/B27_P15_092668_1.png	14412
746	/var/www/html/images/properties/B27_P16_062068_1.png	14413
747	/var/www/html/images/properties/B27_P16_091565_1.png	14413
748	/var/www/html/images/properties/B27_P17_062968_1.png	14414
749	/var/www/html/images/properties/B27_P17_091565_1.png	14414
750	/var/www/html/images/properties/B27_P18_070668_1.png	14415
751	/var/www/html/images/properties/B27_P18_091565_1.png	14415
752	/var/www/html/images/properties/B27_P19_062968_1.png	14416
753	/var/www/html/images/properties/B27_P1_061068_1.png	14417
754	/var/www/html/images/properties/B27_P1_061576_1.png	14417
755	/var/www/html/images/properties/B27_P1_061576_2.png	14417
756	/var/www/html/images/properties/B27_P1_061576_3.png	14417
757	/var/www/html/images/properties/B27_P1_062066_1.png	14417
758	/var/www/html/images/properties/B27_P1_101266_1.png	14417
759	/var/www/html/images/properties/B27_P20_062768_1.png	14418
760	/var/www/html/images/properties/B27_P20_091565_1.png	14418
761	/var/www/html/images/properties/B27_P21_062268_1.png	14419
762	/var/www/html/images/properties/B27_P21_062268_2.png	14419
763	/var/www/html/images/properties/B27_P21_101066_1.png	14419
764	/var/www/html/images/properties/B27_P22_091565_1.png	14420
765	/var/www/html/images/properties/B27_P22_101066_1.png	14420
766	/var/www/html/images/properties/B27_P23_021867_1.png	14421
767	/var/www/html/images/properties/B27_P23_021867_2.png	14421
768	/var/www/html/images/properties/B27_P23_062768_1.png	14421
769	/var/www/html/images/properties/B27_P24A&P24B_022167_1.png	14422
770	/var/www/html/images/properties/B27_P24A&P24B_062968_1.png	14422
771	/var/www/html/images/properties/B27_P24A&P24B_080368_1.png	14422
772	/var/www/html/images/properties/B27_P24A&P24B_080368_2.png	14422
773	/var/www/html/images/properties/B27_P24A&P24B_091565_1.png	14422
774	/var/www/html/images/properties/B27_P24A&P24B_091565_2.png	14422
775	/var/www/html/images/properties/B27_P25_062468_1.png	14423
776	/var/www/html/images/properties/B27_P25_091565_1.png	14423
777	/var/www/html/images/properties/B27_P26_062468_1.png	14424
778	/var/www/html/images/properties/B27_P26_091565_1.png	14424
779	/var/www/html/images/properties/B27_P27_020267_1.png	14425
780	/var/www/html/images/properties/B27_P27_020267_2.png	14425
781	/var/www/html/images/properties/B27_P27_020267_3.png	14425
782	/var/www/html/images/properties/B27_P27_062468_1.png	14425
783	/var/www/html/images/properties/B27_P27_091565_1.png	14425
784	/var/www/html/images/properties/B27_P28_080368_1.png	14426
785	/var/www/html/images/properties/B27_P28_091565_1.png	14426
786	/var/www/html/images/properties/B27_P29_062968_1.png	14427
787	/var/www/html/images/properties/B27_P29_091565_1.png	14427
788	/var/www/html/images/properties/B27_P2_021976_1.png	14428
789	/var/www/html/images/properties/B27_P2_021976_2.png	14428
790	/var/www/html/images/properties/B27_P2_022576_1.png	14428
791	/var/www/html/images/properties/B27_P2_061068_1.png	14428
792	/var/www/html/images/properties/B27_P2_062066_1.png	14428
793	/var/www/html/images/properties/B27_P2_101166_1.png	14428
794	/var/www/html/images/properties/B27_P3_061068_1.png	14429
795	/var/www/html/images/properties/B27_P3_062066_1.png	14429
796	/var/www/html/images/properties/B27_P4_061068_1.png	14430
797	/var/www/html/images/properties/B27_P4_062066_1.png	14430
798	/var/www/html/images/properties/B27_P5_061068_1.png	14431
799	/var/www/html/images/properties/B27_P5_062066_1.png	14431
800	/var/www/html/images/properties/B27_P6_021867_1.png	14432
801	/var/www/html/images/properties/B27_P6_061568_1.png	14432
802	/var/www/html/images/properties/B27_P6_061568_2.png	14432
803	/var/www/html/images/properties/B27_P6_091565_1.png	14432
804	/var/www/html/images/properties/B27_P6_091565_2.png	14432
805	/var/www/html/images/properties/B27_P7_021567_1.png	14433
806	/var/www/html/images/properties/B27_P7_091565_1.png	14433
807	/var/www/html/images/properties/B27_P8_061568_1.png	14434
808	/var/www/html/images/properties/B27_P8_091565_1.png	14434
809	/var/www/html/images/properties/B28_P10_042368_1.png	14435
810	/var/www/html/images/properties/B28_P10_091565_1.png	14435
811	/var/www/html/images/properties/B28_P11_071868_1.png	14436
812	/var/www/html/images/properties/B28_P11_071868_2.png	14436
813	/var/www/html/images/properties/B28_P11_072968_1.png	14436
814	/var/www/html/images/properties/B28_P11_091565_1.png	14436
815	/var/www/html/images/properties/B28_P12_072068_1.png	14437
816	/var/www/html/images/properties/B28_P12_072068_2.png	14437
817	/var/www/html/images/properties/B28_P12_072068_3.png	14437
818	/var/www/html/images/properties/B28_P12_091565_1.png	14437
819	/var/www/html/images/properties/B28_P13_072568_1.png	14438
820	/var/www/html/images/properties/B28_P13_072568_2.png	14438
821	/var/www/html/images/properties/B28_P13_072568_3.png	14438
822	/var/www/html/images/properties/B28_P13_072968_1.png	14438
823	/var/www/html/images/properties/B28_P13_072968_2.png	14438
824	/var/www/html/images/properties/B28_P13_091565_1.png	14438
825	/var/www/html/images/properties/B28_P14_072068_1.png	14439
826	/var/www/html/images/properties/B28_P14_091565_1.png	14439
827	/var/www/html/images/properties/B28_P14_121666_1.png	14439
828	/var/www/html/images/properties/B28_P14_121666_2.png	14439
829	/var/www/html/images/properties/B28_P15_081470_1.png	14440
830	/var/www/html/images/properties/B28_P15_081770_1.png	14440
831	/var/www/html/images/properties/B28_P16_090469_1.png	14441
832	/var/www/html/images/properties/B28_P18_070668_1.png	14442
833	/var/www/html/images/properties/B28_P18_091565_1.png	14442
834	/var/www/html/images/properties/B28_P19_070568_1.png	14443
835	/var/www/html/images/properties/B28_P19_091565_1.png	14443
836	/var/www/html/images/properties/B28_P1_122972_1.png	14444
837	/var/www/html/images/properties/B28_P1_122972_2.png	14444
838	/var/www/html/images/properties/B28_P1_122972_3.png	14444
839	/var/www/html/images/properties/B28_P1_122972_4.png	14444
840	/var/www/html/images/properties/B28_P1_122972_5.png	14444
841	/var/www/html/images/properties/B28_P20_091565_1.png	14445
842	/var/www/html/images/properties/B28_P20_121466_1.png	14445
843	/var/www/html/images/properties/B28_P21_070668_1.png	14446
844	/var/www/html/images/properties/B28_P21_091565_1.png	14446
845	/var/www/html/images/properties/B28_P22_071168_1.png	14447
846	/var/www/html/images/properties/B28_P22_091565_1.png	14447
847	/var/www/html/images/properties/B28_P23_052368_1.png	14448
848	/var/www/html/images/properties/B28_P23_091565_1.png	14448
849	/var/www/html/images/properties/B28_P3A_012174_1.png	14449
850	/var/www/html/images/properties/B28_P3A_012174_2.png	14449
851	/var/www/html/images/properties/B28_P3A_020674_1.png	14449
852	/var/www/html/images/properties/B28_P4_011874_1.png	14450
853	/var/www/html/images/properties/B28_P4_020674_1.png	14450
854	/var/www/html/images/properties/B28_P5_012174_1.png	14451
855	/var/www/html/images/properties/B28_P5_012174_2.png	14451
856	/var/www/html/images/properties/B28_P5_020674_1.png	14451
857	/var/www/html/images/properties/B28_P6_011974_1.png	14452
858	/var/www/html/images/properties/B28_P6_011974_2.png	14452
859	/var/www/html/images/properties/B28_P6_020674_1.png	14452
860	/var/www/html/images/properties/B28_P7A_070668_1.png	14453
861	/var/www/html/images/properties/B28_P7A_091565_2.png	14453
862	/var/www/html/images/properties/B28_P7B_071368_1.png	14453
863	/var/www/html/images/properties/B28_P7B_091565_1.png	14453
864	/var/www/html/images/properties/B28_P7B_121266_1.png	14453
865	/var/www/html/images/properties/B28_P8_052368_1.png	14454
866	/var/www/html/images/properties/B28_P8_111566_1.png	14454
867	/var/www/html/images/properties/B28_P9_052368_1.png	14455
868	/var/www/html/images/properties/B28_P9_091565_1.png	14455
869	/var/www/html/images/properties/B29_P12_011674_1.png	14456
870	/var/www/html/images/properties/B29_P12_020674_1.png	14456
871	/var/www/html/images/properties/B29_P1_011874_1.png	14457
872	/var/www/html/images/properties/B29_P1_011874_2.png	14457
873	/var/www/html/images/properties/B29_P1_020674_1.png	14457
874	/var/www/html/images/properties/B29_P3_020674_1.png	14458
875	/var/www/html/images/properties/B29_P3_020674_2.png	14458
876	/var/www/html/images/properties/B29_P7_030874_1.png	14459
877	/var/www/html/images/properties/B29_P7_041474_1.png	14459
878	/var/www/html/images/properties/B2_P1_020674_1.png	14460
879	/var/www/html/images/properties/B2_P1_022476_1.png	14460
880	/var/www/html/images/properties/B2_P1_022476_2.png	14460
881	/var/www/html/images/properties/B2_P1_041774_1.png	14460
882	/var/www/html/images/properties/B2_P1_041774_2.png	14460
883	/var/www/html/images/properties/B2_P1_121273_1.png	14460
884	/var/www/html/images/properties/B2_P1_121273_2.png	14460
885	/var/www/html/images/properties/B2_P2_020674_1.png	14461
886	/var/www/html/images/properties/B2_P2_022476_1.png	14461
887	/var/www/html/images/properties/B2_P2_022476_2.png	14461
888	/var/www/html/images/properties/B2_P2_022476_3.png	14461
889	/var/www/html/images/properties/B2_P2_022476_4.png	14461
890	/var/www/html/images/properties/B2_P2_022476_5.png	14461
891	/var/www/html/images/properties/B2_P2_022476_6.png	14461
892	/var/www/html/images/properties/B2_P2_041774_1.png	14461
893	/var/www/html/images/properties/B2_P2_041774_2.png	14461
894	/var/www/html/images/properties/B2_P2_041774_3.png	14461
895	/var/www/html/images/properties/B2_P2_121273_1.png	14461
896	/var/www/html/images/properties/B2_P2_121273_2.png	14461
897	/var/www/html/images/properties/B2_P2_121273_3.png	14461
898	/var/www/html/images/properties/B2_P2_121273_4.png	14461
899	/var/www/html/images/properties/B2_P2_121273_5.png	14461
900	/var/www/html/images/properties/B2_P2_121273_6.png	14461
901	/var/www/html/images/properties/B30_P27_030467_1.png	14462
902	/var/www/html/images/properties/B30_P27_030467_2.png	14462
903	/var/www/html/images/properties/B31_P23_050268_1.png	14463
904	/var/www/html/images/properties/B32_P14_073168_1.png	14464
905	/var/www/html/images/properties/B32_P14_073168_2.png	14464
906	/var/www/html/images/properties/B32_P14_073168_3.png	14464
907	/var/www/html/images/properties/B32_P14_073168_4.png	14464
908	/var/www/html/images/properties/B33_P10_022774_1.png	14465
909	/var/www/html/images/properties/B33_P10_022774_2.png	14465
910	/var/www/html/images/properties/B33_P10_022774_3.png	14465
911	/var/www/html/images/properties/B33_P10_041474_1.png	14465
912	/var/www/html/images/properties/B33_P10_041474_2.png	14465
913	/var/www/html/images/properties/B33_P11_082868_1.png	14466
914	/var/www/html/images/properties/B33_P11_091565_1.png	14466
915	/var/www/html/images/properties/B33_P1_080568_1.png	14467
916	/var/www/html/images/properties/B33_P1_112268_1.png	14467
917	/var/www/html/images/properties/B33_P1_112268_2.png	14467
918	/var/www/html/images/properties/B33_P1_112268_3.png	14467
919	/var/www/html/images/properties/B33_P5_061274_1.png	14468
920	/var/www/html/images/properties/B33_P7_022467_1.png	14469
921	/var/www/html/images/properties/B34_P10_091565_1.png	14470
922	/var/www/html/images/properties/B34_P10_111468_1.png	14470
923	/var/www/html/images/properties/B34_P11_091565_1.png	14471
924	/var/www/html/images/properties/B34_P11_111468_1.png	14471
925	/var/www/html/images/properties/B34_P12_022467_1.png	14472
926	/var/www/html/images/properties/B34_P12_091565_1.png	14472
927	/var/www/html/images/properties/B34_P13_052368_1.png	14473
928	/var/www/html/images/properties/B34_P13_112268_1.png	14473
929	/var/www/html/images/properties/B34_P14_030267_1.png	14474
930	/var/www/html/images/properties/B34_P14_091565_1.png	14474
931	/var/www/html/images/properties/B34_P15_061768_1.png	14475
932	/var/www/html/images/properties/B34_P15_091565_1.png	14475
933	/var/www/html/images/properties/B34_P16_022467_1.png	14476
934	/var/www/html/images/properties/B34_P16_050175_1.png	14476
935	/var/www/html/images/properties/B34_P16_050175_2.png	14476
936	/var/www/html/images/properties/B34_P16_052075_1.png	14476
937	/var/www/html/images/properties/B34_P16_091565_1.png	14476
938	/var/www/html/images/properties/B34_P16_111468_1.png	14476
939	/var/www/html/images/properties/B34_P17_022467_1.png	14477
940	/var/www/html/images/properties/B34_P17_091565_1.png	14477
941	/var/www/html/images/properties/B34_P17_111568_1.png	14477
942	/var/www/html/images/properties/B34_P17_111568_2.png	14477
943	/var/www/html/images/properties/B34_P18_060368_1.png	14478
944	/var/www/html/images/properties/B34_P18_091565_1.png	14478
945	/var/www/html/images/properties/B34_P1_061968_1.png	14479
946	/var/www/html/images/properties/B34_P1_091565_1.png	14479
947	/var/www/html/images/properties/B34_P1_091565_2.png	14479
948	/var/www/html/images/properties/B34_P1_091565_3.png	14479
949	/var/www/html/images/properties/B34_P1_112168_1.png	14479
950	/var/www/html/images/properties/B34_P2_051068_1.png	14480
951	/var/www/html/images/properties/B34_P2_051068_2.png	14480
952	/var/www/html/images/properties/B34_P2_091565_1.png	14480
953	/var/www/html/images/properties/B34_P2_091565_2.png	14480
954	/var/www/html/images/properties/B34_P2_112168_1.png	14480
955	/var/www/html/images/properties/B34_P3_040568_1.png	14481
956	/var/www/html/images/properties/B34_P3_091565_1.png	14481
957	/var/www/html/images/properties/B34_P4_022467_1.png	14482
958	/var/www/html/images/properties/B34_P4_091565_1.png	14482
959	/var/www/html/images/properties/B34_P5_030267_1.png	14483
960	/var/www/html/images/properties/B34_P5_041974_1.png	14483
961	/var/www/html/images/properties/B34_P5_043068_1.png	14483
962	/var/www/html/images/properties/B34_P5_091565_1.png	14483
963	/var/www/html/images/properties/B34_P5_091674_1.png	14483
964	/var/www/html/images/properties/B34_P5_112168_1.png	14483
965	/var/www/html/images/properties/B34_P6_091565_1.png	14484
966	/var/www/html/images/properties/B34_P7_043068_1.png	14485
967	/var/www/html/images/properties/B34_P7_043068_2.png	14485
968	/var/www/html/images/properties/B34_P7_091565_1.png	14485
969	/var/www/html/images/properties/B34_P7_091565_2.png	14485
970	/var/www/html/images/properties/B34_P7_091565_3.png	14485
971	/var/www/html/images/properties/B34_P7_112268_1.png	14485
972	/var/www/html/images/properties/B34_P7_112268_2.png	14485
973	/var/www/html/images/properties/B34_P7_112973_1.png	14485
974	/var/www/html/images/properties/B34_P7_112973_2.png	14485
975	/var/www/html/images/properties/B34_P7_112973_3.png	14485
976	/var/www/html/images/properties/B34_P8_030372_1.png	14486
977	/var/www/html/images/properties/B34_P8_030372_2.png	14486
978	/var/www/html/images/properties/B34_P8_030372_3.png	14486
979	/var/www/html/images/properties/B34_P8_030372_4.png	14486
980	/var/www/html/images/properties/B34_P8_041968_1.png	14486
981	/var/www/html/images/properties/B34_P8_041968_2.png	14486
982	/var/www/html/images/properties/B34_P8_091565_1.png	14486
983	/var/www/html/images/properties/B34_P8_091565_2.png	14486
984	/var/www/html/images/properties/B34_P8_091565_3.png	14486
985	/var/www/html/images/properties/B34_P8_091565_4.png	14486
986	/var/www/html/images/properties/B34_P8_091565_5.png	14486
987	/var/www/html/images/properties/B34_P8_091565_6.png	14486
988	/var/www/html/images/properties/B34_P8_121268_1.png	14486
989	/var/www/html/images/properties/B34_P9_022467_1.png	14487
990	/var/www/html/images/properties/B34_P9_091565_1.png	14487
991	/var/www/html/images/properties/B35_P1_022770_1.png	14488
992	/var/www/html/images/properties/B35_P1_022770_2.png	14488
993	/var/www/html/images/properties/B35_P1_022770_3.png	14488
994	/var/www/html/images/properties/B35_P1_022770_4.png	14488
995	/var/www/html/images/properties/B35_P1_022770_5.png	14488
996	/var/www/html/images/properties/B35_P1_070168_1.png	14488
997	/var/www/html/images/properties/B35_P1_070168_2.png	14488
998	/var/www/html/images/properties/B35_P1_070168_3.png	14488
999	/var/www/html/images/properties/B35_P1_091565_1.png	14488
1000	/var/www/html/images/properties/B35_P1_091565_2.png	14488
1001	/var/www/html/images/properties/B35_P1_091565_3.png	14488
1002	/var/www/html/images/properties/B35_P1_091565_4.png	14488
1003	/var/www/html/images/properties/B35_P1_091565_5.png	14488
1004	/var/www/html/images/properties/B35_P1_091565_6.png	14488
1005	/var/www/html/images/properties/B35_P1_092868_1.png	14488
1006	/var/www/html/images/properties/B35_P1_092868_2.png	14488
1007	/var/www/html/images/properties/B35_P1_092868_3.png	14488
1008	/var/www/html/images/properties/B35_P2_022767_1.png	14489
1009	/var/www/html/images/properties/B35_P2_080568_1.png	14489
1010	/var/www/html/images/properties/B35_P2_091565_1.png	14489
1011	/var/www/html/images/properties/B35_P3_073068_1.png	14490
1012	/var/www/html/images/properties/B35_P3_091565_1.png	14490
1013	/var/www/html/images/properties/B35_P4_091565_1.png	14491
1014	/var/www/html/images/properties/B35_P7_091565_1.png	14492
1015	/var/www/html/images/properties/B35_P8_030267_1.png	14493
1016	/var/www/html/images/properties/B35_P8_073068_1.png	14493
1017	/var/www/html/images/properties/B36_P3A_041474_1.png	14494
1018	/var/www/html/images/properties/B36_P3A_041474_2.png	14494
1019	/var/www/html/images/properties/B36_P3A_041474_3.png	14494
1020	/var/www/html/images/properties/B36_P3B_041474_1.png	14494
1021	/var/www/html/images/properties/B36_P3B_041474_2.png	14494
1022	/var/www/html/images/properties/B36_P3B_041474_3.png	14494
1023	/var/www/html/images/properties/B36_P3B_121175_1.png	14494
1024	/var/www/html/images/properties/B36_P3B_121175_2.png	14494
1025	/var/www/html/images/properties/B36_P3B_121175_3.png	14494
1026	/var/www/html/images/properties/B36_P3B_121175_4.png	14494
1027	/var/www/html/images/properties/B36_P3B_121175_5.png	14494
1028	/var/www/html/images/properties/B36_P3B_121175_6.png	14494
1029	/var/www/html/images/properties/B36_P4_031275_1.png	14495
1030	/var/www/html/images/properties/B36_P4_042975_1.png	14495
1031	/var/www/html/images/properties/B36_P4_042975_2.png	14495
1032	/var/www/html/images/properties/B36_P4_081274_1.png	14495
1033	/var/www/html/images/properties/B36_P4_081274_2.png	14495
1034	/var/www/html/images/properties/B36_P4_081274_3.png	14495
1035	/var/www/html/images/properties/B36_P6_021467_1.png	14496
1036	/var/www/html/images/properties/B36_P6_091565_1.png	14496
1037	/var/www/html/images/properties/B36_P7_021467_1.png	14497
1038	/var/www/html/images/properties/B36_P7_091565_1.png	14497
1039	/var/www/html/images/properties/B36_P8_072068_1.png	14498
1040	/var/www/html/images/properties/B36_P8_091565_1.png	14498
1041	/var/www/html/images/properties/B37_P10_091565_1.png	14499
1042	/var/www/html/images/properties/B37_P10_091565_2.png	14499
1043	/var/www/html/images/properties/B37_P11_052568_1.png	14500
1044	/var/www/html/images/properties/B37_P11_052568_2.png	14500
1045	/var/www/html/images/properties/B37_P11_091565_1.png	14500
1046	/var/www/html/images/properties/B37_P2_061868_1.png	14501
1047	/var/www/html/images/properties/B37_P3A_082668_1.png	14502
1048	/var/www/html/images/properties/B37_P3A_082668_2.png	14502
1049	/var/www/html/images/properties/B37_P3A_082668_3.png	14502
1050	/var/www/html/images/properties/B37_P3A_082668_4.png	14502
1051	/var/www/html/images/properties/B37_P3A_082668_5.png	14502
1052	/var/www/html/images/properties/B37_P3B_042068_1.png	14502
1053	/var/www/html/images/properties/B37_P3B_042068_2.png	14502
1054	/var/www/html/images/properties/B37_P3B_042068_3.png	14502
1055	/var/www/html/images/properties/B37_P3B_042068_4.png	14502
1056	/var/www/html/images/properties/B37_P3B_061269_1.png	14502
1057	/var/www/html/images/properties/B37_P3B_091565_1.png	14502
1058	/var/www/html/images/properties/B37_P3B_091565_2.png	14502
1059	/var/www/html/images/properties/B37_P3B_091565_3.png	14502
1060	/var/www/html/images/properties/B37_P3B_091565_4.png	14502
1061	/var/www/html/images/properties/B37_P3B_091565_5.png	14502
1062	/var/www/html/images/properties/B37_P3B_091565_6.png	14502
1063	/var/www/html/images/properties/B37_P3B_091565_7.png	14502
1064	/var/www/html/images/properties/B37_P4_022767_1.png	14503
1065	/var/www/html/images/properties/B37_P4_091565_1.png	14503
1066	/var/www/html/images/properties/B37_P5_030467_1.png	14504
1067	/var/www/html/images/properties/B37_P5_041768_1.png	14504
1068	/var/www/html/images/properties/B37_P5_091565_1.png	14504
1069	/var/www/html/images/properties/B37_P6_091565_1.png	14505
1070	/var/www/html/images/properties/B37_P7_041268_1.png	14506
1071	/var/www/html/images/properties/B37_P7_091565_1.png	14506
1072	/var/www/html/images/properties/B37_P8_041868_1.png	14507
1073	/var/www/html/images/properties/B37_P8_091565_1.png	14507
1074	/var/www/html/images/properties/B37_P9_052768_1.png	14508
1075	/var/www/html/images/properties/B37_P9_091565_1.png	14508
1076	/var/www/html/images/properties/B38_P13_031275_1.png	14509
1077	/var/www/html/images/properties/B38_P13_031275_2.png	14509
1078	/var/www/html/images/properties/B38_P13_080174_1.png	14509
1079	/var/www/html/images/properties/B38_P15_030775_1.png	14510
1080	/var/www/html/images/properties/B38_P15_030775_2.png	14510
1081	/var/www/html/images/properties/B38_P15_072974_1.png	14510
1082	/var/www/html/images/properties/B38_P16_072474_1.png	14511
1083	/var/www/html/images/properties/B38_P16_072974_1.png	14511
1084	/var/www/html/images/properties/B38_P16_072974_2.png	14511
1085	/var/www/html/images/properties/B38_P17_022774_1.png	14512
1086	/var/www/html/images/properties/B38_P17_041474_1.png	14512
1087	/var/www/html/images/properties/B38_P6_090469_1.png	14513
1088	/var/www/html/images/properties/B38_P6_090669_1.png	14513
1089	/var/www/html/images/properties/B39_P10_031076_1.png	14514
1090	/var/www/html/images/properties/B39_P10_031076_2.png	14514
1091	/var/www/html/images/properties/B39_P11_031975_1.png	14515
1092	/var/www/html/images/properties/B39_P11_031975_2.png	14515
1093	/var/www/html/images/properties/B39_P11_042474_1.png	14515
1094	/var/www/html/images/properties/B39_P11_042474_2.png	14515
1095	/var/www/html/images/properties/B39_P11_042474_3.png	14515
1096	/var/www/html/images/properties/B39_P15A_080174_1.png	14516
1097	/var/www/html/images/properties/B39_P15A_092474_1.png	14516
1098	/var/www/html/images/properties/B39_P15B_080674_1.png	14516
1099	/var/www/html/images/properties/B39_P15B_100874_1.png	14516
1100	/var/www/html/images/properties/B39_P16_010269_1.png	14517
1101	/var/www/html/images/properties/B39_P16_010770_1.png	14517
1102	/var/www/html/images/properties/B39_P17_092474_1.png	14518
1103	/var/www/html/images/properties/B39_P17_092474_2.png	14518
1104	/var/www/html/images/properties/B39_P17_100174_1.png	14518
1105	/var/www/html/images/properties/B39_P17_100174_2.png	14518
1106	/var/www/html/images/properties/B39_P17_100174_3.png	14518
1107	/var/www/html/images/properties/B3_P11_091168_1.png	14519
1108	/var/www/html/images/properties/B3_P11_091565_1.png	14519
1109	/var/www/html/images/properties/B3_P13_062066_1.png	14520
1110	/var/www/html/images/properties/B3_P13_071668_1.png	14520
1111	/var/www/html/images/properties/B3_P14_010767_1.png	14521
1112	/var/www/html/images/properties/B3_P15_010767_1.png	14522
1113	/var/www/html/images/properties/B3_P15_061674_1.png	14522
1114	/var/www/html/images/properties/B3_P15_091168_1.png	14522
1115	/var/www/html/images/properties/B3_P15_091168_2.png	14522
1116	/var/www/html/images/properties/B3_P15_091565_1.png	14522
1117	/var/www/html/images/properties/B3_P16_081168_1.png	14523
1118	/var/www/html/images/properties/B3_P16_091565_1.png	14523
1119	/var/www/html/images/properties/B3_P17_071668_1.png	14524
1120	/var/www/html/images/properties/B3_P17_091468_1.png	14524
1121	/var/www/html/images/properties/B3_P18_091565_1.png	14525
1122	/var/www/html/images/properties/B3_P18_091668_1.png	14525
1123	/var/www/html/images/properties/B3_P19_071568_1.png	14526
1124	/var/www/html/images/properties/B3_P19_091565_1.png	14526
1125	/var/www/html/images/properties/B3_P1_011467_1.png	1
1126	/var/www/html/images/properties/B3_P1_080668_1.png	1
1127	/var/www/html/images/properties/B3_P1_080668_2.png	1
1128	/var/www/html/images/properties/B3_P1_091565_1.png	1
1129	/var/www/html/images/properties/B3_P1_091565_2.png	1
1130	/var/www/html/images/properties/B3_P20_091368_1.PNG	14527
1131	/var/www/html/images/properties/B3_P20_091565_1.png	14527
1132	/var/www/html/images/properties/B3_P21_091468_1.png	14528
1133	/var/www/html/images/properties/B3_P21_091565_1.png	14528
1134	/var/www/html/images/properties/B3_P22_011167_1.png	14529
1135	/var/www/html/images/properties/B3_P22_091868_1.png	14529
1136	/var/www/html/images/properties/B3_P23_071568_1.png	14530
1137	/var/www/html/images/properties/B3_P23_091468_1.png	14530
1138	/var/www/html/images/properties/B3_P24_083168_1.png	14531
1139	/var/www/html/images/properties/B3_P24_083168_2.png	14531
1140	/var/www/html/images/properties/B3_P24_091565_1.png	14531
1141	/var/www/html/images/properties/B3_P25_011367_1.png	14532
1142	/var/www/html/images/properties/B3_P25_091565_1.png	14532
1143	/var/www/html/images/properties/B3_P2_061868_1.png	14533
1144	/var/www/html/images/properties/B3_P2_061868_2.png	14533
1145	/var/www/html/images/properties/B3_P2_090668_1.png	14533
1146	/var/www/html/images/properties/B3_P2_091565_1.png	14533
1147	/var/www/html/images/properties/B3_P2_091565_2.png	14533
1148	/var/www/html/images/properties/B3_P2_091565_3.png	14533
1149	/var/www/html/images/properties/B3_P2_102175_1.png	14533
1150	/var/www/html/images/properties/B3_P2_102175_2.png	14533
1151	/var/www/html/images/properties/B3_P2_102175_3.png	14533
1152	/var/www/html/images/properties/B3_P2_102175_4.png	14533
1153	/var/www/html/images/properties/B3_P2_102175_5.png	14533
1154	/var/www/html/images/properties/B3_P2_102175_6.png	14533
1155	/var/www/html/images/properties/B3_P2_102375_1.png	14533
1156	/var/www/html/images/properties/B3_P2_102375_2.png	14533
1157	/var/www/html/images/properties/B3_P2_102375_3.png	14533
1158	/var/www/html/images/properties/B3_P2_102375_4.png	14533
1159	/var/www/html/images/properties/B3_P2_102375_5.png	14533
1160	/var/www/html/images/properties/B3_P3_053168_1.png	14534
1161	/var/www/html/images/properties/B3_P3_090668_1.png	14534
1162	/var/www/html/images/properties/B3_P3_091565_1.png	14534
1163	/var/www/html/images/properties/B3_P3_102175_1.png	14534
1164	/var/www/html/images/properties/B3_P3_102175_2.png	14534
1165	/var/www/html/images/properties/B3_P3_102175_3.png	14534
1166	/var/www/html/images/properties/B3_P3_102375_1.png	14534
1167	/var/www/html/images/properties/B3_P3_102375_2.png	14534
1168	/var/www/html/images/properties/B3_P4_090768_1.png	14535
1169	/var/www/html/images/properties/B3_P4_091565_1.png	14535
1170	/var/www/html/images/properties/B3_P5_090668_1.png	14536
1171	/var/www/html/images/properties/B3_P5_091565_1.png	14536
1172	/var/www/html/images/properties/B3_P6_090768_1.png	14537
1173	/var/www/html/images/properties/B3_P6_091565_1.png	14537
1174	/var/www/html/images/properties/B3_P7_011267_1.png	14538
1175	/var/www/html/images/properties/B3_P7_091565_1.png	14538
1176	/var/www/html/images/properties/B3_P8_011067_1.png	14539
1177	/var/www/html/images/properties/B3_P8_020570_1.png	14539
1178	/var/www/html/images/properties/B3_P8_020570_2.png	14539
1179	/var/www/html/images/properties/B3_P8_020570_3.PNG	14539
1180	/var/www/html/images/properties/B3_P8_091565_1.png	14539
1181	/var/www/html/images/properties/B3_P9_090768_1.png	14540
1182	/var/www/html/images/properties/B3_P9_091565_1.png	14540
1183	/var/www/html/images/properties/B40_P10_082068_1.png	14541
1184	/var/www/html/images/properties/B40_P10_082068_2.png	14541
1185	/var/www/html/images/properties/B40_P10_091565_1.png	14541
1186	/var/www/html/images/properties/B40_P10_091565_2.png	14541
1187	/var/www/html/images/properties/B40_P11_050968_1.png	14542
1188	/var/www/html/images/properties/B40_P11_091565_1.png	14542
1189	/var/www/html/images/properties/B40_P12_042474_1.png	14543
1190	/var/www/html/images/properties/B40_P12_042474_2.png	14543
1191	/var/www/html/images/properties/B40_P12_050868_1.png	14543
1192	/var/www/html/images/properties/B40_P12_070368_1.png	14543
1193	/var/www/html/images/properties/B40_P12_070368_2.png	14543
1194	/var/www/html/images/properties/B40_P12_070368_3.png	14543
1195	/var/www/html/images/properties/B40_P12_070368_4.png	14543
1196	/var/www/html/images/properties/B40_P12_091565_1.png	14543
1197	/var/www/html/images/properties/B40_P13_050968_1.png	14544
1198	/var/www/html/images/properties/B40_P13_071568_1.png	14544
1199	/var/www/html/images/properties/B40_P14_030674_1.png	14545
1200	/var/www/html/images/properties/B40_P14_030674_2.png	14545
1201	/var/www/html/images/properties/B40_P14_041474_1.png	14545
1202	/var/www/html/images/properties/B40_P15_051658_1.png	14546
1203	/var/www/html/images/properties/B40_P15_051658_2.png	14546
1204	/var/www/html/images/properties/B40_P15_080768_1.png	14546
1205	/var/www/html/images/properties/B40_P15_091565_1.png	14546
1206	/var/www/html/images/properties/B40_P16_072474_1.png	14547
1207	/var/www/html/images/properties/B40_P16_073074_1.png	14547
1208	/var/www/html/images/properties/B40_P16_073074_2.png	14547
1209	/var/www/html/images/properties/B40_P17_122972_1.png	14548
1210	/var/www/html/images/properties/B40_P17_122972_2.png	14548
1211	/var/www/html/images/properties/B40_P17_122972_3.png	14548
1212	/var/www/html/images/properties/B40_P17_122972_4.png	14548
1213	/var/www/html/images/properties/B40_P18_030675_1.png	14549
1214	/var/www/html/images/properties/B40_P18_030675_2.png	14549
1215	/var/www/html/images/properties/B40_P18_030675_3.png	14549
1216	/var/www/html/images/properties/B40_P18_030675_4.png	14549
1217	/var/www/html/images/properties/B40_P18_030675_5.png	14549
1218	/var/www/html/images/properties/B40_P18_071476_1.png	14549
1219	/var/www/html/images/properties/B40_P18_071476_2.png	14549
1220	/var/www/html/images/properties/B40_P18_071476_3.png	14549
1221	/var/www/html/images/properties/B40_P18_071476_4.png	14549
1222	/var/www/html/images/properties/B40_P18_071476_5.png	14549
1223	/var/www/html/images/properties/B40_P18_071476_6.png	14549
1224	/var/www/html/images/properties/B40_P18_071476_7.png	14549
1225	/var/www/html/images/properties/B40_P18_071476_8.png	14549
1226	/var/www/html/images/properties/B40_P18_071476_9.png	14549
1227	/var/www/html/images/properties/B40_P18_073074_1.png	14549
1228	/var/www/html/images/properties/B40_P18_073074_2.png	14549
1229	/var/www/html/images/properties/B40_P18_073074_3.png	14549
1230	/var/www/html/images/properties/B40_P19_010875_1.png	14550
1231	/var/www/html/images/properties/B40_P19_022475_1.png	14550
1232	/var/www/html/images/properties/B40_P20_030375_1.png	14551
1233	/var/www/html/images/properties/B40_P20_030375_2.png	14551
1234	/var/www/html/images/properties/B40_P20_073074_1.png	14551
1235	/var/www/html/images/properties/B40_P21_111874_1.png	14552
1236	/var/www/html/images/properties/B40_P21_112074_1.png	14552
1237	/var/www/html/images/properties/B40_P21_112074_2.png	14552
1238	/var/www/html/images/properties/B40_P22_111474_1.png	14553
1239	/var/www/html/images/properties/B40_P22_111474_2.png	14553
1240	/var/www/html/images/properties/B40_P22_121174_1.png	14553
1241	/var/www/html/images/properties/B40_P22_121274_1.png	14553
1242	/var/www/html/images/properties/B40_P23_121874_1.png	14554
1243	/var/www/html/images/properties/B40_P23_121874_2.png	14554
1244	/var/www/html/images/properties/B40_P24_062066_1.png	14555
1245	/var/www/html/images/properties/B40_P24_080768_1.png	14555
1246	/var/www/html/images/properties/B40_P25_020570_1.png	14556
1247	/var/www/html/images/properties/B40_P25_062066_1.png	14556
1248	/var/www/html/images/properties/B40_P25_080768_1.png	14556
1249	/var/www/html/images/properties/B40_P25_121175_1.png	14556
1250	/var/www/html/images/properties/B40_P25_121175_2.png	14556
1251	/var/www/html/images/properties/B40_P25_121175_3.png	14556
1252	/var/www/html/images/properties/B40_P26_120975_1.png	14557
1253	/var/www/html/images/properties/B40_P26_120975_2.png	14557
1254	/var/www/html/images/properties/B40_P26_120975_3.png	14557
1255	/var/www/html/images/properties/B40_P26_120975_4.png	14557
1256	/var/www/html/images/properties/B40_P26_120975_5.png	14557
1257	/var/www/html/images/properties/B40_P26_120975_6.png	14557
1258	/var/www/html/images/properties/B40_P27_020570_1.png	14558
1259	/var/www/html/images/properties/B40_P27_022367_1.png	14558
1260	/var/www/html/images/properties/B40_P27_080768_1.png	14558
1261	/var/www/html/images/properties/B40_P27_091565_1.png	14558
1262	/var/www/html/images/properties/B40_P28_080868_1.png	14559
1263	/var/www/html/images/properties/B40_P28_091565_1.png	14559
1264	/var/www/html/images/properties/B40_P29_020570_1.png	14560
1265	/var/www/html/images/properties/B40_P29_022467_1.png	14560
1266	/var/www/html/images/properties/B40_P29_080768_1.png	14560
1267	/var/www/html/images/properties/B40_P29_091565_1.png	14560
1268	/var/www/html/images/properties/B40_P4_042474_1.png	14561
1269	/var/www/html/images/properties/B40_P4_042474_2.png	14561
1270	/var/www/html/images/properties/B40_P4_100874_1.png	14561
1271	/var/www/html/images/properties/B40_P5_030575_1.png	14562
1272	/var/www/html/images/properties/B40_P5_030575_2.png	14562
1273	/var/www/html/images/properties/B40_P5_030575_3.png	14562
1274	/var/www/html/images/properties/B40_P5_030575_4.png	14562
1275	/var/www/html/images/properties/B40_P5_080674_1.png	14562
1276	/var/www/html/images/properties/B40_P5_080674_2.png	14562
1277	/var/www/html/images/properties/B40_P5_080674_3.png	14562
1278	/var/www/html/images/properties/B40_P7_012167_1.png	14563
1279	/var/www/html/images/properties/B41_P10_050675_1.png	14564
1280	/var/www/html/images/properties/B41_P10_050675_2.png	14564
1281	/var/www/html/images/properties/B41_P10_050675_3.png	14564
1282	/var/www/html/images/properties/B41_P10_051068_1.png	14564
1283	/var/www/html/images/properties/B41_P10_051068_2.png	14564
1284	/var/www/html/images/properties/B41_P10_051675_1.png	14564
1285	/var/www/html/images/properties/B41_P10_070268_1.png	14564
1286	/var/www/html/images/properties/B41_P10_070268_2.png	14564
1287	/var/www/html/images/properties/B41_P10_091565_1.png	14564
1288	/var/www/html/images/properties/B41_P10_091565_2.png	14564
1289	/var/www/html/images/properties/B41_P11_030475_1.png	14565
1290	/var/www/html/images/properties/B41_P11_030475_2.png	14565
1291	/var/www/html/images/properties/B41_P11_080174_1.png	14565
1292	/var/www/html/images/properties/B41_P11_080174_2.png	14565
1293	/var/www/html/images/properties/B41_P12_082074_1.png	14566
1294	/var/www/html/images/properties/B41_P12_100874_1.png	14566
1295	/var/www/html/images/properties/B41_P8_030370_1.png	14567
1296	/var/www/html/images/properties/B41_P8_080868_1.png	14567
1297	/var/www/html/images/properties/B41_P8_080868_2.png	14567
1298	/var/www/html/images/properties/B41_P8_091565_1.png	14567
1299	/var/www/html/images/properties/B41_P9_052268_1.png	14568
1300	/var/www/html/images/properties/B41_P9_070268_1.png	14568
1301	/var/www/html/images/properties/B41_P9_091565_1.png	14568
1302	/var/www/html/images/properties/B42_P13_070968_1.png	14569
1303	/var/www/html/images/properties/B42_P13_070968_2.png	14569
1304	/var/www/html/images/properties/B42_P13_080968_1.png	14569
1305	/var/www/html/images/properties/B42_P13_091565_1.png	14569
1306	/var/www/html/images/properties/B42_P13_091565_2.png	14569
1307	/var/www/html/images/properties/B42_P14_030176_1.png	14570
1308	/var/www/html/images/properties/B42_P14_030176_2.png	14570
1309	/var/www/html/images/properties/B42_P14_030176_3.png	14570
1310	/var/www/html/images/properties/B42_P14_030176_4.png	14570
1311	/var/www/html/images/properties/B42_P14_030176_5.png	14570
1312	/var/www/html/images/properties/B42_P14_092474_1.png	14570
1313	/var/www/html/images/properties/B42_P18_081674_1.png	14571
1314	/var/www/html/images/properties/B42_P18_081674_2.png	14571
1315	/var/www/html/images/properties/B42_P18_100874_1.png	14571
1316	/var/www/html/images/properties/B42_P4_072974_1.png	14572
1317	/var/www/html/images/properties/B42_P4_092474_1.png	14572
1318	/var/www/html/images/properties/B42_P5_052374_1.png	14573
1319	/var/www/html/images/properties/B42_P5_121775_1.png	14573
1320	/var/www/html/images/properties/B42_P5_121775_2.png	14573
1321	/var/www/html/images/properties/B42_P5_121775_3.png	14573
1322	/var/www/html/images/properties/B43_P10_050175_1.png	14574
1323	/var/www/html/images/properties/B43_P10_050175_2.png	14574
1324	/var/www/html/images/properties/B43_P10_050175_3.png	14574
1325	/var/www/html/images/properties/B43_P10_082074_1.png	14574
1326	/var/www/html/images/properties/B43_P11_081968_1.png	14575
1327	/var/www/html/images/properties/B43_P11_091565_1.png	14575
1328	/var/www/html/images/properties/B43_P12_062668_1.png	14576
1329	/var/www/html/images/properties/B43_P12_091565_2.png	14576
1330	/var/www/html/images/properties/B43_P14_040868_1.png	14577
1331	/var/www/html/images/properties/B43_P14_062568_1.png	14577
1332	/var/www/html/images/properties/B43_P14_091565_1.png	14577
1333	/var/www/html/images/properties/B43_P14_091565_2.png	14577
1334	/var/www/html/images/properties/B43_P14_091565_3.png	14577
1335	/var/www/html/images/properties/B43_P15_072076_1.png	14578
1336	/var/www/html/images/properties/B43_P15_072076_2.png	14578
1337	/var/www/html/images/properties/B43_P15_072076_3.png	14578
1338	/var/www/html/images/properties/B43_P15_072076_4.png	14578
1339	/var/www/html/images/properties/B43_P15_080476_1.png	14578
1340	/var/www/html/images/properties/B43_P15_080476_2.png	14578
1341	/var/www/html/images/properties/B43_P16_041368_1.png	14579
1342	/var/www/html/images/properties/B43_P16_062768_1.png	14579
1343	/var/www/html/images/properties/B43_P17_082674_1.png	14580
1344	/var/www/html/images/properties/B43_P17_082674_2.png	14580
1345	/var/www/html/images/properties/B43_P17_092474_1.png	14580
1346	/var/www/html/images/properties/B43_P1_040368_1.png	14581
1347	/var/www/html/images/properties/B43_P1_091565_1.png	14581
1348	/var/www/html/images/properties/B43_P1_091565_2.png	14581
1349	/var/www/html/images/properties/B43_P1_091565_3.png	14581
1350	/var/www/html/images/properties/B43_P1_091768_1.png	14581
1351	/var/www/html/images/properties/B43_P23_041668_1.png	14582
1352	/var/www/html/images/properties/B43_P23_041668_2.png	14582
1353	/var/www/html/images/properties/B43_P24_111374_1.png	14583
1354	/var/www/html/images/properties/B43_P24_111974_1.png	14583
1355	/var/www/html/images/properties/B43_P24_120674_1.png	14583
1356	/var/www/html/images/properties/B43_P24_120674_2.png	14583
1357	/var/www/html/images/properties/B43_P26_111974_1.png	14584
1358	/var/www/html/images/properties/B43_P26_121174_1.png	14584
1359	/var/www/html/images/properties/B43_P26_121174_2.png	14584
1360	/var/www/html/images/properties/B43_P2_041968_1.png	14585
1361	/var/www/html/images/properties/B43_P2_041968_2.png	14585
1362	/var/www/html/images/properties/B43_P2_083068_1.png	14585
1363	/var/www/html/images/properties/B43_P2_091565_1.png	14585
1364	/var/www/html/images/properties/B43_P2_091565_2.png	14585
1365	/var/www/html/images/properties/B43_P30_030674_1.png	14586
1366	/var/www/html/images/properties/B43_P30_041474_1.png	14586
1367	/var/www/html/images/properties/B43_P32_022370_1.png	14587
1368	/var/www/html/images/properties/B43_P32_022370_10.png	14587
1369	/var/www/html/images/properties/B43_P32_022370_11.png	14587
1370	/var/www/html/images/properties/B43_P32_022370_2.png	14587
1371	/var/www/html/images/properties/B43_P32_022370_3.png	14587
1372	/var/www/html/images/properties/B43_P32_022370_4.png	14587
1373	/var/www/html/images/properties/B43_P32_022370_5.png	14587
1374	/var/www/html/images/properties/B43_P32_022370_6.png	14587
1375	/var/www/html/images/properties/B43_P32_022370_7.png	14587
1376	/var/www/html/images/properties/B43_P32_022370_8.png	14587
1377	/var/www/html/images/properties/B43_P32_022370_9.png	14587
1378	/var/www/html/images/properties/B43_P32_081770_1.png	14587
1379	/var/www/html/images/properties/B43_P32_081870_1.png	14587
1380	/var/www/html/images/properties/B43_P33A_041668_1.png	14588
1381	/var/www/html/images/properties/B43_P33A_091565_1.png	14588
1382	/var/www/html/images/properties/B43_P33B_041668_1.png	14588
1383	/var/www/html/images/properties/B43_P34_041668_1.png	14589
1384	/var/www/html/images/properties/B43_P34_091565_1.png	14589
1385	/var/www/html/images/properties/B43_P35_041668_1.png	14590
1386	/var/www/html/images/properties/B43_P35_091565_1.png	14590
1387	/var/www/html/images/properties/B43_P3_041268_1.png	14591
1388	/var/www/html/images/properties/B43_P3_080268_1.png	14591
1389	/var/www/html/images/properties/B43_P4_041268_1.png	14592
1390	/var/www/html/images/properties/B43_P4_041268_2.png	14592
1391	/var/www/html/images/properties/B43_P4_041268_3.png	14592
1392	/var/www/html/images/properties/B43_P4_090368_1.png	14592
1393	/var/www/html/images/properties/B43_P4_091565_1.png	14592
1394	/var/www/html/images/properties/B43_P4_091565_2.png	14592
1395	/var/www/html/images/properties/B43_P4_091565_3.png	14592
1396	/var/www/html/images/properties/B43_P5_010667_1.png	14593
1397	/var/www/html/images/properties/B43_P5_091565_1.png	14593
1398	/var/www/html/images/properties/B43_P9_072277_1.png	14594
1399	/var/www/html/images/properties/B43_P9_072277_2.png	14594
1400	/var/www/html/images/properties/B43_P9_081277_1.png	14594
1401	/var/www/html/images/properties/B43_P9_081277_2.png	14594
1402	/var/www/html/images/properties/B44_P10_012367_1.png	14595
1403	/var/www/html/images/properties/B44_P10_091565_1.png	14595
1404	/var/www/html/images/properties/B44_P11_052968_1.png	14596
1405	/var/www/html/images/properties/B44_P11_091565_1.png	14596
1406	/var/www/html/images/properties/B44_P12_071675_1.png	14597
1407	/var/www/html/images/properties/B44_P12_071675_2.png	14597
1408	/var/www/html/images/properties/B44_P12_071675_3.png	14597
1409	/var/www/html/images/properties/B44_P12_071675_4.png	14597
1410	/var/www/html/images/properties/B44_P12_091565_1.png	14597
1411	/var/www/html/images/properties/B44_P13_052968_1.png	14598
1412	/var/www/html/images/properties/B44_P13_091565_1.png	14598
1413	/var/www/html/images/properties/B44_P14_052868_1.png	14599
1414	/var/www/html/images/properties/B44_P14_091565_1.png	14599
1415	/var/www/html/images/properties/B44_P15_012467_1.png	14600
1416	/var/www/html/images/properties/B44_P15_012467_2.png	14600
1417	/var/www/html/images/properties/B44_P15_091565_1.png	14600
1418	/var/www/html/images/properties/B44_P17_052868_1.png	14601
1419	/var/www/html/images/properties/B44_P17_091565_1.png	14601
1420	/var/www/html/images/properties/B44_P18_P20_P21_P22_P23_120176_1.png	14602
1421	/var/www/html/images/properties/B44_P18_P20_P21_P22_P23_120176_2.png	14602
1422	/var/www/html/images/properties/B44_P18_P20_P21_P22_P23_120176_3.png	14602
1423	/var/www/html/images/properties/B44_P18_P20_P21_P22_P23_120176_4.png	14602
1424	/var/www/html/images/properties/B44_P18_P20_P21_P22_P23_120176_5.png	14602
1425	/var/www/html/images/properties/B44_P18_P20_P21_P22_P23_120176_6.png	14602
1426	/var/www/html/images/properties/B44_P18_P20_P21_P22_P23_120176_7.png	14602
1427	/var/www/html/images/properties/B44_P18_P20_P21_P22_P23_121676_1.png	14602
1428	/var/www/html/images/properties/B44_P18_P20_P21_P22_P23_121676_2.png	14602
1429	/var/www/html/images/properties/B44_P18_P20_P21_P22_P23_121676_3.png	14602
1430	/var/www/html/images/properties/B44_P18_P20_P21_P22_P23_121676_4.png	14602
1431	/var/www/html/images/properties/B44_P18_P20_P21_P22_P23_121676_5.png	14602
1432	/var/www/html/images/properties/B44_P18_P20_P21_P22_P23_121676_6.png	14602
1433	/var/www/html/images/properties/B44_P18_P20_P21_P22_P23_121676_7.png	14602
1434	/var/www/html/images/properties/B44_P1_040468_1.png	14603
1435	/var/www/html/images/properties/B44_P1_091565_1.png	14603
1436	/var/www/html/images/properties/B44_P1_121275_1.png	14603
1437	/var/www/html/images/properties/B44_P1_121275_2.png	14603
1438	/var/www/html/images/properties/B44_P1_121275_3.png	14603
1439	/var/www/html/images/properties/B44_P24_040368_1.png	14604
1440	/var/www/html/images/properties/B44_P24_091565_1.png	14604
1441	/var/www/html/images/properties/B44_P25_091565_1.png	14605
1442	/var/www/html/images/properties/B44_P26_062068_1.png	14606
1443	/var/www/html/images/properties/B44_P26_091565_1.png	14606
1444	/var/www/html/images/properties/B44_P2_040368_1.png	14607
1445	/var/www/html/images/properties/B44_P2_091565_1.png	14607
1446	/var/www/html/images/properties/B44_P3_032968_1.png	14608
1447	/var/www/html/images/properties/B44_P3_032968_2.png	14608
1448	/var/www/html/images/properties/B44_P3_081968_1.png	14608
1449	/var/www/html/images/properties/B44_P3_091565_1.png	14608
1450	/var/www/html/images/properties/B44_P3_091565_2.png	14608
1451	/var/www/html/images/properties/B44_P4_040368_1.png	14609
1452	/var/www/html/images/properties/B44_P4_091565_1.png	14609
1453	/var/www/html/images/properties/B44_P5_032174_1.png	14610
1454	/var/www/html/images/properties/B44_P5_032174_2.png	14610
1455	/var/www/html/images/properties/B44_P5_041474_1.png	14610
1456	/var/www/html/images/properties/B44_P6_040368_1.png	14611
1457	/var/www/html/images/properties/B44_P6_091565_1.png	14611
1458	/var/www/html/images/properties/B44_P7_041568_1.png	14612
1459	/var/www/html/images/properties/B44_P7_091565_1.png	14612
1460	/var/www/html/images/properties/B44_P8_062468_1.png	14613
1461	/var/www/html/images/properties/B44_P8_091565_1.png	14613
1462	/var/www/html/images/properties/B44_P9_012567_1.png	14614
1463	/var/www/html/images/properties/B44_P9_091565_1.png	14614
1464	/var/www/html/images/properties/B45_P10_053168_1.png	14615
1465	/var/www/html/images/properties/B45_P10_091565_1.png	14615
1466	/var/www/html/images/properties/B45_P11_060568_1.png	14616
1467	/var/www/html/images/properties/B45_P11_080868_1.png	14616
1468	/var/www/html/images/properties/B45_P11_091565_1.png	14616
1469	/var/www/html/images/properties/B45_P11_091565_2.png	14616
1470	/var/www/html/images/properties/B45_P11_091565_3.png	14616
1471	/var/www/html/images/properties/B45_P13_020467_1.png	14617
1472	/var/www/html/images/properties/B45_P13_091565_1.png	14617
1473	/var/www/html/images/properties/B45_P14_061768_1.png	14618
1474	/var/www/html/images/properties/B45_P14_081168_1.png	14618
1475	/var/www/html/images/properties/B45_P15_060668_1.png	14619
1476	/var/www/html/images/properties/B45_P15_060668_2.png	14619
1477	/var/www/html/images/properties/B45_P15_091565_1.png	14619
1478	/var/www/html/images/properties/B45_P16_013167_1.png	14620
1479	/var/www/html/images/properties/B45_P16_091565_1.png	14620
1480	/var/www/html/images/properties/B45_P17_020667_1.png	14621
1481	/var/www/html/images/properties/B45_P17_091565_1.png	14621
1482	/var/www/html/images/properties/B45_P18_061268_1.png	14622
1483	/var/www/html/images/properties/B45_P18_091565_1.png	14622
1484	/var/www/html/images/properties/B45_P19_020167_1.png	14623
1485	/var/www/html/images/properties/B45_P19_060668_1.png	14623
1486	/var/www/html/images/properties/B45_P20_013167_1.png	14624
1487	/var/www/html/images/properties/B45_P20_091565_1.png	14624
1488	/var/www/html/images/properties/B45_P21_060568_1.png	14625
1489	/var/www/html/images/properties/B45_P21_091565_1.png	14625
1490	/var/www/html/images/properties/B45_P22_060568_1.png	14626
1491	/var/www/html/images/properties/B45_P22_091565_1.png	14626
1492	/var/www/html/images/properties/B45_P23_060368_1.png	14627
1493	/var/www/html/images/properties/B45_P23_091565_1.png	14627
1494	/var/www/html/images/properties/B45_P24_060368_1.png	14628
1495	/var/www/html/images/properties/B45_P24_091565_1.png	14628
1496	/var/www/html/images/properties/B45_P25_013067_1.png	14629
1497	/var/www/html/images/properties/B45_P26_091565_1.png	14630
1498	/var/www/html/images/properties/B45_P27_052868_1.png	14631
1499	/var/www/html/images/properties/B45_P27_091565_1.png	14631
1500	/var/www/html/images/properties/B45_P28_060668_1.png	14632
1501	/var/www/html/images/properties/B45_P28_091565_1.png	14632
1502	/var/www/html/images/properties/B45_P29_012767_1.png	14633
1503	/var/www/html/images/properties/B45_P29_012767_2.png	14633
1504	/var/www/html/images/properties/B45_P29_052968_1.png	14633
1505	/var/www/html/images/properties/B45_P29_091565_1.png	14633
1506	/var/www/html/images/properties/B45_P2_052468_1.png	14634
1507	/var/www/html/images/properties/B45_P2_091565_1.png	14634
1508	/var/www/html/images/properties/B45_P30_020167_1.png	14635
1509	/var/www/html/images/properties/B45_P30_052968_1.png	14635
1510	/var/www/html/images/properties/B45_P31_061668_1.png	14636
1511	/var/www/html/images/properties/B45_P31_091565_1.png	14636
1512	/var/www/html/images/properties/B45_P32_060368_1.png	14637
1513	/var/www/html/images/properties/B45_P32_091565_1.png	14637
1514	/var/www/html/images/properties/B45_P33_012467_1.png	14638
1515	/var/www/html/images/properties/B45_P33_091565_1.png	14638
1516	/var/www/html/images/properties/B45_P34_052768_1.png	14639
1517	/var/www/html/images/properties/B45_P34_091565_1.png	14639
1518	/var/www/html/images/properties/B45_P3_012267_1.png	14640
1519	/var/www/html/images/properties/B45_P3_052568_1.png	14640
1520	/var/www/html/images/properties/B45_P4_012267_1.png	14641
1521	/var/www/html/images/properties/B45_P4_091565_1.png	14641
1522	/var/www/html/images/properties/B45_P5_012267_1.png	14642
1523	/var/www/html/images/properties/B45_P5_091565_1.png	14642
1524	/var/www/html/images/properties/B45_P6_052768_1.png	14643
1525	/var/www/html/images/properties/B45_P6_091565_1.png	14643
1526	/var/www/html/images/properties/B45_P7_012267_1.png	14644
1527	/var/www/html/images/properties/B45_P7_091565_1.png	14644
1528	/var/www/html/images/properties/B45_P8_082668_1.png	14645
1529	/var/www/html/images/properties/B45_P8_091565_1.png	14645
1530	/var/www/html/images/properties/B45_P9_012367_1.png	14646
1531	/var/www/html/images/properties/B45_P9_053168_1.png	14646
1532	/var/www/html/images/properties/B45_P9_091565_1.png	14646
1533	/var/www/html/images/properties/B45_P9_091565_2.png	14646
1534	/var/www/html/images/properties/B45_P9_091565_3.png	14646
1535	/var/www/html/images/properties/B46_P10_041974_1.png	14647
1536	/var/www/html/images/properties/B46_P10_052768_1.png	14647
1537	/var/www/html/images/properties/B46_P10_061274_1.png	14647
1538	/var/www/html/images/properties/B46_P10_091565_1.png	14647
1539	/var/www/html/images/properties/B46_P11_011867_1.png	14648
1540	/var/www/html/images/properties/B46_P11_091565_1.png	14648
1541	/var/www/html/images/properties/B46_P12_011867_1.png	14649
1542	/var/www/html/images/properties/B46_P12_091565_1.png	14649
1543	/var/www/html/images/properties/B46_P13_061268_1.png	14650
1544	/var/www/html/images/properties/B46_P13_091565_1.png	14650
1545	/var/www/html/images/properties/B46_P15_012067_1.png	14651
1546	/var/www/html/images/properties/B46_P15_061274_1.png	14651
1547	/var/www/html/images/properties/B46_P15_091565_1.png	14651
1548	/var/www/html/images/properties/B46_P15_091565_2.png	14651
1549	/var/www/html/images/properties/B46_P15_091565_3.png	14651
1550	/var/www/html/images/properties/B46_P15_091565_4.png	14651
1551	/var/www/html/images/properties/B46_P15_091565_5.png	14651
1552	/var/www/html/images/properties/B46_P16_061768_1.png	14652
1553	/var/www/html/images/properties/B46_P16_091565_1.png	14652
1554	/var/www/html/images/properties/B46_P17_061368_1.png	14653
1555	/var/www/html/images/properties/B46_P17_091565_1.png	14653
1556	/var/www/html/images/properties/B46_P18_012067_1.png	14654
1557	/var/www/html/images/properties/B46_P18_091565_1.png	14654
1558	/var/www/html/images/properties/B46_P19_062068_1.png	14655
1559	/var/www/html/images/properties/B46_P19_091565_1.png	14655
1560	/var/www/html/images/properties/B46_P1_041168_1.png	14656
1561	/var/www/html/images/properties/B46_P1_091565_1.png	14656
1562	/var/www/html/images/properties/B46_P1_091968_1.png	14656
1563	/var/www/html/images/properties/B46_P2_031469_1.png	14657
1564	/var/www/html/images/properties/B46_P2_050168_1.png	14657
1565	/var/www/html/images/properties/B46_P2_091565_1.png	14657
1566	/var/www/html/images/properties/B46_P3_011667_1.png	14658
1567	/var/www/html/images/properties/B46_P3_091565_1.png	14658
1568	/var/www/html/images/properties/B46_P4_061768_1.png	14659
1569	/var/www/html/images/properties/B46_P4_091565_1.png	14659
1570	/var/www/html/images/properties/B46_P5_062668_1.png	14660
1571	/var/www/html/images/properties/B46_P5_091565_1.png	14660
1572	/var/www/html/images/properties/B46_P6_011867_1.png	14661
1573	/var/www/html/images/properties/B46_P6_091565_1.png	14661
1574	/var/www/html/images/properties/B46_P7_011767_1.png	14662
1575	/var/www/html/images/properties/B46_P7_091565_1.png	14662
1576	/var/www/html/images/properties/B46_P8_082768_1.png	14663
1577	/var/www/html/images/properties/B46_P8_091565_1.png	14663
1578	/var/www/html/images/properties/B46_P9_080268_1.png	14664
1579	/var/www/html/images/properties/B46_P9_082868_1.png	14664
1580	/var/www/html/images/properties/B46_P9_082868_2.png	14664
1581	/var/www/html/images/properties/B46_P9_091565_1.png	14664
1582	/var/www/html/images/properties/B47_P10_061968_1.png	14665
1583	/var/www/html/images/properties/B47_P10_091268_1.png	14665
1584	/var/www/html/images/properties/B47_P11_061168_1.png	14666
1585	/var/www/html/images/properties/B47_P11_091168_1.png	14666
1586	/var/www/html/images/properties/B47_P12_061868_1.png	14667
1587	/var/www/html/images/properties/B47_P13_062068_1.png	14668
1588	/var/www/html/images/properties/B47_P13_091565_1.png	14668
1589	/var/www/html/images/properties/B47_P14_061868_1.png	14669
1590	/var/www/html/images/properties/B47_P14_061868_2.png	14669
1591	/var/www/html/images/properties/B47_P14_090468_1.png	14669
1592	/var/www/html/images/properties/B47_P15_091565_1.png	14670
1593	/var/www/html/images/properties/B47_P15_110166_1.png	14670
1594	/var/www/html/images/properties/B47_P16_091565_1.png	14671
1595	/var/www/html/images/properties/B47_P16_110166_1.png	14671
1596	/var/www/html/images/properties/B47_P16_110466_1.png	14671
1597	/var/www/html/images/properties/B47_P17_091565_1.png	14672
1598	/var/www/html/images/properties/B47_P18_120866_1.png	14673
1599	/var/www/html/images/properties/B47_P19_091565_1.png	14674
1600	/var/www/html/images/properties/B47_P19_110166_1.png	14674
1601	/var/www/html/images/properties/B47_P1_041868_1.png	14675
1602	/var/www/html/images/properties/B47_P1_091565_1.png	14675
1603	/var/www/html/images/properties/B47_P1_091968_1.png	14675
1604	/var/www/html/images/properties/B47_P20_061868_1.png	14676
1605	/var/www/html/images/properties/B47_P20_061868_2.png	14676
1606	/var/www/html/images/properties/B47_P20_091565_1.png	14676
1607	/var/www/html/images/properties/B47_P20_091565_2.png	14676
1608	/var/www/html/images/properties/B47_P21_051471_1.png	14677
1609	/var/www/html/images/properties/B47_P21_051471_2.png	14677
1610	/var/www/html/images/properties/B47_P21_051471_3.png	14677
1611	/var/www/html/images/properties/B47_P21_051471_4.png	14677
1612	/var/www/html/images/properties/B47_P21_051471_5.png	14677
1613	/var/www/html/images/properties/B47_P21_051471_6.png	14677
1614	/var/www/html/images/properties/B47_P21_051471_7.png	14677
1615	/var/www/html/images/properties/B47_P21_062568_1.png	14677
1616	/var/www/html/images/properties/B47_P21_062568_2.png	14677
1617	/var/www/html/images/properties/B47_P21_091565_1.png	14677
1618	/var/www/html/images/properties/B47_P22_091565_1.png	14678
1619	/var/www/html/images/properties/B47_P22_111766_1.png	14678
1620	/var/www/html/images/properties/B47_P23_061868_1.png	14679
1621	/var/www/html/images/properties/B47_P23_091565_1.png	14679
1622	/var/www/html/images/properties/B47_P24_030467_1.png	14680
1623	/var/www/html/images/properties/B47_P24_091565_1.png	14680
1624	/var/www/html/images/properties/B47_P24_091565_2.png	14680
1625	/var/www/html/images/properties/B47_P25_062468_1.png	14681
1626	/var/www/html/images/properties/B47_P25_062468_2.png	14681
1627	/var/www/html/images/properties/B47_P25_070568_1.png	14681
1628	/var/www/html/images/properties/B47_P25_070568_2.png	14681
1629	/var/www/html/images/properties/B47_P25_091565_1.png	14681
1630	/var/www/html/images/properties/B47_P25_091565_2.png	14681
1631	/var/www/html/images/properties/B47_P26_070168_1.png	14682
1632	/var/www/html/images/properties/B47_P26_070568_1.png	14682
1633	/var/www/html/images/properties/B47_P27_011767_1.png	14683
1634	/var/www/html/images/properties/B47_P27_091565_1.png	14683
1635	/var/www/html/images/properties/B47_P27_111466_1.png	14683
1636	/var/www/html/images/properties/B47_P2_022767_1.png	14684
1637	/var/www/html/images/properties/B47_P2_091565_1.png	14684
1638	/var/www/html/images/properties/B47_P3_061168_1.png	14685
1639	/var/www/html/images/properties/B47_P3_091768_1.png	14685
1640	/var/www/html/images/properties/B47_P4_062068_1.png	14686
1641	/var/www/html/images/properties/B47_P4_090968_1.png	14686
1642	/var/www/html/images/properties/B47_P4_091565_1.png	14686
1643	/var/www/html/images/properties/B47_P5_061168_1.png	14687
1644	/var/www/html/images/properties/B47_P5_081468_1.png	14687
1645	/var/www/html/images/properties/B47_P6_032768_1.png	14688
1646	/var/www/html/images/properties/B47_P6_091565_1.png	14688
1647	/var/www/html/images/properties/B47_P7_020274_1.png	14689
1648	/var/www/html/images/properties/B47_P7_020274_2.png	14689
1649	/var/www/html/images/properties/B47_P7_020274_3.png	14689
1650	/var/www/html/images/properties/B47_P7_021370_1.png	14689
1651	/var/www/html/images/properties/B47_P7_021370_2.png	14689
1652	/var/www/html/images/properties/B47_P7_021370_3.png	14689
1653	/var/www/html/images/properties/B47_P7_041474_1.png	14689
1654	/var/www/html/images/properties/B47_P7_041474_2.png	14689
1655	/var/www/html/images/properties/B47_P7_060368_1.png	14689
1656	/var/www/html/images/properties/B47_P7_091565_1.png	14689
1657	/var/www/html/images/properties/B47_P7_091565_2.png	14689
1658	/var/www/html/images/properties/B47_P7_091668_1.png	14689
1659	/var/www/html/images/properties/B47_P8_060368_1.png	14690
1660	/var/www/html/images/properties/B47_P8_082068_1.png	14690
1661	/var/www/html/images/properties/B47_P9_060568_1.png	14691
1662	/var/www/html/images/properties/B47_P9_091268_1.png	14691
1663	/var/www/html/images/properties/B47_P9_091565_1.png	14691
1664	/var/www/html/images/properties/B48_P11_061168_1.png	14692
1665	/var/www/html/images/properties/B48_P11_061168_2.png	14692
1666	/var/www/html/images/properties/B48_P11_061168_3.png	14692
1667	/var/www/html/images/properties/B48_P11_090968_1.png	14692
1668	/var/www/html/images/properties/B48_P11_091565_1.png	14692
1669	/var/www/html/images/properties/B48_P11_091565_2.png	14692
1670	/var/www/html/images/properties/B48_P11_091565_3.png	14692
1671	/var/www/html/images/properties/B48_P11_091565_4.png	14692
1672	/var/www/html/images/properties/B48_P12_061668_1.png	14693
1673	/var/www/html/images/properties/B48_P12_090468_1.png	14693
1674	/var/www/html/images/properties/B48_P12_091565_1.png	14693
1675	/var/www/html/images/properties/B48_P12_091565_2.png	14693
1676	/var/www/html/images/properties/B48_P12_092468_1.png	14693
1677	/var/www/html/images/properties/B48_P13_083068_1.png	14694
1678	/var/www/html/images/properties/B48_P13_091565_1.png	14694
1679	/var/www/html/images/properties/B48_P14_091565_1.png	14695
1680	/var/www/html/images/properties/B48_P15_082968_1.png	14696
1681	/var/www/html/images/properties/B48_P15_091565_1.png	14696
1682	/var/www/html/images/properties/B48_P16_021370_1.png	14697
1683	/var/www/html/images/properties/B48_P16_021370_2.png	14697
1684	/var/www/html/images/properties/B48_P16_021370_3.png	14697
1685	/var/www/html/images/properties/B48_P16_090368_1.png	14697
1686	/var/www/html/images/properties/B48_P16_091565_1.png	14697
1687	/var/www/html/images/properties/B48_P16_111466_1.png	14697
1688	/var/www/html/images/properties/B48_P17_090368_1.png	14698
1689	/var/www/html/images/properties/B48_P17_091565_1.png	14698
1690	/var/www/html/images/properties/B48_P17_110766_1.png	14698
1691	/var/www/html/images/properties/B48_P18_010175_2.png	14699
1692	/var/www/html/images/properties/B48_P18_050175_1.png	14699
1693	/var/www/html/images/properties/B48_P18_050175_3.png	14699
1694	/var/www/html/images/properties/B48_P18_050175_4.png	14699
1695	/var/www/html/images/properties/B48_P18_052075_1.png	14699
1696	/var/www/html/images/properties/B48_P18_083068_1.png	14699
1697	/var/www/html/images/properties/B48_P18_091565_1.png	14699
1698	/var/www/html/images/properties/B48_P18_111466_1.png	14699
1699	/var/www/html/images/properties/B48_P19_091565_1.png	14700
1700	/var/www/html/images/properties/B48_P19_111466_1.png	14700
1701	/var/www/html/images/properties/B48_P1_091565_1.png	14701
1702	/var/www/html/images/properties/B48_P20_090468_1.png	14702
1703	/var/www/html/images/properties/B48_P20_091565_1.png	14702
1704	/var/www/html/images/properties/B48_P20_111466_1.png	14702
1705	/var/www/html/images/properties/B48_P21_091565_1.png	14703
1706	/var/www/html/images/properties/B48_P21_110966_1.png	14703
1707	/var/www/html/images/properties/B48_P22_091565_1.png	14704
1708	/var/www/html/images/properties/B48_P22_110966_1.png	14704
1709	/var/www/html/images/properties/B48_P23_091565_1.png	14705
1710	/var/www/html/images/properties/B48_P23_111466_1.png	14705
1711	/var/www/html/images/properties/B48_P24_052075_1.png	14706
1712	/var/www/html/images/properties/B48_P24_082868_1.png	14706
1713	/var/www/html/images/properties/B48_P24_091565_1.png	14706
1714	/var/www/html/images/properties/B48_P24_111466_1.png	14706
1715	/var/www/html/images/properties/B48_P25_082868_1.png	14707
1716	/var/www/html/images/properties/B48_P26_082968_1.png	14708
1717	/var/www/html/images/properties/B48_P26_091565_1.png	14708
1718	/var/www/html/images/properties/B48_P27_090368_1.png	14709
1719	/var/www/html/images/properties/B48_P27_091565_1.png	14709
1720	/var/www/html/images/properties/B48_P28_091565_1.png	14710
1721	/var/www/html/images/properties/B48_P2_090368_1.png	14711
1722	/var/www/html/images/properties/B48_P2_091565_1.png	14711
1723	/var/www/html/images/properties/B48_P2_091565_2.png	14711
1724	/var/www/html/images/properties/B48_P2_111566_1.png	14711
1725	/var/www/html/images/properties/B48_P2_111566_2.png	14711
1726	/var/www/html/images/properties/B48_P3_062768_1.png	14712
1727	/var/www/html/images/properties/B48_P3_091565_1.png	14712
1728	/var/www/html/images/properties/B48_P4_091565_1.png	14713
1729	/var/www/html/images/properties/B48_P4_092068_1.png	14713
1730	/var/www/html/images/properties/B48_P5_062868_1.png	14714
1731	/var/www/html/images/properties/B48_P5_091565_1.png	14714
1732	/var/www/html/images/properties/B48_P6_062768_1.png	14715
1733	/var/www/html/images/properties/B48_P6_091565_1.png	14715
1734	/var/www/html/images/properties/B48_P6_091565_2.png	14715
1735	/var/www/html/images/properties/B48_P6_091565_3.png	14715
1736	/var/www/html/images/properties/B48_P7_031170_1.png	14716
1737	/var/www/html/images/properties/B48_P7_031170_2.png	14716
1738	/var/www/html/images/properties/B48_P7_031170_3.png	14716
1739	/var/www/html/images/properties/B48_P7_081268_1.png	14716
1740	/var/www/html/images/properties/B48_P7_091565_1.png	14716
1741	/var/www/html/images/properties/B48_P7_091565_2.png	14716
1742	/var/www/html/images/properties/B48_P7_091868_1.png	14716
1743	/var/www/html/images/properties/B48_P7_091868_2.png	14716
1744	/var/www/html/images/properties/B48_P8_062668_1.png	14717
1745	/var/www/html/images/properties/B48_P8_091565_1.png	14717
1746	/var/www/html/images/properties/B48_P9_061968_1.png	14718
1747	/var/www/html/images/properties/B48_P9_091565_1.png	14718
1748	/var/www/html/images/properties/B49_P10_012567_1.png	14719
1749	/var/www/html/images/properties/B49_P10_090968_1.png	14719
1750	/var/www/html/images/properties/B49_P10_091565_1.png	14719
1751	/var/www/html/images/properties/B49_P11_090968_1.png	14720
1752	/var/www/html/images/properties/B49_P11_091565_1.png	14720
1753	/var/www/html/images/properties/B49_P12_012567_1.png	14721
1754	/var/www/html/images/properties/B49_P12_091565_1.png	14721
1755	/var/www/html/images/properties/B49_P13_091565_1.png	14722
1756	/var/www/html/images/properties/B49_P14_070268_1.png	14723
1757	/var/www/html/images/properties/B49_P14_091565_1.png	14723
1758	/var/www/html/images/properties/B49_P14_091565_2.png	14723
1759	/var/www/html/images/properties/B49_P15_070268_1.png	14724
1760	/var/www/html/images/properties/B49_P16_012567_1.png	14725
1761	/var/www/html/images/properties/B49_P16_062066_1.png	14725
1762	/var/www/html/images/properties/B49_P16_062066_2.png	14725
1763	/var/www/html/images/properties/B49_P17_102266_1.png	14726
1764	/var/www/html/images/properties/B49_P18_102266_1.png	14727
1765	/var/www/html/images/properties/B49_P1_110466_1.png	14728
1766	/var/www/html/images/properties/B49_P2_082768_1.png	14729
1767	/var/www/html/images/properties/B49_P2_091565_1.png	14729
1768	/var/www/html/images/properties/B49_P3_091565_1.png	14730
1769	/var/www/html/images/properties/B49_P4_091565_1.png	14731
1770	/var/www/html/images/properties/B49_P5_091565_1.png	14732
1771	/var/www/html/images/properties/B49_P7_082868_1.png	14733
1772	/var/www/html/images/properties/B49_P8_082868_1.png	14734
1773	/var/www/html/images/properties/B49_P8_091565_1.png	14734
1774	/var/www/html/images/properties/B49_P9_062768_1.png	14735
1775	/var/www/html/images/properties/B49_P9_091565_1.png	14735
1776	/var/www/html/images/properties/B4_P10_072668_1.png	14736
1777	/var/www/html/images/properties/B4_P10_091565_1.png	14736
1778	/var/www/html/images/properties/B4_P10_091565_2.png	14736
1779	/var/www/html/images/properties/B4_P10_091565_3.png	14736
1780	/var/www/html/images/properties/B4_P10_091565_4.png	14736
1781	/var/www/html/images/properties/B4_P10_091565_5.png	14736
1782	/var/www/html/images/properties/B4_P10_091565_6.png	14736
1783	/var/www/html/images/properties/B4_P14_072668_1.png	14737
1784	/var/www/html/images/properties/B4_P14_073068_1.png	14737
1785	/var/www/html/images/properties/B4_P14_091565_1.png	14737
1786	/var/www/html/images/properties/B4_P15_011774_1.png	14738
1787	/var/www/html/images/properties/B4_P15_011774_2.png	14738
1788	/var/www/html/images/properties/B4_P15_020674_1.png	14738
1789	/var/www/html/images/properties/B4_P15_091565_1.png	14738
1790	/var/www/html/images/properties/B4_P16_011074_1.png	14739
1791	/var/www/html/images/properties/B4_P16_020674_1.png	14739
1792	/var/www/html/images/properties/B4_P16_061565_1.png	14739
1793	/var/www/html/images/properties/B4_P17_020167_1.png	14740
1794	/var/www/html/images/properties/B4_P17_050675_1.png	14740
1795	/var/www/html/images/properties/B4_P17_050675_2.png	14740
1796	/var/www/html/images/properties/B4_P17_050675_3.png	14740
1797	/var/www/html/images/properties/B4_P17_050675_4.png	14740
1798	/var/www/html/images/properties/B4_P17_050675_5.png	14740
1799	/var/www/html/images/properties/B4_P17_060375_1.png	14740
1800	/var/www/html/images/properties/B4_P17_060375_2.png	14740
1801	/var/www/html/images/properties/B4_P17_060375_3.png	14740
1802	/var/www/html/images/properties/B4_P17_060375_4.png	14740
1803	/var/www/html/images/properties/B4_P17_060375_5.png	14740
1804	/var/www/html/images/properties/B4_P17_081668_1.png	14740
1805	/var/www/html/images/properties/B4_P17_091565_1.png	14740
1806	/var/www/html/images/properties/B4_P17_091565_2.png	14740
1807	/var/www/html/images/properties/B4_P17_091565_3.png	14740
1808	/var/www/html/images/properties/B4_P17_091565_4.png	14740
1809	/var/www/html/images/properties/B4_P18_012975_1.png	14741
1810	/var/www/html/images/properties/B4_P18_012975_2.png	14741
1811	/var/www/html/images/properties/B4_P18_091565_1.png	14741
1812	/var/www/html/images/properties/B4_P18_111474_1.png	14741
1813	/var/www/html/images/properties/B4_P19_091565_1.png	14742
1814	/var/www/html/images/properties/B4_P19_091565_2.png	14742
1815	/var/www/html/images/properties/B4_P19_112374_1.png	14742
1816	/var/www/html/images/properties/B4_P19_112374_2.png	14742
1817	/var/www/html/images/properties/B4_P19_112374_3.png	14742
1818	/var/www/html/images/properties/B4_P19_112374_4.png	14742
1819	/var/www/html/images/properties/B4_P1_010377_1.png	14743
1820	/var/www/html/images/properties/B4_P1_010377_2.png	14743
1821	/var/www/html/images/properties/B4_P1_011267_1.png	14743
1822	/var/www/html/images/properties/B4_P1_081668_1.png	14743
1823	/var/www/html/images/properties/B4_P1_122876_1.png	14743
1824	/var/www/html/images/properties/B4_P1_122876_2.png	14743
1825	/var/www/html/images/properties/B4_P20_091565_1.png	14744
1826	/var/www/html/images/properties/B4_P20_111374_1.png	14744
1827	/var/www/html/images/properties/B4_P20_111374_2.png	14744
1828	/var/www/html/images/properties/B4_P20_120574_1.png	14744
1829	/var/www/html/images/properties/B4_P20_120574_2.png	14744
1830	/var/www/html/images/properties/B4_P21_083068_1.png	14745
1831	/var/www/html/images/properties/B4_P21_091565_1.png	14745
1832	/var/www/html/images/properties/B4_P22_042175_1.png	14746
1833	/var/www/html/images/properties/B4_P22_081668_1.png	14746
1834	/var/www/html/images/properties/B4_P22_091565_1.png	14746
1835	/var/www/html/images/properties/B4_P23_071768_1.png	14747
1836	/var/www/html/images/properties/B4_P23_082068_1.png	14747
1837	/var/www/html/images/properties/B4_P24_071868_1.png	14748
1838	/var/www/html/images/properties/B4_P24_091565_1.png	14748
1839	/var/www/html/images/properties/B4_P25_071868_1.png	14749
1840	/var/www/html/images/properties/B4_P25_083068_1.png	14749
1841	/var/www/html/images/properties/B4_P26_071868_1.png	14750
1842	/var/www/html/images/properties/B4_P26_083168_1.png	14750
1843	/var/www/html/images/properties/B4_P2_091565_1.png	14751
1844	/var/www/html/images/properties/B4_P2_092168_1.png	14751
1845	/var/www/html/images/properties/B4_P4_072668_1.png	14752
1846	/var/www/html/images/properties/B4_P4_091565_1.png	14752
1847	/var/www/html/images/properties/B4_P5_042274_1.png	14753
1848	/var/www/html/images/properties/B4_P5_042274_2.png	14753
1849	/var/www/html/images/properties/B4_P5_051876_1.png	14753
1850	/var/www/html/images/properties/B4_P5_051876_2.png	14753
1851	/var/www/html/images/properties/B4_P5_051876_3.png	14753
1852	/var/www/html/images/properties/B4_P5_072668_1.png	14753
1853	/var/www/html/images/properties/B4_P5_091565_1.png	14753
1854	/var/www/html/images/properties/B4_P6_011267_1.png	14754
1855	/var/www/html/images/properties/B4_P6_042175_1.png	14754
1856	/var/www/html/images/properties/B4_P6_081668_1.png	14754
1857	/var/www/html/images/properties/B4_P6_091565_1.png	14754
1858	/var/www/html/images/properties/B4_P9_072668_1.png	14755
1859	/var/www/html/images/properties/B4_P9_091565_1.png	14755
1860	/var/www/html/images/properties/B50_P10_091565_1.png	14160
1861	/var/www/html/images/properties/B50_P10_091565_2.png	14160
1862	/var/www/html/images/properties/B50_P11_081568_1.png	14161
1863	/var/www/html/images/properties/B50_P11_091565_1.png	14161
1864	/var/www/html/images/properties/B50_P12_081568_1.png	14162
1865	/var/www/html/images/properties/B50_P12_091565_1.png	14162
1866	/var/www/html/images/properties/B50_P12_100969_1.png	14162
1867	/var/www/html/images/properties/B50_P13_091565_1.png	14164
1868	/var/www/html/images/properties/B50_P14_102566_1.png	14165
1869	/var/www/html/images/properties/B50_P15_091565_1.png	14166
1870	/var/www/html/images/properties/B50_P15_102566_1.png	14166
1871	/var/www/html/images/properties/B50_P16_081668_1.png	14167
1872	/var/www/html/images/properties/B50_P16_091565_1.png	14167
1873	/var/www/html/images/properties/B50_P17_091565_1.png	14168
1874	/var/www/html/images/properties/B50_P17_102566_1.png	14168
1875	/var/www/html/images/properties/B50_P18_091565_1.png	14169
1876	/var/www/html/images/properties/B50_P19_081368_1.png	14170
1877	/var/www/html/images/properties/B50_P19_091565_1.png	14170
1878	/var/www/html/images/properties/B50_P1_091565_1.png	14756
1879	/var/www/html/images/properties/B50_P20_081667_1.png	14171
1880	/var/www/html/images/properties/B50_P2_091565_1.png	14152
1881	/var/www/html/images/properties/B50_P2_091565_2.png	14152
1882	/var/www/html/images/properties/B50_P2_091565_3.png	14152
1883	/var/www/html/images/properties/B50_P2_102066_1.png	14152
1884	/var/www/html/images/properties/B50_P2_102066_2.png	14152
1885	/var/www/html/images/properties/B50_P3_091565_1.png	14153
1886	/var/www/html/images/properties/B50_P4_091565_1.png	14154
1887	/var/www/html/images/properties/B50_P5_091565_1.png	14155
1888	/var/www/html/images/properties/B50_P6_081568_1.png	14156
1889	/var/www/html/images/properties/B50_P6_091565_1.png	14156
1890	/var/www/html/images/properties/B50_P7_091565_1.png	14157
1891	/var/www/html/images/properties/B50_P7_091565_2.png	14157
1892	/var/www/html/images/properties/B50_P8_091565_1.png	14158
1893	/var/www/html/images/properties/B50_P9_091565_1.png	14159
1894	/var/www/html/images/properties/B51_P1_091565_3.png	14757
1895	/var/www/html/images/properties/B51_P1_091565_4.png	14757
1896	/var/www/html/images/properties/B51_P1_091565_5.png	14757
1897	/var/www/html/images/properties/B52_P10_09068_1.png	14758
1898	/var/www/html/images/properties/B52_P10_091565_1.png	14758
1899	/var/www/html/images/properties/B52_P1_102866_1.png	14759
1900	/var/www/html/images/properties/B52_P3_091565_1.png	14760
1901	/var/www/html/images/properties/B52_P4_091565_1.png	14761
1902	/var/www/html/images/properties/B52_P4_091565_2.png	14761
1903	/var/www/html/images/properties/B52_P5_091565_1.png	14762
1904	/var/www/html/images/properties/B52_P6_091565_1.png	14763
1905	/var/www/html/images/properties/B52_P7_091565_1.png	14764
1906	/var/www/html/images/properties/B52_P8_041974_1.png	14765
1907	/var/www/html/images/properties/B52_P8_061274_1.png	14765
1908	/var/www/html/images/properties/B52_P8_091565_1.png	14765
1909	/var/www/html/images/properties/B52_P8_102866_1.png	14765
1910	/var/www/html/images/properties/B52_P9_080968_1.png	14766
1911	/var/www/html/images/properties/B52_P9_091565_1.png	14766
1912	/var/www/html/images/properties/B53_P10_072968_1.png	14767
1913	/var/www/html/images/properties/B53_P10_091565_1.png	14767
1914	/var/www/html/images/properties/B53_P11_062066_1.png	14172
1915	/var/www/html/images/properties/B53_P11_072968_1.png	14172
1916	/var/www/html/images/properties/B53_P12_062066_1.png	14173
1917	/var/www/html/images/properties/B53_P12_110566_1.png	14173
1918	/var/www/html/images/properties/B53_P15A_073168_1.png	14175
1919	/var/www/html/images/properties/B53_P15A_091565_1.png	14175
1920	/var/www/html/images/properties/B53_P15B_061274_1.png	14175
1921	/var/www/html/images/properties/B53_P15B_111766_1.png	14175
1922	/var/www/html/images/properties/B53_P16_091565_1.png	14174
1923	/var/www/html/images/properties/B53_P16_111766_1.png	14174
1924	/var/www/html/images/properties/B53_P1_091565_1.png	9438
1925	/var/www/html/images/properties/B53_P1_091565_10.png	9438
1926	/var/www/html/images/properties/B53_P1_091565_11.png	9438
1927	/var/www/html/images/properties/B53_P1_091565_12.png	9438
1928	/var/www/html/images/properties/B53_P1_091565_13.png	9438
1929	/var/www/html/images/properties/B53_P1_091565_14.png	9438
1930	/var/www/html/images/properties/B53_P1_091565_15.png	9438
1931	/var/www/html/images/properties/B53_P1_091565_16.png	9438
1932	/var/www/html/images/properties/B53_P1_091565_17.png	9438
1933	/var/www/html/images/properties/B53_P1_091565_18.png	9438
1934	/var/www/html/images/properties/B53_P1_091565_19.png	9438
1935	/var/www/html/images/properties/B53_P1_091565_2.png	9438
1936	/var/www/html/images/properties/B53_P1_091565_3.png	9438
1937	/var/www/html/images/properties/B53_P1_091565_4.png	9438
1938	/var/www/html/images/properties/B53_P1_091565_5.png	9438
1939	/var/www/html/images/properties/B53_P1_091565_6.png	9438
1940	/var/www/html/images/properties/B53_P1_091565_7.png	9438
1941	/var/www/html/images/properties/B53_P1_091565_8.png	9438
1942	/var/www/html/images/properties/B53_P1_091565_9.png	9438
1943	/var/www/html/images/properties/B53_P2_072568_1.png	9439
1944	/var/www/html/images/properties/B53_P4_091565_1.png	9441
1945	/var/www/html/images/properties/B53_P5_091565_1.png	14768
1946	/var/www/html/images/properties/B53_P6_072968_1.png	14769
1947	/var/www/html/images/properties/B53_P7_043068_1.png	14770
1948	/var/www/html/images/properties/B53_P8_043068_1.png	14771
1949	/var/www/html/images/properties/B53_P9_050168_1.png	14772
1950	/var/www/html/images/properties/B53_P9_050168_2.png	14772
1951	/var/www/html/images/properties/B55_P10_052268_1.png	14148
1952	/var/www/html/images/properties/B55_P11_052268_1.png	14149
1953	/var/www/html/images/properties/B55_P11_091565_1.png	14149
1954	/var/www/html/images/properties/B55_P12_091565_1.png	14150
1955	/var/www/html/images/properties/B55_P13_091565_1.png	14151
1956	/var/www/html/images/properties/B55_P14_042474_1.png	14773
1957	/var/www/html/images/properties/B55_P14_042474_2.png	14773
1958	/var/www/html/images/properties/B55_P14_061274_1.png	14773
1959	/var/www/html/images/properties/B55_P14_091565_1.png	14773
1960	/var/www/html/images/properties/B55_P15_091565_1.png	14180
1961	/var/www/html/images/properties/B55_P16_091565_1.png	14774
1962	/var/www/html/images/properties/B55_P18_122866_1.png	14775
1963	/var/www/html/images/properties/B55_P19_091565_1.png	14776
1964	/var/www/html/images/properties/B55_P1_062066_01.png	4715
1965	/var/www/html/images/properties/B55_P1_062066_1.png	4715
1966	/var/www/html/images/properties/B55_P20_122766_1.png	14777
1967	/var/www/html/images/properties/B55_P21_091565_1.png	14778
1968	/var/www/html/images/properties/B55_P22_071568_1.png	14779
1969	/var/www/html/images/properties/B55_P22_091565_1.png	14779
1970	/var/www/html/images/properties/B55_P22_122266_1.png	14779
1971	/var/www/html/images/properties/B55_P23_091565_1.png	14780
1972	/var/www/html/images/properties/B55_P24_091565_1.png	14781
1973	/var/www/html/images/properties/B55_P25_052968_1.png	14782
1974	/var/www/html/images/properties/B55_P25_091565_1.png	14782
1975	/var/www/html/images/properties/B55_P26_091565_1.png	14783
1976	/var/www/html/images/properties/B55_P27_091565_1.png	14784
1977	/var/www/html/images/properties/B55_P27_092669_1.png	14784
1978	/var/www/html/images/properties/B55_P27_092669_2.png	14784
1979	/var/www/html/images/properties/B55_P27_092669_3.png	14784
1980	/var/www/html/images/properties/B55_P27_092669_4.png	14784
1981	/var/www/html/images/properties/B55_P28_071168_1.png	14785
1982	/var/www/html/images/properties/B55_P29_121966_1.png	14786
1983	/var/www/html/images/properties/B55_P2_050768_1.png	4716
1984	/var/www/html/images/properties/B55_P30_091565_1.png	14787
1985	/var/www/html/images/properties/B55_P31_091565_1.png	14788
1986	/var/www/html/images/properties/B55_P32_091565_1.png	14789
1987	/var/www/html/images/properties/B55_P33_091565_1.png	14790
1988	/var/www/html/images/properties/B55_P34_nodate_1.png	14791
1989	/var/www/html/images/properties/B55_P35_091565_1.png	14792
1990	/var/www/html/images/properties/B55_P35_nodate_1.png	14792
1991	/var/www/html/images/properties/B55_P36_091565_1.png	14793
1992	/var/www/html/images/properties/B55_P36_120566_1.png	14793
1993	/var/www/html/images/properties/B55_P37_091565_1.png	14794
1994	/var/www/html/images/properties/B55_P38_053168_1.png	14795
1995	/var/www/html/images/properties/B55_P38_091565_1.png	14795
1996	/var/www/html/images/properties/B55_P39_091565_1.png	14796
1997	/var/www/html/images/properties/B55_P3_091565_1.png	9433
1998	/var/www/html/images/properties/B55_P40_091565_1.png	14797
1999	/var/www/html/images/properties/B55_P41_081368_1.png	14798
2000	/var/www/html/images/properties/B55_P42_091565_1.png	14799
2001	/var/www/html/images/properties/B55_P43_050868_1.png	14800
2002	/var/www/html/images/properties/B55_P44_120566_1.png	14801
2003	/var/www/html/images/properties/B55_P45_121666_1.png	14802
2004	/var/www/html/images/properties/B55_P46_091565_1.png	14803
2005	/var/www/html/images/properties/B55_P46_121066_1.png	14803
2006	/var/www/html/images/properties/B55_P47_071868_1.png	14804
2007	/var/www/html/images/properties/B55_P48_121366_1.png	14179
2008	/var/www/html/images/properties/B55_P49_070968_1.png	14805
2009	/var/www/html/images/properties/B55_P4_050768_1.png	9432
2010	/var/www/html/images/properties/B55_P50_070968_1.png	14806
2011	/var/www/html/images/properties/B55_P51_051976_1.png	14807
2012	/var/www/html/images/properties/B55_P51_051976_2.png	14807
2013	/var/www/html/images/properties/B55_P51_061976_1.png	14807
2014	/var/www/html/images/properties/B55_P52_051976_1.png	14808
2015	/var/www/html/images/properties/B55_P52_051976_2.png	14808
2016	/var/www/html/images/properties/B55_P52_061976_1.png	14808
2017	/var/www/html/images/properties/B55_P5_052868_1.png	9431
2018	/var/www/html/images/properties/B55_P6_051468_1.png	9434
2019	/var/www/html/images/properties/B55_P7_010367_1.png	9435
2020	/var/www/html/images/properties/B55_P8_010367_1.png	9436
2021	/var/www/html/images/properties/B55_P8_091565_1.png	9436
2022	/var/www/html/images/properties/B55_P9_011267_1.png	9437
2023	/var/www/html/images/properties/B56A_P13_031170_1.png	14809
2024	/var/www/html/images/properties/B56A_P13_031170_2.png	14809
2025	/var/www/html/images/properties/B56A_P25_081674_1.png	14810
2026	/var/www/html/images/properties/B56A_P25_081674_2.png	14810
2027	/var/www/html/images/properties/B56A_P4_081570_1.png	14811
2028	/var/www/html/images/properties/B56A_P4_082170_1.png	14811
2029	/var/www/html/images/properties/B56A_P4_nodate_1.png	14811
2030	/var/www/html/images/properties/B56A_P4_nodate_2.png	14811
2031	/var/www/html/images/properties/B56A_P4_nodate_3.png	14811
2032	/var/www/html/images/properties/B56A_P4_nodate_4.png	14811
2033	/var/www/html/images/properties/B56A_P4_nodate_5.png	14811
2034	/var/www/html/images/properties/B56_P16_011974_1.png	14812
2035	/var/www/html/images/properties/B56_P16_011974_2.png	14812
2036	/var/www/html/images/properties/B56_P16_020674_1.png	14812
2037	/var/www/html/images/properties/B56_P17_020674_1.png	14177
2038	/var/www/html/images/properties/B56_P17_040274_1.png	14177
2039	/var/www/html/images/properties/B56_P18_012174_1.png	14813
2040	/var/www/html/images/properties/B56_P18_012174_2.png	14813
2041	/var/www/html/images/properties/B56_P18_020674_1.png	14813
2042	/var/www/html/images/properties/B56_P19_012474_1.png	14814
2043	/var/www/html/images/properties/B56_P19_020674_1.png	14814
2044	/var/www/html/images/properties/B56_P2_052068_1.png	14181
2045	/var/www/html/images/properties/B56_P2_052268_1.png	14181
2046	/var/www/html/images/properties/B56_P2_062066_1.png	14181
2047	/var/www/html/images/properties/B56_P2_082775_1.png	14181
2048	/var/www/html/images/properties/B56_P2_082775_2.png	14181
2049	/var/www/html/images/properties/B56_P2_082775_3.png	14181
2050	/var/www/html/images/properties/B56_P2_101075_1.png	14181
2051	/var/www/html/images/properties/B56_P2_101075_2.png	14181
2052	/var/www/html/images/properties/B56_P4_081570_1.png	14811
2053	/var/www/html/images/properties/B56_P4_081870_1.png	14811
2054	/var/www/html/images/properties/B56_P4_081870_2.png	14811
2055	/var/www/html/images/properties/B57_P10_091565_1.png	14815
2056	/var/www/html/images/properties/B57_P10_091565_2.png	14815
2057	/var/www/html/images/properties/B57_P10_112566_1.png	14815
2058	/var/www/html/images/properties/B57_P11_051668_1.png	14816
2059	/var/www/html/images/properties/B57_P11_091565_1.png	14816
2060	/var/www/html/images/properties/B57_P12_062066_1.png	14817
2061	/var/www/html/images/properties/B57_P12_071268_1.png	14817
2062	/var/www/html/images/properties/B57_P13_062066_1.png	14818
2063	/var/www/html/images/properties/B57_P13_071068_1.png	14818
2064	/var/www/html/images/properties/B57_P13_120966_1.png	14818
2065	/var/www/html/images/properties/B57_P14_050868_1.png	14819
2066	/var/www/html/images/properties/B57_P14_071368_1.png	14819
2067	/var/www/html/images/properties/B57_P14_091565_1.png	14819
2068	/var/www/html/images/properties/B57_P1_050868_1.png	14820
2069	/var/www/html/images/properties/B57_P1_071368_1.png	14820
2070	/var/www/html/images/properties/B57_P1_071368_2.png	14820
2071	/var/www/html/images/properties/B57_P1_091565_1.png	14820
2072	/var/www/html/images/properties/B57_P1_091565_2.png	14820
2073	/var/www/html/images/properties/B57_P2_071668_1.png	14821
2074	/var/www/html/images/properties/B57_P2_091565_1.png	14821
2075	/var/www/html/images/properties/B57_P3_091565_1.png	14822
2076	/var/www/html/images/properties/B57_P3_120666_1.png	14822
2077	/var/www/html/images/properties/B57_P4_071568_1.png	14823
2078	/var/www/html/images/properties/B57_P4_071568_2.png	14823
2079	/var/www/html/images/properties/B57_P4_091565_1.png	14823
2080	/var/www/html/images/properties/B57_P4_091565_2.png	14823
2081	/var/www/html/images/properties/B57_P5_091565_1.png	14824
2082	/var/www/html/images/properties/B57_P5_120666_1.png	14824
2083	/var/www/html/images/properties/B57_P6_071568_1.png	14825
2084	/var/www/html/images/properties/B57_P6_091565_1.png	14825
2085	/var/www/html/images/properties/B57_P6_112566_1.png	14825
2086	/var/www/html/images/properties/B57_P7_091565_1.png	14826
2087	/var/www/html/images/properties/B57_P7_112366_1.png	14826
2088	/var/www/html/images/properties/B57_P8_091565_1.png	14827
2089	/var/www/html/images/properties/B57_P8_112366_1.png	14827
2090	/var/www/html/images/properties/B57_P9_091565_1.png	14828
2091	/var/www/html/images/properties/B57_P9_112366_1.png	14828
2092	/var/www/html/images/properties/B58_P3_071968_1.png	14829
2093	/var/www/html/images/properties/B58_P3_071968_2.png	14829
2094	/var/www/html/images/properties/B58_P3_091565_1.png	14829
2095	/var/www/html/images/properties/B58_P3_112666_1.png	14829
2096	/var/www/html/images/properties/B58_P3_112666_2.png	14829
2097	/var/www/html/images/properties/B58_P3_112666_3.png	14829
2098	/var/www/html/images/properties/B58_P4_071868_1.png	14830
2099	/var/www/html/images/properties/B58_P4_091565_1.png	14830
2100	/var/www/html/images/properties/B58_P4_112566_1.png	14830
2101	/var/www/html/images/properties/B58_P6_082968_1.png	14831
2102	/var/www/html/images/properties/B58_P6_091565_1.png	14831
2103	/var/www/html/images/properties/B58_P6_121066_1.png	14831
2104	/var/www/html/images/properties/B59_P10_081268_1.png	14832
2105	/var/www/html/images/properties/B59_P10_091565_1.png	14832
2106	/var/www/html/images/properties/B59_P10_112366_1.png	14832
2107	/var/www/html/images/properties/B59_P11_070866_1.png	14833
2108	/var/www/html/images/properties/B59_P11_072268_1.png	14833
2109	/var/www/html/images/properties/B59_P11_111766_1.png	14833
2110	/var/www/html/images/properties/B59_P12_072268_1.png	14834
2111	/var/www/html/images/properties/B59_P12_091565_1.png	14834
2112	/var/www/html/images/properties/B59_P12_111666_1.png	14834
2113	/var/www/html/images/properties/B59_P13A_072368_1.png	14835
2114	/var/www/html/images/properties/B59_P13A_091565_1.png	14835
2115	/var/www/html/images/properties/B59_P13A_112166_1.png	14835
2116	/var/www/html/images/properties/B59_P13B_062066_1.png	14835
2117	/var/www/html/images/properties/B59_P13B_072368_1.png	14835
2118	/var/www/html/images/properties/B59_P13B_111666_1.png	14835
2119	/var/www/html/images/properties/B59_P16_080968_1.png	14836
2120	/var/www/html/images/properties/B59_P16_091565_1.png	14836
2121	/var/www/html/images/properties/B59_P16_111666_1.png	14836
2122	/var/www/html/images/properties/B59_P17_020570_1.png	14837
2123	/var/www/html/images/properties/B59_P17_020570_2.png	14837
2124	/var/www/html/images/properties/B59_P17_072368_1.png	14837
2125	/var/www/html/images/properties/B59_P17_091565_1.png	14837
2126	/var/www/html/images/properties/B59_P17_111766_1.png	14837
2127	/var/www/html/images/properties/B59_P1_062066_1.png	14838
2128	/var/www/html/images/properties/B59_P1_062066_2.png	14838
2129	/var/www/html/images/properties/B59_P1_071968_1.png	14838
2130	/var/www/html/images/properties/B59_P1_112566_1.png	14838
2131	/var/www/html/images/properties/B59_P2_091565_1.png	14839
2132	/var/www/html/images/properties/B59_P2_111168_1.png	14839
2133	/var/www/html/images/properties/B59_P2_112166_1.png	14839
2134	/var/www/html/images/properties/B59_P3_072268_1.png	14840
2135	/var/www/html/images/properties/B59_P3_091565_1.png	14840
2136	/var/www/html/images/properties/B59_P3_112266_1.png	14840
2137	/var/www/html/images/properties/B59_P4_072268_1.png	14841
2138	/var/www/html/images/properties/B59_P4_091565_1.png	14841
2139	/var/www/html/images/properties/B59_P4_111866_1.png	14841
2140	/var/www/html/images/properties/B59_P5_072268_1.png	14842
2141	/var/www/html/images/properties/B59_P5_091565_1.png	14842
2142	/var/www/html/images/properties/B59_P5_111866_1.png	14842
2143	/var/www/html/images/properties/B59_P6_051375_1.png	14843
2144	/var/www/html/images/properties/B59_P6_051375_2.png	14843
2145	/var/www/html/images/properties/B59_P6_051375_3.png	14843
2146	/var/www/html/images/properties/B59_P6_091565_1.png	14843
2147	/var/www/html/images/properties/B59_P6_092368_1.png	14843
2148	/var/www/html/images/properties/B59_P6_123166_1.png	14843
2149	/var/www/html/images/properties/B59_P7_081368_1.png	14844
2150	/var/www/html/images/properties/B59_P7_091565_1.png	14844
2151	/var/www/html/images/properties/B59_P7_112666_1.png	14844
2152	/var/www/html/images/properties/B59_P8_090668_1.png	14845
2153	/var/www/html/images/properties/B59_P8_091565_1.png	14845
2154	/var/www/html/images/properties/B59_P8_120766_1.png	14845
2155	/var/www/html/images/properties/B59_P9_072268_1.png	14846
2156	/var/www/html/images/properties/B59_P9_091565_1.png	14846
2157	/var/www/html/images/properties/B59_P9_111866_1.png	14846
2158	/var/www/html/images/properties/B5_P10_020674_1.png	14847
2159	/var/www/html/images/properties/B5_P10_091565_1.png	14847
2160	/var/www/html/images/properties/B5_P11_072268_1.png	14848
2161	/var/www/html/images/properties/B5_P11_091565_1.png	14848
2162	/var/www/html/images/properties/B5_P12_030971_2.PNG	14849
2163	/var/www/html/images/properties/B5_P12_091565_1.PNG	14849
2164	/var/www/html/images/properties/B5_P13_072768_1.PNG	14850
2165	/var/www/html/images/properties/B5_P13_082775_3.PNG	14850
2166	/var/www/html/images/properties/B5_P16_091565_1.PNG	14851
2167	/var/www/html/images/properties/B5_P17_072268_1.PNG	14852
2168	/var/www/html/images/properties/B5_P18_061565_1.PNG	14853
2169	/var/www/html/images/properties/B5_P19_053168_1.PNG	14854
2170	/var/www/html/images/properties/B5_P20_091368_1.PNG	14855
2171	/var/www/html/images/properties/B5_P20_091565_1.PNG	14855
2172	/var/www/html/images/properties/B5_P21_020172_1.png	14856
2173	/var/www/html/images/properties/B5_P21_020172_2.png	14856
2174	/var/www/html/images/properties/B5_P21_020172_3.png	14856
2175	/var/www/html/images/properties/B5_P21_020172_4.png	14856
2176	/var/www/html/images/properties/B5_P21_091565_1.png	14856
2177	/var/www/html/images/properties/B5_P22_011166_1.png	14857
2178	/var/www/html/images/properties/B5_P22_092168_1.png	14857
2179	/var/www/html/images/properties/B5_P23_030153_1.png	14858
2180	/var/www/html/images/properties/B5_P23_052868_1.png	14858
2181	/var/www/html/images/properties/B5_P24_030147_1.png	14859
2182	/var/www/html/images/properties/B5_P24_091565_1.png	14859
2183	/var/www/html/images/properties/B5_P25_091565_1.png	14860
2184	/var/www/html/images/properties/B5_P25_101468_1.png	14860
2185	/var/www/html/images/properties/B5_P26_052968_1.png	14861
2186	/var/www/html/images/properties/B5_P26_081668_1.png	14861
2187	/var/www/html/images/properties/B5_P27_052968_1.png	14862
2188	/var/www/html/images/properties/B5_P27_060166_1.png	14862
2189	/var/www/html/images/properties/B5_P2_080368_1.png	14863
2190	/var/www/html/images/properties/B5_P2_093066_1.png	14863
2191	/var/www/html/images/properties/B5_P6_050868_1.png	14864
2192	/var/www/html/images/properties/B5_P6_051275_2.png	14864
2193	/var/www/html/images/properties/B5_P9_091565_1.png	14865
2194	/var/www/html/images/properties/B5_P9_100666_1.png	14865
2195	/var/www/html/images/properties/B60_P10_091565_1.png	14866
2196	/var/www/html/images/properties/B60_P10_111566_1.png	14866
2197	/var/www/html/images/properties/B60_P11_072568_1.png	14867
2198	/var/www/html/images/properties/B60_P11_091565_1.png	14867
2199	/var/www/html/images/properties/B60_P11_111866_1.png	14867
2200	/var/www/html/images/properties/B60_P1_072368_1.png	14868
2201	/var/www/html/images/properties/B60_P1_091565_1.png	14868
2202	/var/www/html/images/properties/B60_P1_111666_1.png	14868
2203	/var/www/html/images/properties/B60_P2_072368_1.png	14869
2204	/var/www/html/images/properties/B60_P2_091565_1.png	14869
2205	/var/www/html/images/properties/B60_P2_111666_1.png	14869
2206	/var/www/html/images/properties/B60_P3_041974_1.png	14870
2207	/var/www/html/images/properties/B60_P3_052572_1.png	14870
2208	/var/www/html/images/properties/B60_P3_061274_1.png	14870
2209	/var/www/html/images/properties/B60_P3_061274_2.png	14870
2210	/var/www/html/images/properties/B60_P3_072368_1.png	14870
2211	/var/www/html/images/properties/B60_P3_091565_1.png	14870
2212	/var/www/html/images/properties/B60_P3_111766_1.png	14870
2213	/var/www/html/images/properties/B60_P4_052368_1.png	14871
2214	/var/www/html/images/properties/B60_P4_091565_1.png	14871
2215	/var/www/html/images/properties/B60_P4_092668_1.png	14871
2216	/var/www/html/images/properties/B60_P6_072468_1.png	14872
2217	/var/www/html/images/properties/B60_P6_091565_1.png	14872
2218	/var/www/html/images/properties/B60_P6_111666_1.png	14872
2219	/var/www/html/images/properties/B60_P7_072468_1.png	14873
2220	/var/www/html/images/properties/B60_P7_091565_1.png	14873
2221	/var/www/html/images/properties/B60_P7_111666_1.png	14873
2222	/var/www/html/images/properties/B60_P8_091565_1.png	14874
2223	/var/www/html/images/properties/B60_P8_111866_1.png	14874
2224	/var/www/html/images/properties/B60_P9_013077_1.png	14875
2225	/var/www/html/images/properties/B60_P9_072968_1.png	14875
2226	/var/www/html/images/properties/B60_P9_090565_1.png	14875
2227	/var/www/html/images/properties/B60_P9_111566_1.png	14875
2228	/var/www/html/images/properties/B61_P15_061274_1.png	14876
2229	/var/www/html/images/properties/B61_P15_093074_1.png	14876
2230	/var/www/html/images/properties/B61_P16_030174_1.png	14877
2231	/var/www/html/images/properties/B61_P16_041474_1.png	14877
2232	/var/www/html/images/properties/B61_P17_021373_1.png	14878
2233	/var/www/html/images/properties/B61_P17_021373_2.png	14878
2234	/var/www/html/images/properties/B61_P17_021373_3.png	14878
2235	/var/www/html/images/properties/B61_P17_021373_4.png	14878
2236	/var/www/html/images/properties/B61_P1_112377_1.png	14879
2237	/var/www/html/images/properties/B61_P1_112377_2.png	14879
2238	/var/www/html/images/properties/B61_P1_112377_3.png	14879
2239	/var/www/html/images/properties/B61_P1_112377_4.png	14879
2240	/var/www/html/images/properties/B61_P1_112377_5.png	14879
2241	/var/www/html/images/properties/B61_P1_112377_6.png	14879
2242	/var/www/html/images/properties/B61_P5A_081974_1.png	14880
2243	/var/www/html/images/properties/B61_P5A_081974_2.png	14880
2244	/var/www/html/images/properties/B61_P5A_100874_1.png	14880
2245	/var/www/html/images/properties/B61_P5A_100874_2.png	14880
2246	/var/www/html/images/properties/B61_P5B_081974_1.png	14880
2247	/var/www/html/images/properties/B61_P5B_100874_1.png	14880
2248	/var/www/html/images/properties/B61_P6_081974_1.png	14881
2249	/var/www/html/images/properties/B61_P6_081974_2.png	14881
2250	/var/www/html/images/properties/B61_P6_100974_1.png	14881
2251	/var/www/html/images/properties/B62_P1A_022074_1.png	14882
2252	/var/www/html/images/properties/B62_P1A_022074_2.png	14882
2253	/var/www/html/images/properties/B62_P1A_041474_1.png	14882
2254	/var/www/html/images/properties/B62_P1B_022074_1.png	14882
2255	/var/www/html/images/properties/B62_P1B_022074_2.png	14882
2256	/var/www/html/images/properties/B62_P1B_041474_1.png	14882
2257	/var/www/html/images/properties/B62_P2_022074_1.png	14883
2258	/var/www/html/images/properties/B62_P2_022074_2.png	14883
2259	/var/www/html/images/properties/B62_P2_041474_1.png	14883
2260	/var/www/html/images/properties/B62_P3_011674_1.png	14884
2261	/var/www/html/images/properties/B62_P3_011674_2.png	14884
2262	/var/www/html/images/properties/B62_P3_040674_1.png	14884
2263	/var/www/html/images/properties/B62_P4_022074_1.png	14885
2264	/var/www/html/images/properties/B62_P4_041474_1.png	14885
2265	/var/www/html/images/properties/B62_P5_022074_1.png	14886
2266	/var/www/html/images/properties/B62_P5_022074_2.png	14886
2267	/var/www/html/images/properties/B62_P5_041474_1.png	14886
2268	/var/www/html/images/properties/B62_P6_062066_1.png	14887
2269	/var/www/html/images/properties/B62_P6_062066_2.png	14887
2270	/var/www/html/images/properties/B62_P6_062066_3.png	14887
2271	/var/www/html/images/properties/B62_P6_062066_4.png	14887
2272	/var/www/html/images/properties/B62_P6_080668_1.png	14887
2273	/var/www/html/images/properties/B62_P6_080768_1.png	14887
2274	/var/www/html/images/properties/B62_P6_080768_2.png	14887
2275	/var/www/html/images/properties/B62_P6_080768_3.png	14887
2276	/var/www/html/images/properties/B62_P6_080768_4.png	14887
2277	/var/www/html/images/properties/B62_P6_080768_5.png	14887
2278	/var/www/html/images/properties/B62_P6_nodate_1.png	14887
2279	/var/www/html/images/properties/B62_P6_nodate_2.png	14887
2280	/var/www/html/images/properties/B62_P6_nodate_3.png	14887
2281	/var/www/html/images/properties/B62_P6_nodate_4.png	14887
2282	/var/www/html/images/properties/B62_P6_nodate_5.png	14887
2283	/var/www/html/images/properties/B63_P12_011574_1.png	14888
2284	/var/www/html/images/properties/B63_P12_011574_2.png	14888
2285	/var/www/html/images/properties/B63_P12_020674_1.png	14888
2286	/var/www/html/images/properties/B64_P5_030475_1.png	14889
2287	/var/www/html/images/properties/B64_P5_030475_2.png	14889
2288	/var/www/html/images/properties/B64_P5_030475_3.png	14889
2289	/var/www/html/images/properties/B64_P5_030475_4.png	14889
2290	/var/www/html/images/properties/B6_P12_090469_1.png	14890
2291	/var/www/html/images/properties/B6_P13_030174_1.png	14891
2292	/var/www/html/images/properties/B6_P13_052374_1.png	14891
2293	/var/www/html/images/properties/B6_P13_062066_1.png	14891
2294	/var/www/html/images/properties/B6_P13_081668_1.png	14891
2295	/var/www/html/images/properties/B6_P14A_011074_1.png	14892
2296	/var/www/html/images/properties/B6_P14A_011074_2.png	14892
2297	/var/www/html/images/properties/B6_P14A_020674_1.png	14892
2298	/var/www/html/images/properties/B6_P14C_011074_1.png	14892
2299	/var/www/html/images/properties/B6_P14C_011074_2.png	14892
2300	/var/www/html/images/properties/B6_P14C_020674_1.png	14892
2301	/var/www/html/images/properties/B6_P15_082368_1.png	14893
2302	/var/www/html/images/properties/B6_P15_091565_1.png	14893
2303	/var/www/html/images/properties/B6_P15_092966_1.png	14893
2304	/var/www/html/images/properties/B6_P17_082368_1.png	14894
2305	/var/www/html/images/properties/B6_P17_082368_2.png	14894
2306	/var/www/html/images/properties/B6_P17_101966_1.png	14894
2307	/var/www/html/images/properties/B6_P1_080568_1.png	14895
2308	/var/www/html/images/properties/B6_P1_091565_1.png	14895
2309	/var/www/html/images/properties/B6_P1_100568_1.png	14895
2310	/var/www/html/images/properties/B6_P1_100568_2.png	14895
2311	/var/www/html/images/properties/B6_P21_082368_1.png	14896
2312	/var/www/html/images/properties/B6_P21_082368_2.png	14896
2313	/var/www/html/images/properties/B6_P21_091565_1.png	14896
2314	/var/www/html/images/properties/B6_P22_070165_1.png	14897
2315	/var/www/html/images/properties/B6_P22_070165_2.png	14897
2316	/var/www/html/images/properties/B6_P22_070165_3.png	14897
2317	/var/www/html/images/properties/B6_P22_090768_1.png	14897
2318	/var/www/html/images/properties/B6_P22_090768_2.png	14897
2319	/var/www/html/images/properties/B6_P25_079165_1.png	14898
2320	/var/www/html/images/properties/B6_P25_082368_1.png	14898
2321	/var/www/html/images/properties/B6_P2_090165_1.png	14899
2322	/var/www/html/images/properties/B6_P2_nodate_1.png	14899
2323	/var/www/html/images/properties/B6_P2_nodate_2.png	14899
2324	/var/www/html/images/properties/B6_P36_031674_1.png	14900
2325	/var/www/html/images/properties/B6_P36_041474_1.png	14900
2326	/var/www/html/images/properties/B6_P37_082468_1.png	14901
2327	/var/www/html/images/properties/B6_P37_082775_1.png	14901
2328	/var/www/html/images/properties/B6_P37_101375_1.png	14901
2329	/var/www/html/images/properties/B6_P37_101375_2.png	14901
2330	/var/www/html/images/properties/B6_P37_101375_3.png	14901
2331	/var/www/html/images/properties/B6_P37_nodate_1.png	14901
2332	/var/www/html/images/properties/B6_P37_nodate_2.png	14901
2333	/var/www/html/images/properties/B6_P37_nodate_3.png	14901
2334	/var/www/html/images/properties/B6_P38_030575_1.png	14902
2335	/var/www/html/images/properties/B6_P38_030575_2.png	14902
2336	/var/www/html/images/properties/B6_P38_030575_3.png	14902
2337	/var/www/html/images/properties/B6_P38_030575_4.png	14902
2338	/var/www/html/images/properties/B6_P38_030575_5.png	14902
2339	/var/www/html/images/properties/B6_P38_030575_6.png	14902
2340	/var/www/html/images/properties/B6_P38_091565_1.png	14902
2341	/var/www/html/images/properties/B6_P38_092668_1.png	14902
2342	/var/www/html/images/properties/B6_P38_092668_2.png	14902
2343	/var/www/html/images/properties/B6_P38_nodate_1.png	14902
2344	/var/www/html/images/properties/B6_P38_nodate_2.png	14902
2345	/var/www/html/images/properties/B6_P39_082468_1.png	14903
2346	/var/www/html/images/properties/B6_P39_092474_1.png	14903
2347	/var/www/html/images/properties/B6_P39_093074_1.png	14903
2348	/var/www/html/images/properties/B6_P39_101366_1.png	14903
2349	/var/www/html/images/properties/B6_P3_082668_1.png	14904
2350	/var/www/html/images/properties/B6_P3_091565_1.png	14904
2351	/var/www/html/images/properties/B6_P3_101568_1.png	14904
2352	/var/www/html/images/properties/B6_P40_nodate_1.png	14905
2353	/var/www/html/images/properties/B6_P40_nodate_2.png	14905
2354	/var/www/html/images/properties/B6_P40_nodate_3.png	14905
2355	/var/www/html/images/properties/B6_P41_083168_1.png	14906
2356	/var/www/html/images/properties/B6_P41_nodate_1.png	14906
2357	/var/www/html/images/properties/B6_P41_nodate_2.png	14906
2358	/var/www/html/images/properties/B6_P42_090768_1.png	14907
2359	/var/www/html/images/properties/B6_P42_101166_1.png	14907
2360	/var/www/html/images/properties/B6_P43_101166_1.png	14908
2361	/var/www/html/images/properties/B6_P43_nodate_1.png	14908
2362	/var/www/html/images/properties/B6_P44_030474_1.png	14909
2363	/var/www/html/images/properties/B6_P44_030474_2.png	14909
2364	/var/www/html/images/properties/B6_P44_030474_3.png	14909
2365	/var/www/html/images/properties/B6_P44_041474_1.png	14909
2366	/var/www/html/images/properties/B6_P44_041474_2.png	14909
2367	/var/www/html/images/properties/B6_P47_090768_1.png	14910
2368	/var/www/html/images/properties/B6_P47_091565_1.png	14910
2369	/var/www/html/images/properties/B6_P48_083168_1.png	14911
2370	/var/www/html/images/properties/B6_P48_083168_2.png	14911
2371	/var/www/html/images/properties/B6_P48_101166_1.png	14911
2372	/var/www/html/images/properties/B6_P49_091565_1.png	14912
2373	/var/www/html/images/properties/B6_P49_091565_2.png	14912
2374	/var/www/html/images/properties/B6_P49_111568_1.png	14912
2375	/var/www/html/images/properties/B6_P49_111568_2.png	14912
2376	/var/www/html/images/properties/B6_P49_111568_3.png	14912
2377	/var/www/html/images/properties/B6_P49_nodate_1.png	14912
2378	/var/www/html/images/properties/B6_P49_nodate_2.png	14912
2379	/var/www/html/images/properties/B6_P4_081668_1.png	14913
2380	/var/www/html/images/properties/B6_P4_103068_1.png	14913
2381	/var/www/html/images/properties/B6_P50_091565_1.png	14914
2382	/var/www/html/images/properties/B6_P51_nodate_1.png	14915
2383	/var/www/html/images/properties/B6_P51_nodate_2.png	14915
2384	/var/www/html/images/properties/B6_P52_nodate_1.png	14916
2385	/var/www/html/images/properties/B6_P52_nodate_2.png	14916
2386	/var/www/html/images/properties/B6_P53_083168_1.png	14917
2387	/var/www/html/images/properties/B6_P53_nodate_1.png	14917
2388	/var/www/html/images/properties/B6_P54_120668_1.png	14918
2389	/var/www/html/images/properties/B6_P54_nodate_1.png	14918
2390	/var/www/html/images/properties/B6_P55_091468_1.png	14919
2391	/var/www/html/images/properties/B6_P55_091468_2.png	14919
2392	/var/www/html/images/properties/B6_P55_nodate_1.png	14919
2393	/var/www/html/images/properties/B6_P56_091468_1.png	14920
2394	/var/www/html/images/properties/B6_P56_nodate_1.png	14920
2395	/var/www/html/images/properties/B6_P57_091565_1.png	14921
2396	/var/www/html/images/properties/B6_P57_100566_1.png	14921
2397	/var/www/html/images/properties/B6_P58_050575_1.png	14922
2398	/var/www/html/images/properties/B6_P58_050575_2.png	14922
2399	/var/www/html/images/properties/B6_P58_050575_3.png	14922
2400	/var/www/html/images/properties/B6_P58_050575_4.png	14922
2401	/var/www/html/images/properties/B6_P58_050575_5.png	14922
2402	/var/www/html/images/properties/B6_P58_050575_6.png	14922
2403	/var/www/html/images/properties/B6_P58_050575_7.png	14922
2404	/var/www/html/images/properties/B6_P58_091565_1.png	14922
2405	/var/www/html/images/properties/B6_P58_091565_2.png	14922
2406	/var/www/html/images/properties/B6_P58_100566_1.png	14922
2407	/var/www/html/images/properties/B6_P59_091565_1.png	14923
2408	/var/www/html/images/properties/B6_P59_091565_2.png	14923
2409	/var/www/html/images/properties/B6_P59_092168_1.png	14923
2410	/var/www/html/images/properties/B6_P59_092168_2.png	14923
2411	/var/www/html/images/properties/B6_P59_093066_1.png	14923
2412	/var/www/html/images/properties/B6_P5_030774_1.png	14924
2413	/var/www/html/images/properties/B6_P5_030774_2.png	14924
2414	/var/www/html/images/properties/B6_P5_030774_3.png	14924
2415	/var/www/html/images/properties/B6_P5_041474_1.png	14924
2416	/var/www/html/images/properties/B6_P5_041474_2.png	14924
2417	/var/www/html/images/properties/B6_P60_091565_1.png	14925
2418	/var/www/html/images/properties/B6_P60_092168_1.png	14925
2419	/var/www/html/images/properties/B6_P61_091468_1.png	14926
2420	/var/www/html/images/properties/B6_P61_091565_1.png	14926
2421	/var/www/html/images/properties/B6_P62_091468_1.png	14927
2422	/var/www/html/images/properties/B6_P62_093066_1.png	14927
2423	/var/www/html/images/properties/B6_P63_070866_1.png	14928
2424	/var/www/html/images/properties/B6_P63_091463_1.png	14928
2425	/var/www/html/images/properties/B6_P65_091468_1.png	14929
2426	/var/www/html/images/properties/B6_P65_091565_1.png	14929
2427	/var/www/html/images/properties/B6_P66_091565_1.png	14930
2428	/var/www/html/images/properties/B6_P66_092966_1.png	14930
2429	/var/www/html/images/properties/B6_P67_082268_1.png	14931
2430	/var/www/html/images/properties/B6_P67_091468_1.png	14931
2431	/var/www/html/images/properties/B6_P68_062066_1.png	14932
2432	/var/www/html/images/properties/B6_P68_091468_1.png	14932
2433	/var/www/html/images/properties/B6_P69_062066_1.png	14933
2434	/var/www/html/images/properties/B6_P69_093066_1.png	14933
2435	/var/www/html/images/properties/B6_P6_080668_1.png	14934
2436	/var/www/html/images/properties/B6_P6_091565_1.png	14934
2437	/var/www/html/images/properties/B6_P6_101568_1.png	14934
2438	/var/www/html/images/properties/B6_P70_070866_1.png	14935
2439	/var/www/html/images/properties/B6_P70_092168_1.png	14935
2440	/var/www/html/images/properties/B6_P72_011574_1.png	14936
2441	/var/www/html/images/properties/B6_P72_011574_2.png	14936
2442	/var/www/html/images/properties/B6_P72_020674_1.png	14936
2443	/var/www/html/images/properties/B6_P75_072077_1.png	14937
2444	/var/www/html/images/properties/B6_P75_072077_2.png	14937
2445	/var/www/html/images/properties/B6_P75_072077_3.png	14937
2446	/var/www/html/images/properties/B6_P75_081277_1.png	14937
2447	/var/www/html/images/properties/B6_P75_091565_1.png	14937
2448	/var/www/html/images/properties/B6_P75_091565_2.png	14937
2449	/var/www/html/images/properties/B6_P75_092966_1.png	14937
2450	/var/www/html/images/properties/B6_P75_092966_2.png	14937
2451	/var/www/html/images/properties/B6_P75_110268_1.png	14937
2452	/var/www/html/images/properties/B6_P75_110268_2.png	14937
2453	/var/www/html/images/properties/B6_P75_110268_3.png	14937
2454	/var/www/html/images/properties/B6_P75_110268_4.png	14937
2455	/var/www/html/images/properties/B6_P75_nodate_1.png	14937
2456	/var/www/html/images/properties/B6_P77_091565_1.png	14938
2457	/var/www/html/images/properties/B6_P77_091565_2.png	14938
2458	/var/www/html/images/properties/B6_P78_092166_1.png	14939
2459	/var/www/html/images/properties/B6_P78_110268_1.png	14939
2460	/var/www/html/images/properties/B6_P79_091565_1.png	14940
2461	/var/www/html/images/properties/B6_P79_091565_2.png	14940
2462	/var/www/html/images/properties/B6_P79_091565_3.png	14940
2463	/var/www/html/images/properties/B6_P79_092266_1.png	14940
2464	/var/www/html/images/properties/B6_P79_111568_1.png	14940
2465	/var/www/html/images/properties/B6_P79_nodate_1.png	14940
2466	/var/www/html/images/properties/B6_P79_nodate_2.png	14940
2467	/var/www/html/images/properties/B6_P79_nodate_3.png	14940
2468	/var/www/html/images/properties/B6_P79_nodate_4.png	14940
2469	/var/www/html/images/properties/B6_P7_091565_1.png	14941
2470	/var/www/html/images/properties/B6_P7_101868_1.png	14941
2471	/var/www/html/images/properties/B6_P8_062266_1.png	14942
2472	/var/www/html/images/properties/B71_P10_021567_1.png	14943
2473	/var/www/html/images/properties/B71_P10_062066_1.png	14943
2474	/var/www/html/images/properties/B71_P10_070568_1.png	14943
2475	/var/www/html/images/properties/B71_P11_021567_1.png	14944
2476	/var/www/html/images/properties/B71_P11_062066_1.png	14944
2477	/var/www/html/images/properties/B71_P11_070568_1.png	14944
2478	/var/www/html/images/properties/B71_P12_021667_1.png	14945
2479	/var/www/html/images/properties/B71_P12_062066_1.png	14945
2480	/var/www/html/images/properties/B71_P12_070568_1.png	14945
2481	/var/www/html/images/properties/B71_P13_021667_1.png	14946
2482	/var/www/html/images/properties/B71_P13_062066_1.png	14946
2483	/var/www/html/images/properties/B71_P13_070568_1.png	14946
2484	/var/www/html/images/properties/B71_P14_021567_1.png	14947
2485	/var/www/html/images/properties/B71_P14_062066_1.png	14947
2486	/var/www/html/images/properties/B71_P14_070568_1.png	14947
2487	/var/www/html/images/properties/B71_P15_022467_1.png	14948
2488	/var/www/html/images/properties/B71_P15_062066_1.png	14948
2489	/var/www/html/images/properties/B71_P15_062066_2.png	14948
2490	/var/www/html/images/properties/B71_P15_082376_1.png	14948
2491	/var/www/html/images/properties/B71_P15_082376_2.png	14948
2492	/var/www/html/images/properties/B71_P15_082376_3.png	14948
2493	/var/www/html/images/properties/B71_P15_082376_4.png	14948
2494	/var/www/html/images/properties/B71_P15_082376_5.png	14948
2495	/var/www/html/images/properties/B71_P15_082376_6.png	14948
2496	/var/www/html/images/properties/B71_P15_082376_7.png	14948
2497	/var/www/html/images/properties/B71_P15_090376_1.png	14948
2498	/var/www/html/images/properties/B71_P15_nodate_1.png	14948
2499	/var/www/html/images/properties/B71_P15_nodate_2.png	14948
2500	/var/www/html/images/properties/B71_P15_nodate_3.png	14948
2501	/var/www/html/images/properties/B71_P15_nodate_4.png	14948
2502	/var/www/html/images/properties/B71_P15_nodate_5.png	14948
2503	/var/www/html/images/properties/B71_P16_070866_1.png	14949
2504	/var/www/html/images/properties/B71_P16_081968_1.png	14949
2505	/var/www/html/images/properties/B71_P16_082368_1.png	14949
2506	/var/www/html/images/properties/B71_P17_022267_1.png	14950
2507	/var/www/html/images/properties/B71_P17_062066_1.png	14950
2508	/var/www/html/images/properties/B71_P17_070568_1.png	14950
2509	/var/www/html/images/properties/B71_P18_070866_1.png	14951
2510	/var/www/html/images/properties/B71_P18_070866_2.png	14951
2511	/var/www/html/images/properties/B71_P18_071568_1.png	14951
2512	/var/www/html/images/properties/B71_P18_080168_1.png	14951
2513	/var/www/html/images/properties/B71_P19_022267_1.png	14952
2514	/var/www/html/images/properties/B71_P19_070866_1.png	14952
2515	/var/www/html/images/properties/B71_P19_071568_1.png	14952
2516	/var/www/html/images/properties/B71_P1_010276_1.png	14953
2517	/var/www/html/images/properties/B71_P1_010276_2.png	14953
2518	/var/www/html/images/properties/B71_P1_010276_3.png	14953
2519	/var/www/html/images/properties/B71_P1_010276_4.png	14953
2520	/var/www/html/images/properties/B71_P1_010276_5.png	14953
2521	/var/www/html/images/properties/B71_P1_010276_6.png	14953
2522	/var/www/html/images/properties/B71_P1_010276_7.png	14953
2523	/var/www/html/images/properties/B71_P20_030467_1.png	14954
2524	/var/www/html/images/properties/B71_P20_070866_1.png	14954
2525	/var/www/html/images/properties/B71_P20_070866_2.png	14954
2526	/var/www/html/images/properties/B71_P20_070866_3.png	14954
2527	/var/www/html/images/properties/B71_P20_070866_4.png	14954
2528	/var/www/html/images/properties/B71_P20_070866_5.png	14954
2529	/var/www/html/images/properties/B71_P20_073068_1.png	14954
2530	/var/www/html/images/properties/B71_P20_080368_1.png	14954
2531	/var/www/html/images/properties/B71_P20_080368_2.png	14954
2532	/var/www/html/images/properties/B71_P22_022467_1.png	14955
2533	/var/www/html/images/properties/B71_P22_041974_1.png	14955
2534	/var/www/html/images/properties/B71_P22_051976_1.png	14955
2535	/var/www/html/images/properties/B71_P22_051976_2.png	14955
2536	/var/www/html/images/properties/B71_P22_061274_1.png	14955
2537	/var/www/html/images/properties/B71_P22_061976_1.png	14955
2538	/var/www/html/images/properties/B71_P22_070568_1.png	14955
2539	/var/www/html/images/properties/B71_P23_030267_1.png	14956
2540	/var/www/html/images/properties/B71_P23_062066_1.png	14956
2541	/var/www/html/images/properties/B71_P23_070968_1.png	14956
2542	/var/www/html/images/properties/B71_P24_062066_1.png	14957
2543	/var/www/html/images/properties/B71_P24_072768_1.png	14957
2544	/var/www/html/images/properties/B71_P25_022467_1.png	14958
2545	/var/www/html/images/properties/B71_P25_062066_1.png	14958
2546	/var/www/html/images/properties/B71_P25_070968_1.png	14958
2547	/var/www/html/images/properties/B71_P26_062066_1.png	14959
2548	/var/www/html/images/properties/B71_P26_081168_1.png	14959
2549	/var/www/html/images/properties/B71_P26_082968_1.png	14959
2550	/var/www/html/images/properties/B71_P27_022367_1.png	14960
2551	/var/www/html/images/properties/B71_P27_062066_1.png	14960
2552	/var/www/html/images/properties/B71_P27_070968_1.png	14960
2553	/var/www/html/images/properties/B71_P28_022567_1.png	14961
2554	/var/www/html/images/properties/B71_P28_062066_1.png	14961
2555	/var/www/html/images/properties/B71_P28_082068_1.png	14961
2556	/var/www/html/images/properties/B71_P29_121175_1.png	14962
2557	/var/www/html/images/properties/B71_P29_121175_2.png	14962
2558	/var/www/html/images/properties/B71_P2_102075_1.png	14963
2559	/var/www/html/images/properties/B71_P2_102075_2.png	14963
2560	/var/www/html/images/properties/B71_P2_102275_1.png	14963
2561	/var/www/html/images/properties/B71_P30_010276_1.png	14964
2562	/var/www/html/images/properties/B71_P30_010276_2.png	14964
2563	/var/www/html/images/properties/B71_P30_010276_3.png	14964
2564	/var/www/html/images/properties/B71_P31_121175_1.png	14965
2565	/var/www/html/images/properties/B71_P31_121175_2.png	14965
2566	/var/www/html/images/properties/B71_P32_121175_1.png	14966
2567	/var/www/html/images/properties/B71_P32_121175_2.png	14966
2568	/var/www/html/images/properties/B71_P32_121175_3.png	14966
2569	/var/www/html/images/properties/B71_P3_102075_1.png	14967
2570	/var/www/html/images/properties/B71_P3_102075_2.png	14967
2571	/var/www/html/images/properties/B71_P3_102275_1.png	14967
2572	/var/www/html/images/properties/B71_P4_102275_1.png	14968
2573	/var/www/html/images/properties/B71_P4_102275_2.png	14968
2574	/var/www/html/images/properties/B71_P4_102275_3.png	14968
2575	/var/www/html/images/properties/B71_P5_102275_1.png	14969
2576	/var/www/html/images/properties/B71_P5_102275_2.png	14969
2577	/var/www/html/images/properties/B71_P5_102275_3.png	14969
2578	/var/www/html/images/properties/B71_P6_102275_1.png	14970
2579	/var/www/html/images/properties/B71_P6_102275_2.png	14970
2580	/var/www/html/images/properties/B71_P6_102275_3.png	14970
2581	/var/www/html/images/properties/B71_P7_102175_1.png	14971
2582	/var/www/html/images/properties/B71_P7_102175_2.png	14971
2583	/var/www/html/images/properties/B71_P7_102175_3.png	14971
2584	/var/www/html/images/properties/B71_P8_102075_1.png	14972
2585	/var/www/html/images/properties/B71_P8_102075_2.png	14972
2586	/var/www/html/images/properties/B71_P8_102275_1.png	14972
2587	/var/www/html/images/properties/B71_P9_021567_1.png	14973
2588	/var/www/html/images/properties/B71_P9_062066_1.png	14973
2589	/var/www/html/images/properties/B71_P9_070968_1.png	14973
2590	/var/www/html/images/properties/B72_P10_011574_1.png	14974
2591	/var/www/html/images/properties/B72_P10_011574_2.png	14974
2592	/var/www/html/images/properties/B72_P10_020674_1.png	14974
2593	/var/www/html/images/properties/B72_P10_020674_2.png	14974
2594	/var/www/html/images/properties/B72_P10_080268_1.png	14974
2595	/var/www/html/images/properties/B72_P1_093074_1.png	14975
2596	/var/www/html/images/properties/B72_P1_093074_2.png	14975
2597	/var/www/html/images/properties/B72_P1_112174_1.png	14975
2598	/var/www/html/images/properties/B72_P2_100474_1.png	14976
2599	/var/www/html/images/properties/B72_P2_100474_2.png	14976
2600	/var/www/html/images/properties/B72_P2_112174_1.png	14976
2601	/var/www/html/images/properties/B72_P2_112174_2.png	14976
2602	/var/www/html/images/properties/B72_P2_112174_3.png	14976
2603	/var/www/html/images/properties/B72_P3_030467_1.png	14977
2604	/var/www/html/images/properties/B72_P3_062066_1.png	14977
2605	/var/www/html/images/properties/B72_P3_072068_1.png	14977
2606	/var/www/html/images/properties/B72_P4_021767_1.png	14978
2607	/var/www/html/images/properties/B72_P4_070866_1.png	14978
2608	/var/www/html/images/properties/B72_P4_081468_1.png	14978
2609	/var/www/html/images/properties/B72_P5_021767_1.png	14979
2610	/var/www/html/images/properties/B72_P5_062066_1.png	14979
2611	/var/www/html/images/properties/B72_P5_071568_1.png	14979
2612	/var/www/html/images/properties/B72_P6_021767_1.png	14980
2613	/var/www/html/images/properties/B72_P6_062066_1.png	14980
2614	/var/www/html/images/properties/B72_P6_072068_1.png	14980
2615	/var/www/html/images/properties/B72_P7_021767_1.png	14981
2616	/var/www/html/images/properties/B72_P7_062066_1.png	14981
2617	/var/www/html/images/properties/B72_P7_071268_1.png	14981
2618	/var/www/html/images/properties/B72_P8_111474_1.png	14982
2619	/var/www/html/images/properties/B72_P8_120674_1.png	14982
2620	/var/www/html/images/properties/B72_P9_082644_2.png	14983
2621	/var/www/html/images/properties/B72_P9_082664_1.png	14983
2622	/var/www/html/images/properties/B72_P9_082674_2.png	14983
2623	/var/www/html/images/properties/B72_P9_092474_1.png	14983
2624	/var/www/html/images/properties/B76_P1_031868_1.png	14984
2625	/var/www/html/images/properties/B76_P1_070866_1.png	14984
2626	/var/www/html/images/properties/B76_P2_031868_1.png	14985
2627	/var/www/html/images/properties/B76_P2_062066_1.png	14985
2628	/var/www/html/images/properties/B76_P2_072068_1.png	14985
2629	/var/www/html/images/properties/B76_P3_031868_1.png	14986
2630	/var/www/html/images/properties/B76_P3_062066_1.png	14986
2631	/var/www/html/images/properties/B76_P3_071368_1.png	14986
2632	/var/www/html/images/properties/B76_P4_031868_1.png	14987
2633	/var/www/html/images/properties/B76_P4_062066_1.png	14987
2634	/var/www/html/images/properties/B76_P4_071268_1.png	14987
2635	/var/www/html/images/properties/B76_P5_031868_1.png	14988
2636	/var/www/html/images/properties/B76_P5_062066_1.png	14988
2637	/var/www/html/images/properties/B76_P5_071268_1.png	14988
2638	/var/www/html/images/properties/B76_P6_032068_1.png	14989
2639	/var/www/html/images/properties/B76_P6_062066_1.png	14989
2640	/var/www/html/images/properties/B76_P6_062066_2.png	14989
2641	/var/www/html/images/properties/B76_P7_031868_1.png	14990
2642	/var/www/html/images/properties/B76_P7_062066_1.png	14990
2643	/var/www/html/images/properties/B76_P7_081368_1.png	14990
2644	/var/www/html/images/properties/B76_P8_031868_1.png	14991
2645	/var/www/html/images/properties/B76_P8_062066_1.png	14991
2646	/var/www/html/images/properties/B76_P8_071268_1.png	14991
2647	/var/www/html/images/properties/B76_P9_031868_1.png	14992
2648	/var/www/html/images/properties/B76_P9_062066_1.png	14992
2649	/var/www/html/images/properties/B76_P9_071268_1.png	14992
2650	/var/www/html/images/properties/B7_P14_070375_1.png	14993
2651	/var/www/html/images/properties/B7_P14_070375_2.png	14993
2652	/var/www/html/images/properties/B7_P14_070375_3.png	14993
2653	/var/www/html/images/properties/B7_P14_070375_4.png	14993
2654	/var/www/html/images/properties/B7_P14_070375_5.png	14993
2655	/var/www/html/images/properties/B7_P14_070375_6.png	14993
2656	/var/www/html/images/properties/B7_P14_070375_7.png	14993
2657	/var/www/html/images/properties/B7_P14_070375_8.png	14993
2658	/var/www/html/images/properties/B7_P14_070375_9.png	14993
2659	/var/www/html/images/properties/B7_P14_071168_1.png	14993
2660	/var/www/html/images/properties/B7_P14_082875_1.png	14993
2661	/var/www/html/images/properties/B7_P14_082875_2.png	14993
2662	/var/www/html/images/properties/B7_P14_082875_3.png	14993
2663	/var/www/html/images/properties/B7_P14_082875_4.png	14993
2664	/var/www/html/images/properties/B7_P14_082875_5.png	14993
2665	/var/www/html/images/properties/B7_P14_091565_1.png	14993
2666	/var/www/html/images/properties/B7_P14_091565_2.png	14993
2667	/var/www/html/images/properties/B7_P14_091565_3.png	14993
2668	/var/www/html/images/properties/B7_P14_091565_4.png	14993
2669	/var/www/html/images/properties/B7_P14_091565_5.png	14993
2670	/var/www/html/images/properties/B7_P14_091565_6.png	14993
2671	/var/www/html/images/properties/B7_P14_091565_7.png	14993
2672	/var/www/html/images/properties/B7_P14_102671_1.png	14993
2673	/var/www/html/images/properties/B7_P14_102671_2.png	14993
2674	/var/www/html/images/properties/B7_P14_102671_3.png	14993
2675	/var/www/html/images/properties/B7_P14_nodate_1.png	14993
2676	/var/www/html/images/properties/B7_P14_nodate_2 (1).png	14993
2677	/var/www/html/images/properties/B7_P14_nodate_2.png	14993
2678	/var/www/html/images/properties/B7_P14_nodate_3.png	14993
2679	/var/www/html/images/properties/B7_P14_nodate_5.png	14993
2680	/var/www/html/images/properties/B7_P14_nodate_6.png	14993
\.


--
-- Name: image_paths_image_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: humanface
--

SELECT pg_catalog.setval('humanface.image_paths_image_id_seq', 2680, true);


--
-- Data for Name: owners; Type: TABLE DATA; Schema: humanface; Owner: humanface
--

COPY humanface.owners (owner_id, owner_name, pass_away_date, is_heir) FROM stdin;
1	Willie A. Glenn                                                                                                                                                                                                                                                	\N	N    
2	Bessie Kalogerkais                                                                                                                                                                                                                                             	\N	N    
\.


--
-- Data for Name: parcel_owner_assoc; Type: TABLE DATA; Schema: humanface; Owner: humanface
--

COPY humanface.parcel_owner_assoc (id, parcel_id, owner_id, puchase_prices, loan_price, deed_transfer_date) FROM stdin;
1	1	1	$11,000.00	\N	1947-01-03
3	3	3	$8,500.00	\N	1945-08-31
\.


--
-- Name: parcel_owner_assoc_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: humanface
--

SELECT pg_catalog.setval('humanface.parcel_owner_assoc_id_seq', 1, false);


--
-- Data for Name: parcels; Type: TABLE DATA; Schema: humanface; Owner: humanface
--

COPY humanface.parcels (parcel_id, block_no, parcel_no, ward_no, land_use) FROM stdin;
1111	1111	1111	1111	Commercial                                                      
2222	2222	2222	2222	Commercial                                                      
3333	3333	3333	3333	Commercial                                                      
5555	5555	5555	5555	5555                                                            
6666	6666	6666	6666	6666                                                            
7777	7777	7777	7777	7777                                                            
9999	9999	9999	9999	9999                                                            
1	9	9	9	                                                                
10	10	10	10	                                                                
11	11	11	11	Commercial                                                      
6777	6777	6777	6777	Commercial                                                      
76	76	76	76	Commercial                                                      
88	88	88	88	Commercial                                                      
92	92	92	92	Commercial                                                      
67	67	67	67	Commercial                                                      
21	21	21	21	Commercial                                                      
8	8	8	8	Commercial                                                      
\.


--
-- Data for Name: parcels_old; Type: TABLE DATA; Schema: humanface; Owner: humanface
--

COPY humanface.parcels_old (parcel_id, concurred_price, date_concurred, date_title_search, date_offer_made, date_offer_accepted, date_condemn_approval, date_assignedto_attornery, date_petition_filed, date_commis_hearing, date_order_vesting_title, date_final_title_certi, block_no, parcel_no, ward_no, special_proceeding_no, date_assigned_for_demolition, date_removed, address) FROM stdin;
1	$11,000.00	1969-03-07	1969-11-24	1969-10-22	\N	\N	\N	\N	\N	1971-11-23	1971-11-23	1	51	4	\N	1971-11-23	1972-07-17	\N
2	$15,000.00	1969-03-07	1969-09-28	1969-08-06	\N	1970-12-31	\N	1971-07-15	1971-06-09	1971-06-16	1971-06-17	1	3	4	\N	\N	\N	\N
\.


--
-- Name: parcels_parcel_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: humanface
--

SELECT pg_catalog.setval('humanface.parcels_parcel_id_seq', 14993, true);


--
-- Data for Name: people; Type: TABLE DATA; Schema: humanface; Owner: humanface
--

COPY humanface.people (person_id, name) FROM stdin;
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
93	Johnson P Greer Jr                                                                                                                                                                                                                                             
94	Estelle Williams Est                                                                                                                                                                                                                                           
95	Paul J Smith, Commissioner                                                                                                                                                                                                                                     
96	Johnson P Greer JR                                                                                                                                                                                                                                             
97	Lewis Holloway                                                                                                                                                                                                                                                 
98	Mamie Holloway                                                                                                                                                                                                                                                 
99	Elizabeth Shuford Nichols                                                                                                                                                                                                                                      
100	Herman G Nichols                                                                                                                                                                                                                                               
101	Millard Wilkins                                                                                                                                                                                                                                                
102	Magnolia Wilkins                                                                                                                                                                                                                                               
103	M. Gist                                                                                                                                                                                                                                                        
104	M. H. Kelly and Mary Kelly                                                                                                                                                                                                                                     
105	Annie Gist                                                                                                                                                                                                                                                     
106	Claude Williams                                                                                                                                                                                                                                                
107	G. J. Bates and Eva P. Bates                                                                                                                                                                                                                                   
108	Carlos Palaez                                                                                                                                                                                                                                                  
109	Jesse Lee Palaez                                                                                                                                                                                                                                               
110	Mary Talbert                                                                                                                                                                                                                                                   
111	Mildred Wurzberg                                                                                                                                                                                                                                               
112	Eddie Talbert                                                                                                                                                                                                                                                  
113	                                                                                                                                                                                                                                                               
114	Lillian Wells                                                                                                                                                                                                                                                  
115	Z. W. Wells                                                                                                                                                                                                                                                    
116	W. E. Shuford and Cora J. Shuford                                                                                                                                                                                                                              
117	Z. W. Wells and Lillian Wells                                                                                                                                                                                                                                  
118	                                                                                                                                                                                                                                                               
119	Beulah Alexander                                                                                                                                                                                                                                               
120	John Alexander                                                                                                                                                                                                                                                 
121	Wade Lytle                                                                                                                                                                                                                                                     
122	Archie Chambers                                                                                                                                                                                                                                                
123	Gussie Mae Chambers                                                                                                                                                                                                                                            
124	Miriam Chambers                                                                                                                                                                                                                                                
125	Edward Chambers                                                                                                                                                                                                                                                
126	Gladys Chambers Green                                                                                                                                                                                                                                          
127	Mack Green                                                                                                                                                                                                                                                     
128	John F Shuford and Caney B Shuford                                                                                                                                                                                                                             
129	Fay Chambers                                                                                                                                                                                                                                                   
130	T. N. James and Emily C. James                                                                                                                                                                                                                                 
131	First Presbyterian Church of Lincolnton                                                                                                                                                                                                                        
132	Terrell Wilkins                                                                                                                                                                                                                                                
133	E. M. Browne                                                                                                                                                                                                                                                   
134	A. L. Tait                                                                                                                                                                                                                                                     
135	                                                                                                                                                                                                                                                               
136	Wayne Bramlett                                                                                                                                                                                                                                                 
137	Bernell Swinson                                                                                                                                                                                                                                                
138	Jannie Siwnson                                                                                                                                                                                                                                                 
139	Jannie Swinson                                                                                                                                                                                                                                                 
140	M. F. Meredith and Dorothy N Meredith                                                                                                                                                                                                                          
141	Thorsen Flooring Company                                                                                                                                                                                                                                       
142	Leo Lowery                                                                                                                                                                                                                                                     
143	Virginia Lowery                                                                                                                                                                                                                                                
144	Rosa Lowery                                                                                                                                                                                                                                                    
145	                                                                                                                                                                                                                                                               
146	Harry D Jones et al                                                                                                                                                                                                                                            
147	C. Baber and Mary Winton Baber                                                                                                                                                                                                                                 
148	Rita H Lee                                                                                                                                                                                                                                                     
149	Walter S Lee                                                                                                                                                                                                                                                   
150	Rae B Lee                                                                                                                                                                                                                                                      
151	P. L. Hendrick and Laura Hendrick                                                                                                                                                                                                                              
152	W. S. Lee                                                                                                                                                                                                                                                      
153	W. S. Lee Jr                                                                                                                                                                                                                                                   
154	Aileen Lipscombe                                                                                                                                                                                                                                               
155	Lola B. McCracken                                                                                                                                                                                                                                              
156	                                                                                                                                                                                                                                                               
157	                                                                                                                                                                                                                                                               
158	Randolph F Williams                                                                                                                                                                                                                                            
159	Dorothy Williams                                                                                                                                                                                                                                               
160	Randolph Williams                                                                                                                                                                                                                                              
161	Jacob Gilbert and Betsy Gilbert                                                                                                                                                                                                                                
162	W. E. Logan                                                                                                                                                                                                                                                    
163	Carl Marsdon Logan                                                                                                                                                                                                                                             
164	Josie V Logan                                                                                                                                                                                                                                                  
165	Harry L Nettles and Margaret G Nettles                                                                                                                                                                                                                         
166	Southside, Inc.                                                                                                                                                                                                                                                
167	T N James and Emily C James                                                                                                                                                                                                                                    
168	                                                                                                                                                                                                                                                               
169	William P Shuford                                                                                                                                                                                                                                              
170	Wachovia Bank                                                                                                                                                                                                                                                  
171	Alonzo McCoy                                                                                                                                                                                                                                                   
172	Fannie M McCoy                                                                                                                                                                                                                                                 
173	R. W. Willis                                                                                                                                                                                                                                                   
174	Mary Frances Willis                                                                                                                                                                                                                                            
175	C. C. Willis (Widower)                                                                                                                                                                                                                                         
176	Paul Rout                                                                                                                                                                                                                                                      
177	Amy Ramsey                                                                                                                                                                                                                                                     
178	Edward Sale                                                                                                                                                                                                                                                    
179	R. D. Burgin                                                                                                                                                                                                                                                   
180	Ira I Angel                                                                                                                                                                                                                                                    
181	Lessie K Angel                                                                                                                                                                                                                                                 
182	                                                                                                                                                                                                                                                               
183	Riley Foster                                                                                                                                                                                                                                                   
184	Sophia Foster                                                                                                                                                                                                                                                  
185	Mozella Toland                                                                                                                                                                                                                                                 
186	Margo Collins                                                                                                                                                                                                                                                  
187	Ray Patricia Hunting                                                                                                                                                                                                                                           
188	Francis Naeger                                                                                                                                                                                                                                                 
189	R. Moore                                                                                                                                                                                                                                                       
190	                                                                                                                                                                                                                                                               
191	T. B. Galloway                                                                                                                                                                                                                                                 
192	William Acker                                                                                                                                                                                                                                                  
193	Sallie Acker                                                                                                                                                                                                                                                   
194	                                                                                                                                                                                                                                                               
195	                                                                                                                                                                                                                                                               
196	Zachriah Curry                                                                                                                                                                                                                                                 
197	Emma Curry                                                                                                                                                                                                                                                     
198	                                                                                                                                                                                                                                                               
199	                                                                                                                                                                                                                                                               
\.


--
-- Name: people_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: humanface
--

SELECT pg_catalog.setval('humanface.people_id_seq', 199, true);


--
-- Data for Name: property_photos ; Type: TABLE DATA; Schema: humanface; Owner: humanface
--

COPY humanface."property_photos " (id, property_id, path) FROM stdin;
\.


--
-- Data for Name: tenants; Type: TABLE DATA; Schema: humanface; Owner: humanface
--

COPY humanface.tenants (tenant_id, tenant_name, date_vacated, rent_per_month, rent_refund, rent_address, building_id) FROM stdin;
1	Willie A. Glenn                                                                                                                                                                                                                                                	\N	$100.00	$13,200.00	231 Coxe Avenue                                                                                                                                                                                                                                                	1
\.


--
-- Name: Appraisers_pkey; Type: CONSTRAINT; Schema: humanface; Owner: humanface; Tablespace: 
--

ALTER TABLE ONLY humanface.appraisers
    ADD CONSTRAINT "Appraisers_pkey" PRIMARY KEY (appraiser_id);


--
-- Name: Appraises_pkey; Type: CONSTRAINT; Schema: humanface; Owner: humanface; Tablespace: 
--

ALTER TABLE ONLY humanface.appraisals
    ADD CONSTRAINT "Appraises_pkey" PRIMARY KEY ("appraisal-id");


--
-- Name: Buildings_pkey; Type: CONSTRAINT; Schema: humanface; Owner: humanface; Tablespace: 
--

ALTER TABLE ONLY humanface.buildings
    ADD CONSTRAINT "Buildings_pkey" PRIMARY KEY (building_id);


--
-- Name: Event_pkey; Type: CONSTRAINT; Schema: humanface; Owner: humanface; Tablespace: 
--

ALTER TABLE ONLY humanface.events
    ADD CONSTRAINT "Event_pkey" PRIMARY KEY (event_id);


--
-- Name: Owners _pkey; Type: CONSTRAINT; Schema: humanface; Owner: humanface; Tablespace: 
--

ALTER TABLE ONLY humanface.owners
    ADD CONSTRAINT "Owners _pkey" PRIMARY KEY (owner_id);


--
-- Name: Parcels_pkey; Type: CONSTRAINT; Schema: humanface; Owner: humanface; Tablespace: 
--

ALTER TABLE ONLY humanface.parcels_old
    ADD CONSTRAINT "Parcels_pkey" PRIMARY KEY (parcel_id);


--
-- Name: Property photos _pkey; Type: CONSTRAINT; Schema: humanface; Owner: humanface; Tablespace: 
--

ALTER TABLE ONLY humanface."property_photos "
    ADD CONSTRAINT "Property photos _pkey" PRIMARY KEY (id);


--
-- Name: Tenants_pkey; Type: CONSTRAINT; Schema: humanface; Owner: humanface; Tablespace: 
--

ALTER TABLE ONLY humanface.tenants
    ADD CONSTRAINT "Tenants_pkey" PRIMARY KEY (tenant_id);


--
-- Name: addresses_pkey; Type: CONSTRAINT; Schema: humanface; Owner: humanface; Tablespace: 
--

ALTER TABLE ONLY humanface.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: event_people_assoc_pkey; Type: CONSTRAINT; Schema: humanface; Owner: humanface; Tablespace: 
--

ALTER TABLE ONLY humanface.event_people_assoc
    ADD CONSTRAINT event_people_assoc_pkey PRIMARY KEY (id);


--
-- Name: event_types_pkey; Type: CONSTRAINT; Schema: humanface; Owner: humanface; Tablespace: 
--

ALTER TABLE ONLY humanface.event_types
    ADD CONSTRAINT event_types_pkey PRIMARY KEY (id);


--
-- Name: image_paths_pkey; Type: CONSTRAINT; Schema: humanface; Owner: humanface; Tablespace: 
--

ALTER TABLE ONLY humanface.image_paths
    ADD CONSTRAINT image_paths_pkey PRIMARY KEY (image_id);


--
-- Name: parcel_owner_assoc_pkey; Type: CONSTRAINT; Schema: humanface; Owner: humanface; Tablespace: 
--

ALTER TABLE ONLY humanface.parcel_owner_assoc
    ADD CONSTRAINT parcel_owner_assoc_pkey PRIMARY KEY (id);


--
-- Name: parcels_pkey; Type: CONSTRAINT; Schema: humanface; Owner: humanface; Tablespace: 
--

ALTER TABLE ONLY humanface.parcels
    ADD CONSTRAINT parcels_pkey PRIMARY KEY (parcel_id);


--
-- Name: people_pkey; Type: CONSTRAINT; Schema: humanface; Owner: humanface; Tablespace: 
--

ALTER TABLE ONLY humanface.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (person_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

