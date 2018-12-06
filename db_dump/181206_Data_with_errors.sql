--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.14
-- Dumped by pg_dump version 9.5.14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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
-- Name: Event_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('humanface."Event_id_seq"', 1206, true);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: humanface; Owner: postgres
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
14233	n/a                                                             	Vernell Street                                                                                                                                                                                                                                                 	42185
14234	                                                                	                                                                                                                                                                                                                                                               	42185
14235	136                                                             	Layman Street                                                                                                                                                                                                                                                  	42186
14236	                                                                	                                                                                                                                                                                                                                                               	42186
14237	n/a                                                             	Lyman Street                                                                                                                                                                                                                                                   	42187
14238	                                                                	                                                                                                                                                                                                                                                               	42187
14239	n/a                                                             	Lyman Street                                                                                                                                                                                                                                                   	42188
14240	8                                                               	Fagg street                                                                                                                                                                                                                                                    	42188
14241	n/a                                                             	Lyman Street                                                                                                                                                                                                                                                   	42189
14242	                                                                	                                                                                                                                                                                                                                                               	42189
14243	102                                                             	Tiernan Street                                                                                                                                                                                                                                                 	42190
14244	                                                                	                                                                                                                                                                                                                                                               	42190
14245	107, 111                                                        	Tiernan Street                                                                                                                                                                                                                                                 	42191
14246	                                                                	                                                                                                                                                                                                                                                               	42191
14247	109                                                             	Tiernan Street                                                                                                                                                                                                                                                 	42192
14248	                                                                	                                                                                                                                                                                                                                                               	42192
14249	105                                                             	Tiernan Street                                                                                                                                                                                                                                                 	42193
14250	                                                                	                                                                                                                                                                                                                                                               	42193
14251	n/a                                                             	Depot Street                                                                                                                                                                                                                                                   	42194
14252	                                                                	                                                                                                                                                                                                                                                               	42194
14253	n/a                                                             	Depot Street                                                                                                                                                                                                                                                   	42195
14254	                                                                	                                                                                                                                                                                                                                                               	42195
14255	103                                                             	Tiernan Street                                                                                                                                                                                                                                                 	42196
14256	                                                                	                                                                                                                                                                                                                                                               	42196
14257	196                                                             	Tiernan Street                                                                                                                                                                                                                                                 	42197
14258	                                                                	                                                                                                                                                                                                                                                               	42197
14259	n/a                                                             	Lyman Street                                                                                                                                                                                                                                                   	42198
14260	                                                                	                                                                                                                                                                                                                                                               	42198
14261	n/a                                                             	Fagg Street (next to #4 Fagg st. )                                                                                                                                                                                                                             	42199
14262	                                                                	                                                                                                                                                                                                                                                               	42199
14263	4                                                               	Fagg Street                                                                                                                                                                                                                                                    	42200
14264	                                                                	                                                                                                                                                                                                                                                               	42200
14265	2                                                               	Blanton Street                                                                                                                                                                                                                                                 	42201
14266	                                                                	                                                                                                                                                                                                                                                               	42201
14267	34                                                              	Silver Street                                                                                                                                                                                                                                                  	42202
14268	                                                                	                                                                                                                                                                                                                                                               	42202
14269	4                                                               	Blanton Street                                                                                                                                                                                                                                                 	42203
14270	                                                                	                                                                                                                                                                                                                                                               	42203
14271	10                                                              	Blanton Street                                                                                                                                                                                                                                                 	42204
14272	                                                                	                                                                                                                                                                                                                                                               	42204
14273	12                                                              	Blanton Street                                                                                                                                                                                                                                                 	42205
14274	                                                                	                                                                                                                                                                                                                                                               	42205
14275	n/a                                                             	Fagg Street                                                                                                                                                                                                                                                    	42206
14276	                                                                	                                                                                                                                                                                                                                                               	42206
14277	20                                                              	Blanton Street                                                                                                                                                                                                                                                 	42207
14278	                                                                	                                                                                                                                                                                                                                                               	42207
14279	24                                                              	Fagg Street                                                                                                                                                                                                                                                    	42208
14280	                                                                	                                                                                                                                                                                                                                                               	42208
14281	28                                                              	Fagg Street                                                                                                                                                                                                                                                    	42209
14282	                                                                	                                                                                                                                                                                                                                                               	42209
14283	30                                                              	Fagg Street                                                                                                                                                                                                                                                    	42210
14284	                                                                	                                                                                                                                                                                                                                                               	42210
14285	21                                                              	Link Street                                                                                                                                                                                                                                                    	42211
14286	                                                                	                                                                                                                                                                                                                                                               	42211
14287	22                                                              	Link Street                                                                                                                                                                                                                                                    	42212
14288	                                                                	                                                                                                                                                                                                                                                               	42212
14289	23                                                              	Link Street                                                                                                                                                                                                                                                    	42213
14290	                                                                	                                                                                                                                                                                                                                                               	42213
14291	137                                                             	Horse Shoe Curve                                                                                                                                                                                                                                               	42214
14292	                                                                	                                                                                                                                                                                                                                                               	42214
14293	27                                                              	Link Street                                                                                                                                                                                                                                                    	42215
14294	                                                                	                                                                                                                                                                                                                                                               	42215
14295	34                                                              	Horse Shoe Curve                                                                                                                                                                                                                                               	42216
14296	                                                                	                                                                                                                                                                                                                                                               	42216
14297	62                                                              	Horse Shoe Curve                                                                                                                                                                                                                                               	42217
14298	                                                                	                                                                                                                                                                                                                                                               	42217
14299	62                                                              	Horse Shoe Curve                                                                                                                                                                                                                                               	42218
14300	                                                                	                                                                                                                                                                                                                                                               	42218
14301	Vacant Lot                                                      	Horse Shoe Curve                                                                                                                                                                                                                                               	42219
14302	                                                                	                                                                                                                                                                                                                                                               	42219
14303	199                                                             	Asheland                                                                                                                                                                                                                                                       	42220
14304	                                                                	                                                                                                                                                                                                                                                               	42220
14305	70                                                              	Fagg Street                                                                                                                                                                                                                                                    	42221
14306	                                                                	                                                                                                                                                                                                                                                               	42221
14307	Vacant Lot                                                      	Fagg Street and Horse Shoe Curve                                                                                                                                                                                                                               	42222
14308	                                                                	                                                                                                                                                                                                                                                               	42222
14309	8                                                               	Silver Street                                                                                                                                                                                                                                                  	42223
14310	                                                                	                                                                                                                                                                                                                                                               	42223
14311	97                                                              	Lyman Street                                                                                                                                                                                                                                                   	42224
14312	                                                                	                                                                                                                                                                                                                                                               	42224
14313	97                                                              	Lyman Street                                                                                                                                                                                                                                                   	42225
14314	                                                                	                                                                                                                                                                                                                                                               	42225
14315	14                                                              	Silver Street                                                                                                                                                                                                                                                  	42226
14316	                                                                	                                                                                                                                                                                                                                                               	42226
14317	22                                                              	Blanton Street                                                                                                                                                                                                                                                 	42227
14318	                                                                	                                                                                                                                                                                                                                                               	42227
14319	18                                                              	Silver Street                                                                                                                                                                                                                                                  	42228
14320	                                                                	                                                                                                                                                                                                                                                               	42228
14321	10                                                              	Fagg Street                                                                                                                                                                                                                                                    	42229
14322	                                                                	                                                                                                                                                                                                                                                               	42229
14323	Vacant Lot                                                      	Link and Horse Shore Curve                                                                                                                                                                                                                                     	42230
14324	                                                                	                                                                                                                                                                                                                                                               	42230
14325	14                                                              	Fagg Street                                                                                                                                                                                                                                                    	42231
14326	                                                                	                                                                                                                                                                                                                                                               	42231
14327	28                                                              	Blanton Street                                                                                                                                                                                                                                                 	42232
14328	                                                                	                                                                                                                                                                                                                                                               	42232
14329	20                                                              	Fagg Street                                                                                                                                                                                                                                                    	42233
14330	                                                                	                                                                                                                                                                                                                                                               	42233
14331	32                                                              	Blanton Street                                                                                                                                                                                                                                                 	42234
14332	                                                                	                                                                                                                                                                                                                                                               	42234
14333	Vacant Lot                                                      	Lexie Street                                                                                                                                                                                                                                                   	42235
14334	                                                                	                                                                                                                                                                                                                                                               	42235
14335	34                                                              	Blanton Street                                                                                                                                                                                                                                                 	42236
14336	                                                                	                                                                                                                                                                                                                                                               	42236
14337	38                                                              	Blanton Street                                                                                                                                                                                                                                                 	42237
14338	                                                                	                                                                                                                                                                                                                                                               	42237
14339	24                                                              	Silver Street                                                                                                                                                                                                                                                  	42238
14340	                                                                	                                                                                                                                                                                                                                                               	42238
14341	Vacant Lot                                                      	Lexie Street                                                                                                                                                                                                                                                   	42239
14342	                                                                	                                                                                                                                                                                                                                                               	42239
14343	15                                                              	Blanton                                                                                                                                                                                                                                                        	42240
14344	                                                                	                                                                                                                                                                                                                                                               	42240
14345	38                                                              	Blanton Street                                                                                                                                                                                                                                                 	42241
14346	                                                                	                                                                                                                                                                                                                                                               	42241
14347	Vacant Lot                                                      	Tenie Street and Horse Shoe Curve                                                                                                                                                                                                                              	42242
14348	                                                                	                                                                                                                                                                                                                                                               	42242
14349	56                                                              	Blanton Street                                                                                                                                                                                                                                                 	42243
14350	                                                                	                                                                                                                                                                                                                                                               	42243
14351	58                                                              	Blanton Street                                                                                                                                                                                                                                                 	42244
14352	                                                                	                                                                                                                                                                                                                                                               	42244
14353	246                                                             	South Grove Street                                                                                                                                                                                                                                             	42245
14354	                                                                	                                                                                                                                                                                                                                                               	42245
14355	29                                                              	Blanton Street                                                                                                                                                                                                                                                 	42246
14356	                                                                	                                                                                                                                                                                                                                                               	42246
14357	60                                                              	Blanton Street                                                                                                                                                                                                                                                 	42247
14358	                                                                	                                                                                                                                                                                                                                                               	42247
14359	Vacant Lot                                                      	Tenie Street and Horse Shoe Curve                                                                                                                                                                                                                              	42248
14360	                                                                	                                                                                                                                                                                                                                                               	42248
14361	70                                                              	Blanton Street                                                                                                                                                                                                                                                 	42249
14362	                                                                	                                                                                                                                                                                                                                                               	42249
14363	31                                                              	Blanton Street                                                                                                                                                                                                                                                 	42250
14364	                                                                	                                                                                                                                                                                                                                                               	42250
14365	33                                                              	Phifer Street                                                                                                                                                                                                                                                  	42251
14366	                                                                	                                                                                                                                                                                                                                                               	42251
14367	35                                                              	Blanton Street                                                                                                                                                                                                                                                 	42252
14368	                                                                	                                                                                                                                                                                                                                                               	42252
14369	74                                                              	Blanton Street                                                                                                                                                                                                                                                 	42253
14370	41                                                              	Phifer Street                                                                                                                                                                                                                                                  	42253
14371	39                                                              	Blanton Street                                                                                                                                                                                                                                                 	42254
14372	                                                                	                                                                                                                                                                                                                                                               	42254
14373	62                                                              	Blanton Street                                                                                                                                                                                                                                                 	42255
14374	                                                                	                                                                                                                                                                                                                                                               	42255
14375	253 & 255                                                       	Asheland Avenue                                                                                                                                                                                                                                                	42256
14376	                                                                	                                                                                                                                                                                                                                                               	42256
14377	45                                                              	Blanton Street                                                                                                                                                                                                                                                 	42257
14378	                                                                	                                                                                                                                                                                                                                                               	42257
14379	253-255                                                         	Asheland Ave.                                                                                                                                                                                                                                                  	42258
14380	                                                                	                                                                                                                                                                                                                                                               	42258
14381	249                                                             	Asheland Avenue                                                                                                                                                                                                                                                	42259
14382	                                                                	                                                                                                                                                                                                                                                               	42259
14383	245                                                             	Asheland Ave.                                                                                                                                                                                                                                                  	42260
14384	                                                                	                                                                                                                                                                                                                                                               	42260
14385	229                                                             	Asheland Ave.                                                                                                                                                                                                                                                  	42261
14386	                                                                	                                                                                                                                                                                                                                                               	42261
14387	223                                                             	Asheland Avenue                                                                                                                                                                                                                                                	42262
14388	                                                                	                                                                                                                                                                                                                                                               	42262
14389	217                                                             	Asheland Avenue                                                                                                                                                                                                                                                	42263
14390	                                                                	                                                                                                                                                                                                                                                               	42263
14391	211                                                             	Asheland Avenue                                                                                                                                                                                                                                                	42264
14392	                                                                	                                                                                                                                                                                                                                                               	42264
14393	207                                                             	Asheland Avenue                                                                                                                                                                                                                                                	42265
14394	                                                                	                                                                                                                                                                                                                                                               	42265
14395	60                                                              	Blanton Street                                                                                                                                                                                                                                                 	42266
14396	                                                                	                                                                                                                                                                                                                                                               	42266
14397	62                                                              	Blanton St                                                                                                                                                                                                                                                     	42267
14398	                                                                	                                                                                                                                                                                                                                                               	42267
14399	70                                                              	Blanton Street                                                                                                                                                                                                                                                 	42268
14400	                                                                	                                                                                                                                                                                                                                                               	42268
14401	33                                                              	Phifer Street                                                                                                                                                                                                                                                  	42269
14402	                                                                	                                                                                                                                                                                                                                                               	42269
14403	74                                                              	Blanton                                                                                                                                                                                                                                                        	42270
14404	                                                                	                                                                                                                                                                                                                                                               	42270
14405	25                                                              	Beech Street                                                                                                                                                                                                                                                   	42271
14406	                                                                	                                                                                                                                                                                                                                                               	42271
14407	33                                                              	Beech Street                                                                                                                                                                                                                                                   	42272
14408	                                                                	                                                                                                                                                                                                                                                               	42272
14409	33                                                              	Beech Street                                                                                                                                                                                                                                                   	42273
14410	                                                                	                                                                                                                                                                                                                                                               	42273
14411	35                                                              	Beech Street                                                                                                                                                                                                                                                   	42274
14412	                                                                	                                                                                                                                                                                                                                                               	42274
14413	Joins 45                                                        	Beech Street                                                                                                                                                                                                                                                   	42275
14414	                                                                	                                                                                                                                                                                                                                                               	42275
14415	34                                                              	Herman Avenue                                                                                                                                                                                                                                                  	42276
14416	                                                                	                                                                                                                                                                                                                                                               	42276
14417	34 1/2                                                          	Herman Avenue                                                                                                                                                                                                                                                  	42277
14418	                                                                	                                                                                                                                                                                                                                                               	42277
14419	30                                                              	Herman Avenue                                                                                                                                                                                                                                                  	42278
14420	                                                                	                                                                                                                                                                                                                                                               	42278
14421	26                                                              	Herman Avenue                                                                                                                                                                                                                                                  	42279
14422	                                                                	                                                                                                                                                                                                                                                               	42279
14423	24                                                              	Herman Avenue                                                                                                                                                                                                                                                  	42280
14424	                                                                	                                                                                                                                                                                                                                                               	42280
14425	18                                                              	Silver Street                                                                                                                                                                                                                                                  	42281
14426	                                                                	                                                                                                                                                                                                                                                               	42281
14427	24                                                              	Silver Street                                                                                                                                                                                                                                                  	42282
14428	                                                                	No Ward number was provided                                                                                                                                                                                                                                    	42282
14429	None                                                            	Fagg Street                                                                                                                                                                                                                                                    	42283
14430	                                                                	                                                                                                                                                                                                                                                               	42283
14431	33                                                              	Fagg Street                                                                                                                                                                                                                                                    	42284
14432	                                                                	                                                                                                                                                                                                                                                               	42284
14433	31                                                              	Fagg Street                                                                                                                                                                                                                                                    	42285
14434	                                                                	                                                                                                                                                                                                                                                               	42285
\.


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('humanface.addresses_id_seq', 14434, true);


--
-- Data for Name: event_people_assoc; Type: TABLE DATA; Schema: humanface; Owner: postgres
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
870	401	200	\N
871	401	200	\N
872	402	200	\N
873	403	200	\N
874	404	200	\N
875	405	200	\N
876	406	200	\N
877	407	4	appraiser                                                       
878	408	188	appraiser                                                       
879	409	201	owner                                                           
880	409	202	purchaser                                                       
881	410	203	\N
882	411	4	appraiser                                                       
883	412	188	appraiser                                                       
884	413	201	owner                                                           
885	413	203	purchaser                                                       
886	414	203	\N
887	415	4	appraiser                                                       
888	416	6	appraiser                                                       
889	417	5	appraiser                                                       
890	418	204	\N
891	419	205	owner                                                           
892	419	206	purchaser                                                       
893	420	4	appraiser                                                       
894	421	5	\N
895	422	6	appraiser                                                       
896	423	207	owner                                                           
897	423	202	purchaser                                                       
898	424	205	owner                                                           
899	424	202	purchaser                                                       
900	425	208	owner                                                           
901	425	206	purchaser                                                       
902	426	209	\N
903	427	210	owner                                                           
904	427	206	purchaser                                                       
905	428	210	owner                                                           
906	428	202	purchaser                                                       
907	429	4	appraiser                                                       
908	430	5	appraiser                                                       
909	431	6	appraiser                                                       
910	432	211	owner                                                           
911	432	202	purchaser                                                       
912	433	4	appraiser                                                       
913	434	212	owner                                                           
914	434	206	purchaser                                                       
915	434	213	owner                                                           
916	435	214	\N
917	436	5	appraiser                                                       
918	437	6	appraiser                                                       
919	438	4	appraiser                                                       
920	439	214	\N
921	440	215	\N
922	441	216	owner                                                           
923	441	202	purchaser                                                       
924	442	4	appraiser                                                       
925	443	6	appraiser                                                       
926	444	5	appraiser                                                       
927	445	4	appraiser                                                       
928	446	216	owner                                                           
929	446	202	purchaser                                                       
930	447	216	owner                                                           
931	447	202	purchaser                                                       
932	448	217	owner                                                           
933	448	206	purchaser                                                       
934	449	218	\N
935	450	6	appraiser                                                       
936	451	219	owner                                                           
937	451	206	purchaser                                                       
938	452	219	owner                                                           
939	453	4	appraiser                                                       
940	454	5	appraiser                                                       
941	455	220	owner                                                           
942	455	202	purchaser                                                       
943	456	221	\N
944	457	201	owner                                                           
945	457	202	purchaser                                                       
946	458	201	owner                                                           
947	458	202	purchaser                                                       
948	459	5	appraiser                                                       
949	460	4	appraiser                                                       
950	461	136	appraiser                                                       
951	462	6	appraiser                                                       
952	463	222	owner                                                           
953	463	202	purchaser                                                       
954	464	223	\N
955	465	222	owner                                                           
956	465	202	purchaser                                                       
957	466	222	owner                                                           
958	466	202	purchaser                                                       
959	467	4	appraiser                                                       
960	468	5	appraiser                                                       
961	469	6	appraiser                                                       
962	470	224	\N
963	471	225	owner                                                           
964	471	206	purchaser                                                       
965	472	4	appraiser                                                       
966	473	5	appraiser                                                       
967	474	6	appraiser                                                       
968	475	226	owner                                                           
969	475	206	purchaser                                                       
970	476	226	owner                                                           
971	476	206	purchaser                                                       
972	477	37	owner                                                           
973	477	206	purchaser                                                       
974	478	227	\N
975	479	37	owner                                                           
976	479	206	purchaser                                                       
977	480	4	appraiser                                                       
978	481	188	appraiser                                                       
979	482	4	appraiser                                                       
980	483	6	appraiser                                                       
981	484	5	appraiser                                                       
982	485	37	owner                                                           
983	485	206	purchaser                                                       
984	486	227	\N
985	487	228	owner                                                           
986	487	206	purchaser                                                       
987	488	229	\N
988	489	228	owner                                                           
989	489	206	purchaser                                                       
990	489	229	\N
991	490	228	owner                                                           
992	490	206	purchaser                                                       
993	491	5	appraiser                                                       
994	492	4	appraiser                                                       
995	493	6	appraiser                                                       
996	494	230	owner                                                           
997	494	202	purchaser                                                       
998	495	231	\N
999	496	230	owner                                                           
1000	496	202	purchaser                                                       
1001	497	230	owner                                                           
1002	497	202	purchaser                                                       
1003	498	4	\N
1004	499	5	appraiser                                                       
1005	500	6	appraiser                                                       
1006	501	232	\N
1007	502	233	owner                                                           
1008	502	206	purchaser                                                       
1009	503	4	appraiser                                                       
1010	504	6	appraiser                                                       
1011	505	4	appraiser                                                       
1012	506	5	appraiser                                                       
1013	507	233	owner                                                           
1014	507	206	purchaser                                                       
1015	508	233	owner                                                           
1016	508	206	purchaser                                                       
1017	509	234	\N
1018	510	211	owner                                                           
1019	510	202	purchaser                                                       
1020	511	4	appraiser                                                       
1021	512	235	heir                                                            
1022	512	202	purchaser                                                       
1023	513	234	\N
1024	514	208	owner                                                           
1025	514	2	purchaser                                                       
1026	515	236	\N
1027	516	208	owner                                                           
1028	516	2	purchaser                                                       
1029	517	208	owner                                                           
1030	517	2	purchaser                                                       
1031	518	4	appraiser                                                       
1032	519	5	appraiser                                                       
1033	520	6	appraiser                                                       
1034	521	237	owner                                                           
1035	521	2	purchaser                                                       
1036	522	237	owner                                                           
1037	522	2	purchaser                                                       
1038	523	238	owner                                                           
1039	523	239	owner                                                           
1040	523	237	purchaser                                                       
1041	524	4	appraiser                                                       
1042	525	11	appraiser                                                       
1043	526	6	appraiser                                                       
1044	527	237	owner                                                           
1045	527	2	purchaser                                                       
1046	528	240	\N
1047	529	241	owner                                                           
1048	529	2	purchaser                                                       
1049	530	241	owner                                                           
1050	530	2	purchaser                                                       
1051	531	241	purchaser                                                       
1052	531	242	owner                                                           
1053	531	243	owner                                                           
1054	532	4	appraiser                                                       
1055	533	11	appraiser                                                       
1056	534	6	appraiser                                                       
1057	535	241	owner                                                           
1058	535	2	purchaser                                                       
1059	536	244	\N
1060	537	245	owner                                                           
1061	537	246	purchaser                                                       
1062	537	202	purchaser                                                       
1063	538	245	owner                                                           
1064	538	246	owner                                                           
1065	538	202	purchaser                                                       
1066	539	247	owner                                                           
1067	539	248	purchaser                                                       
1068	540	4	appraiser                                                       
1069	541	11	appraiser                                                       
1070	542	6	appraiser                                                       
1071	543	245	owner                                                           
1072	543	246	owner                                                           
1073	543	202	purchaser                                                       
1074	544	249	\N
1075	545	250	owner                                                           
1076	545	2	purchaser                                                       
1077	546	251	owner                                                           
1078	546	252	owner                                                           
1079	546	250	purchaser                                                       
1080	547	6	appraiser                                                       
1081	548	4	appraiser                                                       
1082	549	11	appraiser                                                       
1083	550	250	owner                                                           
1084	550	2	purchaser                                                       
1085	551	250	owner                                                           
1086	551	2	purchaser                                                       
1087	552	253	\N
1088	553	254	owner                                                           
1089	553	255	owner                                                           
1090	553	256	purchaser                                                       
1091	554	257	owner                                                           
1092	554	256	owner                                                           
1093	554	202	purchaser                                                       
1094	555	188	appraiser                                                       
1095	556	4	appraiser                                                       
1096	557	4	appraiser                                                       
1097	558	6	appraiser                                                       
1098	559	11	appraiser                                                       
1099	560	257	owner                                                           
1100	560	256	owner                                                           
1101	560	202	purchaser                                                       
1102	561	257	owner                                                           
1103	561	256	owner                                                           
1104	561	202	purchaser                                                       
1105	562	258	\N
1106	563	259	\N
1107	564	211	owner                                                           
1108	564	202	purchaser                                                       
1109	565	4	appraiser                                                       
1110	566	235	heir                                                            
1111	566	202	purchaser                                                       
1112	567	235	heir                                                            
1113	567	202	purchaser                                                       
1114	568	4	appraiser                                                       
1115	569	5	appraiser                                                       
1116	570	6	appraiser                                                       
1117	571	259	\N
1118	572	260	trustee                                                         
1119	572	261	purchaser                                                       
1120	573	261	owner                                                           
1121	573	2	purchaser                                                       
1122	574	11	appraiser                                                       
1123	575	4	appraiser                                                       
1124	576	6	appraiser                                                       
1125	577	261	owner                                                           
1126	577	2	purchaser                                                       
1127	578	261	owner                                                           
1128	578	2	purchaser                                                       
1129	579	262	tenant                                                          
1130	580	263	\N
1131	581	264	owner                                                           
1132	581	265	owner                                                           
1133	581	266	purchaser                                                       
1134	582	267	owner                                                           
1135	582	2	purchaser                                                       
1136	583	4	appraiser                                                       
1137	583	268	\N
1138	584	5	appraiser                                                       
1139	585	6	appraiser                                                       
1140	586	267	owner                                                           
1141	586	2	purchaser                                                       
1142	587	267	owner                                                           
1143	587	2	purchaser                                                       
1144	588	268	\N
1145	589	264	owner                                                           
1146	589	265	owner                                                           
1147	589	269	purchaser                                                       
1148	590	269	owner                                                           
1149	590	2	purchaser                                                       
1150	590	270	\N
1151	591	4	appraiser                                                       
1152	592	5	appraiser                                                       
1153	593	6	appraiser                                                       
1154	594	271	owner                                                           
1155	594	2	purchaser                                                       
1156	595	269	owner                                                           
1157	595	2	purchaser                                                       
1158	596	270	\N
1159	597	264	owner                                                           
1160	597	265	owner                                                           
1161	597	272	purchaser                                                       
1162	598	272	owner                                                           
1163	598	2	purchaser                                                       
1164	599	4	appraiser                                                       
1165	600	5	appraiser                                                       
1166	601	6	appraiser                                                       
1167	601	273	\N
1168	602	272	owner                                                           
1169	602	2	purchaser                                                       
1170	603	272	owner                                                           
1171	603	2	purchaser                                                       
1172	604	273	\N
1173	605	274	owner                                                           
1174	605	275	purchaser                                                       
1175	606	275	owner                                                           
1176	606	276	owner                                                           
1177	606	2	purchaser                                                       
1178	607	4	appraiser                                                       
1179	608	5	appraiser                                                       
1180	609	6	appraiser                                                       
1181	610	275	owner                                                           
1182	610	276	owner                                                           
1183	610	2	purchaser                                                       
1184	611	275	owner                                                           
1185	611	276	owner                                                           
1186	611	2	purchaser                                                       
1187	612	277	\N
1188	613	278	owner                                                           
1189	613	279	owner                                                           
1190	613	280	purchaser                                                       
1191	613	281	purchaser                                                       
1192	614	280	owner                                                           
1193	614	281	owner                                                           
1194	614	2	purchaser                                                       
1195	615	4	appraiser                                                       
1196	616	5	appraiser                                                       
1197	617	6	appraiser                                                       
1198	618	280	owner                                                           
1199	618	281	owner                                                           
1200	618	2	purchaser                                                       
1201	619	280	owner                                                           
1202	619	281	owner                                                           
1203	619	2	purchaser                                                       
1204	620	282	\N
1205	621	283	owner                                                           
1206	621	284	owner                                                           
1207	621	285	purchaser                                                       
1208	621	286	purchaser                                                       
1209	622	285	owner                                                           
1210	622	286	owner                                                           
1211	622	2	purchaser                                                       
1212	623	4	appraiser                                                       
1213	624	5	appraiser                                                       
1214	625	6	appraiser                                                       
1215	626	285	owner                                                           
1216	626	286	owner                                                           
1217	626	2	purchaser                                                       
1218	627	285	owner                                                           
1219	627	286	owner                                                           
1220	627	2	purchaser                                                       
1221	628	287	\N
1222	629	288	owner                                                           
1223	629	289	owner                                                           
1224	629	290	purchaser                                                       
1225	629	291	\N
1226	630	292	owner                                                           
1227	630	290	purchaser                                                       
1228	631	290	owner                                                           
1229	631	2	purchaser                                                       
1230	632	4	appraiser                                                       
1231	633	5	appraiser                                                       
1232	634	6	appraiser                                                       
1233	635	290	owner                                                           
1234	635	2	purchaser                                                       
1235	636	290	owner                                                           
1236	636	2	purchaser                                                       
1237	637	291	\N
1238	638	293	owner                                                           
1239	638	294	purchaser                                                       
1240	639	293	other                                                           
1241	639	295	other                                                           
1242	639	296	trustee                                                         
1243	639	260	trustee                                                         
1244	640	296	owner                                                           
1245	640	297	owner                                                           
1246	640	260	trustee                                                         
1247	640	293	other                                                           
1248	640	295	other                                                           
1249	640	2	purchaser                                                       
1250	641	4	appraiser                                                       
1251	642	5	appraiser                                                       
1252	643	6	appraiser                                                       
1253	644	298	owner                                                           
1254	644	297	owner                                                           
1255	644	260	trustee                                                         
1256	644	293	other                                                           
1257	644	295	other                                                           
1258	644	2	purchaser                                                       
1259	645	296	owner                                                           
1260	645	297	owner                                                           
1261	645	260	trustee                                                         
1262	645	293	other                                                           
1263	645	295	other                                                           
1264	645	2	purchaser                                                       
1265	646	299	\N
1266	647	299	\N
1267	648	300	owner                                                           
1268	648	301	owner                                                           
1269	648	302	purchaser                                                       
1270	649	303	owner                                                           
1271	649	304	owner                                                           
1272	649	305	tenant                                                          
1273	649	306	owner                                                           
1274	649	307	owner                                                           
1275	649	308	owner                                                           
1276	649	309	owner                                                           
1277	649	2	purchaser                                                       
1278	650	4	appraiser                                                       
1279	651	5	appraiser                                                       
1280	652	6	appraiser                                                       
1281	653	303	owner                                                           
1282	653	304	owner                                                           
1283	653	305	tenant                                                          
1284	653	306	owner                                                           
1285	653	307	owner                                                           
1286	653	308	owner                                                           
1287	653	309	owner                                                           
1288	653	2	purchaser                                                       
1289	654	303	owner                                                           
1290	654	304	owner                                                           
1291	654	305	tenant                                                          
1292	654	306	owner                                                           
1293	654	307	owner                                                           
1294	654	308	owner                                                           
1295	654	309	owner                                                           
1296	654	2	purchaser                                                       
1297	655	303	owner                                                           
1298	655	304	owner                                                           
1299	655	305	tenant                                                          
1300	655	306	owner                                                           
1301	655	307	owner                                                           
1302	655	308	owner                                                           
1303	655	310	owner                                                           
1304	655	2	purchaser                                                       
1305	656	284	owner                                                           
1306	656	99	owner                                                           
1307	656	283	purchaser                                                       
1308	657	99	owner                                                           
1309	657	100	owner                                                           
1310	657	2	purchaser                                                       
1311	658	4	appraiser                                                       
1312	659	5	appraiser                                                       
1313	660	6	appraiser                                                       
1314	661	99	owner                                                           
1315	661	100	owner                                                           
1316	661	2	purchaser                                                       
1317	662	99	owner                                                           
1318	662	100	owner                                                           
1319	662	2	appraiser                                                       
1320	663	311	\N
1321	664	312	owner                                                           
1322	664	313	owner                                                           
1323	664	314	purchaser                                                       
1324	664	315	purchaser                                                       
1325	665	316	owner                                                           
1326	665	317	owner                                                           
1327	665	318	owner                                                           
1328	665	319	owner                                                           
1329	665	320	owner                                                           
1330	665	321	owner                                                           
1331	665	2	purchaser                                                       
1332	666	4	appraiser                                                       
1333	667	5	appraiser                                                       
1334	668	6	appraiser                                                       
1335	669	316	owner                                                           
1336	669	317	owner                                                           
1337	669	318	owner                                                           
1338	669	319	owner                                                           
1339	669	320	owner                                                           
1340	669	321	owner                                                           
1341	669	2	purchaser                                                       
1342	670	316	owner                                                           
1343	670	317	owner                                                           
1344	670	318	owner                                                           
1345	670	319	owner                                                           
1346	670	320	owner                                                           
1347	670	321	owner                                                           
1348	670	2	purchaser                                                       
1349	671	322	\N
1350	672	170	owner                                                           
1351	672	323	purchaser                                                       
1352	672	324	purchaser                                                       
1353	673	324	owner                                                           
1354	673	325	owner                                                           
1355	673	326	owner                                                           
1356	673	327	owner                                                           
1357	673	2	purchaser                                                       
1358	674	4	appraiser                                                       
1359	675	5	appraiser                                                       
1360	676	6	appraiser                                                       
1361	677	328	owner                                                           
1362	677	325	owner                                                           
1363	677	326	owner                                                           
1364	677	327	owner                                                           
1365	677	2	purchaser                                                       
1366	678	328	owner                                                           
1367	678	325	owner                                                           
1368	678	326	owner                                                           
1369	678	327	owner                                                           
1370	678	2	purchaser                                                       
1371	679	329	\N
1372	680	330	owner                                                           
1373	680	331	purchaser                                                       
1374	681	332	owner                                                           
1375	681	2	purchaser                                                       
1376	682	333	owner                                                           
1377	682	2	purchaser                                                       
1378	683	4	appraiser                                                       
1379	683	334	\N
1380	684	11	appraiser                                                       
1381	685	6	appraiser                                                       
1382	686	334	\N
1383	687	335	owner                                                           
1384	687	336	purchaser                                                       
1385	688	205	owner                                                           
1386	688	2	purchaser                                                       
1387	689	4	appraiser                                                       
1388	690	5	appraiser                                                       
1389	691	6	appraiser                                                       
1390	692	207	owner                                                           
1391	692	2	purchaser                                                       
1392	693	207	owner                                                           
1393	693	2	purchaser                                                       
1394	694	337	\N
1395	695	338	owner                                                           
1396	695	339	owner                                                           
1397	696	338	owner                                                           
1398	696	202	purchaser                                                       
1399	697	4	appraiser                                                       
1400	698	5	appraiser                                                       
1401	699	6	appraiser                                                       
1402	700	340	owner                                                           
1403	700	202	purchaser                                                       
1404	701	340	owner                                                           
1405	701	202	purchaser                                                       
1406	702	341	\N
1407	703	341	\N
1408	704	330	owner                                                           
1409	704	342	purchaser                                                       
1410	705	343	owner                                                           
1411	705	2	purchaser                                                       
1412	706	343	owner                                                           
1413	706	2	purchaser                                                       
1414	707	4	appraiser                                                       
1415	708	6	appraiser                                                       
1416	709	11	appraiser                                                       
1417	710	344	\N
1418	711	335	owner                                                           
1419	711	345	purchaser                                                       
1420	711	346	purchaser                                                       
1421	712	347	owner                                                           
1422	712	348	owner                                                           
1423	712	349	purchaser                                                       
1424	713	4	appraiser                                                       
1425	714	5	appraiser                                                       
1426	715	350	\N
1427	716	335	owner                                                           
1428	716	345	purchaser                                                       
1429	716	346	purchaser                                                       
1430	717	347	owner                                                           
1431	717	348	owner                                                           
1432	717	206	purchaser                                                       
1433	718	4	appraiser                                                       
1434	719	5	appraiser                                                       
1435	720	6	appraiser                                                       
1436	721	347	owner                                                           
1437	721	348	owner                                                           
1438	721	206	purchaser                                                       
1439	722	347	owner                                                           
1440	722	348	owner                                                           
1441	722	206	purchaser                                                       
1442	723	351	\N
1443	724	351	\N
1444	725	352	owner                                                           
1445	725	353	purchaser                                                       
1446	726	354	owner                                                           
1447	726	2	purchaser                                                       
1448	727	354	owner                                                           
1449	727	2	purchaser                                                       
1450	728	11	appraiser                                                       
1451	729	4	appraiser                                                       
1452	730	6	appraiser                                                       
1453	731	355	\N
1454	732	140	owner                                                           
1455	732	356	purchaser                                                       
1456	732	357	purchaser                                                       
1457	733	358	owner                                                           
1458	733	359	owner                                                           
1459	733	206	purchaser                                                       
1460	734	4	appraiser                                                       
1461	735	356	owner                                                           
1462	735	357	owner                                                           
1463	735	206	purchaser                                                       
1464	736	11	appraiser                                                       
1465	737	6	appraiser                                                       
1466	738	31	other                                                           
1467	739	360	\N
1468	740	361	owner                                                           
1469	740	362	purchaser                                                       
1470	741	363	owner                                                           
1471	741	362	purchaser                                                       
1472	742	364	owner                                                           
1473	742	349	purchaser                                                       
1474	743	364	owner                                                           
1475	743	349	purchaser                                                       
1476	744	11	appraiser                                                       
1477	745	4	appraiser                                                       
1478	746	6	appraiser                                                       
1479	747	365	\N
1480	748	366	owner                                                           
1481	748	202	purchaser                                                       
1482	749	367	\N
1483	750	366	owner                                                           
1484	750	206	purchaser                                                       
1485	751	366	owner                                                           
1486	751	206	purchaser                                                       
1487	752	6	appraiser                                                       
1488	753	4	appraiser                                                       
1489	754	5	appraiser                                                       
1490	755	368	owner                                                           
1491	755	369	owner                                                           
1492	755	370	purchaser                                                       
1493	756	371	owner                                                           
1494	756	372	purchaser                                                       
1495	757	4	appraiser                                                       
1496	758	5	appraiser                                                       
1497	759	6	appraiser                                                       
1498	760	371	owner                                                           
1499	760	206	purchaser                                                       
1500	761	371	owner                                                           
1501	761	206	purchaser                                                       
1502	762	373	\N
1503	763	373	\N
1504	764	374	owner                                                           
1505	764	206	purchaser                                                       
1506	765	375	\N
1507	766	376	owner                                                           
1508	766	202	purchaser                                                       
1509	767	376	owner                                                           
1510	767	202	purchaser                                                       
1511	768	375	\N
1512	769	4	appraiser                                                       
1513	770	5	appraiser                                                       
1514	771	6	appraiser                                                       
1515	772	251	owner                                                           
1516	772	377	owner                                                           
1517	772	378	purchaser                                                       
1518	772	379	purchaser                                                       
1519	773	380	owner                                                           
1520	773	349	purchaser                                                       
1521	774	11	appraiser                                                       
1522	775	6	appraiser                                                       
1523	776	4	\N
1524	777	380	owner                                                           
1525	777	349	purchaser                                                       
1526	778	381	\N
1527	779	381	\N
1528	780	382	\N
1529	781	383	owner                                                           
1530	781	206	purchaser                                                       
1531	782	4	appraiser                                                       
1532	783	4	appraiser                                                       
1533	784	5	appraiser                                                       
1534	785	6	appraiser                                                       
1535	786	383	owner                                                           
1536	786	206	purchaser                                                       
1537	787	383	owner                                                           
1538	787	206	purchaser                                                       
1539	788	384	owner                                                           
1540	788	385	owner                                                           
1541	788	386	purchaser                                                       
1542	788	387	purchaser                                                       
1543	789	386	owner                                                           
1544	789	387	owner                                                           
1545	789	2	purchaser                                                       
1546	790	4	appraiser                                                       
1547	791	11	appraiser                                                       
1548	792	6	appraiser                                                       
1549	793	386	owner                                                           
1550	793	387	owner                                                           
1551	793	2	purchaser                                                       
1552	794	388	\N
1553	795	388	\N
1554	796	386	tenant                                                          
1555	796	2	owner                                                           
1556	797	389	owner                                                           
1557	797	390	owner                                                           
1558	797	391	purchaser                                                       
1559	798	392	owner                                                           
1560	798	393	owner                                                           
1561	798	391	owner                                                           
1562	798	394	owner                                                           
1563	798	395	owner                                                           
1564	798	372	purchaser                                                       
1565	799	4	appraiser                                                       
1566	800	5	appraiser                                                       
1567	801	6	appraiser                                                       
1568	802	392	owner                                                           
1569	802	396	owner                                                           
1570	802	391	owner                                                           
1571	802	394	owner                                                           
1572	802	395	owner                                                           
1573	802	372	purchaser                                                       
1574	803	397	owner                                                           
1575	803	396	owner                                                           
1576	803	391	owner                                                           
1577	803	394	owner                                                           
1578	803	395	owner                                                           
1579	803	372	purchaser                                                       
1580	804	398	\N
1581	805	399	owner                                                           
1582	805	400	purchaser                                                       
1583	806	401	owner                                                           
1584	806	402	owner                                                           
1585	806	2	purchaser                                                       
1586	807	11	appraiser                                                       
1587	808	4	appraiser                                                       
1588	809	6	appraiser                                                       
1589	810	401	owner                                                           
1590	810	402	owner                                                           
1591	810	2	purchaser                                                       
1592	811	403	\N
1593	812	403	\N
1594	813	404	owner                                                           
1595	813	405	purchaser                                                       
1596	814	405	owner                                                           
1597	814	406	owner                                                           
1598	814	2	purchaser                                                       
1599	815	4	appraiser                                                       
1600	816	11	appraiser                                                       
1601	817	6	appraiser                                                       
1602	818	405	owner                                                           
1603	818	406	owner                                                           
1604	818	2	purchaser                                                       
1605	819	407	\N
1606	820	407	\N
1607	821	408	owner                                                           
1608	821	409	purchaser                                                       
1609	822	410	owner                                                           
1610	822	2	purchaser                                                       
1611	823	411	\N
1612	824	412	owner                                                           
1613	824	2	purchaser                                                       
1614	825	413	owner                                                           
1615	825	2	purchaser                                                       
1616	826	6	appraiser                                                       
1617	827	11	\N
1618	828	4	appraiser                                                       
1619	829	414	tenant                                                          
1620	829	415	tenant                                                          
1621	830	416	owner                                                           
1622	830	417	owner                                                           
1623	830	418	owner                                                           
1624	830	419	purchaser                                                       
1625	831	420	owner                                                           
1626	831	349	purchaser                                                       
1627	832	4	appraiser                                                       
1628	833	5	appraiser                                                       
1629	834	6	appraiser                                                       
1630	835	420	owner                                                           
1631	835	349	purchaser                                                       
1632	836	420	owner                                                           
1633	836	206	purchaser                                                       
1634	837	421	\N
1635	838	421	\N
1636	839	422	purchaser                                                       
1637	839	423	owner                                                           
1638	840	422	owner                                                           
1639	840	2	purchaser                                                       
1640	841	424	\N
1641	842	422	owner                                                           
1642	842	2	purchaser                                                       
1643	843	422	owner                                                           
1644	843	2	purchaser                                                       
1645	844	11	appraiser                                                       
1646	845	4	appraiser                                                       
1647	846	6	appraiser                                                       
1648	847	425	owner                                                           
1649	847	426	owner                                                           
1650	847	427	purchaser                                                       
1651	848	427	owner                                                           
1652	848	372	purchaser                                                       
1653	849	4	appraiser                                                       
1654	850	6	appraiser                                                       
1655	851	5	\N
1656	852	428	\N
1657	853	428	\N
1658	854	428	\N
1659	855	428	\N
1660	856	429	owner                                                           
1661	856	430	owner                                                           
1662	856	431	purchaser                                                       
1663	857	432	owner                                                           
1664	857	433	owner                                                           
1665	857	434	owner                                                           
1666	857	435	owner                                                           
1667	857	206	purchaser                                                       
1668	858	436	appraiser                                                       
1669	859	5	appraiser                                                       
1670	860	4	appraiser                                                       
1671	861	4	appraiser                                                       
1672	862	188	appraiser                                                       
1673	863	432	owner                                                           
1674	863	433	owner                                                           
1675	863	437	owner                                                           
1676	863	435	owner                                                           
1677	863	206	purchaser                                                       
1678	864	432	owner                                                           
1679	864	433	owner                                                           
1680	864	434	owner                                                           
1681	864	435	owner                                                           
1682	864	206	purchaser                                                       
1683	865	438	\N
1684	866	439	owner                                                           
1685	866	440	owner                                                           
1686	866	441	purchaser                                                       
1687	866	442	purchaser                                                       
1688	867	441	owner                                                           
1689	867	442	owner                                                           
1690	867	2	purchaser                                                       
1691	868	11	appraiser                                                       
1692	869	4	appraiser                                                       
1693	870	6	appraiser                                                       
1694	871	441	owner                                                           
1695	871	442	owner                                                           
1696	871	2	purchaser                                                       
1697	872	443	\N
1698	873	443	\N
1699	874	444	owner                                                           
1700	874	445	purchaser                                                       
1701	875	445	owner                                                           
1702	875	2	purchaser                                                       
1703	876	11	appraiser                                                       
1704	877	4	appraiser                                                       
1705	878	445	owner                                                           
1706	878	2	purchaser                                                       
1707	879	6	appraiser                                                       
1708	880	446	\N
1709	881	446	\N
1710	882	447	tenant                                                          
1711	882	2	owner                                                           
1712	883	180	owner                                                           
1713	883	181	owner                                                           
1714	883	448	purchaser                                                       
1715	883	449	purchaser                                                       
1716	884	448	owner                                                           
1717	884	449	owner                                                           
1718	884	2	purchaser                                                       
1719	885	4	appraiser                                                       
1720	886	11	\N
1721	887	6	appraiser                                                       
1722	888	448	owner                                                           
1723	888	449	owner                                                           
1724	888	2	purchaser                                                       
1725	889	450	\N
1726	890	450	\N
1727	891	451	owner                                                           
1728	891	452	owner                                                           
1729	891	453	purchaser                                                       
1730	892	454	other                                                           
1731	892	206	purchaser                                                       
1732	893	453	owner                                                           
1733	893	206	purchaser                                                       
1734	894	453	owner                                                           
1735	894	206	purchaser                                                       
1736	895	11	appraiser                                                       
1737	896	4	appraiser                                                       
1738	897	6	appraiser                                                       
1739	898	455	owner                                                           
1740	898	456	owner                                                           
1741	898	457	purchaser                                                       
1742	899	457	owner                                                           
1743	899	372	purchaser                                                       
1744	900	11	appraiser                                                       
1745	901	4	appraiser                                                       
1746	902	6	appraiser                                                       
1747	903	457	owner                                                           
1748	903	349	purchaser                                                       
1749	904	458	\N
1750	905	458	\N
1751	906	459	owner                                                           
1752	906	460	owner                                                           
1753	906	461	purchaser                                                       
1754	907	461	owner                                                           
1755	907	1	owner                                                           
1756	907	7	owner                                                           
1757	907	349	purchaser                                                       
1758	908	436	appraiser                                                       
1759	909	5	appraiser                                                       
1760	910	4	appraiser                                                       
1761	911	188	appraiser                                                       
1762	912	4	appraiser                                                       
1763	913	461	owner                                                           
1764	913	1	owner                                                           
1765	913	7	owner                                                           
1766	913	349	purchaser                                                       
1767	914	461	owner                                                           
1768	914	1	owner                                                           
1769	914	7	owner                                                           
1770	914	349	purchaser                                                       
1771	915	462	\N
1772	916	463	owner                                                           
1773	916	464	purchaser                                                       
1774	916	465	purchaser                                                       
1775	917	466	owner                                                           
1776	917	467	owner                                                           
1777	917	2	purchaser                                                       
1778	918	11	appraiser                                                       
1779	919	4	appraiser                                                       
1780	920	6	appraiser                                                       
1781	921	466	tenant                                                          
1782	921	2	owner                                                           
1783	922	466	owner                                                           
1784	922	467	owner                                                           
1785	922	2	purchaser                                                       
1786	923	468	\N
1787	924	468	\N
1788	925	469	\N
1789	926	11	appraiser                                                       
1790	927	4	appraiser                                                       
1791	928	6	appraiser                                                       
1792	929	470	owner                                                           
1793	929	471	purchaser                                                       
1794	930	206	purchaser                                                       
1795	930	471	owner                                                           
1796	931	206	purchaser                                                       
1797	931	471	owner                                                           
1798	932	472	owner                                                           
1799	932	206	purchaser                                                       
1800	933	469	\N
1801	934	473	owner                                                           
1802	934	474	purchaser                                                       
1803	934	475	purchaser                                                       
1804	935	474	owner                                                           
1805	935	476	owner                                                           
1806	935	202	purchaser                                                       
1807	936	4	appraiser                                                       
1808	937	5	appraiser                                                       
1809	938	6	appraiser                                                       
1810	939	474	owner                                                           
1811	939	476	owner                                                           
1812	939	202	purchaser                                                       
1813	940	477	\N
1814	941	477	\N
1815	942	11	appraiser                                                       
1816	943	4	appraiser                                                       
1817	944	6	appraiser                                                       
1818	945	439	owner                                                           
1819	945	440	owner                                                           
1820	945	478	purchaser                                                       
1821	945	479	purchaser                                                       
1822	946	478	owner                                                           
1823	947	480	owner                                                           
1824	947	2	purchaser                                                       
1825	948	481	\N
1826	949	2	purchaser                                                       
1827	949	480	owner                                                           
1828	950	480	owner                                                           
1829	950	2	purchaser                                                       
1830	951	482	owner                                                           
1831	951	483	purchaser                                                       
1832	951	484	purchaser                                                       
1833	952	483	owner                                                           
1834	952	485	owner                                                           
1835	952	486	owner                                                           
1836	952	372	purchaser                                                       
1837	953	11	appraiser                                                       
1838	954	6	appraiser                                                       
1839	955	4	appraiser                                                       
1840	956	188	appraiser                                                       
1841	957	4	appraiser                                                       
1842	958	483	owner                                                           
1843	958	485	owner                                                           
1844	958	486	owner                                                           
1845	958	372	purchaser                                                       
1846	959	487	\N
1847	960	487	\N
1848	961	4	appraiser                                                       
1849	962	5	appraiser                                                       
1850	963	6	appraiser                                                       
1851	964	488	owner                                                           
1852	964	489	purchaser                                                       
1853	965	489	owner                                                           
1854	965	2	purchaser                                                       
1855	966	490	\N
1856	967	2	purchaser                                                       
1857	967	489	owner                                                           
1858	968	2	purchaser                                                       
1859	968	489	owner                                                           
1860	969	489	owner                                                           
1861	970	491	owner                                                           
1862	970	492	owner                                                           
1863	970	493	purchaser                                                       
1864	970	494	purchaser                                                       
1865	971	493	\N
1866	971	206	purchaser                                                       
1867	972	495	\N
1868	973	493	owner                                                           
1869	973	206	purchaser                                                       
1870	974	495	\N
1871	975	495	\N
1872	976	496	owner                                                           
1873	976	497	owner                                                           
1874	976	2	purchaser                                                       
1875	976	498	\N
1876	977	499	owner                                                           
1877	977	497	purchaser                                                       
1878	977	498	\N
1879	978	497	owner                                                           
1880	978	2	purchaser                                                       
1881	978	498	\N
1882	979	500	owner                                                           
1883	979	501	appraiser                                                       
1884	979	498	\N
1885	980	497	owner                                                           
1886	980	5	appraiser                                                       
1887	980	498	\N
1888	981	502	owner                                                           
1889	981	6	appraiser                                                       
1890	981	498	\N
1891	982	503	owner                                                           
1892	982	504	purchaser                                                       
1893	983	505	appraiser                                                       
1894	984	11	appraiser                                                       
1895	985	6	appraiser                                                       
1896	986	504	owner                                                           
1897	986	206	purchaser                                                       
1898	987	505	\N
1899	988	505	\N
1900	989	506	owner                                                           
1901	989	2	purchaser                                                       
1902	990	507	owner                                                           
1903	990	2	purchaser                                                       
1904	991	507	owner                                                           
1905	991	2	purchaser                                                       
1906	992	508	purchaser                                                       
1907	992	499	owner                                                           
1908	993	509	\N
1909	994	501	appraiser                                                       
1910	995	510	appraiser                                                       
1911	996	511	appraiser                                                       
1912	997	512	owner                                                           
1913	997	2	purchaser                                                       
1914	998	513	owner                                                           
1915	998	2	purchaser                                                       
1916	999	514	owner                                                           
1917	999	2	purchaser                                                       
1918	1000	515	\N
1919	1001	512	purchaser                                                       
1920	1001	516	owner                                                           
1921	1002	501	appraiser                                                       
1922	1003	517	appraiser                                                       
1923	1004	6	appraiser                                                       
1924	1005	518	owner                                                           
1925	1005	519	purchaser                                                       
1926	1006	520	\N
1927	1007	518	owner                                                           
1928	1007	521	purchaser                                                       
1929	1008	520	\N
1930	1009	522	purchaser                                                       
1931	1009	523	owner                                                           
1932	1010	517	appraiser                                                       
1933	1011	501	appraiser                                                       
1934	1012	6	appraiser                                                       
1935	1013	524	owner                                                           
1936	1013	2	purchaser                                                       
1937	1014	525	owner                                                           
1938	1014	2	purchaser                                                       
1939	1015	526	purchaser                                                       
1940	1015	527	owner                                                           
1941	1016	524	owner                                                           
1942	1016	2	purchaser                                                       
1943	1017	528	\N
1944	1018	501	appraiser                                                       
1945	1019	517	appraiser                                                       
1946	1020	6	appraiser                                                       
1947	1021	529	owner                                                           
1948	1021	2	purchaser                                                       
1949	1022	530	owner                                                           
1950	1022	2	purchaser                                                       
1951	1023	531	purchaser                                                       
1952	1023	532	owner                                                           
1953	1024	529	owner                                                           
1954	1024	2	purchaser                                                       
1955	1025	533	\N
1956	1026	501	appraiser                                                       
1957	1027	510	appraiser                                                       
1958	1028	6	appraiser                                                       
1959	1029	534	owner                                                           
1960	1029	2	purchaser                                                       
1961	1030	534	owner                                                           
1962	1030	2	purchaser                                                       
1963	1031	535	purchaser                                                       
1964	1031	536	owner                                                           
1965	1032	534	owner                                                           
1966	1032	2	purchaser                                                       
1967	1033	537	\N
1968	1034	501	appraiser                                                       
1969	1035	510	appraiser                                                       
1970	1036	6	appraiser                                                       
1971	1037	538	owner                                                           
1972	1037	2	purchaser                                                       
1973	1038	538	owner                                                           
1974	1038	2	purchaser                                                       
1975	1039	539	purchaser                                                       
1976	1039	540	owner                                                           
1977	1040	538	owner                                                           
1978	1040	2	purchaser                                                       
1979	1041	541	\N
1980	1042	501	appraiser                                                       
1981	1043	510	appraiser                                                       
1982	1044	6	appraiser                                                       
1983	1045	542	purchaser                                                       
1984	1045	543	owner                                                           
1985	1046	544	owner                                                           
1986	1046	2	purchaser                                                       
1987	1047	510	appraiser                                                       
1988	1048	501	appraiser                                                       
1989	1049	6	appraiser                                                       
1990	1050	545	owner                                                           
1991	1050	349	purchaser                                                       
1992	1051	11	appraiser                                                       
1993	1051	546	\N
1994	1052	4	appraiser                                                       
1995	1053	6	appraiser                                                       
1996	1054	547	other                                                           
1997	1054	548	other                                                           
1998	1055	455	owner                                                           
1999	1055	456	owner                                                           
2000	1055	457	purchaser                                                       
2001	1056	548	other                                                           
2002	1056	547	other                                                           
2003	1057	493	purchaser                                                       
2004	1057	494	purchaser                                                       
2005	1057	491	owner                                                           
2006	1058	493	owner                                                           
2007	1058	202	purchaser                                                       
2008	1059	6	appraiser                                                       
2009	1060	4	\N
2010	1061	510	appraiser                                                       
2011	1062	4	appraiser                                                       
2012	1063	549	appraiser                                                       
2013	1064	493	owner                                                           
2014	1064	550	other                                                           
2015	1065	493	owner                                                           
2016	1065	550	other                                                           
2017	1066	551	\N
2018	1067	11	appraiser                                                       
2019	1068	4	appraiser                                                       
2020	1069	6	appraiser                                                       
2021	1070	552	\N
2022	1071	474	purchaser                                                       
2023	1071	475	purchaser                                                       
2024	1071	473	owner                                                           
2025	1072	474	owner                                                           
2026	1072	476	owner                                                           
2027	1072	202	purchaser                                                       
2028	1073	4	appraiser                                                       
2029	1074	510	appraiser                                                       
2030	1075	6	appraiser                                                       
2031	1076	553	\N
2032	1077	554	other                                                           
2033	1077	474	owner                                                           
2034	1078	547	other                                                           
2035	1078	474	owner                                                           
2036	1079	483	purchaser                                                       
2037	1079	484	purchaser                                                       
2038	1080	483	owner                                                           
2039	1080	485	owner                                                           
2040	1080	486	owner                                                           
2041	1080	202	purchaser                                                       
2042	1081	11	appraiser                                                       
2043	1082	6	appraiser                                                       
2044	1083	4	appraiser                                                       
2045	1084	555	appraiser                                                       
2046	1085	556	appraiser                                                       
2047	1086	555	\N
2048	1087	550	other                                                           
2049	1087	493	owner                                                           
2050	1087	483	owner                                                           
2051	1087	484	owner                                                           
2052	1088	550	other                                                           
2053	1088	493	owner                                                           
2054	1088	484	owner                                                           
2055	1088	483	owner                                                           
2056	1089	555	\N
2057	1090	11	appraiser                                                       
2058	1091	6	appraiser                                                       
2059	1092	557	appraiser                                                       
2060	1092	558	\N
2061	1093	559	owner                                                           
2062	1093	560	purchaser                                                       
2063	1094	561	owner                                                           
2064	1094	372	purchaser                                                       
2065	1095	562	owner                                                           
2066	1095	372	purchaser                                                       
2067	1096	561	owner                                                           
2068	1096	372	purchaser                                                       
2069	1097	561	owner                                                           
2070	1097	372	purchaser                                                       
2071	1098	11	appraiser                                                       
2072	1099	6	appraiser                                                       
2073	1100	557	appraiser                                                       
2074	1101	563	owner                                                           
2075	1102	564	owner                                                           
2076	1102	565	purchaser                                                       
2077	1103	563	owner                                                           
2078	1103	372	purchaser                                                       
2079	1104	563	owner                                                           
2080	1104	372	purchaser                                                       
2081	1105	563	owner                                                           
2082	1106	11	appraiser                                                       
2083	1107	557	appraiser                                                       
2084	1108	6	appraiser                                                       
2085	1109	140	owner                                                           
2086	1110	566	owner                                                           
2087	1110	140	purchaser                                                       
2088	1111	140	owner                                                           
2089	1111	349	purchaser                                                       
2090	1112	140	owner                                                           
2091	1112	202	purchaser                                                       
2092	1113	140	owner                                                           
2093	1114	11	appraiser                                                       
2094	1115	557	appraiser                                                       
2095	1116	6	appraiser                                                       
2096	1117	567	owner                                                           
2097	1117	568	purchaser                                                       
2098	1118	568	owner                                                           
2099	1119	568	owner                                                           
2100	1119	372	purchaser                                                       
2101	1120	569	tenant                                                          
2102	1121	568	owner                                                           
2103	1122	568	owner                                                           
2104	1123	11	appraiser                                                       
2105	1124	557	appraiser                                                       
2106	1125	6	appraiser                                                       
2107	1126	570	owner                                                           
2108	1126	571	purchaser                                                       
2109	1127	571	owner                                                           
2110	1128	571	owner                                                           
2111	1128	202	purchaser                                                       
2112	1129	571	owner                                                           
2113	1130	571	owner                                                           
2114	1131	11	appraiser                                                       
2115	1132	557	appraiser                                                       
2116	1133	6	appraiser                                                       
2117	1134	140	owner                                                           
2118	1134	572	purchaser                                                       
2119	1135	573	heir                                                            
2120	1135	572	owner                                                           
2121	1136	573	heir                                                            
2122	1136	572	owner                                                           
2123	1136	206	purchaser                                                       
2124	1137	573	heir                                                            
2125	1137	572	owner                                                           
2126	1138	572	owner                                                           
2127	1138	573	heir                                                            
2128	1139	11	appraiser                                                       
2129	1140	6	appraiser                                                       
2130	1141	557	appraiser                                                       
2131	1142	574	owner                                                           
2132	1143	574	owner                                                           
2133	1144	574	owner                                                           
2134	1144	372	purchaser                                                       
2135	1145	574	owner                                                           
2136	1146	575	owner                                                           
2137	1146	574	purchaser                                                       
2138	1147	11	appraiser                                                       
2139	1148	557	appraiser                                                       
2140	1149	6	appraiser                                                       
2141	1150	543	owner                                                           
2142	1150	576	purchaser                                                       
2143	1151	576	owner                                                           
2144	1152	576	owner                                                           
2145	1152	202	purchaser                                                       
2146	1153	576	owner                                                           
2147	1154	576	owner                                                           
2148	1155	11	appraiser                                                       
2149	1156	557	appraiser                                                       
2150	1157	6	appraiser                                                       
2151	1158	577	owner                                                           
2152	1158	578	purchaser                                                       
2153	1159	578	owner                                                           
2154	1160	578	owner                                                           
2155	1160	202	purchaser                                                       
2156	1161	579	tenant                                                          
2157	1162	578	owner                                                           
2158	1163	578	owner                                                           
2159	1164	11	appraiser                                                       
2160	1165	6	appraiser                                                       
2161	1166	557	appraiser                                                       
2162	1167	580	owner                                                           
2163	1168	580	owner                                                           
2164	1169	580	owner                                                           
2165	1169	206	purchaser                                                       
2166	1170	580	owner                                                           
2167	1170	206	purchaser                                                       
2168	1171	581	owner                                                           
2169	1171	580	purchaser                                                       
2170	1172	582	owner                                                           
2171	1172	372	purchaser                                                       
2172	1172	583	\N
2173	1173	582	owner                                                           
2174	1173	372	purchaser                                                       
2175	1173	583	\N
2176	1174	584	owner                                                           
2177	1174	583	\N
2178	1175	585	owner                                                           
2179	1175	586	owner                                                           
2180	1175	587	purchaser                                                       
2181	1175	583	\N
2182	1176	587	owner                                                           
2183	1176	11	appraiser                                                       
2184	1176	583	\N
2185	1177	587	owner                                                           
2186	1177	501	appraiser                                                       
2187	1177	583	\N
2188	1178	588	owner                                                           
2189	1178	6	appraiser                                                       
2190	1178	583	\N
2191	1179	413	owner                                                           
2192	1179	2	purchaser                                                       
2193	1179	589	\N
2194	1180	412	owner                                                           
2195	1180	2	purchaser                                                       
2196	1180	589	\N
2197	1181	408	trustee                                                         
2198	1181	412	purchaser                                                       
2199	1181	589	\N
2200	1182	408	trustee                                                         
2201	1182	412	purchaser                                                       
2202	1182	589	\N
2203	1183	412	owner                                                           
2204	1183	2	purchaser                                                       
2205	1183	589	\N
2206	1184	11	appraiser                                                       
2207	1184	412	owner                                                           
2208	1184	589	\N
2209	1185	590	owner                                                           
2210	1185	412	purchaser                                                       
2211	1185	589	\N
2212	1186	501	appraiser                                                       
2213	1186	412	owner                                                           
2214	1186	589	\N
2215	1187	412	owner                                                           
2216	1187	6	appraiser                                                       
2217	1187	589	\N
2218	1188	591	owner                                                           
2219	1188	202	purchaser                                                       
2220	1188	591	\N
2221	1189	37	owner                                                           
2222	1189	202	purchaser                                                       
2223	1189	591	\N
2224	1190	592	owner                                                           
2225	1190	37	purchaser                                                       
2226	1190	591	\N
2227	1191	37	owner                                                           
2228	1191	136	appraiser                                                       
2229	1191	591	\N
2230	1192	510	appraiser                                                       
2231	1192	37	owner                                                           
2232	1192	591	\N
2233	1193	6	appraiser                                                       
2234	1193	37	owner                                                           
2235	1193	591	\N
2236	1194	593	\N
2237	1195	594	owner                                                           
2238	1195	202	purchaser                                                       
2239	1196	595	owner                                                           
2240	1196	594	owner                                                           
2241	1196	501	appraiser                                                       
2242	1196	593	\N
2243	1197	593	\N
2244	1198	595	owner                                                           
2245	1198	596	owner                                                           
2246	1198	510	appraiser                                                       
2247	1198	593	\N
2248	1199	174	owner                                                           
2249	1199	597	owner                                                           
2250	1199	598	owner                                                           
2251	1199	595	purchaser                                                       
2252	1199	599	purchaser                                                       
2253	1199	593	\N
2254	1200	600	\N
2255	1201	601	owner                                                           
2256	1201	602	owner                                                           
2257	1201	600	\N
2258	1202	601	owner                                                           
2259	1202	603	owner                                                           
2260	1202	349	purchaser                                                       
2261	1202	600	\N
2262	1203	604	owner                                                           
2263	1203	601	purchaser                                                       
2264	1203	605	purchaser                                                       
2265	1203	600	\N
2266	1204	601	owner                                                           
2267	1204	606	owner                                                           
2268	1204	136	appraiser                                                       
2269	1205	601	owner                                                           
2270	1205	605	owner                                                           
2271	1205	510	appraiser                                                       
2272	1205	600	\N
2273	1206	601	owner                                                           
2274	1206	606	owner                                                           
2275	1206	6	appraiser                                                       
2276	1206	600	\N
\.


--
-- Name: event_people_assoc_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('humanface.event_people_assoc_id_seq', 2276, true);


--
-- Data for Name: event_types; Type: TABLE DATA; Schema: humanface; Owner: postgres
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
-- Name: event_types_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('humanface.event_types_id_seq', 7, true);


--
-- Data for Name: events; Type: TABLE DATA; Schema: humanface; Owner: postgres
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
226	\N	Offer made $7500 - (taxes + stamp duty) = $7410	14158	1970-11-06	7	7410
227	\N		14158	1970-11-06	1	7500
228	\N		14159	1965-09-15	3	4950
229	\N		14159	1966-10-20	3	6000
230	\N		14159	1968-08-15	3	5500
231	\N		14159	1968-10-24	2	6000
232	accept                                                                                                                                                                                                                                                         		14159	1968-10-24	4	6000
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
279	\N	Offer made $5500 - (taxes + stamp duty) = $5477	14165	1969-06-27	7	5477
280	\N		14165	1969-06-27	1	5500
281	\N	Tenant asked to pay originally 25$ per month but relocation director reconsidered the fact that the tenant only lives on retirement benefits of $127 for two weeks and has 6 people to support and reduces the rent to $15 per month	14165	1969-07-24	5	15
282	\N	To be best considered as Street according to appraiser	14166	1965-09-15	3	0
283	\N		14166	1966-10-25	3	400
284	\N		14166	1968-08-16	3	400
285	\N		14166	1969-08-06	2	400
286	accept                                                                                                                                                                                                                                                         		14166	1969-08-11	4	400
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
311	\N		14169	1973-07-24	1	450
312	\N	Case was filed and heard at Superior court to decide on the final award	14169	1973-08-16	6	457
313	\N		14170	1965-09-15	3	125
314	\N		14170	1968-08-13	3	350
315	\N		14170	1966-10-25	3	500
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
342	\N		14173	1970-04-21	2	700
343	accept                                                                                                                                                                                                                                                         		14173	1970-04-23	4	700
344	\N	Offer made $700 - (taxes + stamp duty) = $696	14173	1970-05-18	7	696
345	\N		14173	1970-05-18	1	700
346	\N		14174	1965-09-15	3	1575
347	\N		14174	1966-11-17	3	4000
348	\N		14174	1968-07-31	3	4500
349	\N		14174	1969-04-21	2	4500
350	accept                                                                                                                                                                                                                                                         		14174	1969-04-21	4	4500
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
401	\N		42185	1976-07-07	7	0
402	\N		42185	1976-07-08	1	47000
403	\N		42185	1976-07-07	2	47000
404	accept                                                                                                                                                                                                                                                         		42185	\N	4	0
405	\N		42185	\N	4	0
406	\N		42185	1976-07-07	7	0
407	\N		42185	1974-11-22	3	47000
408	\N		42185	1974-11-22	3	35850
409	\N		42186	1976-11-02	1	0
410	\N		42186	1976-11-01	7	0
411	\N		42186	1975-03-21	3	750
412	\N		42186	1975-04-15	3	500
413	\N		42186	1968-12-27	2	650
414	accept                                                                                                                                                                                                                                                         		42186	1968-12-27	4	650
415	\N		42186	1968-05-28	3	650
416	\N		42186	1965-09-15	3	200
417	\N		42186	1967-02-08	3	2000
418	\N		42187	1971-12-13	7	0
419	\N		42187	1971-12-13	1	1050
420	\N		42187	1968-05-29	3	750
421	\N		42187	1966-10-20	3	750
422	\N		42187	1965-09-15	3	300
423	\N		42187	1970-11-17	2	1050
424	\N		42187	1970-11-17	4	1050
425	\N		42188	1970-09-03	1	350
426	\N		42188	1970-09-23	7	0
427	\N		42188	1970-09-21	2	360
428	accept                                                                                                                                                                                                                                                         		42188	1970-09-21	4	0
429	\N		42188	1968-05-29	3	350
430	\N		42188	1966-10-20	3	300
431	\N		42188	1965-09-15	3	200
432	\N		42189	1976-09-23	1	0
433	\N		42189	1976-09-06	3	625
434	\N		42189	1970-01-26	2	400
435	accept                                                                                                                                                                                                                                                         		42189	1970-01-26	4	400
436	\N		42189	1966-10-20	3	315
437	\N		42189	1965-09-15	3	155
438	\N		42189	1966-05-29	3	400
439	\N		42189	1976-09-16	6	625
440	\N		42190	1976-09-24	6	750
441	\N		42190	1976-09-30	1	750
442	\N		42190	1976-09-16	3	750
443	\N		42190	1965-09-15	3	150
444	\N		42190	1966-10-20	3	300
445	\N		42190	1968-05-29	3	500
446	\N		42190	1976-09-30	2	750
447	accept                                                                                                                                                                                                                                                         		42190	1976-09-30	4	750
448	\N		42191	1969-03-31	1	5000
449	\N		42191	1969-04-04	7	0
450	\N		42191	1965-09-15	3	3100
451	\N		42191	1969-01-07	2	5000
452	\N		42191	1969-02-10	4	5000
453	\N		42191	1968-05-28	3	4250
454	\N		42191	1967-02-10	3	6000
455	\N		42192	1970-06-25	1	350
456	\N		42192	1970-06-29	7	0
457	\N		42192	1970-05-08	2	350
458	accept                                                                                                                                                                                                                                                         		42192	1970-05-08	4	350
459	\N		42192	1967-02-08	3	2500
460	\N		42192	1968-11-13	3	350
461	\N		42192	1970-02-05	3	300
462	\N		42192	1965-09-15	3	1050
463	\N		42193	1969-03-27	1	0
464	\N		42193	1969-03-28	7	0
465	\N		42193	1969-02-10	2	3000
466	accept                                                                                                                                                                                                                                                         		42193	1969-02-10	4	3000
467	\N		42193	1968-05-28	3	3000
468	\N		42193	1967-02-08	3	3000
469	\N		42193	1965-09-15	3	2100
470	\N		42194	1972-01-26	6	3250
471	\N		42194	1972-02-01	1	3250
472	\N		42194	1968-11-13	3	2200
473	\N		42194	1966-11-14	3	2500
474	\N		42194	1965-09-05	3	1100
475	\N		42194	1972-02-01	2	3250
476	\N		42194	1972-02-01	4	3250
477	\N		42195	1976-07-07	1	1900
478	\N		42195	1976-07-29	7	0
479	\N		42195	1976-07-07	2	1900
480	\N		42195	1976-02-19	3	2650
481	\N		42195	1976-02-25	3	1150
482	\N		42195	1968-11-13	3	1900
483	\N		42195	1965-09-15	3	690
484	\N		42195	1966-11-14	3	1600
485	accept                                                                                                                                                                                                                                                         		42195	1976-07-07	4	1900
486	\N		42195	\N	\N	0
487	\N		42196	1969-05-06	1	1500
488	\N		42196	1969-05-15	7	0
489	\N		42196	1969-03-12	2	1500
582	\N		42208	1970-09-30	1	6000
583	\N		42208	1968-05-29	3	6500
584	\N		42208	1967-01-14	3	5200
585	\N		42208	1965-09-15	3	2500
490	accept                                                                                                                                                                                                                                                         		42196	1969-03-14	4	1500
491	\N		42196	1967-02-08	3	2500
492	\N		42196	1968-05-28	3	1500
493	\N		42196	1965-09-15	3	1250
494	\N		42197	1969-09-05	1	2000
495	\N		42197	1969-09-13	7	0
496	\N		42197	1969-04-28	2	2000
497	accept                                                                                                                                                                                                                                                         		42197	1969-04-30	4	2000
498	\N		42197	1968-05-28	3	1400
499	\N		42197	1967-02-08	3	2000
500	\N		42197	1965-09-15	3	1000
501	\N		42198	1976-09-24	6	150
502	\N		42198	1976-09-30	1	150
503	\N		42198	1976-09-16	3	150
504	\N		42198	1965-09-15	3	50
505	\N		42198	1968-05-28	3	100
506	\N		42198	1966-10-11	3	100
507	\N		42198	1976-09-30	2	150
508	accept                                                                                                                                                                                                                                                         		42198	1976-09-30	4	150
509	\N		42199	1976-09-16	6	225
510	\N		42199	1976-09-23	1	225
511	\N		42199	1976-08-06	3	225
512	\N		42199	1970-01-26	2	150
513	\N		42199	1970-01-26	4	150
514	\N		42200	1970-09-03	1	150
515	\N		42200	1970-09-23	7	0
516	\N		42200	1970-05-21	2	150
517	\N		42200	1970-05-21	4	150
518	\N		42200	1968-05-29	3	125
519	\N		42200	1966-10-17	4	150
520	\N		42200	1965-09-15	3	100
521	\N		42201	1969-09-08	2	6350
522	\N		42201	1969-09-16	1	6350
523	\N		42201	1944-08-31	1	0
524	\N		42201	1968-06-13	3	6350
525	\N		42201	1968-05-20	3	6000
526	\N		42201	1965-09-15	3	5400
527	accept                                                                                                                                                                                                                                                         		42201	1969-09-08	4	6350
528	\N		42201	1969-09-30	7	0
529	\N		42202	1969-01-29	2	6000
530	\N		42202	1969-04-04	1	0
531	\N		42202	1941-06-10	1	0
532	\N		42202	1968-06-13	3	5750
533	\N		42202	1968-05-16	3	6000
534	\N		42202	1965-09-15	3	4900
535	accept                                                                                                                                                                                                                                                         		42202	1969-01-30	4	6000
536	\N		42202	1969-04-30	7	0
537	\N		42203	1972-10-30	2	6500
538	\N		42203	1972-12-11	1	0
539	\N		42203	1937-06-30	1	0
540	\N		42203	1968-06-18	3	6200
541	\N		42203	1968-08-23	3	7500
542	\N		42203	1965-09-15	3	6500
543	accept                                                                                                                                                                                                                                                         		42203	1972-11-20	4	6500
544	\N		42203	1973-01-23	7	0
545	\N		42204	1970-03-16	1	0
546	\N		42204	1945-12-18	1	0
547	\N		42204	1965-09-15	3	5200
548	\N		42204	1968-08-10	3	7400
549	\N		42204	1968-08-21	3	8000
550	\N		42204	1970-03-12	2	8000
551	accept                                                                                                                                                                                                                                                         		42204	1970-03-12	4	8000
552	\N		42204	1970-04-03	7	0
553	\N		42205	1963-09-23	1	0
554	\N		42205	1976-02-03	1	0
555	\N		42205	1975-07-15	3	7000
556	\N		42205	1975-07-15	3	6500
557	\N		42205	1968-07-02	3	5500
558	\N		42205	1965-09-15	3	4100
559	\N		42205	1968-08-20	3	8000
560	\N		42205	1975-10-22	2	7000
561	accept                                                                                                                                                                                                                                                         		42205	1975-10-23	4	7000
562	\N		42205	1976-03-17	7	0
563	\N		42206	1976-09-16	6	150
564	\N		42206	1976-09-23	1	150
565	\N		42206	1976-09-06	3	150
566	\N		42206	1970-01-26	2	140
567	accept                                                                                                                                                                                                                                                         		42206	1970-01-26	4	140
568	\N		42206	1968-05-29	3	100
569	\N		42206	1966-10-12	3	125
570	\N		42206	1965-09-15	3	75
571	\N		42206	1976-09-27	7	0
572	\N	Bruce A. Elmore is a substitute Trustee	42207	1967-02-28	1	0
573	\N		42207	1968-10-29	1	0
574	\N		42207	1968-08-19	3	7000
575	\N		42207	1968-06-14	3	6300
576	\N		42207	1965-09-15	3	4050
577	\N		42207	1968-09-26	2	7000
578	accept                                                                                                                                                                                                                                                         		42207	1968-09-30	4	7000
579	\N	Rent Amount: $25, Lease Start Date: December 1, 1968	42207	1968-11-27	5	25
580	\N		42207	1968-10-29	7	0
581	\N		42208	1952-01-22	1	0
586	accept                                                                                                                                                                                                                                                         		42208	1970-08-24	2	6000
587	accept                                                                                                                                                                                                                                                         		42208	1970-08-24	4	6000
588	\N		42208	1970-09-30	7	0
589	\N		42209	1951-01-04	1	0
590	\N		42209	1970-08-17	1	6850
591	\N		42209	1968-05-29	3	6850
592	\N		42209	1967-02-14	3	5000
593	\N		42209	1965-09-15	3	3000
594	\N		42209	1970-06-22	2	6850
595	accept                                                                                                                                                                                                                                                         		42209	1970-07-28	4	6850
596	\N		42209	1970-08-17	7	0
597	\N		42210	1951-07-09	1	0
598	\N		42210	1970-08-10	1	3100
599	\N		42210	1968-06-06	3	3100
600	\N		42210	1966-10-08	3	4200
601	\N		42210	1965-09-15	3	2600
602	\N		42210	1970-04-25	2	3100
603	accept                                                                                                                                                                                                                                                         		42210	1970-04-25	4	3100
604	\N		42210	1970-08-10	7	0
605	\N		42211	1950-11-17	1	0
606	\N		42211	1969-04-28	1	2400
607	\N		42211	1968-06-07	3	2300
608	\N		42211	1967-02-06	3	2400
609	\N		42211	1965-09-15	3	1500
610	\N		42211	1969-01-29	2	2400
611	accept                                                                                                                                                                                                                                                         		42211	1969-01-30	4	2400
612	\N		42211	1969-04-28	7	0
613	\N		42212	1957-01-30	1	0
614	\N		42212	1969-01-28	1	2500
615	\N		42212	1968-06-07	3	2500
616	\N		42212	1967-02-06	3	4000
617	\N		42212	1965-09-15	3	1950
618	\N		42212	1968-12-03	2	2500
619	accept                                                                                                                                                                                                                                                         		42212	1968-12-04	4	2500
620	\N		42212	1969-01-28	7	0
621	\N		42213	1946-07-31	1	0
622	\N		42213	1969-01-29	1	2000
623	\N		42213	1968-06-06	3	1400
624	\N		42213	1967-02-06	3	2000
625	\N		42213	1965-09-15	3	700
626	\N		42213	1968-12-09	2	2000
627	accept                                                                                                                                                                                                                                                         		42213	1968-10-09	4	2000
628	\N		42213	1969-01-29	7	0
629	\N		42214	1957-02-19	1	0
630	\N		42214	1961-12-05	1	0
631	\N		42214	1969-11-17	1	5300
632	\N		42214	1968-06-06	3	4100
633	\N		42214	1967-02-08	3	5300
634	\N		42214	1965-09-15	3	3100
635	\N		42214	1969-10-22	2	5300
636	accept                                                                                                                                                                                                                                                         		42214	1969-10-22	4	5300
637	\N		42214	1969-11-17	7	0
638	\N		42215	1961-01-06	1	0
639	\N	Other=Donor	42215	1962-07-06	1	0
640	\N	Other = Donor	42215	1969-01-28	1	3200
641	\N		42215	1968-06-07	3	3200
642	\N		42215	1967-02-07	3	3000
643	\N		42215	1965-09-15	3	1250
644	\N	Other=Donor	42215	1969-09-30	2	3200
645	accept                                                                                                                                                                                                                                                         		42215	1969-09-30	4	3200
646	\N		42215	1969-01-28	7	0
647	\N		42215	\N	\N	0
648	\N		42216	1928-10-01	1	0
649	\N		42216	1969-06-11	1	2400
650	\N		42216	1968-06-06	3	1950
651	\N		42216	1967-02-08	3	2400
652	\N		42216	1965-09-15	3	1050
653	\N		42216	1969-04-25	2	2400
654	accept                                                                                                                                                                                                                                                         		42216	1969-04-25	4	2400
655	\N		42216	1969-06-11	7	0
656	\N		42217	1945-08-02	1	0
657	\N		42217	1970-05-05	1	375
658	\N		42217	1968-06-06	3	300
659	\N		42217	1966-10-17	3	375
660	\N		42217	1965-09-15	3	100
661	\N		42217	1970-04-22	2	375
662	accept                                                                                                                                                                                                                                                         		42217	1970-04-23	4	375
663	\N		42217	1970-05-05	7	0
664	\N		42218	1943-02-25	1	0
665	\N	3 daughters inherited the property	42218	1969-05-01	1	1000
666	\N		42218	1968-06-06	3	650
667	\N		42218	1967-02-06	3	1400
668	\N		42218	1965-09-15	3	1850
669	\N		42218	1968-10-10	2	1000
837	\N	Owner went to court after offer was made and accepted	42239	1977-01-13	6	400
838	\N		42239	1977-01-31	7	0
841	\N		42240	1970-02-20	7	0
670	accept                                                                                                                                                                                                                                                         		42218	1968-10-21	4	1000
671	\N		42218	1969-05-01	7	0
672	\N		42219	1965-08-07	1	0
673	\N		42219	1970-11-23	1	400
674	\N		42219	1968-06-11	3	500
675	\N		42219	1966-10-18	3	270
676	\N		42219	1965-09-15	3	175
677	\N		42219	1970-09-01	2	400
678	accept                                                                                                                                                                                                                                                         		42219	1970-10-12	4	400
679	\N		42219	1970-11-23	7	0
680	\N		42220	1947-05-19	1	0
681	\N		42220	1971-02-03	1	5800
682	accept                                                                                                                                                                                                                                                         		42220	1971-01-28	2	5800
683	\N		42220	1968-08-03	3	5800
684	\N		42220	1968-06-19	3	5200
685	\N		42220	1965-09-15	3	3000
686	\N		42220	1971-02-18	7	0
687	\N		42221	1915-05-06	1	0
688	\N		42221	1971-12-13	1	1050
689	\N		42221	1968-06-06	3	300
690	\N		42221	1966-10-08	3	300
691	\N		42221	1965-09-15	3	100
692	\N		42221	1969-12-15	2	1050
693	accept                                                                                                                                                                                                                                                         		42221	1969-12-15	4	1050
694	\N		42221	1971-12-13	7	0
695	\N	Partition among Heirs of W.E. Shuford	42222	1945-08-02	1	0
696	\N		42222	1972-09-22	1	300
697	\N		42222	1968-06-06	3	300
698	\N		42222	1966-10-08	3	300
699	\N		42222	1965-09-15	3	100
700	\N		42222	1968-01-01	2	300
701	reject                                                                                                                                                                                                                                                         		42222	1969-02-25	4	300
702	\N		42222	1972-09-15	6	300
703	\N		42222	1972-09-22	7	0
704	\N		42223	1947-09-20	1	0
705	\N		42223	1970-08-05	1	6600
706	accept                                                                                                                                                                                                                                                         		42223	1970-07-14	2	6600
707	\N		42223	1968-07-27	3	6600
708	\N		42223	1965-09-15	3	4500
709	\N		42223	1968-05-29	3	6000
710	\N		42223	1970-08-10	7	0
711	\N		42224	1923-01-24	1	0
712	\N		42224	1971-11-12	1	2300
713	\N		42224	1968-06-07	3	1200
714	\N		42224	1967-02-07	3	2500
715	\N		42224	1965-09-15	3	0
716	\N		42225	1923-01-24	1	0
717	\N		42225	1971-11-12	1	2300
718	\N		42225	1968-06-07	3	1200
719	\N		42225	1967-02-07	3	2500
720	\N		42225	1965-09-15	3	1650
721	\N		42225	1969-08-08	2	2300
722	accept                                                                                                                                                                                                                                                         		42225	1969-08-11	4	2300
723	\N	Outstanding liens against the owner, unable to make transaction, so placed on list of condemnation	42225	1971-11-05	6	2300
724	\N		42225	1971-11-12	7	0
725	\N		42226	1968-05-24	1	0
726	\N		42226	1969-06-10	1	4700
727	accept                                                                                                                                                                                                                                                         		42226	1969-02-17	2	4700
728	\N		42226	1968-05-29	3	4700
729	\N		42226	1968-07-15	3	4500
730	\N		42226	1965-09-15	3	4700
731	\N		42226	1969-06-23	7	0
732	\N		42227	1967-01-12	1	0
733	complicated                                                                                                                                                                                                                                                    	There is no information on whether the owners accepted or rejected the offer. HACA filed petition for condemnation on 07-05-1975 and commissioner''s hearing occured on 31-07-1975	42227	1974-08-26	2	9000
734	\N		42227	1968-06-14	3	8700
735	\N		42227	1975-08-11	1	0
736	accept                                                                                                                                                                                                                                                         		42227	1968-08-22	3	9000
737	\N		42227	1965-09-15	3	7200
738	\N	Amount awarded: 11000 + interest: 176	42227	1975-07-31	6	11176
739	\N		42227	1975-09-17	7	0
740	\N		42228	1945-06-25	1	0
741	\N		42228	1950-05-29	1	0
742	\N		42228	1974-12-06	1	4000
743	accept                                                                                                                                                                                                                                                         		42228	1974-11-25	2	4000
744	\N		42228	1968-05-28	3	4000
745	\N		42228	1968-07-11	3	4000
746	\N		42228	1965-09-15	3	4000
747	\N		42228	1975-01-02	7	0
748	\N		42229	1972-11-21	1	500
749	\N		42229	1972-11-21	7	0
750	\N		42229	1972-08-30	2	500
839	\N		42240	1963-03-04	1	0
840	\N		42240	1970-02-20	1	7000
751	accept                                                                                                                                                                                                                                                         		42229	1972-09-01	4	500
752	\N		42229	1965-09-15	3	100
753	\N		42229	1968-05-29	3	450
754	\N		42229	1967-02-14	3	800
755	\N		42230	1915-07-07	1	0
756	\N		42230	1976-12-30	1	700
757	\N		42230	1968-06-11	3	525
758	\N		42230	1966-10-17	3	385
759	\N		42230	1965-09-15	3	150
760	\N		42230	\N	2	500
761	reject                                                                                                                                                                                                                                                         		42230	\N	4	500
762	\N		42230	1976-12-17	6	700
763	\N		42230	1976-12-30	7	0
764	\N		42231	1970-04-14	1	2000
765	\N		42231	1970-04-07	6	2000
766	\N		42231	1969-02-24	2	2000
767	accept                                                                                                                                                                                                                                                         		42231	1969-02-24	2	2000
768	\N		42231	1970-04-14	7	0
769	\N		42231	1968-05-29	3	1800
770	\N		42231	1967-02-14	3	2000
771	\N		42231	1965-09-15	3	750
772	\N		42232	1947-01-12	1	0
773	\N		42232	1973-08-08	1	0
774	\N		42232	1968-08-20	3	6000
775	\N		42232	1965-09-15	3	6100
776	\N		42232	1968-06-14	3	7000
777	\N		42232	1972-05-31	2	7000
778	accept                                                                                                                                                                                                                                                         		42232	1973-03-20	4	0
779	\N		42232	1973-09-21	7	0
780	\N		42233	1976-09-24	6	500
781	\N		42233	1976-09-30	1	500
782	\N		42233	1976-09-16	3	500
783	\N		42233	1968-05-29	3	350
784	\N		42233	1966-10-10	3	320
785	\N		42233	1965-09-15	3	150
786	\N		42233	1976-09-30	2	500
787	accept                                                                                                                                                                                                                                                         		42233	1976-09-30	4	500
788	\N		42234	1963-02-21	1	0
789	\N		42234	1969-05-20	1	0
790	\N		42234	1968-06-14	3	6500
791	\N		42234	1968-08-20	3	6500
792	\N		42234	1965-09-15	3	6150
793	\N		42234	1969-05-01	2	6500
794	accept                                                                                                                                                                                                                                                         		42234	1969-01-02	4	0
795	\N		42234	1969-05-23	7	0
796	\N	Monthly rent - $25. The previous owner is the tenant after purchase of property by the redevelopment commission.	42234	1969-06-27	5	25
797	\N		42235	1924-06-03	1	0
798	\N		42235	1974-03-20	1	2000
799	\N		42235	1968-06-11	3	1500
800	\N		42235	1966-11-17	3	2000
801	\N		42235	1966-06-20	3	2800
802	\N		42235	1974-02-13	2	2000
803	accept                                                                                                                                                                                                                                                         		42235	1974-02-13	4	2000
804	\N		42235	1974-04-24	7	0
805	\N		42236	1946-10-03	1	0
806	\N		42236	1969-05-15	1	0
807	\N		42236	1968-08-21	3	3600
808	\N		42236	1968-06-15	3	3600
809	\N		42236	1965-09-15	3	1200
810	\N		42236	1969-02-21	2	3600
811	accept                                                                                                                                                                                                                                                         		42236	1969-02-24	4	0
812	\N		42236	1969-06-02	7	0
813	\N		42237	1938-12-02	1	0
814	\N		42237	1970-10-13	1	0
815	\N		42237	1968-09-26	3	10500
816	\N		42237	1968-06-30	3	13000
817	\N		42237	1965-09-15	3	10250
818	\N		42237	1970-09-30	2	10500
819	accept                                                                                                                                                                                                                                                         		42237	1970-10-02	4	0
820	\N		42237	1970-10-21	7	0
821	\N		42238	1950-03-20	1	0
822	\N		42238	1968-11-26	1	11000
823	\N		42238	1968-12-03	7	0
824	\N		42238	1968-10-29	2	11000
825	accept                                                                                                                                                                                                                                                         		42238	1968-10-29	4	11000
826	\N		42238	1965-09-15	3	9150
827	\N		42238	1968-05-05	3	8500
828	\N		42238	1968-07-27	3	13285
829	\N	Vacated 5/3/1971	42238	1969-02-01	5	0
830	\N		42239	1910-10-04	1	0
831	\N		42239	1977-01-21	1	400
832	\N		42239	1968-06-11	3	300
833	\N		42239	1966-10-17	3	135
834	\N		42239	1965-09-15	3	100
835	\N		42239	1974-01-08	2	250
836	accept                                                                                                                                                                                                                                                         	Owner went to court after offer was made and accepted	42239	1974-01-08	4	250
842	\N		42240	1969-11-05	2	7000
843	accept                                                                                                                                                                                                                                                         		42240	1970-02-05	4	7000
844	\N		42240	1968-08-19	3	7000
845	\N		42240	1968-06-07	3	7000
846	\N		42240	1965-09-15	3	3000
847	\N	The actual date of transfer is 01/04/1899.	42241	1910-04-01	1	0
848	\N		42241	1975-08-25	1	0
849	\N		42241	1968-06-15	3	1550
850	\N		42241	1965-09-15	3	750
851	\N		42241	1968-07-19	3	1725
852	\N	There is no information on whether the an offer was made to owners. HACA filed petition for condemnation on 21-05-1975 and commissioner''s hearing occurred on 14-08-1975	42241	\N	2	0
853	complicated                                                                                                                                                                                                                                                    	There is no information on whether the owners accepted or rejected the offer. HACA filed petition for condemnation on 21-05-1975 and commissioner''s hearing occurred on 14-08-1975	42241	\N	4	0
854	\N		42241	1975-09-19	6	1550
855	\N		42241	1975-09-26	7	0
856	\N		42242	1925-10-30	1	0
857	\N		42242	1975-05-29	1	300
858	\N		42242	1965-09-15	3	140
859	\N		42242	1966-10-18	3	160
860	\N		42242	1968-06-11	3	300
861	\N		42242	1975-03-21	3	400
862	\N		42242	1975-04-15	3	300
863	\N		42242	1969-06-22	2	300
864	accept                                                                                                                                                                                                                                                         		42242	1975-05-19	4	300
865	\N		42242	1975-06-05	7	0
866	\N		42243	1968-01-30	1	0
867	\N		42243	1968-10-15	1	0
868	\N		42243	1968-08-21	3	11500
869	\N		42243	1968-06-18	3	9500
870	\N		42243	1965-09-15	3	7300
871	\N		42243	1968-09-24	2	10000
872	accept                                                                                                                                                                                                                                                         		42243	1968-09-25	4	0
873	\N		42243	1968-10-17	7	0
874	\N		42244	1947-03-17	1	0
875	\N		42244	1969-04-04	1	0
876	\N		42244	1968-08-26	3	4000
877	\N		42244	1968-06-29	3	3850
878	\N		42244	1969-01-13	2	4000
879	\N		42244	1965-09-15	3	2650
880	accept                                                                                                                                                                                                                                                         		42244	1969-01-13	4	0
881	\N		42244	1969-06-11	7	0
882	\N	The previous owner is the tenant after the residence was purchased by the redevelopment commission.	42244	1969-07-24	5	10
883	\N		42245	1955-12-03	1	0
884	\N		42245	1968-12-18	1	0
885	\N		42245	1968-06-18	3	4650
886	\N		42245	1968-08-27	3	4000
887	\N		42245	1965-09-15	3	3000
888	\N		42245	1968-10-24	2	4650
889	accept                                                                                                                                                                                                                                                         		42245	1968-10-25	4	0
890	\N		42245	1968-12-19	7	0
891	\N		42246	1940-06-14	1	0
892	\N		42246	1971-05-06	1	8500
893	\N		42246	1969-04-01	2	8500
894	accept                                                                                                                                                                                                                                                         		42246	1969-04-01	4	8500
895	\N		42246	1968-08-20	3	8500
896	\N		42246	1968-07-11	3	7850
897	\N		42246	1965-09-16	3	6650
898	\N		42247	1963-07-12	1	0
899	\N		42247	1972-02-21	1	0
900	\N		42247	1968-09-03	3	10500
901	\N		42247	1968-07-11	3	10800
902	\N		42247	1965-09-15	3	6850
903	\N		42247	1972-02-02	2	10800
904	accept                                                                                                                                                                                                                                                         		42247	1972-02-03	4	0
905	\N		42247	1972-02-22	7	0
906	\N		42248	1925-01-28	1	0
907	\N		42248	1975-04-24	1	450
908	\N		42248	1965-09-15	3	100
909	\N		42248	1966-10-18	3	200
910	\N		42248	1968-06-11	3	300
911	\N		42248	1975-03-05	3	350
912	\N		42248	1975-03-06	3	450
913	\N		42248	1975-04-15	2	450
914	accept                                                                                                                                                                                                                                                         		42248	1975-04-15	4	450
915	\N		42248	1975-04-24	7	0
916	\N		42249	1963-10-28	1	0
917	\N		42249	1968-12-09	1	0
918	\N		42249	1968-09-02	3	9000
919	\N		42249	1968-06-18	3	11500
920	\N		42249	1965-09-15	3	8800
921	\N	The previous owner is the tenant now after the house was purchased by the redevelopment commission.	42249	1969-02-03	5	25
922	\N		42249	1968-10-15	2	11500
923	accept                                                                                                                                                                                                                                                         		42249	1968-10-16	4	0
924	\N		42249	1968-12-10	7	0
925	\N		42250	1972-05-15	7	0
926	\N		42250	1968-08-27	3	9700
927	\N		42250	1968-07-06	3	11000
928	\N		42250	1965-09-15	3	6650
929	\N		42250	1939-11-29	1	0
930	\N		42250	1972-05-15	1	10000
931	\N		42250	1972-04-11	2	10000
932	accept                                                                                                                                                                                                                                                         		42250	1972-04-12	4	10000
933	\N		42250	\N	\N	0
934	\N	Grace W. Hinton, acting comm. of the World War Veterans Loan Fund of the state of N.C.	42251	1942-09-19	1	0
935	\N	Florence Foster (deceased as of 07-09-1955) was previously the owner before Lois Foster.	42251	1972-02-14	1	0
936	\N		42251	1968-07-05	3	4250
937	\N		42251	1967-03-06	3	5000
938	\N		42251	1965-09-15	3	3300
939	\N		42251	1972-01-06	2	4500
940	accept                                                                                                                                                                                                                                                         		42251	1972-01-13	4	0
941	\N		42251	1972-02-14	7	0
942	\N		42252	1968-08-21	3	6700
943	\N		42252	1968-07-06	3	6950
944	\N		42252	1965-09-15	3	4750
945	\N		42252	1963-03-14	1	0
946	\N		42252	1969-01-13	5	40
947	\N		42252	1968-11-07	1	6950
948	\N		42252	1968-11-08	7	0
949	\N		42252	1968-10-14	2	6950
950	accept                                                                                                                                                                                                                                                         		42252	1968-10-14	4	0
951	\N	Farrie Nicholas is the sister of Timothy Nicholas	42253	1962-01-05	1	0
952	\N		42253	1975-10-23	1	0
953	\N		42253	1968-09-02	3	7300
954	\N		42253	1965-09-15	3	4350
955	\N		42253	1968-06-18	3	6500
956	\N		42253	1974-10-02	3	6000
957	\N		42253	1975-02-24	3	7300
958	\N		42253	1975-08-14	2	7300
959	accept                                                                                                                                                                                                                                                         		42253	1975-08-15	4	0
960	\N		42253	1975-11-22	7	0
961	\N		42254	1968-07-13	3	5200
962	\N		42254	1967-08-19	3	5000
963	\N		42254	1965-09-15	3	1950
964	\N		42254	1958-04-09	1	0
965	\N		42254	1969-04-02	1	5000
966	\N		42254	1969-04-10	7	0
967	\N		42254	1969-02-10	2	5000
968	accept                                                                                                                                                                                                                                                         		42254	1969-02-10	4	5000
969	\N		42254	\N	5	0
970	\N		42255	1954-06-21	1	0
971	\N		42255	1975-12-09	1	0
972	\N		42255	1975-12-07	7	0
973	\N	The offer made originally was on 20/05/1974 over phone at the owner''s request as numerous contacts had been made and updated appraisals had been made. The offer originally was not accepted by owner and she tried several negotiations on the price in meetings. Finally she accepted after numerous failed attempts to increase the fair value determined by the board.	42255	1975-11-18	2	14500
974	\N		42255	1975-11-18	4	0
975	\N		42255	1965-09-15	3	8550
976	\N		42256	1969-11-14	1	6000
977	\N		42256	1940-06-25	1	0
978	accept                                                                                                                                                                                                                                                         		42256	1969-10-31	2	6000
979	\N	Helen''s middle initial slightly different	42256	1968-08-05	3	5000
980	\N		42256	1968-07-12	3	6000
981	\N		42256	1965-09-15	3	1500
982	\N	Previous	42257	1926-01-20	1	0
983	\N		42257	1968-07-15	3	4400
984	\N		42257	1968-04-21	3	5700
985	\N		42257	1965-09-15	3	1700
986	\N	Final	42257	1975-08-26	1	5000
987	\N		42257	1975-08-26	7	0
988	\N		42257	\N	2	0
989	accept                                                                                                                                                                                                                                                         		42258	1969-10-31	2	6000
990	accept                                                                                                                                                                                                                                                         		42258	1969-10-31	4	6000
991	\N		42258	1969-11-12	1	6000
992	\N		42258	1940-01-24	1	6000
993	\N		42258	1969-11-14	7	0
994	\N		42258	1968-08-05	3	5000
995	\N		42258	1968-07-12	3	6000
996	\N		42258	1965-09-15	3	0
997	\N		42259	1968-11-08	2	9000
998	accept                                                                                                                                                                                                                                                         		42259	1968-11-08	4	9000
999	\N		42259	1968-12-16	1	8983
1000	\N		42259	1968-12-17	7	0
1001	\N		42259	1961-10-04	1	0
1002	\N		42259	1968-08-05	3	9000
1003	\N		42259	1968-07-12	3	6250
1004	\N		42259	1965-09-15	3	3100
1005	\N		42260	1971-11-01	2	9000
1006	\N		42260	1973-07-24	6	10000
1007	\N		42260	1973-07-20	1	10000
1008	\N		42260	1973-07-24	7	0
1009	\N		42260	1910-08-01	1	0
1010	\N		42260	1968-07-12	3	8500
1011	\N		42260	1968-05-08	3	9750
1012	\N		42260	1965-09-15	3	5100
1013	\N		42261	1970-08-05	2	6500
1014	accept                                                                                                                                                                                                                                                         		42261	1970-08-05	4	6500
1015	\N		42261	1961-12-22	1	0
1016	\N		42261	1970-11-04	1	6500
1017	\N		42261	1970-11-06	7	0
1018	\N		42261	1968-08-14	3	6500
1019	\N		42261	1968-07-16	3	5500
1020	\N		42261	1965-09-15	3	3650
1021	\N		42262	1969-10-09	2	6250
1022	accept                                                                                                                                                                                                                                                         		42262	1969-10-09	4	6250
1023	\N		42262	1952-09-19	1	0
1024	\N		42262	1969-11-06	1	6250
1025	\N		42262	1969-11-07	7	0
1026	\N		42262	1968-08-10	3	5500
1027	\N		42262	1968-07-16	3	6250
1028	\N		42262	1965-09-15	3	4150
1029	\N		42263	1969-02-25	2	10000
1030	accept                                                                                                                                                                                                                                                         		42263	1969-02-25	4	10000
1031	\N		42263	1947-06-18	1	0
1032	\N		42263	1969-06-22	1	0
1033	\N		42263	1969-06-23	7	0
1034	\N		42263	1968-08-16	3	9850
1035	\N		42263	1968-07-17	3	10250
1036	\N		42263	1965-09-15	3	0
1037	\N		42264	1969-12-02	2	19500
1038	accept                                                                                                                                                                                                                                                         		42264	1970-04-09	4	19500
1039	\N		42264	1948-06-01	1	0
1040	\N		42264	1970-08-06	1	19500
1041	\N		42264	1970-08-12	7	0
1042	\N		42264	1968-08-31	3	21000
1043	\N		42264	1968-07-18	3	16500
1044	\N		42264	1965-09-15	3	15750
1045	\N		42265	1946-10-29	1	0
1046	\N		42265	1970-03-04	1	9000
1047	\N		42265	1968-07-10	3	9250
1048	\N		42265	1968-08-10	3	7500
1049	\N		42265	1965-09-15	3	8250
1050	\N	Final Transfer	42266	1972-02-22	1	10800
1051	\N		42266	1968-09-05	3	10500
1052	\N		42266	1968-07-11	3	10800
1053	\N		42266	1965-09-15	3	6850
1054	accept                                                                                                                                                                                                                                                         		42266	1972-02-02	2	10800
1055	\N	Previous Deed Transfer	42266	1963-07-16	1	0
1056	accept                                                                                                                                                                                                                                                         		42266	1972-02-03	4	10800
1057	\N	Previous 	42267	1954-06-21	1	0
1058	\N	Final Transfer	42267	1975-12-09	1	14500
1059	\N		42267	1965-09-15	3	8550
1060	\N		42267	1968-06-29	3	12500
1061	\N		42267	1968-09-02	3	14500
1062	\N		42267	1973-08-03	3	14500
1063	\N		42267	1974-02-06	3	12840
1064	accept                                                                                                                                                                                                                                                         		42267	1975-11-18	2	14500
1065	accept                                                                                                                                                                                                                                                         		42267	1975-11-18	4	14500
1066	\N		42267	1975-12-09	7	14500
1067	\N		42268	1968-09-02	3	9000
1068	\N		42268	1968-06-18	3	11500
1069	\N		42268	1965-09-15	3	8800
1070	\N		42268	1968-12-10	7	0
1071	\N	Previous Transfer	42269	1942-09-19	1	0
1072	\N	Final Transfer	42269	1972-02-14	1	4500
1073	\N		42269	1968-07-05	3	4250
1074	\N		42269	1967-03-06	3	5000
1075	\N		42269	1965-09-15	3	3300
1076	\N		42269	1972-02-14	7	0
1077	\N		42269	1972-01-12	2	4500
1078	accept                                                                                                                                                                                                                                                         		42269	1972-01-13	4	4500
1079	\N	Previous	42270	1962-01-05	1	0
1080	\N	Final transfer	42270	1975-12-09	1	7300
1081	\N		42270	1968-09-02	3	7300
1082	\N		42270	1965-09-15	3	4350
1083	\N		42270	1968-06-18	3	6500
1084	\N		42270	1974-10-02	3	6000
1085	\N		42270	1975-02-24	3	7300
1086	\N		42270	1975-12-09	7	0
1087	\N		42270	1975-08-14	2	7300
1088	accept                                                                                                                                                                                                                                                         		42270	1975-08-15	4	0
1089	\N		42270	\N	\N	0
1090	\N		42271	1967-01-22	3	5500
1091	\N		42271	1965-09-15	3	4000
1092	\N		42271	1968-05-25	3	5300
1093	\N		42271	1960-08-03	1	0
1094	accept                                                                                                                                                                                                                                                         		42271	1970-12-04	1	5500
1204	\N	Parcel address on doc is 24 Murray Hill	42285	1968-05-29	3	7400
1205	\N	Address on document is 24 Murray Hill Road	42285	1967-02-15	3	8250
1206	\N	Address on document is 24 Murray Hill Road	42285	1965-09-15	3	4500
1095	accept                                                                                                                                                                                                                                                         		42271	1968-10-08	2	5500
1096	accept                                                                                                                                                                                                                                                         		42271	1970-11-12	4	5500
1097	\N		42271	1970-12-04	7	5500
1098	\N		42272	1967-01-22	3	600
1099	\N		42272	1965-09-15	3	325
1100	\N		42272	1968-05-26	3	750
1101	accept                                                                                                                                                                                                                                                         		42272	1969-01-20	7	750
1102	\N		42272	1952-09-20	1	0
1103	\N		42272	\N	1	0
1104	accept                                                                                                                                                                                                                                                         		42272	1968-10-04	2	750
1105	accept                                                                                                                                                                                                                                                         		42272	1968-10-04	4	750
1106	\N		42273	1967-01-22	3	5000
1107	\N		42273	1968-05-24	3	4500
1108	\N		42273	1965-09-15	3	3000
1109	accept                                                                                                                                                                                                                                                         		42273	1969-02-19	2	5000
1110	\N		42273	1964-04-24	1	0
1111	accept                                                                                                                                                                                                                                                         		42273	1969-05-05	7	5000
1112	\N		42273	1969-05-05	1	5000
1113	accept                                                                                                                                                                                                                                                         		42273	1969-02-20	4	5000
1114	\N		42274	1967-01-22	3	4800
1115	\N		42274	1968-05-27	3	4250
1116	\N		42274	1965-09-15	3	3600
1117	\N		42274	1949-03-19	1	0
1118	accept                                                                                                                                                                                                                                                         		42274	1969-05-29	7	4800
1119	accept                                                                                                                                                                                                                                                         		42274	1969-05-20	1	4800
1120	\N		42274	1969-07-01	5	20
1121	accept                                                                                                                                                                                                                                                         		42274	1969-03-25	2	4800
1122	accept                                                                                                                                                                                                                                                         		42274	1969-03-26	4	4800
1123	\N		42275	1967-01-22	3	525
1124	\N		42275	1968-05-26	3	350
1125	\N		42275	1965-09-15	3	400
1126	\N		42275	1964-04-29	1	0
1127	accept                                                                                                                                                                                                                                                         		42275	1968-11-04	7	500
1128	accept                                                                                                                                                                                                                                                         		42275	1968-11-04	1	500
1129	accept                                                                                                                                                                                                                                                         		42275	1968-10-15	2	500
1130	accept                                                                                                                                                                                                                                                         		42275	1968-10-15	4	500
1131	\N		42276	1967-02-01	3	4300
1132	\N		42276	1968-05-29	3	5400
1133	\N		42276	1965-09-15	3	3200
1134	\N		42276	1944-09-06	1	0
1135	accept                                                                                                                                                                                                                                                         		42276	1972-02-03	7	4300
1136	\N		42276	1972-02-11	1	4300
1137	accept                                                                                                                                                                                                                                                         		42276	1970-01-30	2	4300
1138	accept                                                                                                                                                                                                                                                         		42276	1970-01-30	4	4300
1139	\N		42277	1967-02-01	3	5000
1140	\N		42277	1965-09-15	3	2300
1141	\N		42277	1968-06-17	3	3750
1142	accept                                                                                                                                                                                                                                                         		42277	1969-05-29	2	3750
1143	accept                                                                                                                                                                                                                                                         		42277	1969-05-29	4	3750
1144	accept                                                                                                                                                                                                                                                         		42277	1969-06-12	1	3750
1145	\N		42277	1969-06-12	7	3750
1146	\N		42277	1956-07-25	1	0
1147	\N		42278	1967-01-25	3	5500
1148	\N		42278	1968-06-03	3	5900
1149	\N		42278	1965-09-15	3	5800
1150	\N		42278	1946-05-24	1	0
1151	accept                                                                                                                                                                                                                                                         		42278	1969-07-03	7	5900
1152	accept                                                                                                                                                                                                                                                         		42278	1969-07-03	1	5900
1153	accept                                                                                                                                                                                                                                                         		42278	1969-03-25	2	5900
1154	accept                                                                                                                                                                                                                                                         		42278	1969-03-25	4	5900
1155	\N		42279	1967-01-24	3	4000
1156	\N		42279	1968-06-03	3	3450
1157	\N		42279	1965-09-15	3	2400
1158	\N		42279	1963-08-01	1	0
1159	accept                                                                                                                                                                                                                                                         		42279	1969-01-24	7	4000
1160	accept                                                                                                                                                                                                                                                         		42279	1969-01-24	1	4000
1161	\N		42279	1969-03-24	5	22
1162	accept                                                                                                                                                                                                                                                         		42279	1968-10-11	2	4000
1163	accept                                                                                                                                                                                                                                                         		42279	1968-10-14	4	4000
1164	\N		42280	1967-01-24	3	2000
1165	\N		42280	1965-09-15	3	380
1166	\N		42280	1968-05-27	3	2150
1167	accept                                                                                                                                                                                                                                                         		42280	1969-07-24	2	2150
1168	accept                                                                                                                                                                                                                                                         		42280	1969-07-24	4	2150
1169	\N		42280	1970-12-10	1	2150
1170	accept                                                                                                                                                                                                                                                         		42280	1970-12-04	7	2150
1171	\N		42280	1949-04-15	1	0
1172	\N		42281	1974-12-06	1	0
1173	\N		42281	1975-01-02	7	4000
1174	accept                                                                                                                                                                                                                                                         	Accepted - Nov 27, 1974	42281	1974-09-24	2	4000
1175	\N		42281	1950-05-29	1	0
1176	\N		42281	1968-05-28	3	4000
1177	\N		42281	1968-07-11	3	4000
1178	\N		42281	1965-09-15	3	4000
1179	\N	HACA rented out property to tenant Ruby Jackson starting Feb 1, 1968	42282	1968-11-26	1	0
1180	\N	Includes property on 6 Blanton Streets	42282	1968-12-03	7	11000
1181	\N	First of two transfers of deed between the same parties (on one document)	42282	1948-06-10	1	0
1182	\N	Second of two transfers of deed between the same parties (on one document)	42282	1950-03-20	1	0
1183	\N		42282	1968-10-29	2	11000
1184	\N		42282	1968-05-15	3	9500
1185	\N	This transfer was handwritten - a second handwritten transfer of deed was provided for the 6 Branton Street property	42282	1957-07-03	1	0
1186	\N	Also appraised 07/27/1968	42282	1968-07-12	3	13300
1187	\N	Address includes "3 Blanton Street" while previous documents say 6 Blanton Street	42282	1965-09-15	3	9150
1188	\N	Deed: Warranty	42283	1975-02-28	1	0
1189	\N		42283	1975-03-27	7	450
1190	\N		42283	1924-05-13	1	0
1191	\N		42283	1968-05-29	3	450
1192	\N		42283	1966-10-08	3	350
1193	\N		42283	1965-09-15	3	200
1194	\N		42284	\N	6	9850
1195	\N	Deed: Order Vesting Title and Right of Possession	42284	1975-06-20	1	0
1196	\N		42284	1975-06-11	3	9850
1197	\N	offer paperwork is available but none were signed by anyone	42284	1975-02-24	2	9000
1198	\N		42284	1966-10-08	3	9000
1199	\N		42284	1946-05-24	1	0
1200	\N		42285	1971-09-22	7	7500
1201	accept                                                                                                                                                                                                                                                         		42285	1971-08-10	2	7500
1202	\N		42285	1971-09-21	1	0
1203	\N		42285	1951-05-11	1	0
\.


--
-- Data for Name: image_paths; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

COPY humanface.image_paths (image_id, img_path, parcel_id) FROM stdin;
5361	images/properties/B10_P12_021976_1.png	41373
5362	images/properties/B10_P12_022576_1.png	41373
5363	images/properties/B10_P12_062066_1.png	41373
5364	images/properties/B10_P12_101866_1.png	41373
5365	images/properties/B10_P13_062066_1.png	41374
5366	images/properties/B10_P13_101966_1.png	41374
5367	images/properties/B10_P14_021767_1.png	41375
5368	images/properties/B10_P14_021767_2.png	41375
5369	images/properties/B10_P14_061368_1.png	41375
5370	images/properties/B10_P14_061368_2.png	41375
5371	images/properties/B10_P14_091565_1.png	41375
5372	images/properties/B10_P14_091565_2.png	41375
5373	images/properties/B10_P15_091565_1.png	41376
5374	images/properties/B10_P15_101966_1.png	41376
5375	images/properties/B10_P16_061368_1.png	41377
5376	images/properties/B10_P16_101966_1.png	41377
5377	images/properties/B10_P17_020767_1.png	41378
5378	images/properties/B10_P17_091565_1.png	41378
5379	images/properties/B10_P18_091565_1.png	41379
5380	images/properties/B10_P18_101866_1.png	41379
5381	images/properties/B10_P19_061363_1.png	41380
5382	images/properties/B10_P19_061363_2.png	41380
5383	images/properties/B10_P19_091565_1.png	41380
5384	images/properties/B10_P2_062066_1.png	41381
5385	images/properties/B10_P2_062268_1.png	41381
5386	images/properties/B10_P3_062028_1.png	41382
5387	images/properties/B10_P3_062066_1.png	41382
5388	images/properties/B10_P3_072076_1.png	41382
5389	images/properties/B10_P3_072076_2.png	41382
5390	images/properties/B10_P3_080476_1.png	41382
5391	images/properties/B10_P3_101166_1.png	41382
5392	images/properties/B10_P4_021667_1.png	41383
5393	images/properties/B10_P4_062066_1.png	41383
5394	images/properties/B10_P6_021567_1.png	41384
5395	images/properties/B10_P6_062066_1.png	41384
5396	images/properties/B10_P6_062068_1.png	41384
5397	images/properties/B11_P10_052868_1.png	41385
5398	images/properties/B11_P10_091565_1.png	41385
5399	images/properties/B11_P11_111368_1.png	41386
5400	images/properties/B11_P11_111466_1.png	41386
5401	images/properties/B11_P12_022576_1.png	41387
5402	images/properties/B11_P12_091565_1.png	41387
5403	images/properties/B11_P12_111368_1.png	41387
5404	images/properties/B11_P12_111466_1.png	41387
5405	images/properties/B11_P14_052868_1.png	41388
5406	images/properties/B11_P14_091565_1.png	41388
5407	images/properties/B11_P15_052868_1.png	41389
5408	images/properties/B11_P15_091565_1.png	41389
5409	images/properties/B11_P16_052868_1.png	41390
5410	images/properties/B11_P16_091676_1.png	41390
5411	images/properties/B11_P16_101166_1.png	41390
5412	images/properties/B11_P17_052968_1.png	41391
5413	images/properties/B11_P17_080676_1.png	41391
5414	images/properties/B11_P17_101766_1.png	41391
5415	images/properties/B11_P18_052968_1.png	41392
5416	images/properties/B11_P18_091565_1.png	41392
5417	images/properties/B11_P19_090676_1.png	41393
5418	images/properties/B11_P19_091565_1.png	41393
5419	images/properties/B11_P19_101266_1.png	41393
5420	images/properties/B11_P20_021467_1.png	41394
5421	images/properties/B11_P20_091565_1.png	41394
5422	images/properties/B11_P21_021467_1.png	41395
5423	images/properties/B11_P21_052968_1.png	41395
5424	images/properties/B11_P22_091565_1.png	41396
5425	images/properties/B11_P22_091676_1.png	41396
5426	images/properties/B11_P22_091676_2.png	41396
5427	images/properties/B11_P22_101066_1.png	41396
5428	images/properties/B11_P23_052968_1.png	41397
5429	images/properties/B11_P23_091565_1.png	41397
5430	images/properties/B11_P24_052968_1.png	41398
5431	images/properties/B11_P24_091565_1.png	41398
5432	images/properties/B11_P25_060668_1.png	41399
5433	images/properties/B11_P25_091565_1.png	41399
5434	images/properties/B11_P27_060768_1.png	41400
5435	images/properties/B11_P27_091565_1.png	41400
5436	images/properties/B11_P28_060768_1.png	41401
5437	images/properties/B11_P28_091565_1.png	41401
5438	images/properties/B11_P29_060668_1.png	41402
5439	images/properties/B11_P29_091565_1.png	41402
5440	images/properties/B11_P2_112274_1.png	41403
5441	images/properties/B11_P2_112274_2.png	41403
5442	images/properties/B11_P2_112274_3.png	41403
5443	images/properties/B11_P2_112274_4.png	41403
5444	images/properties/B11_P2_112274_5.png	41403
5445	images/properties/B11_P2_112274_6.png	41403
5446	images/properties/B11_P2_112274_7.png	41403
5447	images/properties/B11_P2_112274_8.png	41403
5448	images/properties/B11_P2_112274_9.png	41403
5449	images/properties/B11_P30_060668_1.png	41404
5450	images/properties/B11_P30_091565_1.png	41404
5451	images/properties/B11_P31_020767_1.png	41405
5452	images/properties/B11_P31_020767_2.png	41405
5453	images/properties/B11_P31_060768_1.png	41405
5454	images/properties/B11_P32_060768_1.png	41406
5455	images/properties/B11_P32_091565_1.png	41406
5456	images/properties/B11_P33_060668_1.png	41407
5457	images/properties/B11_P33_091565_1.png	41407
5458	images/properties/B11_P34_060668_1.png	41408
5459	images/properties/B11_P34_091565_1.png	41408
5460	images/properties/B11_P35_060668_1.png	41409
5461	images/properties/B11_P35_091565_1.png	41409
5462	images/properties/B11_P36_061168_1.png	41410
5463	images/properties/B11_P36_091565_1.png	41410
5464	images/properties/B11_P36_101766_1.png	41410
5465	images/properties/B11_P36_112276_1.png	41410
5466	images/properties/B11_P37_061168_1.png	41411
5467	images/properties/B11_P37_062066_1.png	41411
5468	images/properties/B11_P37_111766_1.png	41411
5469	images/properties/B11_P38_061168_1.png	41412
5470	images/properties/B11_P38_101766_1.png	41412
5471	images/properties/B11_P38_122876_1.png	41412
5472	images/properties/B11_P38_122876_2.png	41412
5473	images/properties/B11_P39_061168_1.png	41413
5474	images/properties/B11_P39_101866_1.png	41413
5475	images/properties/B11_P3_020867_1.png	41414
5476	images/properties/B11_P3_032175_1.png	41414
5477	images/properties/B11_P3_032175_2.png	41414
5478	images/properties/B11_P3_041575_1.png	41414
5479	images/properties/B11_P3_052868_1.png	41414
5480	images/properties/B11_P3_091565_1.png	41414
5481	images/properties/B11_P40_032175_1.png	41415
5482	images/properties/B11_P40_032175_2.png	41415
5483	images/properties/B11_P40_041575_1.png	41415
5484	images/properties/B11_P40_061168_1.png	41415
5485	images/properties/B11_P40_101866_1.png	41415
5486	images/properties/B11_P41_030575_1.png	41416
5487	images/properties/B11_P41_030675_1.png	41416
5488	images/properties/B11_P41_061168_1.png	41416
5489	images/properties/B11_P41_091565_1.png	41416
5490	images/properties/B11_P41_101866_1.png	41416
5491	images/properties/B11_P42_091565_1.png	41417
5492	images/properties/B11_P42_100866_1.png	41417
5493	images/properties/B11_P43_060668_1.png	41418
5494	images/properties/B11_P43_091565_1.png	41418
5495	images/properties/B11_P43_101866_1.png	41418
5496	images/properties/B11_P44_061168_1.png	41419
5497	images/properties/B11_P44_100766_1.png	41419
5498	images/properties/B11_P45_060668_1.png	41420
5499	images/properties/B11_P45_100866_1.png	41420
5500	images/properties/B11_P4_052968_1.png	41421
5501	images/properties/B11_P4_091565_1.png	41421
5502	images/properties/B11_P5_091565_1.png	41422
5503	images/properties/B11_P5_102066_1.png	41422
5504	images/properties/B11_P6_052968_1.png	41423
5505	images/properties/B11_P6_090676_1.png	41423
5506	images/properties/B11_P6_091565_1.png	41423
5507	images/properties/B11_P6_102066_1.png	41423
5508	images/properties/B11_P7_052968_1.png	41424
5509	images/properties/B11_P7_091565_1.png	41424
5510	images/properties/B11_P7_091676_1.png	41424
5511	images/properties/B11_P7_102066_1.png	41424
5512	images/properties/B11_P8_021067_1.png	41425
5513	images/properties/B11_P8_021067_2.png	41425
5514	images/properties/B11_P8_052868_1.png	41425
5515	images/properties/B11_P8_091565_1.png	41425
5516	images/properties/B11_P8_091565_2.png	41425
5517	images/properties/B11_P9_020570_1.png	41426
5518	images/properties/B11_P9_020570_2.png	41426
5519	images/properties/B11_P9_091565_1.png	41426
5520	images/properties/B11_P9_111368_1.png	41426
5521	images/properties/B14_P12_052476_1.png	41427
5522	images/properties/B14_P12_052476_2.png	41427
5523	images/properties/B14_P12_052476_3.png	41427
5524	images/properties/B14_P12_052476_4.png	41427
5525	images/properties/B14_P12_052476_5.png	41427
5526	images/properties/B14_P12_052476_6.png	41427
5527	images/properties/B14_P12_052476_7.png	41427
5528	images/properties/B14_P12_052476_8.png	41427
5529	images/properties/B14_P12_052476_9.png	41427
5530	images/properties/B14_P12_062376_1.png	41427
5531	images/properties/B14_P13_061776_1.png	41428
5532	images/properties/B14_P13_061776_2.png	41428
5533	images/properties/B14_P13_061776_3.png	41428
5534	images/properties/B14_P13_061776_4.png	41428
5535	images/properties/B14_P13_061776_5.png	41428
5536	images/properties/B14_P13_061776_6.png	41428
5537	images/properties/B14_P13_061776_7.png	41428
5538	images/properties/B14_P13_061776_8.png	41428
5539	images/properties/B14_P14_061776_1.png	41429
5540	images/properties/B14_P14_061776_2.png	41429
5541	images/properties/B14_P14_061776_3.png	41429
5542	images/properties/B14_P14_061776_4.png	41429
5543	images/properties/B14_P14_061776_5.png	41429
5544	images/properties/B14_P14_061776_6.png	41429
5545	images/properties/B14_P14_061776_7.png	41429
5546	images/properties/B14_P14_061776_8.png	41429
5547	images/properties/B14_P15_062876_1.png	41430
5548	images/properties/B14_P15_062876_10.png	41430
5549	images/properties/B14_P15_062876_2.png	41430
5550	images/properties/B14_P15_062876_3.png	41430
5551	images/properties/B14_P15_062876_4.png	41430
5552	images/properties/B14_P15_062876_5.png	41430
5553	images/properties/B14_P15_062876_6.png	41430
5554	images/properties/B14_P15_062876_7.png	41430
5555	images/properties/B14_P15_062876_8.png	41430
5556	images/properties/B14_P15_062876_9.png	41430
5557	images/properties/B14_P16_111874_1.png	41431
5558	images/properties/B14_P16_112774_1.png	41431
5559	images/properties/B14_P1_052476_1.png	41432
5560	images/properties/B14_P1_052476_2.png	41432
5561	images/properties/B14_P1_052476_3.png	41432
5562	images/properties/B14_P1_052476_4.png	41432
5563	images/properties/B14_P1_052476_5.png	41432
5564	images/properties/B14_P1_071776_1.png	41432
5565	images/properties/B14_P1_071776_2.png	41432
5566	images/properties/B14_P1_071776_3.png	41432
5567	images/properties/B14_P1_071776_4.png	41432
5568	images/properties/B14_P2_112274_1.png	41433
5569	images/properties/B14_P2_112274_2.png	41433
5570	images/properties/B14_P2_112274_3.png	41433
5571	images/properties/B14_P2_112274_4.png	41433
5572	images/properties/B14_P2_112274_5.png	41433
5573	images/properties/B14_P2_112274_6.png	41433
5574	images/properties/B14_P2_112274_7.png	41433
5575	images/properties/B14_P2_112274_8.png	41433
5576	images/properties/B15_P12_072077_1.png	41434
5577	images/properties/B15_P12_081177_1.png	41434
5578	images/properties/B15_P13_072177_1.png	41435
5579	images/properties/B15_P13_072177_2.png	41435
5580	images/properties/B15_P13_072177_3.png	41435
5581	images/properties/B15_P13_072177_4.png	41435
5582	images/properties/B15_P14_020868_1.png	41436
5583	images/properties/B15_P14_091565_1.png	41436
5584	images/properties/B15_P15_091565_1.png	41437
5585	images/properties/B15_P15_092868_1.png	41437
5586	images/properties/B15_P16_092868_1.png	41438
5587	images/properties/B15_P17_092868_1.png	41439
5588	images/properties/B15_P17_092868_2.png	41439
5589	images/properties/B15_P17_101166_1.png	41439
5590	images/properties/B15_P17_101166_2.png	41439
5591	images/properties/B15_P18_070866_1.png	41440
5592	images/properties/B15_P18_090275_1.png	41440
5593	images/properties/B15_P18_090275_2.png	41440
5594	images/properties/B15_P18_092868_1.png	41440
5595	images/properties/B15_P19_021373_1.png	41441
5596	images/properties/B15_P19_102666_1.png	41441
5597	images/properties/B15_P1_011074_1.png	41442
5598	images/properties/B15_P1_011074_2.png	41442
5599	images/properties/B15_P1_020674_1.png	41442
5600	images/properties/B15_P2_090275_1.png	41443
5601	images/properties/B15_P2_090275_2.png	41443
5602	images/properties/B15_P2_090275_3.png	41443
5603	images/properties/B15_P2_090275_4.png	41443
5604	images/properties/B15_P2_090275_5.png	41443
5605	images/properties/B15_P2_090275_6.png	41443
5606	images/properties/B15_P2_090275_7.png	41443
5607	images/properties/B15_P2_091565_1.png	41443
5608	images/properties/B15_P2_092868_1.png	41443
5609	images/properties/B15_P2_092868_2.png	41443
5610	images/properties/B15_P2_101166_1.png	41443
5611	images/properties/B15_P2_101166_2.png	41443
5612	images/properties/B15_P7_011874_1.png	41444
5613	images/properties/B15_P7_011874_2.png	41444
5614	images/properties/B15_P7_020674_1.png	41444
5615	images/properties/B15_P8_081570_1.png	41445
5616	images/properties/B15_P8_081770_.1.png	41445
5617	images/properties/B16_P10_082168_1.png	41446
5618	images/properties/B16_P10_091565_1.png	41446
5619	images/properties/B16_P10_091565_2.png	41446
5620	images/properties/B16_P11_063068_1.png	41447
5621	images/properties/B16_P11_091565_1.png	41447
5622	images/properties/B16_P11_092668_1.png	41447
5623	images/properties/B16_P11_092668_2.png	41447
5624	images/properties/B16_P12_091565_1.png	41448
5625	images/properties/B16_P12_091565_2.png	41448
5626	images/properties/B16_P13_082168_1.png	41449
5627	images/properties/B16_P13_091565_1.png	41449
5628	images/properties/B16_P13_091565_2.png	41449
5629	images/properties/B16_P14_062968_1.png	41450
5630	images/properties/B16_P14_082668_1.png	41450
5631	images/properties/B16_P15_082768_1.png	41451
5632	images/properties/B16_P15_091565_1.png	41451
5633	images/properties/B16_P16_071168_1.png	41452
5634	images/properties/B16_P16_091565_1.png	41452
5635	images/properties/B16_P17_020674_1.png	41453
5636	images/properties/B16_P17_020674_2.png	41453
5637	images/properties/B16_P17_062968_1.png	41453
5638	images/properties/B16_P17_080373_1.png	41453
5639	images/properties/B16_P17_080373_2.png	41453
5640	images/properties/B16_P17_080373_3.png	41453
5641	images/properties/B16_P17_090268_1.png	41453
5642	images/properties/B16_P18_061868_1.png	41454
5643	images/properties/B16_P18_090268_1.png	41454
5644	images/properties/B16_P18_091565_1.png	41454
5645	images/properties/B16_P19_070568_1.png	41455
5646	images/properties/B16_P19_091565_1.png	41455
5647	images/properties/B16_P1_052068_1.png	41456
5648	images/properties/B16_P1_061368_1.png	41456
5649	images/properties/B16_P20_022475_1.png	41457
5650	images/properties/B16_P20_061868_1.png	41457
5651	images/properties/B16_P20_090268_1.png	41457
5652	images/properties/B16_P20_091565_1.png	41457
5653	images/properties/B16_P20_100274_1.png	41457
5654	images/properties/B16_P20_100274_2.png	41457
5655	images/properties/B16_P20_100274_3.png	41457
5656	images/properties/B16_P2_051668_1.png	41458
5657	images/properties/B16_P2_061368_1.png	41458
5658	images/properties/B16_P3_061868_1.png	41459
5659	images/properties/B16_P3_082368_1.png	41459
5660	images/properties/B16_P4_081068_1.png	41460
5661	images/properties/B16_P4_082168_1.png	41460
5662	images/properties/B16_P5_070268_1.png	41461
5663	images/properties/B16_P5_071575_1.png	41461
5664	images/properties/B16_P5_071575_2.png	41461
5665	images/properties/B16_P5_071575_3.png	41461
5666	images/properties/B16_P5_071575_4.png	41461
5667	images/properties/B16_P5_071575_5.png	41461
5668	images/properties/B16_P5_071575_6.png	41461
5669	images/properties/B16_P5_082868_1.png	41461
5670	images/properties/B16_P5_091565_1.png	41461
5671	images/properties/B16_P6_061468_1.png	41462
5672	images/properties/B16_P6_081968_1.png	41462
5673	images/properties/B16_P6_091565_1.png	41462
5674	images/properties/B16_P7_061468_1.png	41463
5675	images/properties/B16_P7_061468_2.png	41463
5676	images/properties/B16_P7_072875_1.png	41463
5677	images/properties/B16_P7_072875_2.png	41463
5678	images/properties/B16_P7_072875_3.png	41463
5679	images/properties/B16_P7_072875_4.png	41463
5680	images/properties/B16_P7_082268_1.png	41463
5681	images/properties/B16_P7_091565_1.png	41463
5682	images/properties/B16_P7_091565_2.png	41463
5683	images/properties/B16_P8_061468_1.png	41464
5684	images/properties/B16_P8_082068_1.png	41464
5685	images/properties/B16_P9_061468_1.png	41465
5686	images/properties/B16_P9_082068_1.png	41465
5687	images/properties/B17_P10_082068_1.png	41466
5688	images/properties/B17_P10_091565_1.png	41466
5689	images/properties/B17_P11_082768_1.png	41467
5690	images/properties/B17_P11_091565_2.png	41467
5691	images/properties/B17_P12_070668_1.png	41468
5692	images/properties/B17_P12_091565_1.png	41468
5693	images/properties/B17_P13_021867_1.png	41469
5694	images/properties/B17_P13_071368_1.png	41469
5695	images/properties/B17_P13_091565_1.png	41469
5696	images/properties/B17_P14_070668_1.png	41470
5697	images/properties/B17_P15_082168_1.png	41471
5698	images/properties/B17_P15_091565_1.png	41471
5699	images/properties/B17_P15_091565_2.png	41471
5700	images/properties/B17_P15_nodate_1.png	41471
5701	images/properties/B17_P15_nodate_2.png	41471
5702	images/properties/B17_P15_nodate_3.png	41471
5703	images/properties/B17_P15_nodate_4.png	41471
5704	images/properties/B17_P15_nodate_5.png	41471
5705	images/properties/B17_P15_nodate_6.png	41471
5706	images/properties/B17_P17_070568_1.png	41472
5707	images/properties/B17_P17_071868_1.png	41472
5708	images/properties/B17_P19_070568_1.png	41473
5709	images/properties/B17_P19_070568_2.png	41473
5710	images/properties/B17_P19_082868_1.png	41473
5711	images/properties/B17_P19_082868_2.png	41473
5712	images/properties/B17_P19_091565_1.png	41473
5713	images/properties/B17_P1_061968_1.png	41474
5714	images/properties/B17_P1_080368_1.png	41474
5715	images/properties/B17_P20_070368_1.png	41475
5716	images/properties/B17_P20_091565_1.png	41475
5717	images/properties/B17_P21_070368_1.png	41476
5718	images/properties/B17_P21_091565_1.png	41476
5719	images/properties/B17_P22_070468_1.png	41477
5720	images/properties/B17_P22_091565_1.png	41477
5721	images/properties/B17_P23_080368_1.png	41478
5722	images/properties/B17_P23_091565_1.png	41478
5723	images/properties/B17_P24_080368_1.png	41479
5724	images/properties/B17_P24_091565_1.png	41479
5725	images/properties/B17_P25_073168_1.png	41480
5726	images/properties/B17_P25_091565_1.png	41480
5727	images/properties/B17_P25_091565_2.png	41480
5728	images/properties/B17_P25_092168_1.png	41480
5729	images/properties/B17_P26_013077_1.png	41481
5730	images/properties/B17_P26_080368_1.png	41481
5731	images/properties/B17_P26_091565_1.png	41481
5732	images/properties/B17_P27_080568_1.png	41482
5733	images/properties/B17_P27_091565_1.png	41482
5734	images/properties/B17_P27_122876_1.png	41482
5735	images/properties/B17_P27_122876_2.png	41482
5736	images/properties/B17_P28_071368_1.png	41483
5737	images/properties/B17_P28_091565_1.png	41483
5738	images/properties/B17_P29_071268_1.png	41484
5739	images/properties/B17_P29_080568_1.png	41484
5740	images/properties/B17_P29_091565_1.png	41484
5741	images/properties/B17_P2_072768_1.png	41485
5742	images/properties/B17_P2_091565_1.png	41485
5743	images/properties/B17_P30_071268_1.png	41486
5744	images/properties/B17_P30_091565_1.png	41486
5745	images/properties/B17_P32_071268_1.png	41487
5746	images/properties/B17_P32_080568_1.png	41487
5747	images/properties/B17_P33_071668_1.png	41488
5748	images/properties/B17_P33_081468_1.png	41488
5749	images/properties/B17_P34_071668_1.png	41489
5750	images/properties/B17_P34_081068_1.png	41489
5751	images/properties/B17_P35_071768_1.png	41490
5752	images/properties/B17_P35_081668_1.png	41490
5753	images/properties/B17_P36_071868_1.png	41491
5754	images/properties/B17_P36_083168_1.png	41491
5755	images/properties/B17_P37_071068_1.png	41492
5756	images/properties/B17_P37_081068_1.png	41492
5757	images/properties/B17_P3_072768_1.png	41493
5758	images/properties/B17_P3_082775_1.png	41493
5759	images/properties/B17_P3_082775_2.png	41493
5760	images/properties/B17_P3_091565_1.png	41493
5761	images/properties/B17_P3_101475_1.png	41493
5762	images/properties/B17_P3_101475_2.png	41493
5763	images/properties/B17_P4_071568_1.png	41494
5764	images/properties/B17_P4_091565_1.png	41494
5765	images/properties/B17_P5_071168_1.png	41495
5766	images/properties/B17_P5_091565_1.png	41495
5767	images/properties/B17_P6_071268_1.png	41496
5768	images/properties/B17_P6_072768_1.png	41496
5769	images/properties/B17_P6_091565_1.png	41496
5770	images/properties/B17_P6_091565_2.png	41496
5771	images/properties/B17_P8_070668_1.png	41497
5772	images/properties/B17_P8_091565_1.png	41497
5773	images/properties/B17_P9A_081968_1.png	41498
5774	images/properties/B17_P9B_071168_1.png	41498
5775	images/properties/B17_P9B_081968_1.png	41498
5776	images/properties/B17_P9B_091565_1.png	41498
5777	images/properties/B18_P3_041868_1.png	41499
5778	images/properties/B18_P3_091565_1.png	41499
5779	images/properties/B18_P3_120568_1.png	41499
5780	images/properties/B18_P4_091565_1.png	41500
5781	images/properties/B18_P4_091565_2.png	41500
5782	images/properties/B18_P4_121268_1.png	41500
5783	images/properties/B18_P4_121268_2.png	41500
5784	images/properties/B18_P4_121268_3.png	41500
5785	images/properties/B18_P5_032768_1.png	41501
5786	images/properties/B18_P5_121368_1.png	41501
5787	images/properties/B18_P6_032968_1.png	41502
5788	images/properties/B18_P6_091565_1.png	41502
5789	images/properties/B18_P7_041568_1.png	41503
5790	images/properties/B18_P7_120568_1.png	41503
5791	images/properties/B19_P10_031968_1.png	41504
5792	images/properties/B19_P10_091565_1.png	41504
5793	images/properties/B19_P11_040168_1.png	41505
5794	images/properties/B19_P11_091565_1.png	41505
5795	images/properties/B19_P13_081570_1.png	41506
5796	images/properties/B19_P13_081570_10.png	41506
5797	images/properties/B19_P13_081570_2.png	41506
5798	images/properties/B19_P13_081570_3.png	41506
5799	images/properties/B19_P13_081570_4.png	41506
5800	images/properties/B19_P13_081570_5.png	41506
5801	images/properties/B19_P13_081570_6.png	41506
5802	images/properties/B19_P13_081570_7.png	41506
5803	images/properties/B19_P13_081570_8.png	41506
5804	images/properties/B19_P13_081570_9.png	41506
5805	images/properties/B19_P14_030274_1.png	41507
5806	images/properties/B19_P14_030274_2.png	41507
5807	images/properties/B19_P14_041474_1.png	41507
5808	images/properties/B19_P17_031968_1.png	41508
5809	images/properties/B19_P17_080368_1.png	41508
5810	images/properties/B19_P17_080368_2.png	41508
5811	images/properties/B19_P17_091565_1.png	41508
5812	images/properties/B19_P18_061464_2.png	41509
5813	images/properties/B19_P18_061474_1.png	41509
5814	images/properties/B19_P18_062066_1.png	41509
5815	images/properties/B19_P18_080368_1.png	41509
5816	images/properties/B19_P1_031968_1.png	41510
5817	images/properties/B19_P1_081068_1.png	41510
5818	images/properties/B19_P22_061274_1.png	41511
5819	images/properties/B19_P22_061474_1.png	41511
5820	images/properties/B19_P23_031968_1.png	41512
5821	images/properties/B19_P23_041170_1.png	41512
5822	images/properties/B19_P23_041170_2.png	41512
5823	images/properties/B19_P23_091565_1.png	41512
5824	images/properties/B19_P23_100568_1.png	41512
5825	images/properties/B19_P24_010168_1.png	41513
5826	images/properties/B19_P24_091565_1.png	41513
5827	images/properties/B19_P25_031968_1.png	41514
5828	images/properties/B19_P25_081068_1.png	41514
5829	images/properties/B19_P26_010168_1.png	41515
5830	images/properties/B19_P26_081068_1.png	41515
5831	images/properties/B19_P26_091565_1.png	41515
5832	images/properties/B19_P27_031968_1.png	41516
5833	images/properties/B19_P27_062066_1.png	41516
5834	images/properties/B19_P28_032868_1.png	41517
5835	images/properties/B19_P28_091565_1.png	41517
5836	images/properties/B19_P29_010868_1.png	41518
5837	images/properties/B19_P29_080868_1.png	41518
5838	images/properties/B19_P2_082368_1.png	41519
5839	images/properties/B19_P2_082468_1.png	41519
5840	images/properties/B19_P3_030774_1.png	41520
5841	images/properties/B19_P3_041474_1.png	41520
5842	images/properties/B19_P5_031868_1.png	41521
5843	images/properties/B19_P5_091565_1.png	41521
5844	images/properties/B19_P6_032968_1.png	41522
5845	images/properties/B19_P6_091565_1.png	41522
5846	images/properties/B19_P9_031968_1.png	41523
5847	images/properties/B19_P9_091565_1.png	41523
5848	images/properties/B1_P10_022874_1.png	41524
5849	images/properties/B1_P10_022874_2.png	41524
5850	images/properties/B1_P11_011267_1.png	41525
5851	images/properties/B1_P11_091565_1.png	41525
5852	images/properties/B1_P11_100168_1.png	41525
5853	images/properties/B1_P12_010676_1.png	41526
5854	images/properties/B1_P12_010676_2.png	41526
5855	images/properties/B1_P12_010676_3.png	41526
5856	images/properties/B1_P12_010676_4.png	41526
5857	images/properties/B1_P12_030174_1.png	41526
5858	images/properties/B1_P12_030174_2.png	41526
5859	images/properties/B1_P12_041474_1.png	41526
5860	images/properties/B1_P12_041474_2.png	41526
5861	images/properties/B1_P12_041474_3.png	41526
5862	images/properties/B1_P12_121275_1.png	41526
5863	images/properties/B1_P12_121275_2.png	41526
5864	images/properties/B1_P12_121275_3.png	41526
5865	images/properties/B1_P13A_121373_1.png	41527
5866	images/properties/B1_P13_020674_1.png	41527
5867	images/properties/B1_P14_011569_1.png	41528
5868	images/properties/B1_P14_011769_1.png	41528
5869	images/properties/B1_P14_100568_1.png	41528
5870	images/properties/B1_P15_011767_1.png	41529
5871	images/properties/B1_P15_091565_1.png	41529
5872	images/properties/B1_P15_091868_1.png	41529
5873	images/properties/B1_P16_011267_1.png	41530
5874	images/properties/B1_P16_072276_1.png	41530
5875	images/properties/B1_P16_072276_2.png	41530
5876	images/properties/B1_P16_091565_1.png	41530
5877	images/properties/B1_P17_011267_1.png	41531
5878	images/properties/B1_P17_091565_1.png	41531
5879	images/properties/B1_P17_091565_2.png	41531
5880	images/properties/B1_P17_100168_1.png	41531
5881	images/properties/B1_P18_011267_1.png	41532
5882	images/properties/B1_P18_091565_1.png	41532
5883	images/properties/B1_P18_100168_1.png	41532
5884	images/properties/B1_P19_091565_1.png	41533
5885	images/properties/B1_P19_091565_2.png	41533
5886	images/properties/B1_P19_100468_1.png	41533
5887	images/properties/B1_P20_011767_1.png	41534
5888	images/properties/B1_P20_091565_1.png	41534
5889	images/properties/B1_P20_110968_1.png	41534
5890	images/properties/B1_P21_091565_1.png	41535
5891	images/properties/B1_P21_091868_1.png	41535
5892	images/properties/B1_P21_091868_2.png	41535
5893	images/properties/B1_P22_011067_1.png	41536
5894	images/properties/B1_P22_020570_1.png	41536
5895	images/properties/B1_P22_020570_2.png	41536
5896	images/properties/B1_P22_091567_1.png	41536
5897	images/properties/B1_P22_100468_1.png	41536
5898	images/properties/B1_P22_101976_1.png	41536
5899	images/properties/B1_P22_101976_2.png	41536
5900	images/properties/B1_P24_091565_1.png	41537
5901	images/properties/B1_P24_101068_1.png	41537
5902	images/properties/B1_P24_101068_2.png	41537
5903	images/properties/B1_P25_091565_1.png	41538
5904	images/properties/B1_P25_101668_1.png	41538
5905	images/properties/B1_P27_051375_1.png	41539
5906	images/properties/B1_P27_051375_2.png	41539
5907	images/properties/B1_P28_072676_1.png	41540
5908	images/properties/B1_P28_072676_2.png	41540
5909	images/properties/B1_P28_091565_1.png	41540
5910	images/properties/B1_P28_091868_1.png	41540
5911	images/properties/B1_P29_011067_1.png	41541
5912	images/properties/B1_P29_091868_1.png	41541
5913	images/properties/B1_P29_092876_1.png	41541
5914	images/properties/B1_P2_073168_1.png	41542
5915	images/properties/B1_P2_091565_1.png	41542
5916	images/properties/B1_P2_110968_1.png	41542
5917	images/properties/B1_P30_071268_1.png	41543
5918	images/properties/B1_P30_091565_1.png	41543
5919	images/properties/B1_P31_010467_1.png	41544
5920	images/properties/B1_P31_100568_1.png	41544
5921	images/properties/B1_P32_010767_1.png	41545
5922	images/properties/B1_P32_061274_1.png	41545
5923	images/properties/B1_P32_091565_1.png	41545
5924	images/properties/B1_P32_091868_1.png	41545
5925	images/properties/B1_P33_091565_1.png	41546
5926	images/properties/B1_P33_101168_1.png	41546
5927	images/properties/B1_P34_100168_1.png	41547
5928	images/properties/B1_P35_091565_1.png	41548
5929	images/properties/B1_P35_091868_1.png	41548
5930	images/properties/B1_P36_070868_1.png	41549
5931	images/properties/B1_P36_091565_1.png	41549
5932	images/properties/B1_P37_091565_1.png	41550
5933	images/properties/B1_P37_091868_1.png	41550
5934	images/properties/B1_P38_020570_1.png	41551
5935	images/properties/B1_P38_070868_1.png	41551
5936	images/properties/B1_P38_091565_1.png	41551
5937	images/properties/B1_P39_091565_1.png	41552
5938	images/properties/B1_P39_101468_1.png	41552
5939	images/properties/B1_P3_071268_1.png	41553
5940	images/properties/B1_P3_091565_1.png	41553
5941	images/properties/B1_P3_091565_2.png	41553
5942	images/properties/B1_P3_091565_3.png	41553
5943	images/properties/B1_P3_110268_1.png	41553
5944	images/properties/B1_P40_091565_1.png	41554
5945	images/properties/B1_P40_091668_1.png	41554
5946	images/properties/B1_P41_091565_1.png	41555
5947	images/properties/B1_P41_091568_1.png	41555
5948	images/properties/B1_P41_102268_1.png	41555
5949	images/properties/B1_P42_081868_1.png	41556
5950	images/properties/B1_P43_091565_1.png	41557
5951	images/properties/B1_P43_091868_1.png	41557
5952	images/properties/B1_P44_012467_1.png	41558
5953	images/properties/B1_P45_091868_1.png	41559
5954	images/properties/B1_P46_070868_1.png	41560
5955	images/properties/B1_P46_091565_1.png	41560
5956	images/properties/B1_P46_091565_2.png	41560
5957	images/properties/B1_P46_091565_3.png	41560
5958	images/properties/B1_P47_091565_1.png	41561
5959	images/properties/B1_P47_091565_2.png	41561
5960	images/properties/B1_P47_102268_1.png	41561
5961	images/properties/B1_P48_050175_1.png	41562
5962	images/properties/B1_P48_050175_2.png	41562
5963	images/properties/B1_P48_050175_3.png	41562
5964	images/properties/B1_P48_070868_1.png	41562
5965	images/properties/B1_P48_070868_2.png	41562
5966	images/properties/B1_P48_081574_1.png	41562
5967	images/properties/B1_P48_091565_1.png	41562
5968	images/properties/B1_P48_101968_1.png	41562
5969	images/properties/B1_P49_091565_1.png	41563
5970	images/properties/B1_P49_102268_1.png	41563
5971	images/properties/B1_P4_071568_1.png	41564
5972	images/properties/B1_P4_091565_1.png	41564
5973	images/properties/B1_P4_091565_2.png	41564
5974	images/properties/B1_P4_091565_3.png	41564
5975	images/properties/B1_P4_110268_1.png	41564
5976	images/properties/B1_P4_110268_2.png	41564
5977	images/properties/B1_P50_091565_1.png	41565
5978	images/properties/B1_P50_091565_2.png	41565
5979	images/properties/B1_P50_102268_1.png	41565
5980	images/properties/B1_P51_091565_1.png	41566
5981	images/properties/B1_P51_102268_1.png	41566
5982	images/properties/B1_P5_071668_1.png	41567
5983	images/properties/B1_P5_102268_1.png	41567
5984	images/properties/B1_P6_030474_1.png	41568
5985	images/properties/B1_P6_030474_2.png	41568
5986	images/properties/B1_P6_041474_1.png	41568
5987	images/properties/B1_P7_042374_1.png	41569
5988	images/properties/B1_P7_042374_2.png	41569
5989	images/properties/B1_P7_080574_1.png	41569
5990	images/properties/B1_P8_072568_1.png	41570
5991	images/properties/B1_P8_091565_1.png	41570
5992	images/properties/B1_P9_100168_1.png	41571
5993	images/properties/B20_P1_040776_1.png	41572
5994	images/properties/B20_P1_040776_2.png	41572
5995	images/properties/B20_P1_040776_3.png	41572
5996	images/properties/B20_P1_072475_1.png	41572
5997	images/properties/B20_P1_072475_10.png	41572
5998	images/properties/B20_P1_072475_11.png	41572
5999	images/properties/B20_P1_072475_12.png	41572
6000	images/properties/B20_P1_072475_13.png	41572
6001	images/properties/B20_P1_072475_2.png	41572
6002	images/properties/B20_P1_072475_3.png	41572
6003	images/properties/B20_P1_072475_4.png	41572
6004	images/properties/B20_P1_072475_5.png	41572
6005	images/properties/B20_P1_072475_6.png	41572
6006	images/properties/B20_P1_072475_7.png	41572
6007	images/properties/B20_P1_072475_8.png	41572
6008	images/properties/B20_P1_072475_9.png	41572
6009	images/properties/B20_P24_041674_1.png	41573
6010	images/properties/B20_P24_041674_2.png	41573
6011	images/properties/B20_P24_061274_1.png	41573
6012	images/properties/B20_P2_051669_1.png	41574
6013	images/properties/B20_P2_060269_1.png	41574
6014	images/properties/B20_P6_080168_1.png	41575
6015	images/properties/B20_P6_091565_1.png	41575
6016	images/properties/B20_P7_080168_1.png	41576
6017	images/properties/B20_P7_080168_2.png	41576
6018	images/properties/B20_P7_091565_1.png	41576
6019	images/properties/B21_P13_041268_1.png	41577
6020	images/properties/B21_P13_041268_2.png	41577
6021	images/properties/B21_P13_041268_3.png	41577
6022	images/properties/B21_P13_041268_4.png	41577
6023	images/properties/B21_P13_050568_1.png	41577
6024	images/properties/B21_P14_072568_1.png	41578
6025	images/properties/B21_P14_091565_1.png	41578
6026	images/properties/B21_P6_020270_1.png	41579
6027	images/properties/B25_P10_060168_1.png	41580
6028	images/properties/B25_P10_091565_1.png	41580
6029	images/properties/B25_P1_052968_1.png	41581
6030	images/properties/B25_P1_091565_1.png	41581
6031	images/properties/B25_P2_072568_1.png	41582
6032	images/properties/B25_P2_091565_1.png	41582
6033	images/properties/B25_P3_020674_1.png	41583
6034	images/properties/B25_P3_080373_1.png	41583
6035	images/properties/B25_P3_080373_2.png	41583
6036	images/properties/B25_P3_080373_3.png	41583
6037	images/properties/B25_P3_091565_1.png	41583
6038	images/properties/B25_P4_053068_1.png	41584
6039	images/properties/B25_P4_091565_1.png	41584
6040	images/properties/B25_P4_120768_1.png	41584
6041	images/properties/B25_P4_120768_2.png	41584
6042	images/properties/B25_P5_091565_1.png	41585
6043	images/properties/B25_P6_021467_1.png	41586
6044	images/properties/B25_P6_060168_1.png	41586
6045	images/properties/B25_P7_021976_1.png	41587
6046	images/properties/B25_P7_022576_1.png	41587
6047	images/properties/B25_P7_060168_1.png	41587
6048	images/properties/B25_P7_101066_1.png	41587
6049	images/properties/B25_P8_021467_1.png	41588
6050	images/properties/B25_P8_060168_1.png	41588
6051	images/properties/B25_P9_060168_1.png	41589
6052	images/properties/B25_P9_091565_1.png	41589
6053	images/properties/B26_P1_022367_1.png	41590
6054	images/properties/B26_P1_022367_2.png	41590
6055	images/properties/B26_P1_091565_1.png	41590
6056	images/properties/B26_P1_091565_2.png	41590
6057	images/properties/B26_P2_022567_1.png	41591
6058	images/properties/B26_P2_091565_1.png	41591
6059	images/properties/B26_P3_052968_1.png	41592
6060	images/properties/B26_P3_101866_1.png	41592
6061	images/properties/B26_P3_101866_2.png	41592
6062	images/properties/B26_P4_052968_1.png	41593
6063	images/properties/B26_P4_100866_1.png	41593
6064	images/properties/B26_P5_061175_1.png	41594
6065	images/properties/B26_P5_061175_2.png	41594
6066	images/properties/B26_P5_061175_3.png	41594
6067	images/properties/B26_P5_061175_4.png	41594
6068	images/properties/B26_P5_061175_5.png	41594
6069	images/properties/B26_P5_100866_1.png	41594
6070	images/properties/B26_P6_021567_1.png	41595
6071	images/properties/B26_P6_091565_1.png	41595
6072	images/properties/B26_P7_021767_1.png	41596
6073	images/properties/B26_P7_053068_1.png	41596
6074	images/properties/B26_P8_021667_1.png	41597
6075	images/properties/B26_P8_052968_1.png	41597
6076	images/properties/B27_P10_062066_1.png	41598
6077	images/properties/B27_P10_101166_1.png	41598
6078	images/properties/B27_P10_101166_2.png	41598
6079	images/properties/B27_P11_062978_1.png	41599
6080	images/properties/B27_P11_062978_2.png	41599
6081	images/properties/B27_P11_062978_3.png	41599
6082	images/properties/B27_P11_062978_4.png	41599
6083	images/properties/B27_P11_062978_5.png	41599
6084	images/properties/B27_P11_062978_6.png	41599
6085	images/properties/B27_P11_062978_7.png	41599
6086	images/properties/B27_P11_101877_1.png	41599
6087	images/properties/B27_P11_101877_2.png	41599
6088	images/properties/B27_P11_101877_3.png	41599
6089	images/properties/B27_P11_101877_4.png	41599
6090	images/properties/B27_P11_101877_5.png	41599
6091	images/properties/B27_P11_101877_6.png	41599
6092	images/properties/B27_P12_022167_1.png	41600
6093	images/properties/B27_P12_040974_1.png	41600
6094	images/properties/B27_P12_040974_2.png	41600
6095	images/properties/B27_P12_061274_1.png	41600
6096	images/properties/B27_P12_061274_2.png	41600
6097	images/properties/B27_P12_091565_1.png	41600
6098	images/properties/B27_P12_101868_1.png	41600
6099	images/properties/B27_P12_101868_2.png	41600
6100	images/properties/B27_P13_030667_1.png	41601
6101	images/properties/B27_P13_091565_1.png	41601
6102	images/properties/B27_P14_062968_1.png	41602
6103	images/properties/B27_P14_091565_1.png	41602
6104	images/properties/B27_P15_091565_1.png	41603
6105	images/properties/B27_P15_092668_1.png	41603
6106	images/properties/B27_P16_062068_1.png	41604
6107	images/properties/B27_P16_091565_1.png	41604
6108	images/properties/B27_P17_062968_1.png	41605
6109	images/properties/B27_P17_091565_1.png	41605
6110	images/properties/B27_P18_070668_1.png	41606
6111	images/properties/B27_P18_091565_1.png	41606
6112	images/properties/B27_P19_062968_1.png	41607
6113	images/properties/B27_P1_061068_1.png	41608
6114	images/properties/B27_P1_061576_1.png	41608
6115	images/properties/B27_P1_061576_2.png	41608
6116	images/properties/B27_P1_061576_3.png	41608
6117	images/properties/B27_P1_062066_1.png	41608
6118	images/properties/B27_P1_101266_1.png	41608
6119	images/properties/B27_P20_062768_1.png	41609
6120	images/properties/B27_P20_091565_1.png	41609
6121	images/properties/B27_P21_062268_1.png	41610
6122	images/properties/B27_P21_062268_2.png	41610
6123	images/properties/B27_P21_101066_1.png	41610
6124	images/properties/B27_P22_091565_1.png	41611
6125	images/properties/B27_P22_101066_1.png	41611
6126	images/properties/B27_P23_021867_1.png	41612
6127	images/properties/B27_P23_021867_2.png	41612
6128	images/properties/B27_P23_062768_1.png	41612
6129	images/properties/B27_P24A&P24B_022167_1.png	41613
6130	images/properties/B27_P24A&P24B_062968_1.png	41613
6131	images/properties/B27_P24A&P24B_080368_1.png	41613
6132	images/properties/B27_P24A&P24B_080368_2.png	41613
6133	images/properties/B27_P24A&P24B_091565_1.png	41613
6134	images/properties/B27_P24A&P24B_091565_2.png	41613
6135	images/properties/B27_P25_062468_1.png	41614
6136	images/properties/B27_P25_091565_1.png	41614
6137	images/properties/B27_P26_062468_1.png	41615
6138	images/properties/B27_P26_091565_1.png	41615
6139	images/properties/B27_P27_020267_1.png	41616
6140	images/properties/B27_P27_020267_2.png	41616
6141	images/properties/B27_P27_020267_3.png	41616
6142	images/properties/B27_P27_062468_1.png	41616
6143	images/properties/B27_P27_091565_1.png	41616
6144	images/properties/B27_P28_080368_1.png	41617
6145	images/properties/B27_P28_091565_1.png	41617
6146	images/properties/B27_P29_062968_1.png	41618
6147	images/properties/B27_P29_091565_1.png	41618
6148	images/properties/B27_P2_021976_1.png	41619
6149	images/properties/B27_P2_021976_2.png	41619
6150	images/properties/B27_P2_022576_1.png	41619
6151	images/properties/B27_P2_061068_1.png	41619
6152	images/properties/B27_P2_062066_1.png	41619
6153	images/properties/B27_P2_101166_1.png	41619
6154	images/properties/B27_P3_061068_1.png	41620
6155	images/properties/B27_P3_062066_1.png	41620
6156	images/properties/B27_P4_061068_1.png	41621
6157	images/properties/B27_P4_062066_1.png	41621
6158	images/properties/B27_P5_061068_1.png	41622
6159	images/properties/B27_P5_062066_1.png	41622
6160	images/properties/B27_P6_021867_1.png	41623
6161	images/properties/B27_P6_061568_1.png	41623
6162	images/properties/B27_P6_061568_2.png	41623
6163	images/properties/B27_P6_091565_1.png	41623
6164	images/properties/B27_P6_091565_2.png	41623
6165	images/properties/B27_P7_021567_1.png	41624
6166	images/properties/B27_P7_091565_1.png	41624
6167	images/properties/B27_P8_061568_1.png	41625
6168	images/properties/B27_P8_091565_1.png	41625
6169	images/properties/B28_P10_042368_1.png	41626
6170	images/properties/B28_P10_091565_1.png	41626
6171	images/properties/B28_P11_071868_1.png	41627
6172	images/properties/B28_P11_071868_2.png	41627
6173	images/properties/B28_P11_072968_1.png	41627
6174	images/properties/B28_P11_091565_1.png	41627
6175	images/properties/B28_P12_072068_1.png	41628
6176	images/properties/B28_P12_072068_2.png	41628
6177	images/properties/B28_P12_072068_3.png	41628
6178	images/properties/B28_P12_091565_1.png	41628
6179	images/properties/B28_P13_072568_1.png	41629
6180	images/properties/B28_P13_072568_2.png	41629
6181	images/properties/B28_P13_072568_3.png	41629
6182	images/properties/B28_P13_072968_1.png	41629
6183	images/properties/B28_P13_072968_2.png	41629
6184	images/properties/B28_P13_091565_1.png	41629
6185	images/properties/B28_P14_072068_1.png	41630
6186	images/properties/B28_P14_091565_1.png	41630
6187	images/properties/B28_P14_121666_1.png	41630
6188	images/properties/B28_P14_121666_2.png	41630
6189	images/properties/B28_P15_081470_1.png	41631
6190	images/properties/B28_P15_081770_1.png	41631
6191	images/properties/B28_P16_090469_1.png	41632
6192	images/properties/B28_P18_070668_1.png	41633
6193	images/properties/B28_P18_091565_1.png	41633
6194	images/properties/B28_P19_070568_1.png	41634
6195	images/properties/B28_P19_091565_1.png	41634
6196	images/properties/B28_P1_122972_1.png	41635
6197	images/properties/B28_P1_122972_2.png	41635
6198	images/properties/B28_P1_122972_3.png	41635
6199	images/properties/B28_P1_122972_4.png	41635
6200	images/properties/B28_P1_122972_5.png	41635
6201	images/properties/B28_P20_091565_1.png	41636
6202	images/properties/B28_P20_121466_1.png	41636
6203	images/properties/B28_P21_070668_1.png	41637
6204	images/properties/B28_P21_091565_1.png	41637
6205	images/properties/B28_P22_071168_1.png	41638
6206	images/properties/B28_P22_091565_1.png	41638
6207	images/properties/B28_P23_052368_1.png	41639
6208	images/properties/B28_P23_091565_1.png	41639
6209	images/properties/B28_P3A_012174_1.png	41640
6210	images/properties/B28_P3A_012174_2.png	41640
6211	images/properties/B28_P3A_020674_1.png	41640
6212	images/properties/B28_P4_011874_1.png	41641
6213	images/properties/B28_P4_020674_1.png	41641
6214	images/properties/B28_P5_012174_1.png	41642
6215	images/properties/B28_P5_012174_2.png	41642
6216	images/properties/B28_P5_020674_1.png	41642
6217	images/properties/B28_P6_011974_1.png	41643
6218	images/properties/B28_P6_011974_2.png	41643
6219	images/properties/B28_P6_020674_1.png	41643
6220	images/properties/B28_P7A_070668_1.png	41644
6221	images/properties/B28_P7A_091565_2.png	41644
6222	images/properties/B28_P7B_071368_1.png	41644
6223	images/properties/B28_P7B_091565_1.png	41644
6224	images/properties/B28_P7B_121266_1.png	41644
6225	images/properties/B28_P8_052368_1.png	41645
6226	images/properties/B28_P8_111566_1.png	41645
6227	images/properties/B28_P9_052368_1.png	41646
6228	images/properties/B28_P9_091565_1.png	41646
6229	images/properties/B29_P12_011674_1.png	41647
6230	images/properties/B29_P12_020674_1.png	41647
6231	images/properties/B29_P1_011874_1.png	41648
6232	images/properties/B29_P1_011874_2.png	41648
6233	images/properties/B29_P1_020674_1.png	41648
6234	images/properties/B29_P3_020674_1.png	41649
6235	images/properties/B29_P3_020674_2.png	41649
6236	images/properties/B29_P7_030874_1.png	41650
6237	images/properties/B29_P7_041474_1.png	41650
6238	images/properties/B2_P1_020674_1.png	41651
6239	images/properties/B2_P1_022476_1.png	41651
6240	images/properties/B2_P1_022476_2.png	41651
6241	images/properties/B2_P1_041774_1.png	41651
6242	images/properties/B2_P1_041774_2.png	41651
6243	images/properties/B2_P1_121273_1.png	41651
6244	images/properties/B2_P1_121273_2.png	41651
6245	images/properties/B2_P2_020674_1.png	41652
6246	images/properties/B2_P2_022476_1.png	41652
6247	images/properties/B2_P2_022476_2.png	41652
6248	images/properties/B2_P2_022476_3.png	41652
6249	images/properties/B2_P2_022476_4.png	41652
6250	images/properties/B2_P2_022476_5.png	41652
6251	images/properties/B2_P2_022476_6.png	41652
6252	images/properties/B2_P2_041774_1.png	41652
6253	images/properties/B2_P2_041774_2.png	41652
6254	images/properties/B2_P2_041774_3.png	41652
6255	images/properties/B2_P2_121273_1.png	41652
6256	images/properties/B2_P2_121273_2.png	41652
6257	images/properties/B2_P2_121273_3.png	41652
6258	images/properties/B2_P2_121273_4.png	41652
6259	images/properties/B2_P2_121273_5.png	41652
6260	images/properties/B2_P2_121273_6.png	41652
6261	images/properties/B30_P27_030467_1.png	41653
6262	images/properties/B30_P27_030467_2.png	41653
6263	images/properties/B31_P23_050268_1.png	41654
6264	images/properties/B32_P14_073168_1.png	41655
6265	images/properties/B32_P14_073168_2.png	41655
6266	images/properties/B32_P14_073168_3.png	41655
6267	images/properties/B32_P14_073168_4.png	41655
6268	images/properties/B33_P10_022774_1.png	41656
6269	images/properties/B33_P10_022774_2.png	41656
6270	images/properties/B33_P10_022774_3.png	41656
6271	images/properties/B33_P10_041474_1.png	41656
6272	images/properties/B33_P10_041474_2.png	41656
6273	images/properties/B33_P11_082868_1.png	41657
6274	images/properties/B33_P11_091565_1.png	41657
6275	images/properties/B33_P1_080568_1.png	41658
6276	images/properties/B33_P1_112268_1.png	41658
6277	images/properties/B33_P1_112268_2.png	41658
6278	images/properties/B33_P1_112268_3.png	41658
6279	images/properties/B33_P5_061274_1.png	41659
6280	images/properties/B33_P7_022467_1.png	41660
6281	images/properties/B34_P10_091565_1.png	41661
6282	images/properties/B34_P10_111468_1.png	41661
6283	images/properties/B34_P11_091565_1.png	41662
6284	images/properties/B34_P11_111468_1.png	41662
6285	images/properties/B34_P12_022467_1.png	41663
6286	images/properties/B34_P12_091565_1.png	41663
6287	images/properties/B34_P13_052368_1.png	41664
6288	images/properties/B34_P13_112268_1.png	41664
6289	images/properties/B34_P14_030267_1.png	41665
6290	images/properties/B34_P14_091565_1.png	41665
6291	images/properties/B34_P15_061768_1.png	41666
6292	images/properties/B34_P15_091565_1.png	41666
6293	images/properties/B34_P16_022467_1.png	41667
6294	images/properties/B34_P16_050175_1.png	41667
6295	images/properties/B34_P16_050175_2.png	41667
6296	images/properties/B34_P16_052075_1.png	41667
6297	images/properties/B34_P16_091565_1.png	41667
6298	images/properties/B34_P16_111468_1.png	41667
6299	images/properties/B34_P17_022467_1.png	41668
6300	images/properties/B34_P17_091565_1.png	41668
6301	images/properties/B34_P17_111568_1.png	41668
6302	images/properties/B34_P17_111568_2.png	41668
6303	images/properties/B34_P18_060368_1.png	41669
6304	images/properties/B34_P18_091565_1.png	41669
6305	images/properties/B34_P1_061968_1.png	41670
6306	images/properties/B34_P1_091565_1.png	41670
6307	images/properties/B34_P1_091565_2.png	41670
6308	images/properties/B34_P1_091565_3.png	41670
6309	images/properties/B34_P1_112168_1.png	41670
6310	images/properties/B34_P2_051068_1.png	41671
6311	images/properties/B34_P2_051068_2.png	41671
6312	images/properties/B34_P2_091565_1.png	41671
6313	images/properties/B34_P2_091565_2.png	41671
6314	images/properties/B34_P2_112168_1.png	41671
6315	images/properties/B34_P3_040568_1.png	41672
6316	images/properties/B34_P3_091565_1.png	41672
6317	images/properties/B34_P4_022467_1.png	41673
6318	images/properties/B34_P4_091565_1.png	41673
6319	images/properties/B34_P5_030267_1.png	41674
6320	images/properties/B34_P5_041974_1.png	41674
6321	images/properties/B34_P5_043068_1.png	41674
6322	images/properties/B34_P5_091565_1.png	41674
6323	images/properties/B34_P5_091674_1.png	41674
6324	images/properties/B34_P5_112168_1.png	41674
6325	images/properties/B34_P6_091565_1.png	41675
6326	images/properties/B34_P7_043068_1.png	41676
6327	images/properties/B34_P7_043068_2.png	41676
6328	images/properties/B34_P7_091565_1.png	41676
6329	images/properties/B34_P7_091565_2.png	41676
6330	images/properties/B34_P7_091565_3.png	41676
6331	images/properties/B34_P7_112268_1.png	41676
6332	images/properties/B34_P7_112268_2.png	41676
6333	images/properties/B34_P7_112973_1.png	41676
6334	images/properties/B34_P7_112973_2.png	41676
6335	images/properties/B34_P7_112973_3.png	41676
6336	images/properties/B34_P8_030372_1.png	41677
6337	images/properties/B34_P8_030372_2.png	41677
6338	images/properties/B34_P8_030372_3.png	41677
6339	images/properties/B34_P8_030372_4.png	41677
6340	images/properties/B34_P8_041968_1.png	41677
6341	images/properties/B34_P8_041968_2.png	41677
6342	images/properties/B34_P8_091565_1.png	41677
6343	images/properties/B34_P8_091565_2.png	41677
6344	images/properties/B34_P8_091565_3.png	41677
6345	images/properties/B34_P8_091565_4.png	41677
6346	images/properties/B34_P8_091565_5.png	41677
6347	images/properties/B34_P8_091565_6.png	41677
6348	images/properties/B34_P8_121268_1.png	41677
6349	images/properties/B34_P9_022467_1.png	41678
6350	images/properties/B34_P9_091565_1.png	41678
6351	images/properties/B35_P1_022770_1.png	41679
6352	images/properties/B35_P1_022770_2.png	41679
6353	images/properties/B35_P1_022770_3.png	41679
6354	images/properties/B35_P1_022770_4.png	41679
6355	images/properties/B35_P1_022770_5.png	41679
6356	images/properties/B35_P1_070168_1.png	41679
6357	images/properties/B35_P1_070168_2.png	41679
6358	images/properties/B35_P1_070168_3.png	41679
6359	images/properties/B35_P1_091565_1.png	41679
6360	images/properties/B35_P1_091565_2.png	41679
6361	images/properties/B35_P1_091565_3.png	41679
6362	images/properties/B35_P1_091565_4.png	41679
6363	images/properties/B35_P1_091565_5.png	41679
6364	images/properties/B35_P1_091565_6.png	41679
6365	images/properties/B35_P1_092868_1.png	41679
6366	images/properties/B35_P1_092868_2.png	41679
6367	images/properties/B35_P1_092868_3.png	41679
6368	images/properties/B35_P2_022767_1.png	41680
6369	images/properties/B35_P2_080568_1.png	41680
6370	images/properties/B35_P2_091565_1.png	41680
6371	images/properties/B35_P3_073068_1.png	41681
6372	images/properties/B35_P3_091565_1.png	41681
6373	images/properties/B35_P4_091565_1.png	41682
6374	images/properties/B35_P7_091565_1.png	41683
6375	images/properties/B35_P8_030267_1.png	41684
6376	images/properties/B35_P8_073068_1.png	41684
6377	images/properties/B36_P3A_041474_1.png	41685
6378	images/properties/B36_P3A_041474_2.png	41685
6379	images/properties/B36_P3A_041474_3.png	41685
6380	images/properties/B36_P3B_041474_1.png	41685
6381	images/properties/B36_P3B_041474_2.png	41685
6382	images/properties/B36_P3B_041474_3.png	41685
6383	images/properties/B36_P3B_121175_1.png	41685
6384	images/properties/B36_P3B_121175_2.png	41685
6385	images/properties/B36_P3B_121175_3.png	41685
6386	images/properties/B36_P3B_121175_4.png	41685
6387	images/properties/B36_P3B_121175_5.png	41685
6388	images/properties/B36_P3B_121175_6.png	41685
6389	images/properties/B36_P4_031275_1.png	41686
6390	images/properties/B36_P4_042975_1.png	41686
6391	images/properties/B36_P4_042975_2.png	41686
6392	images/properties/B36_P4_081274_1.png	41686
6393	images/properties/B36_P4_081274_2.png	41686
6394	images/properties/B36_P4_081274_3.png	41686
6395	images/properties/B36_P6_021467_1.png	41687
6396	images/properties/B36_P6_091565_1.png	41687
6397	images/properties/B36_P7_021467_1.png	41688
6398	images/properties/B36_P7_091565_1.png	41688
6399	images/properties/B36_P8_072068_1.png	41689
6400	images/properties/B36_P8_091565_1.png	41689
6401	images/properties/B37_P10_091565_1.png	41690
6402	images/properties/B37_P10_091565_2.png	41690
6403	images/properties/B37_P11_052568_1.png	41691
6404	images/properties/B37_P11_052568_2.png	41691
6405	images/properties/B37_P11_091565_1.png	41691
6406	images/properties/B37_P2_061868_1.png	41692
6407	images/properties/B37_P3A_082668_1.png	41693
6408	images/properties/B37_P3A_082668_2.png	41693
6409	images/properties/B37_P3A_082668_3.png	41693
6410	images/properties/B37_P3A_082668_4.png	41693
6411	images/properties/B37_P3A_082668_5.png	41693
6412	images/properties/B37_P3B_042068_1.png	41693
6413	images/properties/B37_P3B_042068_2.png	41693
6414	images/properties/B37_P3B_042068_3.png	41693
6415	images/properties/B37_P3B_042068_4.png	41693
6416	images/properties/B37_P3B_061269_1.png	41693
6417	images/properties/B37_P3B_091565_1.png	41693
6418	images/properties/B37_P3B_091565_2.png	41693
6419	images/properties/B37_P3B_091565_3.png	41693
6420	images/properties/B37_P3B_091565_4.png	41693
6421	images/properties/B37_P3B_091565_5.png	41693
6422	images/properties/B37_P3B_091565_6.png	41693
6423	images/properties/B37_P3B_091565_7.png	41693
6424	images/properties/B37_P4_022767_1.png	41694
6425	images/properties/B37_P4_091565_1.png	41694
6426	images/properties/B37_P5_030467_1.png	41695
6427	images/properties/B37_P5_041768_1.png	41695
6428	images/properties/B37_P5_091565_1.png	41695
6429	images/properties/B37_P6_091565_1.png	41696
6430	images/properties/B37_P7_041268_1.png	41697
6431	images/properties/B37_P7_091565_1.png	41697
6432	images/properties/B37_P8_041868_1.png	41698
6433	images/properties/B37_P8_091565_1.png	41698
6434	images/properties/B37_P9_052768_1.png	41699
6435	images/properties/B37_P9_091565_1.png	41699
6436	images/properties/B38_P13_031275_1.png	41700
6437	images/properties/B38_P13_031275_2.png	41700
6438	images/properties/B38_P13_080174_1.png	41700
6439	images/properties/B38_P15_030775_1.png	41701
6440	images/properties/B38_P15_030775_2.png	41701
6441	images/properties/B38_P15_072974_1.png	41701
6442	images/properties/B38_P16_072474_1.png	41702
6443	images/properties/B38_P16_072974_1.png	41702
6444	images/properties/B38_P16_072974_2.png	41702
6445	images/properties/B38_P17_022774_1.png	41703
6446	images/properties/B38_P17_041474_1.png	41703
6447	images/properties/B38_P6_090469_1.png	41704
6448	images/properties/B38_P6_090669_1.png	41704
6449	images/properties/B39_P10_031076_1.png	41705
6450	images/properties/B39_P10_031076_2.png	41705
6451	images/properties/B39_P11_031975_1.png	41706
6452	images/properties/B39_P11_031975_2.png	41706
6453	images/properties/B39_P11_042474_1.png	41706
6454	images/properties/B39_P11_042474_2.png	41706
6455	images/properties/B39_P11_042474_3.png	41706
6456	images/properties/B39_P15A_080174_1.png	41707
6457	images/properties/B39_P15A_092474_1.png	41707
6458	images/properties/B39_P15B_080674_1.png	41707
6459	images/properties/B39_P15B_100874_1.png	41707
6460	images/properties/B39_P16_010269_1.png	41708
6461	images/properties/B39_P16_010770_1.png	41708
6462	images/properties/B39_P17_092474_1.png	41709
6463	images/properties/B39_P17_092474_2.png	41709
6464	images/properties/B39_P17_100174_1.png	41709
6465	images/properties/B39_P17_100174_2.png	41709
6466	images/properties/B39_P17_100174_3.png	41709
6467	images/properties/B3_P11_091168_1.png	41710
6468	images/properties/B3_P11_091565_1.png	41710
6469	images/properties/B3_P13_062066_1.png	41711
6470	images/properties/B3_P13_071668_1.png	41711
6471	images/properties/B3_P14_010767_1.png	41712
6472	images/properties/B3_P15_010767_1.png	41713
6473	images/properties/B3_P15_061674_1.png	41713
6474	images/properties/B3_P15_091168_1.png	41713
6475	images/properties/B3_P15_091168_2.png	41713
6476	images/properties/B3_P15_091565_1.png	41713
6477	images/properties/B3_P16_081168_1.png	41714
6478	images/properties/B3_P16_091565_1.png	41714
6479	images/properties/B3_P17_071668_1.png	41715
6480	images/properties/B3_P17_091468_1.png	41715
6481	images/properties/B3_P18_091565_1.png	41716
6482	images/properties/B3_P18_091668_1.png	41716
6483	images/properties/B3_P19_071568_1.png	41717
6484	images/properties/B3_P19_091565_1.png	41717
6485	images/properties/B3_P1_011467_1.png	1
6486	images/properties/B3_P1_080668_1.png	1
6487	images/properties/B3_P1_080668_2.png	1
6488	images/properties/B3_P1_091565_1.png	1
6489	images/properties/B3_P1_091565_2.png	1
6490	images/properties/B3_P20_091368_1.PNG	41718
6491	images/properties/B3_P20_091565_1.png	41718
6492	images/properties/B3_P21_091468_1.png	41719
6493	images/properties/B3_P21_091565_1.png	41719
6494	images/properties/B3_P22_011167_1.png	41720
6495	images/properties/B3_P22_091868_1.png	41720
6496	images/properties/B3_P23_071568_1.png	41721
6497	images/properties/B3_P23_091468_1.png	41721
6498	images/properties/B3_P24_083168_1.png	41722
6499	images/properties/B3_P24_083168_2.png	41722
6500	images/properties/B3_P24_091565_1.png	41722
6501	images/properties/B3_P25_011367_1.png	41723
6502	images/properties/B3_P25_091565_1.png	41723
6503	images/properties/B3_P2_061868_1.png	41724
6504	images/properties/B3_P2_061868_2.png	41724
6505	images/properties/B3_P2_090668_1.png	41724
6506	images/properties/B3_P2_091565_1.png	41724
6507	images/properties/B3_P2_091565_2.png	41724
6508	images/properties/B3_P2_091565_3.png	41724
6509	images/properties/B3_P2_102175_1.png	41724
6510	images/properties/B3_P2_102175_2.png	41724
6511	images/properties/B3_P2_102175_3.png	41724
6512	images/properties/B3_P2_102175_4.png	41724
6513	images/properties/B3_P2_102175_5.png	41724
6514	images/properties/B3_P2_102175_6.png	41724
6515	images/properties/B3_P2_102375_1.png	41724
6516	images/properties/B3_P2_102375_2.png	41724
6517	images/properties/B3_P2_102375_3.png	41724
6518	images/properties/B3_P2_102375_4.png	41724
6519	images/properties/B3_P2_102375_5.png	41724
6520	images/properties/B3_P3_053168_1.png	41725
6521	images/properties/B3_P3_090668_1.png	41725
6522	images/properties/B3_P3_091565_1.png	41725
6523	images/properties/B3_P3_102175_1.png	41725
6524	images/properties/B3_P3_102175_2.png	41725
6525	images/properties/B3_P3_102175_3.png	41725
6526	images/properties/B3_P3_102375_1.png	41725
6527	images/properties/B3_P3_102375_2.png	41725
6528	images/properties/B3_P4_090768_1.png	41726
6529	images/properties/B3_P4_091565_1.png	41726
6530	images/properties/B3_P5_090668_1.png	41727
6531	images/properties/B3_P5_091565_1.png	41727
6532	images/properties/B3_P6_090768_1.png	41728
6533	images/properties/B3_P6_091565_1.png	41728
6534	images/properties/B3_P7_011267_1.png	41729
6535	images/properties/B3_P7_091565_1.png	41729
6536	images/properties/B3_P8_011067_1.png	41730
6537	images/properties/B3_P8_020570_1.png	41730
6538	images/properties/B3_P8_020570_2.png	41730
6539	images/properties/B3_P8_020570_3.PNG	41730
6540	images/properties/B3_P8_091565_1.png	41730
6541	images/properties/B3_P9_090768_1.png	41731
6542	images/properties/B3_P9_091565_1.png	41731
6543	images/properties/B40_P10_082068_1.png	41732
6544	images/properties/B40_P10_082068_2.png	41732
6545	images/properties/B40_P10_091565_1.png	41732
6546	images/properties/B40_P10_091565_2.png	41732
6547	images/properties/B40_P11_050968_1.png	41733
6548	images/properties/B40_P11_091565_1.png	41733
6549	images/properties/B40_P12_042474_1.png	41734
6550	images/properties/B40_P12_042474_2.png	41734
6551	images/properties/B40_P12_050868_1.png	41734
6552	images/properties/B40_P12_070368_1.png	41734
6553	images/properties/B40_P12_070368_2.png	41734
6554	images/properties/B40_P12_070368_3.png	41734
6555	images/properties/B40_P12_070368_4.png	41734
6556	images/properties/B40_P12_091565_1.png	41734
6557	images/properties/B40_P13_050968_1.png	41735
6558	images/properties/B40_P13_071568_1.png	41735
6559	images/properties/B40_P14_030674_1.png	41736
6560	images/properties/B40_P14_030674_2.png	41736
6561	images/properties/B40_P14_041474_1.png	41736
6562	images/properties/B40_P15_051658_1.png	41737
6563	images/properties/B40_P15_051658_2.png	41737
6564	images/properties/B40_P15_080768_1.png	41737
6565	images/properties/B40_P15_091565_1.png	41737
6566	images/properties/B40_P16_072474_1.png	41738
6567	images/properties/B40_P16_073074_1.png	41738
6568	images/properties/B40_P16_073074_2.png	41738
6569	images/properties/B40_P17_122972_1.png	41739
6570	images/properties/B40_P17_122972_2.png	41739
6571	images/properties/B40_P17_122972_3.png	41739
6572	images/properties/B40_P17_122972_4.png	41739
6573	images/properties/B40_P18_030675_1.png	41740
6574	images/properties/B40_P18_030675_2.png	41740
6575	images/properties/B40_P18_030675_3.png	41740
6576	images/properties/B40_P18_030675_4.png	41740
6577	images/properties/B40_P18_030675_5.png	41740
6578	images/properties/B40_P18_071476_1.png	41740
6579	images/properties/B40_P18_071476_2.png	41740
6580	images/properties/B40_P18_071476_3.png	41740
6581	images/properties/B40_P18_071476_4.png	41740
6582	images/properties/B40_P18_071476_5.png	41740
6583	images/properties/B40_P18_071476_6.png	41740
6584	images/properties/B40_P18_071476_7.png	41740
6585	images/properties/B40_P18_071476_8.png	41740
6586	images/properties/B40_P18_071476_9.png	41740
6587	images/properties/B40_P18_073074_1.png	41740
6588	images/properties/B40_P18_073074_2.png	41740
6589	images/properties/B40_P18_073074_3.png	41740
6590	images/properties/B40_P19_010875_1.png	41741
6591	images/properties/B40_P19_022475_1.png	41741
6592	images/properties/B40_P20_030375_1.png	41742
6593	images/properties/B40_P20_030375_2.png	41742
6594	images/properties/B40_P20_073074_1.png	41742
6595	images/properties/B40_P21_111874_1.png	41743
6596	images/properties/B40_P21_112074_1.png	41743
6597	images/properties/B40_P21_112074_2.png	41743
6598	images/properties/B40_P22_111474_1.png	41744
6599	images/properties/B40_P22_111474_2.png	41744
6600	images/properties/B40_P22_121174_1.png	41744
6601	images/properties/B40_P22_121274_1.png	41744
6602	images/properties/B40_P23_121874_1.png	41745
6603	images/properties/B40_P23_121874_2.png	41745
6604	images/properties/B40_P24_062066_1.png	41746
6605	images/properties/B40_P24_080768_1.png	41746
6606	images/properties/B40_P25_020570_1.png	41747
6607	images/properties/B40_P25_062066_1.png	41747
6608	images/properties/B40_P25_080768_1.png	41747
6609	images/properties/B40_P25_121175_1.png	41747
6610	images/properties/B40_P25_121175_2.png	41747
6611	images/properties/B40_P25_121175_3.png	41747
6612	images/properties/B40_P26_120975_1.png	41748
6613	images/properties/B40_P26_120975_2.png	41748
6614	images/properties/B40_P26_120975_3.png	41748
6615	images/properties/B40_P26_120975_4.png	41748
6616	images/properties/B40_P26_120975_5.png	41748
6617	images/properties/B40_P26_120975_6.png	41748
6618	images/properties/B40_P27_020570_1.png	41749
6619	images/properties/B40_P27_022367_1.png	41749
6620	images/properties/B40_P27_080768_1.png	41749
6621	images/properties/B40_P27_091565_1.png	41749
6622	images/properties/B40_P28_080868_1.png	41750
6623	images/properties/B40_P28_091565_1.png	41750
6624	images/properties/B40_P29_020570_1.png	41751
6625	images/properties/B40_P29_022467_1.png	41751
6626	images/properties/B40_P29_080768_1.png	41751
6627	images/properties/B40_P29_091565_1.png	41751
6628	images/properties/B40_P4_042474_1.png	41752
6629	images/properties/B40_P4_042474_2.png	41752
6630	images/properties/B40_P4_100874_1.png	41752
6631	images/properties/B40_P5_030575_1.png	41753
6632	images/properties/B40_P5_030575_2.png	41753
6633	images/properties/B40_P5_030575_3.png	41753
6634	images/properties/B40_P5_030575_4.png	41753
6635	images/properties/B40_P5_080674_1.png	41753
6636	images/properties/B40_P5_080674_2.png	41753
6637	images/properties/B40_P5_080674_3.png	41753
6638	images/properties/B40_P7_012167_1.png	41754
6639	images/properties/B41_P10_050675_1.png	41755
6640	images/properties/B41_P10_050675_2.png	41755
6641	images/properties/B41_P10_050675_3.png	41755
6642	images/properties/B41_P10_051068_1.png	41755
6643	images/properties/B41_P10_051068_2.png	41755
6644	images/properties/B41_P10_051675_1.png	41755
6645	images/properties/B41_P10_070268_1.png	41755
6646	images/properties/B41_P10_070268_2.png	41755
6647	images/properties/B41_P10_091565_1.png	41755
6648	images/properties/B41_P10_091565_2.png	41755
6649	images/properties/B41_P11_030475_1.png	41756
6650	images/properties/B41_P11_030475_2.png	41756
6651	images/properties/B41_P11_080174_1.png	41756
6652	images/properties/B41_P11_080174_2.png	41756
6653	images/properties/B41_P12_082074_1.png	41757
6654	images/properties/B41_P12_100874_1.png	41757
6655	images/properties/B41_P8_030370_1.png	41758
6656	images/properties/B41_P8_080868_1.png	41758
6657	images/properties/B41_P8_080868_2.png	41758
6658	images/properties/B41_P8_091565_1.png	41758
6659	images/properties/B41_P9_052268_1.png	41759
6660	images/properties/B41_P9_070268_1.png	41759
6661	images/properties/B41_P9_091565_1.png	41759
6662	images/properties/B42_P13_070968_1.png	41760
6663	images/properties/B42_P13_070968_2.png	41760
6664	images/properties/B42_P13_080968_1.png	41760
6665	images/properties/B42_P13_091565_1.png	41760
6666	images/properties/B42_P13_091565_2.png	41760
6667	images/properties/B42_P14_030176_1.png	41761
6668	images/properties/B42_P14_030176_2.png	41761
6669	images/properties/B42_P14_030176_3.png	41761
6670	images/properties/B42_P14_030176_4.png	41761
6671	images/properties/B42_P14_030176_5.png	41761
6672	images/properties/B42_P14_092474_1.png	41761
6673	images/properties/B42_P18_081674_1.png	41762
6674	images/properties/B42_P18_081674_2.png	41762
6675	images/properties/B42_P18_100874_1.png	41762
6676	images/properties/B42_P4_072974_1.png	41763
6677	images/properties/B42_P4_092474_1.png	41763
6678	images/properties/B42_P5_052374_1.png	41764
6679	images/properties/B42_P5_121775_1.png	41764
6680	images/properties/B42_P5_121775_2.png	41764
6681	images/properties/B42_P5_121775_3.png	41764
6682	images/properties/B43_P10_050175_1.png	41765
6683	images/properties/B43_P10_050175_2.png	41765
6684	images/properties/B43_P10_050175_3.png	41765
6685	images/properties/B43_P10_082074_1.png	41765
6686	images/properties/B43_P11_081968_1.png	41766
6687	images/properties/B43_P11_091565_1.png	41766
6688	images/properties/B43_P12_062668_1.png	41767
6689	images/properties/B43_P12_091565_2.png	41767
6690	images/properties/B43_P14_040868_1.png	41768
6691	images/properties/B43_P14_062568_1.png	41768
6692	images/properties/B43_P14_091565_1.png	41768
6693	images/properties/B43_P14_091565_2.png	41768
6694	images/properties/B43_P14_091565_3.png	41768
6695	images/properties/B43_P15_072076_1.png	41769
6696	images/properties/B43_P15_072076_2.png	41769
6697	images/properties/B43_P15_072076_3.png	41769
6698	images/properties/B43_P15_072076_4.png	41769
6699	images/properties/B43_P15_080476_1.png	41769
6700	images/properties/B43_P15_080476_2.png	41769
6701	images/properties/B43_P16_041368_1.png	41770
6702	images/properties/B43_P16_062768_1.png	41770
6703	images/properties/B43_P17_082674_1.png	41771
6704	images/properties/B43_P17_082674_2.png	41771
6705	images/properties/B43_P17_092474_1.png	41771
6706	images/properties/B43_P1_040368_1.png	41772
6707	images/properties/B43_P1_091565_1.png	41772
6708	images/properties/B43_P1_091565_2.png	41772
6709	images/properties/B43_P1_091565_3.png	41772
6710	images/properties/B43_P1_091768_1.png	41772
6711	images/properties/B43_P23_041668_1.png	41773
6712	images/properties/B43_P23_041668_2.png	41773
6713	images/properties/B43_P24_111374_1.png	41774
6714	images/properties/B43_P24_111974_1.png	41774
6715	images/properties/B43_P24_120674_1.png	41774
6716	images/properties/B43_P24_120674_2.png	41774
6717	images/properties/B43_P26_111974_1.png	41775
6718	images/properties/B43_P26_121174_1.png	41775
6719	images/properties/B43_P26_121174_2.png	41775
6720	images/properties/B43_P2_041968_1.png	41776
6721	images/properties/B43_P2_041968_2.png	41776
6722	images/properties/B43_P2_083068_1.png	41776
6723	images/properties/B43_P2_091565_1.png	41776
6724	images/properties/B43_P2_091565_2.png	41776
6725	images/properties/B43_P30_030674_1.png	41777
6726	images/properties/B43_P30_041474_1.png	41777
6727	images/properties/B43_P32_022370_1.png	41778
6728	images/properties/B43_P32_022370_10.png	41778
6729	images/properties/B43_P32_022370_11.png	41778
6730	images/properties/B43_P32_022370_2.png	41778
6731	images/properties/B43_P32_022370_3.png	41778
6732	images/properties/B43_P32_022370_4.png	41778
6733	images/properties/B43_P32_022370_5.png	41778
6734	images/properties/B43_P32_022370_6.png	41778
6735	images/properties/B43_P32_022370_7.png	41778
6736	images/properties/B43_P32_022370_8.png	41778
6737	images/properties/B43_P32_022370_9.png	41778
6738	images/properties/B43_P32_081770_1.png	41778
6739	images/properties/B43_P32_081870_1.png	41778
6740	images/properties/B43_P33A_041668_1.png	41779
6741	images/properties/B43_P33A_091565_1.png	41779
6742	images/properties/B43_P33B_041668_1.png	41779
6743	images/properties/B43_P34_041668_1.png	41780
6744	images/properties/B43_P34_091565_1.png	41780
6745	images/properties/B43_P35_041668_1.png	41781
6746	images/properties/B43_P35_091565_1.png	41781
6747	images/properties/B43_P3_041268_1.png	41782
6748	images/properties/B43_P3_080268_1.png	41782
6749	images/properties/B43_P4_041268_1.png	41783
6750	images/properties/B43_P4_041268_2.png	41783
6751	images/properties/B43_P4_041268_3.png	41783
6752	images/properties/B43_P4_090368_1.png	41783
6753	images/properties/B43_P4_091565_1.png	41783
6754	images/properties/B43_P4_091565_2.png	41783
6755	images/properties/B43_P4_091565_3.png	41783
6756	images/properties/B43_P5_010667_1.png	41784
6757	images/properties/B43_P5_091565_1.png	41784
6758	images/properties/B43_P9_072277_1.png	41785
6759	images/properties/B43_P9_072277_2.png	41785
6760	images/properties/B43_P9_081277_1.png	41785
6761	images/properties/B43_P9_081277_2.png	41785
6762	images/properties/B44_P10_012367_1.png	41786
6763	images/properties/B44_P10_091565_1.png	41786
6764	images/properties/B44_P11_052968_1.png	41787
6765	images/properties/B44_P11_091565_1.png	41787
6766	images/properties/B44_P12_071675_1.png	41788
6767	images/properties/B44_P12_071675_2.png	41788
6768	images/properties/B44_P12_071675_3.png	41788
6769	images/properties/B44_P12_071675_4.png	41788
6770	images/properties/B44_P12_091565_1.png	41788
6771	images/properties/B44_P13_052968_1.png	41789
6772	images/properties/B44_P13_091565_1.png	41789
6773	images/properties/B44_P14_052868_1.png	41790
6774	images/properties/B44_P14_091565_1.png	41790
6775	images/properties/B44_P15_012467_1.png	41791
6776	images/properties/B44_P15_012467_2.png	41791
6777	images/properties/B44_P15_091565_1.png	41791
6778	images/properties/B44_P17_052868_1.png	41792
6779	images/properties/B44_P17_091565_1.png	41792
6780	images/properties/B44_P18_P20_P21_P22_P23_120176_1.png	41793
6781	images/properties/B44_P18_P20_P21_P22_P23_120176_2.png	41793
6782	images/properties/B44_P18_P20_P21_P22_P23_120176_3.png	41793
6783	images/properties/B44_P18_P20_P21_P22_P23_120176_4.png	41793
6784	images/properties/B44_P18_P20_P21_P22_P23_120176_5.png	41793
6785	images/properties/B44_P18_P20_P21_P22_P23_120176_6.png	41793
6786	images/properties/B44_P18_P20_P21_P22_P23_120176_7.png	41793
6787	images/properties/B44_P18_P20_P21_P22_P23_121676_1.png	41793
6788	images/properties/B44_P18_P20_P21_P22_P23_121676_2.png	41793
6789	images/properties/B44_P18_P20_P21_P22_P23_121676_3.png	41793
6790	images/properties/B44_P18_P20_P21_P22_P23_121676_4.png	41793
6791	images/properties/B44_P18_P20_P21_P22_P23_121676_5.png	41793
6792	images/properties/B44_P18_P20_P21_P22_P23_121676_6.png	41793
6793	images/properties/B44_P18_P20_P21_P22_P23_121676_7.png	41793
6794	images/properties/B44_P1_040468_1.png	41794
6795	images/properties/B44_P1_091565_1.png	41794
6796	images/properties/B44_P1_121275_1.png	41794
6797	images/properties/B44_P1_121275_2.png	41794
6798	images/properties/B44_P1_121275_3.png	41794
6799	images/properties/B44_P24_040368_1.png	41795
6800	images/properties/B44_P24_091565_1.png	41795
6801	images/properties/B44_P25_091565_1.png	41796
6802	images/properties/B44_P26_062068_1.png	41797
6803	images/properties/B44_P26_091565_1.png	41797
6804	images/properties/B44_P2_040368_1.png	41798
6805	images/properties/B44_P2_091565_1.png	41798
6806	images/properties/B44_P3_032968_1.png	41799
6807	images/properties/B44_P3_032968_2.png	41799
6808	images/properties/B44_P3_081968_1.png	41799
6809	images/properties/B44_P3_091565_1.png	41799
6810	images/properties/B44_P3_091565_2.png	41799
6811	images/properties/B44_P4_040368_1.png	41800
6812	images/properties/B44_P4_091565_1.png	41800
6813	images/properties/B44_P5_032174_1.png	41801
6814	images/properties/B44_P5_032174_2.png	41801
6815	images/properties/B44_P5_041474_1.png	41801
6816	images/properties/B44_P6_040368_1.png	41802
6817	images/properties/B44_P6_091565_1.png	41802
6818	images/properties/B44_P7_041568_1.png	41803
6819	images/properties/B44_P7_091565_1.png	41803
6820	images/properties/B44_P8_062468_1.png	41804
6821	images/properties/B44_P8_091565_1.png	41804
6822	images/properties/B44_P9_012567_1.png	41805
6823	images/properties/B44_P9_091565_1.png	41805
6824	images/properties/B45_P10_053168_1.png	41806
6825	images/properties/B45_P10_091565_1.png	41806
6826	images/properties/B45_P11_060568_1.png	41807
6827	images/properties/B45_P11_080868_1.png	41807
6828	images/properties/B45_P11_091565_1.png	41807
6829	images/properties/B45_P11_091565_2.png	41807
6830	images/properties/B45_P11_091565_3.png	41807
6831	images/properties/B45_P13_020467_1.png	41808
6832	images/properties/B45_P13_091565_1.png	41808
6833	images/properties/B45_P14_061768_1.png	41809
6834	images/properties/B45_P14_081168_1.png	41809
6835	images/properties/B45_P15_060668_1.png	41810
6836	images/properties/B45_P15_060668_2.png	41810
6837	images/properties/B45_P15_091565_1.png	41810
6838	images/properties/B45_P16_013167_1.png	41811
6839	images/properties/B45_P16_091565_1.png	41811
6840	images/properties/B45_P17_020667_1.png	41812
6841	images/properties/B45_P17_091565_1.png	41812
6842	images/properties/B45_P18_061268_1.png	41813
6843	images/properties/B45_P18_091565_1.png	41813
6844	images/properties/B45_P19_020167_1.png	41814
6845	images/properties/B45_P19_060668_1.png	41814
6846	images/properties/B45_P20_013167_1.png	41815
6847	images/properties/B45_P20_091565_1.png	41815
6848	images/properties/B45_P21_060568_1.png	41816
6849	images/properties/B45_P21_091565_1.png	41816
6850	images/properties/B45_P22_060568_1.png	41817
6851	images/properties/B45_P22_091565_1.png	41817
6852	images/properties/B45_P23_060368_1.png	41818
6853	images/properties/B45_P23_091565_1.png	41818
6854	images/properties/B45_P24_060368_1.png	41819
6855	images/properties/B45_P24_091565_1.png	41819
6856	images/properties/B45_P25_013067_1.png	41820
6857	images/properties/B45_P26_091565_1.png	41821
6858	images/properties/B45_P27_052868_1.png	41822
6859	images/properties/B45_P27_091565_1.png	41822
6860	images/properties/B45_P28_060668_1.png	41823
6861	images/properties/B45_P28_091565_1.png	41823
6862	images/properties/B45_P29_012767_1.png	41824
6863	images/properties/B45_P29_012767_2.png	41824
6864	images/properties/B45_P29_052968_1.png	41824
6865	images/properties/B45_P29_091565_1.png	41824
6866	images/properties/B45_P2_052468_1.png	41825
6867	images/properties/B45_P2_091565_1.png	41825
6868	images/properties/B45_P30_020167_1.png	41826
6869	images/properties/B45_P30_052968_1.png	41826
6870	images/properties/B45_P31_061668_1.png	41827
6871	images/properties/B45_P31_091565_1.png	41827
6872	images/properties/B45_P32_060368_1.png	41828
6873	images/properties/B45_P32_091565_1.png	41828
6874	images/properties/B45_P33_012467_1.png	41829
6875	images/properties/B45_P33_091565_1.png	41829
6876	images/properties/B45_P34_052768_1.png	41830
6877	images/properties/B45_P34_091565_1.png	41830
6878	images/properties/B45_P3_012267_1.png	41831
6879	images/properties/B45_P3_052568_1.png	41831
6880	images/properties/B45_P4_012267_1.png	41832
6881	images/properties/B45_P4_091565_1.png	41832
6882	images/properties/B45_P5_012267_1.png	41833
6883	images/properties/B45_P5_091565_1.png	41833
6884	images/properties/B45_P6_052768_1.png	41834
6885	images/properties/B45_P6_091565_1.png	41834
6886	images/properties/B45_P7_012267_1.png	41835
6887	images/properties/B45_P7_091565_1.png	41835
6888	images/properties/B45_P8_082668_1.png	41836
6889	images/properties/B45_P8_091565_1.png	41836
6890	images/properties/B45_P9_012367_1.png	41837
6891	images/properties/B45_P9_053168_1.png	41837
6892	images/properties/B45_P9_091565_1.png	41837
6893	images/properties/B45_P9_091565_2.png	41837
6894	images/properties/B45_P9_091565_3.png	41837
6895	images/properties/B46_P10_041974_1.png	41838
6896	images/properties/B46_P10_052768_1.png	41838
6897	images/properties/B46_P10_061274_1.png	41838
6898	images/properties/B46_P10_091565_1.png	41838
6899	images/properties/B46_P11_011867_1.png	41839
6900	images/properties/B46_P11_091565_1.png	41839
6901	images/properties/B46_P12_011867_1.png	41840
6902	images/properties/B46_P12_091565_1.png	41840
6903	images/properties/B46_P13_061268_1.png	41841
6904	images/properties/B46_P13_091565_1.png	41841
6905	images/properties/B46_P15_012067_1.png	41842
6906	images/properties/B46_P15_061274_1.png	41842
6907	images/properties/B46_P15_091565_1.png	41842
6908	images/properties/B46_P15_091565_2.png	41842
6909	images/properties/B46_P15_091565_3.png	41842
6910	images/properties/B46_P15_091565_4.png	41842
6911	images/properties/B46_P15_091565_5.png	41842
6912	images/properties/B46_P16_061768_1.png	41843
6913	images/properties/B46_P16_091565_1.png	41843
6914	images/properties/B46_P17_061368_1.png	41844
6915	images/properties/B46_P17_091565_1.png	41844
6916	images/properties/B46_P18_012067_1.png	41845
6917	images/properties/B46_P18_091565_1.png	41845
6918	images/properties/B46_P19_062068_1.png	41846
6919	images/properties/B46_P19_091565_1.png	41846
6920	images/properties/B46_P1_041168_1.png	41847
6921	images/properties/B46_P1_091565_1.png	41847
6922	images/properties/B46_P1_091968_1.png	41847
6923	images/properties/B46_P2_031469_1.png	41848
6924	images/properties/B46_P2_050168_1.png	41848
6925	images/properties/B46_P2_091565_1.png	41848
6926	images/properties/B46_P3_011667_1.png	41849
6927	images/properties/B46_P3_091565_1.png	41849
6928	images/properties/B46_P4_061768_1.png	41850
6929	images/properties/B46_P4_091565_1.png	41850
6930	images/properties/B46_P5_062668_1.png	41851
6931	images/properties/B46_P5_091565_1.png	41851
6932	images/properties/B46_P6_011867_1.png	41852
6933	images/properties/B46_P6_091565_1.png	41852
6934	images/properties/B46_P7_011767_1.png	41853
6935	images/properties/B46_P7_091565_1.png	41853
6936	images/properties/B46_P8_082768_1.png	41854
6937	images/properties/B46_P8_091565_1.png	41854
6938	images/properties/B46_P9_080268_1.png	41855
6939	images/properties/B46_P9_082868_1.png	41855
6940	images/properties/B46_P9_082868_2.png	41855
6941	images/properties/B46_P9_091565_1.png	41855
6942	images/properties/B47_P10_061968_1.png	41856
6943	images/properties/B47_P10_091268_1.png	41856
6944	images/properties/B47_P11_061168_1.png	41857
6945	images/properties/B47_P11_091168_1.png	41857
6946	images/properties/B47_P12_061868_1.png	41858
6947	images/properties/B47_P13_062068_1.png	41859
6948	images/properties/B47_P13_091565_1.png	41859
6949	images/properties/B47_P14_061868_1.png	41860
6950	images/properties/B47_P14_061868_2.png	41860
6951	images/properties/B47_P14_090468_1.png	41860
6952	images/properties/B47_P15_091565_1.png	41861
6953	images/properties/B47_P15_110166_1.png	41861
6954	images/properties/B47_P16_091565_1.png	41862
6955	images/properties/B47_P16_110166_1.png	41862
6956	images/properties/B47_P16_110466_1.png	41862
6957	images/properties/B47_P17_091565_1.png	41863
6958	images/properties/B47_P18_120866_1.png	41864
6959	images/properties/B47_P19_091565_1.png	41865
6960	images/properties/B47_P19_110166_1.png	41865
6961	images/properties/B47_P1_041868_1.png	41866
6962	images/properties/B47_P1_091565_1.png	41866
6963	images/properties/B47_P1_091968_1.png	41866
6964	images/properties/B47_P20_061868_1.png	41867
6965	images/properties/B47_P20_061868_2.png	41867
6966	images/properties/B47_P20_091565_1.png	41867
6967	images/properties/B47_P20_091565_2.png	41867
6968	images/properties/B47_P21_051471_1.png	41868
6969	images/properties/B47_P21_051471_2.png	41868
6970	images/properties/B47_P21_051471_3.png	41868
6971	images/properties/B47_P21_051471_4.png	41868
6972	images/properties/B47_P21_051471_5.png	41868
6973	images/properties/B47_P21_051471_6.png	41868
6974	images/properties/B47_P21_051471_7.png	41868
6975	images/properties/B47_P21_062568_1.png	41868
6976	images/properties/B47_P21_062568_2.png	41868
6977	images/properties/B47_P21_091565_1.png	41868
6978	images/properties/B47_P22_091565_1.png	41869
6979	images/properties/B47_P22_111766_1.png	41869
6980	images/properties/B47_P23_061868_1.png	41870
6981	images/properties/B47_P23_091565_1.png	41870
6982	images/properties/B47_P24_030467_1.png	41871
6983	images/properties/B47_P24_091565_1.png	41871
6984	images/properties/B47_P24_091565_2.png	41871
6985	images/properties/B47_P25_062468_1.png	41872
6986	images/properties/B47_P25_062468_2.png	41872
6987	images/properties/B47_P25_070568_1.png	41872
6988	images/properties/B47_P25_070568_2.png	41872
6989	images/properties/B47_P25_091565_1.png	41872
6990	images/properties/B47_P25_091565_2.png	41872
6991	images/properties/B47_P26_070168_1.png	41873
6992	images/properties/B47_P26_070568_1.png	41873
6993	images/properties/B47_P27_011767_1.png	41874
6994	images/properties/B47_P27_091565_1.png	41874
6995	images/properties/B47_P27_111466_1.png	41874
6996	images/properties/B47_P2_022767_1.png	41875
6997	images/properties/B47_P2_091565_1.png	41875
6998	images/properties/B47_P3_061168_1.png	41876
6999	images/properties/B47_P3_091768_1.png	41876
7000	images/properties/B47_P4_062068_1.png	41877
7001	images/properties/B47_P4_090968_1.png	41877
7002	images/properties/B47_P4_091565_1.png	41877
7003	images/properties/B47_P5_061168_1.png	41878
7004	images/properties/B47_P5_081468_1.png	41878
7005	images/properties/B47_P6_032768_1.png	41879
7006	images/properties/B47_P6_091565_1.png	41879
7007	images/properties/B47_P7_020274_1.png	41880
7008	images/properties/B47_P7_020274_2.png	41880
7009	images/properties/B47_P7_020274_3.png	41880
7010	images/properties/B47_P7_021370_1.png	41880
7011	images/properties/B47_P7_021370_2.png	41880
7012	images/properties/B47_P7_021370_3.png	41880
7013	images/properties/B47_P7_041474_1.png	41880
7014	images/properties/B47_P7_041474_2.png	41880
7015	images/properties/B47_P7_060368_1.png	41880
7016	images/properties/B47_P7_091565_1.png	41880
7017	images/properties/B47_P7_091565_2.png	41880
7018	images/properties/B47_P7_091668_1.png	41880
7019	images/properties/B47_P8_060368_1.png	41881
7020	images/properties/B47_P8_082068_1.png	41881
7021	images/properties/B47_P9_060568_1.png	41882
7022	images/properties/B47_P9_091268_1.png	41882
7023	images/properties/B47_P9_091565_1.png	41882
7024	images/properties/B48_P11_061168_1.png	41883
7025	images/properties/B48_P11_061168_2.png	41883
7026	images/properties/B48_P11_061168_3.png	41883
7027	images/properties/B48_P11_090968_1.png	41883
7028	images/properties/B48_P11_091565_1.png	41883
7029	images/properties/B48_P11_091565_2.png	41883
7030	images/properties/B48_P11_091565_3.png	41883
7031	images/properties/B48_P11_091565_4.png	41883
7032	images/properties/B48_P12_061668_1.png	41884
7033	images/properties/B48_P12_090468_1.png	41884
7034	images/properties/B48_P12_091565_1.png	41884
7035	images/properties/B48_P12_091565_2.png	41884
7036	images/properties/B48_P12_092468_1.png	41884
7037	images/properties/B48_P13_083068_1.png	41885
7038	images/properties/B48_P13_091565_1.png	41885
7039	images/properties/B48_P14_091565_1.png	41886
7040	images/properties/B48_P15_082968_1.png	41887
7041	images/properties/B48_P15_091565_1.png	41887
7042	images/properties/B48_P16_021370_1.png	41888
7043	images/properties/B48_P16_021370_2.png	41888
7044	images/properties/B48_P16_021370_3.png	41888
7045	images/properties/B48_P16_090368_1.png	41888
7046	images/properties/B48_P16_091565_1.png	41888
7047	images/properties/B48_P16_111466_1.png	41888
7048	images/properties/B48_P17_090368_1.png	41889
7049	images/properties/B48_P17_091565_1.png	41889
7050	images/properties/B48_P17_110766_1.png	41889
7051	images/properties/B48_P18_010175_2.png	41890
7052	images/properties/B48_P18_050175_1.png	41890
7053	images/properties/B48_P18_050175_3.png	41890
7054	images/properties/B48_P18_050175_4.png	41890
7055	images/properties/B48_P18_052075_1.png	41890
7056	images/properties/B48_P18_083068_1.png	41890
7057	images/properties/B48_P18_091565_1.png	41890
7058	images/properties/B48_P18_111466_1.png	41890
7059	images/properties/B48_P19_091565_1.png	41891
7060	images/properties/B48_P19_111466_1.png	41891
7061	images/properties/B48_P1_091565_1.png	41892
7062	images/properties/B48_P20_090468_1.png	41893
7063	images/properties/B48_P20_091565_1.png	41893
7064	images/properties/B48_P20_111466_1.png	41893
7065	images/properties/B48_P21_091565_1.png	41894
7066	images/properties/B48_P21_110966_1.png	41894
7067	images/properties/B48_P22_091565_1.png	41895
7068	images/properties/B48_P22_110966_1.png	41895
7069	images/properties/B48_P23_091565_1.png	41896
7070	images/properties/B48_P23_111466_1.png	41896
7071	images/properties/B48_P24_052075_1.png	41897
7072	images/properties/B48_P24_082868_1.png	41897
7073	images/properties/B48_P24_091565_1.png	41897
7074	images/properties/B48_P24_111466_1.png	41897
7075	images/properties/B48_P25_082868_1.png	41898
7076	images/properties/B48_P26_082968_1.png	41899
7077	images/properties/B48_P26_091565_1.png	41899
7078	images/properties/B48_P27_090368_1.png	41900
7079	images/properties/B48_P27_091565_1.png	41900
7080	images/properties/B48_P28_091565_1.png	41901
7081	images/properties/B48_P2_090368_1.png	41902
7082	images/properties/B48_P2_091565_1.png	41902
7083	images/properties/B48_P2_091565_2.png	41902
7084	images/properties/B48_P2_111566_1.png	41902
7085	images/properties/B48_P2_111566_2.png	41902
7086	images/properties/B48_P3_062768_1.png	41903
7087	images/properties/B48_P3_091565_1.png	41903
7088	images/properties/B48_P4_091565_1.png	41904
7089	images/properties/B48_P4_092068_1.png	41904
7090	images/properties/B48_P5_062868_1.png	41905
7091	images/properties/B48_P5_091565_1.png	41905
7092	images/properties/B48_P6_062768_1.png	41906
7093	images/properties/B48_P6_091565_1.png	41906
7094	images/properties/B48_P6_091565_2.png	41906
7095	images/properties/B48_P6_091565_3.png	41906
7096	images/properties/B48_P7_031170_1.png	41907
7097	images/properties/B48_P7_031170_2.png	41907
7098	images/properties/B48_P7_031170_3.png	41907
7099	images/properties/B48_P7_081268_1.png	41907
7100	images/properties/B48_P7_091565_1.png	41907
7101	images/properties/B48_P7_091565_2.png	41907
7102	images/properties/B48_P7_091868_1.png	41907
7103	images/properties/B48_P7_091868_2.png	41907
7104	images/properties/B48_P8_062668_1.png	41908
7105	images/properties/B48_P8_091565_1.png	41908
7106	images/properties/B48_P9_061968_1.png	41909
7107	images/properties/B48_P9_091565_1.png	41909
7108	images/properties/B49_P10_012567_1.png	41910
7109	images/properties/B49_P10_090968_1.png	41910
7110	images/properties/B49_P10_091565_1.png	41910
7111	images/properties/B49_P11_090968_1.png	41911
7112	images/properties/B49_P11_091565_1.png	41911
7113	images/properties/B49_P12_012567_1.png	41912
7114	images/properties/B49_P12_091565_1.png	41912
7115	images/properties/B49_P13_091565_1.png	41913
7116	images/properties/B49_P14_070268_1.png	41914
7117	images/properties/B49_P14_091565_1.png	41914
7118	images/properties/B49_P14_091565_2.png	41914
7119	images/properties/B49_P15_070268_1.png	41915
7120	images/properties/B49_P16_012567_1.png	41916
7121	images/properties/B49_P16_062066_1.png	41916
7122	images/properties/B49_P16_062066_2.png	41916
7123	images/properties/B49_P17_102266_1.png	41917
7124	images/properties/B49_P18_102266_1.png	41918
7125	images/properties/B49_P1_110466_1.png	41919
7126	images/properties/B49_P2_082768_1.png	41920
7127	images/properties/B49_P2_091565_1.png	41920
7128	images/properties/B49_P3_091565_1.png	41921
7129	images/properties/B49_P4_091565_1.png	41922
7130	images/properties/B49_P5_091565_1.png	41923
7131	images/properties/B49_P7_082868_1.png	41924
7132	images/properties/B49_P8_082868_1.png	41925
7133	images/properties/B49_P8_091565_1.png	41925
7134	images/properties/B49_P9_062768_1.png	41926
7135	images/properties/B49_P9_091565_1.png	41926
7136	images/properties/B4_P10_072668_1.png	41927
7137	images/properties/B4_P10_091565_1.png	41927
7138	images/properties/B4_P10_091565_2.png	41927
7139	images/properties/B4_P10_091565_3.png	41927
7140	images/properties/B4_P10_091565_4.png	41927
7141	images/properties/B4_P10_091565_5.png	41927
7142	images/properties/B4_P10_091565_6.png	41927
7143	images/properties/B4_P14_072668_1.png	41928
7144	images/properties/B4_P14_073068_1.png	41928
7145	images/properties/B4_P14_091565_1.png	41928
7146	images/properties/B4_P15_011774_1.png	41929
7147	images/properties/B4_P15_011774_2.png	41929
7148	images/properties/B4_P15_020674_1.png	41929
7149	images/properties/B4_P15_091565_1.png	41929
7150	images/properties/B4_P16_011074_1.png	41930
7151	images/properties/B4_P16_020674_1.png	41930
7152	images/properties/B4_P16_061565_1.png	41930
7153	images/properties/B4_P17_020167_1.png	41931
7154	images/properties/B4_P17_050675_1.png	41931
7155	images/properties/B4_P17_050675_2.png	41931
7156	images/properties/B4_P17_050675_3.png	41931
7157	images/properties/B4_P17_050675_4.png	41931
7158	images/properties/B4_P17_050675_5.png	41931
7159	images/properties/B4_P17_060375_1.png	41931
7160	images/properties/B4_P17_060375_2.png	41931
7161	images/properties/B4_P17_060375_3.png	41931
7162	images/properties/B4_P17_060375_4.png	41931
7163	images/properties/B4_P17_060375_5.png	41931
7164	images/properties/B4_P17_081668_1.png	41931
7165	images/properties/B4_P17_091565_1.png	41931
7166	images/properties/B4_P17_091565_2.png	41931
7167	images/properties/B4_P17_091565_3.png	41931
7168	images/properties/B4_P17_091565_4.png	41931
7169	images/properties/B4_P18_012975_1.png	41932
7170	images/properties/B4_P18_012975_2.png	41932
7171	images/properties/B4_P18_091565_1.png	41932
7172	images/properties/B4_P18_111474_1.png	41932
7173	images/properties/B4_P19_091565_1.png	41933
7174	images/properties/B4_P19_091565_2.png	41933
7175	images/properties/B4_P19_112374_1.png	41933
7176	images/properties/B4_P19_112374_2.png	41933
7177	images/properties/B4_P19_112374_3.png	41933
7178	images/properties/B4_P19_112374_4.png	41933
7179	images/properties/B4_P1_010377_1.png	41934
7180	images/properties/B4_P1_010377_2.png	41934
7181	images/properties/B4_P1_011267_1.png	41934
7182	images/properties/B4_P1_081668_1.png	41934
7183	images/properties/B4_P1_122876_1.png	41934
7184	images/properties/B4_P1_122876_2.png	41934
7185	images/properties/B4_P20_091565_1.png	41935
7186	images/properties/B4_P20_111374_1.png	41935
7187	images/properties/B4_P20_111374_2.png	41935
7188	images/properties/B4_P20_120574_1.png	41935
7189	images/properties/B4_P20_120574_2.png	41935
7190	images/properties/B4_P21_083068_1.png	41936
7191	images/properties/B4_P21_091565_1.png	41936
7192	images/properties/B4_P22_042175_1.png	41937
7193	images/properties/B4_P22_081668_1.png	41937
7194	images/properties/B4_P22_091565_1.png	41937
7195	images/properties/B4_P23_071768_1.png	41938
7196	images/properties/B4_P23_082068_1.png	41938
7197	images/properties/B4_P24_071868_1.png	41939
7198	images/properties/B4_P24_091565_1.png	41939
7199	images/properties/B4_P25_071868_1.png	41940
7200	images/properties/B4_P25_083068_1.png	41940
7201	images/properties/B4_P26_071868_1.png	41941
7202	images/properties/B4_P26_083168_1.png	41941
7203	images/properties/B4_P2_091565_1.png	41942
7204	images/properties/B4_P2_092168_1.png	41942
7205	images/properties/B4_P4_072668_1.png	41943
7206	images/properties/B4_P4_091565_1.png	41943
7207	images/properties/B4_P5_042274_1.png	41944
7208	images/properties/B4_P5_042274_2.png	41944
7209	images/properties/B4_P5_051876_1.png	41944
7210	images/properties/B4_P5_051876_2.png	41944
7211	images/properties/B4_P5_051876_3.png	41944
7212	images/properties/B4_P5_072668_1.png	41944
7213	images/properties/B4_P5_091565_1.png	41944
7214	images/properties/B4_P6_011267_1.png	41945
7215	images/properties/B4_P6_042175_1.png	41945
7216	images/properties/B4_P6_081668_1.png	41945
7217	images/properties/B4_P6_091565_1.png	41945
7218	images/properties/B4_P9_072668_1.png	41946
7219	images/properties/B4_P9_091565_1.png	41946
7220	images/properties/B50_P10_091565_1.png	14160
7221	images/properties/B50_P10_091565_2.png	14160
7222	images/properties/B50_P11_081568_1.png	14161
7223	images/properties/B50_P11_091565_1.png	14161
7224	images/properties/B50_P12_081568_1.png	14162
7225	images/properties/B50_P12_091565_1.png	14162
7226	images/properties/B50_P12_100969_1.png	14162
7227	images/properties/B50_P13_091565_1.png	14164
7228	images/properties/B50_P14_102566_1.png	14165
7229	images/properties/B50_P15_091565_1.png	14166
7230	images/properties/B50_P15_102566_1.png	14166
7231	images/properties/B50_P16_081668_1.png	14167
7232	images/properties/B50_P16_091565_1.png	14167
7233	images/properties/B50_P17_091565_1.png	14168
7234	images/properties/B50_P17_102566_1.png	14168
7235	images/properties/B50_P18_091565_1.png	14169
7236	images/properties/B50_P19_081368_1.png	14170
7237	images/properties/B50_P19_091565_1.png	14170
7238	images/properties/B50_P1_091565_1.png	41947
7239	images/properties/B50_P20_081667_1.png	14171
7240	images/properties/B50_P2_091565_1.png	14152
7241	images/properties/B50_P2_091565_2.png	14152
7242	images/properties/B50_P2_091565_3.png	14152
7243	images/properties/B50_P2_102066_1.png	14152
7244	images/properties/B50_P2_102066_2.png	14152
7245	images/properties/B50_P3_091565_1.png	14153
7246	images/properties/B50_P4_091565_1.png	14154
7247	images/properties/B50_P5_091565_1.png	14155
7248	images/properties/B50_P6_081568_1.png	14156
7249	images/properties/B50_P6_091565_1.png	14156
7250	images/properties/B50_P7_091565_1.png	14157
7251	images/properties/B50_P7_091565_2.png	14157
7252	images/properties/B50_P8_091565_1.png	14158
7253	images/properties/B50_P9_091565_1.png	14159
7254	images/properties/B51_P1_091565_3.png	41948
7255	images/properties/B51_P1_091565_4.png	41948
7256	images/properties/B51_P1_091565_5.png	41948
7257	images/properties/B52_P10_09068_1.png	41949
7258	images/properties/B52_P10_091565_1.png	41949
7259	images/properties/B52_P1_102866_1.png	41950
7260	images/properties/B52_P3_091565_1.png	41951
7261	images/properties/B52_P4_091565_1.png	41952
7262	images/properties/B52_P4_091565_2.png	41952
7263	images/properties/B52_P5_091565_1.png	41953
7264	images/properties/B52_P6_091565_1.png	41954
7265	images/properties/B52_P7_091565_1.png	41955
7266	images/properties/B52_P8_041974_1.png	41956
7267	images/properties/B52_P8_061274_1.png	41956
7268	images/properties/B52_P8_091565_1.png	41956
7269	images/properties/B52_P8_102866_1.png	41956
7270	images/properties/B52_P9_080968_1.png	41957
7271	images/properties/B52_P9_091565_1.png	41957
7272	images/properties/B53_P10_072968_1.png	41958
7273	images/properties/B53_P10_091565_1.png	41958
7274	images/properties/B53_P11_062066_1.png	14172
7275	images/properties/B53_P11_072968_1.png	14172
7276	images/properties/B53_P12_062066_1.png	14173
7277	images/properties/B53_P12_110566_1.png	14173
7278	images/properties/B53_P15A_073168_1.png	14175
7279	images/properties/B53_P15A_091565_1.png	14175
7280	images/properties/B53_P15B_061274_1.png	14175
7281	images/properties/B53_P15B_111766_1.png	14175
7282	images/properties/B53_P16_091565_1.png	14174
7283	images/properties/B53_P16_111766_1.png	14174
7284	images/properties/B53_P1_091565_1.png	9438
7285	images/properties/B53_P1_091565_10.png	9438
7286	images/properties/B53_P1_091565_11.png	9438
7287	images/properties/B53_P1_091565_12.png	9438
7288	images/properties/B53_P1_091565_13.png	9438
7289	images/properties/B53_P1_091565_14.png	9438
7290	images/properties/B53_P1_091565_15.png	9438
7291	images/properties/B53_P1_091565_16.png	9438
7292	images/properties/B53_P1_091565_17.png	9438
7293	images/properties/B53_P1_091565_18.png	9438
7294	images/properties/B53_P1_091565_19.png	9438
7295	images/properties/B53_P1_091565_2.png	9438
7296	images/properties/B53_P1_091565_3.png	9438
7297	images/properties/B53_P1_091565_4.png	9438
7298	images/properties/B53_P1_091565_5.png	9438
7299	images/properties/B53_P1_091565_6.png	9438
7300	images/properties/B53_P1_091565_7.png	9438
7301	images/properties/B53_P1_091565_8.png	9438
7302	images/properties/B53_P1_091565_9.png	9438
7303	images/properties/B53_P2_072568_1.png	9439
7304	images/properties/B53_P4_091565_1.png	9441
7305	images/properties/B53_P5_091565_1.png	41959
7306	images/properties/B53_P6_072968_1.png	41960
7307	images/properties/B53_P7_043068_1.png	41961
7308	images/properties/B53_P8_043068_1.png	41962
7309	images/properties/B53_P9_050168_1.png	41963
7310	images/properties/B53_P9_050168_2.png	41963
7311	images/properties/B55_P10_052268_1.png	14148
7312	images/properties/B55_P11_052268_1.png	14149
7313	images/properties/B55_P11_091565_1.png	14149
7314	images/properties/B55_P12_091565_1.png	14150
7315	images/properties/B55_P13_091565_1.png	14151
7316	images/properties/B55_P14_042474_1.png	41964
7317	images/properties/B55_P14_042474_2.png	41964
7318	images/properties/B55_P14_061274_1.png	41964
7319	images/properties/B55_P14_091565_1.png	41964
7320	images/properties/B55_P15_091565_1.png	14180
7321	images/properties/B55_P16_091565_1.png	41965
7322	images/properties/B55_P18_122866_1.png	41966
7323	images/properties/B55_P19_091565_1.png	41967
7324	images/properties/B55_P1_062066_01.png	4715
7325	images/properties/B55_P1_062066_1.png	4715
7326	images/properties/B55_P20_122766_1.png	41968
7327	images/properties/B55_P21_091565_1.png	41969
7328	images/properties/B55_P22_071568_1.png	41970
7329	images/properties/B55_P22_091565_1.png	41970
7330	images/properties/B55_P22_122266_1.png	41970
7331	images/properties/B55_P23_091565_1.png	41971
7332	images/properties/B55_P24_091565_1.png	41972
7333	images/properties/B55_P25_052968_1.png	41973
7334	images/properties/B55_P25_091565_1.png	41973
7335	images/properties/B55_P26_091565_1.png	41974
7336	images/properties/B55_P27_091565_1.png	41975
7337	images/properties/B55_P27_092669_1.png	41975
7338	images/properties/B55_P27_092669_2.png	41975
7339	images/properties/B55_P27_092669_3.png	41975
7340	images/properties/B55_P27_092669_4.png	41975
7341	images/properties/B55_P28_071168_1.png	41976
7342	images/properties/B55_P29_121966_1.png	41977
7343	images/properties/B55_P2_050768_1.png	4716
7344	images/properties/B55_P30_091565_1.png	41978
7345	images/properties/B55_P31_091565_1.png	41979
7346	images/properties/B55_P32_091565_1.png	41980
7347	images/properties/B55_P33_091565_1.png	41981
7348	images/properties/B55_P34_nodate_1.png	41982
7349	images/properties/B55_P35_091565_1.png	41983
7350	images/properties/B55_P35_nodate_1.png	41983
7351	images/properties/B55_P36_091565_1.png	41984
7352	images/properties/B55_P36_120566_1.png	41984
7353	images/properties/B55_P37_091565_1.png	41985
7354	images/properties/B55_P38_053168_1.png	41986
7355	images/properties/B55_P38_091565_1.png	41986
7356	images/properties/B55_P39_091565_1.png	41987
7357	images/properties/B55_P3_091565_1.png	9433
7358	images/properties/B55_P40_091565_1.png	41988
7359	images/properties/B55_P41_081368_1.png	41989
7360	images/properties/B55_P42_091565_1.png	41990
7361	images/properties/B55_P43_050868_1.png	41991
7362	images/properties/B55_P44_120566_1.png	41992
7363	images/properties/B55_P45_121666_1.png	41993
7364	images/properties/B55_P46_091565_1.png	41994
7365	images/properties/B55_P46_121066_1.png	41994
7366	images/properties/B55_P47_071868_1.png	41995
7367	images/properties/B55_P48_121366_1.png	14179
7368	images/properties/B55_P49_070968_1.png	41996
7369	images/properties/B55_P4_050768_1.png	9432
7370	images/properties/B55_P50_070968_1.png	41997
7371	images/properties/B55_P51_051976_1.png	41998
7372	images/properties/B55_P51_051976_2.png	41998
7373	images/properties/B55_P51_061976_1.png	41998
7374	images/properties/B55_P52_051976_1.png	41999
7375	images/properties/B55_P52_051976_2.png	41999
7376	images/properties/B55_P52_061976_1.png	41999
7377	images/properties/B55_P5_052868_1.png	9431
7378	images/properties/B55_P6_051468_1.png	9434
7379	images/properties/B55_P7_010367_1.png	9435
7380	images/properties/B55_P8_010367_1.png	9436
7381	images/properties/B55_P8_091565_1.png	9436
7382	images/properties/B55_P9_011267_1.png	9437
7383	images/properties/B56A_P13_031170_1.png	42000
7384	images/properties/B56A_P13_031170_2.png	42000
7385	images/properties/B56A_P25_081674_1.png	42001
7386	images/properties/B56A_P25_081674_2.png	42001
7387	images/properties/B56A_P4_081570_1.png	42002
7388	images/properties/B56A_P4_082170_1.png	42002
7389	images/properties/B56A_P4_nodate_1.png	42002
7390	images/properties/B56A_P4_nodate_2.png	42002
7391	images/properties/B56A_P4_nodate_3.png	42002
7392	images/properties/B56A_P4_nodate_4.png	42002
7393	images/properties/B56A_P4_nodate_5.png	42002
7394	images/properties/B56_P16_011974_1.png	42003
7395	images/properties/B56_P16_011974_2.png	42003
7396	images/properties/B56_P16_020674_1.png	42003
7397	images/properties/B56_P17_020674_1.png	14177
7398	images/properties/B56_P17_040274_1.png	14177
7399	images/properties/B56_P18_012174_1.png	42004
7400	images/properties/B56_P18_012174_2.png	42004
7401	images/properties/B56_P18_020674_1.png	42004
7402	images/properties/B56_P19_012474_1.png	42005
7403	images/properties/B56_P19_020674_1.png	42005
7404	images/properties/B56_P2_052068_1.png	14181
7405	images/properties/B56_P2_052268_1.png	14181
7406	images/properties/B56_P2_062066_1.png	14181
7407	images/properties/B56_P2_082775_1.png	14181
7408	images/properties/B56_P2_082775_2.png	14181
7409	images/properties/B56_P2_082775_3.png	14181
7410	images/properties/B56_P2_101075_1.png	14181
7411	images/properties/B56_P2_101075_2.png	14181
7412	images/properties/B56_P4_081570_1.png	42002
7413	images/properties/B56_P4_081870_1.png	42002
7414	images/properties/B56_P4_081870_2.png	42002
7415	images/properties/B57_P10_091565_1.png	42006
7416	images/properties/B57_P10_091565_2.png	42006
7417	images/properties/B57_P10_112566_1.png	42006
7418	images/properties/B57_P11_051668_1.png	42007
7419	images/properties/B57_P11_091565_1.png	42007
7420	images/properties/B57_P12_062066_1.png	42008
7421	images/properties/B57_P12_071268_1.png	42008
7422	images/properties/B57_P13_062066_1.png	42009
7423	images/properties/B57_P13_071068_1.png	42009
7424	images/properties/B57_P13_120966_1.png	42009
7425	images/properties/B57_P14_050868_1.png	42010
7426	images/properties/B57_P14_071368_1.png	42010
7427	images/properties/B57_P14_091565_1.png	42010
7428	images/properties/B57_P1_050868_1.png	42011
7429	images/properties/B57_P1_071368_1.png	42011
7430	images/properties/B57_P1_071368_2.png	42011
7431	images/properties/B57_P1_091565_1.png	42011
7432	images/properties/B57_P1_091565_2.png	42011
7433	images/properties/B57_P2_071668_1.png	42012
7434	images/properties/B57_P2_091565_1.png	42012
7435	images/properties/B57_P3_091565_1.png	42013
7436	images/properties/B57_P3_120666_1.png	42013
7437	images/properties/B57_P4_071568_1.png	42014
7438	images/properties/B57_P4_071568_2.png	42014
7439	images/properties/B57_P4_091565_1.png	42014
7440	images/properties/B57_P4_091565_2.png	42014
7441	images/properties/B57_P5_091565_1.png	42015
7442	images/properties/B57_P5_120666_1.png	42015
7443	images/properties/B57_P6_071568_1.png	42016
7444	images/properties/B57_P6_091565_1.png	42016
7445	images/properties/B57_P6_112566_1.png	42016
7446	images/properties/B57_P7_091565_1.png	42017
7447	images/properties/B57_P7_112366_1.png	42017
7448	images/properties/B57_P8_091565_1.png	42018
7449	images/properties/B57_P8_112366_1.png	42018
7450	images/properties/B57_P9_091565_1.png	42019
7451	images/properties/B57_P9_112366_1.png	42019
7452	images/properties/B58_P3_071968_1.png	42020
7453	images/properties/B58_P3_071968_2.png	42020
7454	images/properties/B58_P3_091565_1.png	42020
7455	images/properties/B58_P3_112666_1.png	42020
7456	images/properties/B58_P3_112666_2.png	42020
7457	images/properties/B58_P3_112666_3.png	42020
7458	images/properties/B58_P4_071868_1.png	42021
7459	images/properties/B58_P4_091565_1.png	42021
7460	images/properties/B58_P4_112566_1.png	42021
7461	images/properties/B58_P6_082968_1.png	42022
7462	images/properties/B58_P6_091565_1.png	42022
7463	images/properties/B58_P6_121066_1.png	42022
7464	images/properties/B59_P10_081268_1.png	42023
7465	images/properties/B59_P10_091565_1.png	42023
7466	images/properties/B59_P10_112366_1.png	42023
7467	images/properties/B59_P11_070866_1.png	42024
7468	images/properties/B59_P11_072268_1.png	42024
7469	images/properties/B59_P11_111766_1.png	42024
7470	images/properties/B59_P12_072268_1.png	42025
7471	images/properties/B59_P12_091565_1.png	42025
7472	images/properties/B59_P12_111666_1.png	42025
7473	images/properties/B59_P13A_072368_1.png	42026
7474	images/properties/B59_P13A_091565_1.png	42026
7475	images/properties/B59_P13A_112166_1.png	42026
7476	images/properties/B59_P13B_062066_1.png	42026
7477	images/properties/B59_P13B_072368_1.png	42026
7478	images/properties/B59_P13B_111666_1.png	42026
7479	images/properties/B59_P16_080968_1.png	42027
7480	images/properties/B59_P16_091565_1.png	42027
7481	images/properties/B59_P16_111666_1.png	42027
7482	images/properties/B59_P17_020570_1.png	42028
7483	images/properties/B59_P17_020570_2.png	42028
7484	images/properties/B59_P17_072368_1.png	42028
7485	images/properties/B59_P17_091565_1.png	42028
7486	images/properties/B59_P17_111766_1.png	42028
7487	images/properties/B59_P1_062066_1.png	42029
7488	images/properties/B59_P1_062066_2.png	42029
7489	images/properties/B59_P1_071968_1.png	42029
7490	images/properties/B59_P1_112566_1.png	42029
7491	images/properties/B59_P2_091565_1.png	42030
7492	images/properties/B59_P2_111168_1.png	42030
7493	images/properties/B59_P2_112166_1.png	42030
7494	images/properties/B59_P3_072268_1.png	42031
7495	images/properties/B59_P3_091565_1.png	42031
7496	images/properties/B59_P3_112266_1.png	42031
7497	images/properties/B59_P4_072268_1.png	42032
7498	images/properties/B59_P4_091565_1.png	42032
7499	images/properties/B59_P4_111866_1.png	42032
7500	images/properties/B59_P5_072268_1.png	42033
7501	images/properties/B59_P5_091565_1.png	42033
7502	images/properties/B59_P5_111866_1.png	42033
7503	images/properties/B59_P6_051375_1.png	42034
7504	images/properties/B59_P6_051375_2.png	42034
7505	images/properties/B59_P6_051375_3.png	42034
7506	images/properties/B59_P6_091565_1.png	42034
7507	images/properties/B59_P6_092368_1.png	42034
7508	images/properties/B59_P6_123166_1.png	42034
7509	images/properties/B59_P7_081368_1.png	42035
7510	images/properties/B59_P7_091565_1.png	42035
7511	images/properties/B59_P7_112666_1.png	42035
7512	images/properties/B59_P8_090668_1.png	42036
7513	images/properties/B59_P8_091565_1.png	42036
7514	images/properties/B59_P8_120766_1.png	42036
7515	images/properties/B59_P9_072268_1.png	42037
7516	images/properties/B59_P9_091565_1.png	42037
7517	images/properties/B59_P9_111866_1.png	42037
7518	images/properties/B5_P10_020674_1.png	42038
7519	images/properties/B5_P10_091565_1.png	42038
7520	images/properties/B5_P11_072268_1.png	42039
7521	images/properties/B5_P11_091565_1.png	42039
7522	images/properties/B5_P12_030971_2.PNG	42040
7523	images/properties/B5_P12_091565_1.PNG	42040
7524	images/properties/B5_P13_072768_1.PNG	42041
7525	images/properties/B5_P13_082775_3.PNG	42041
7526	images/properties/B5_P16_091565_1.PNG	42042
7527	images/properties/B5_P17_072268_1.PNG	42043
7528	images/properties/B5_P18_061565_1.PNG	42044
7529	images/properties/B5_P19_053168_1.PNG	42045
7530	images/properties/B5_P20_091368_1.PNG	42046
7531	images/properties/B5_P20_091565_1.PNG	42046
7532	images/properties/B5_P21_020172_1.png	42047
7533	images/properties/B5_P21_020172_2.png	42047
7534	images/properties/B5_P21_020172_3.png	42047
7535	images/properties/B5_P21_020172_4.png	42047
7536	images/properties/B5_P21_091565_1.png	42047
7537	images/properties/B5_P22_011166_1.png	42048
7538	images/properties/B5_P22_092168_1.png	42048
7539	images/properties/B5_P23_030153_1.png	42049
7540	images/properties/B5_P23_052868_1.png	42049
7541	images/properties/B5_P24_030147_1.png	42050
7542	images/properties/B5_P24_091565_1.png	42050
7543	images/properties/B5_P25_091565_1.png	42051
7544	images/properties/B5_P25_101468_1.png	42051
7545	images/properties/B5_P26_052968_1.png	42052
7546	images/properties/B5_P26_081668_1.png	42052
7547	images/properties/B5_P27_052968_1.png	42053
7548	images/properties/B5_P27_060166_1.png	42053
7549	images/properties/B5_P2_080368_1.png	42054
7550	images/properties/B5_P2_093066_1.png	42054
7551	images/properties/B5_P6_050868_1.png	42055
7552	images/properties/B5_P6_051275_2.png	42055
7553	images/properties/B5_P9_091565_1.png	42056
7554	images/properties/B5_P9_100666_1.png	42056
7555	images/properties/B60_P10_091565_1.png	42057
7556	images/properties/B60_P10_111566_1.png	42057
7557	images/properties/B60_P11_072568_1.png	42058
7558	images/properties/B60_P11_091565_1.png	42058
7559	images/properties/B60_P11_111866_1.png	42058
7560	images/properties/B60_P1_072368_1.png	42059
7561	images/properties/B60_P1_091565_1.png	42059
7562	images/properties/B60_P1_111666_1.png	42059
7563	images/properties/B60_P2_072368_1.png	42060
7564	images/properties/B60_P2_091565_1.png	42060
7565	images/properties/B60_P2_111666_1.png	42060
7566	images/properties/B60_P3_041974_1.png	42061
7567	images/properties/B60_P3_052572_1.png	42061
7568	images/properties/B60_P3_061274_1.png	42061
7569	images/properties/B60_P3_061274_2.png	42061
7570	images/properties/B60_P3_072368_1.png	42061
7571	images/properties/B60_P3_091565_1.png	42061
7572	images/properties/B60_P3_111766_1.png	42061
7573	images/properties/B60_P4_052368_1.png	42062
7574	images/properties/B60_P4_091565_1.png	42062
7575	images/properties/B60_P4_092668_1.png	42062
7576	images/properties/B60_P6_072468_1.png	42063
7577	images/properties/B60_P6_091565_1.png	42063
7578	images/properties/B60_P6_111666_1.png	42063
7579	images/properties/B60_P7_072468_1.png	42064
7580	images/properties/B60_P7_091565_1.png	42064
7581	images/properties/B60_P7_111666_1.png	42064
7582	images/properties/B60_P8_091565_1.png	42065
7583	images/properties/B60_P8_111866_1.png	42065
7584	images/properties/B60_P9_013077_1.png	42066
7585	images/properties/B60_P9_072968_1.png	42066
7586	images/properties/B60_P9_090565_1.png	42066
7587	images/properties/B60_P9_111566_1.png	42066
7588	images/properties/B61_P15_061274_1.png	42067
7589	images/properties/B61_P15_093074_1.png	42067
7590	images/properties/B61_P16_030174_1.png	42068
7591	images/properties/B61_P16_041474_1.png	42068
7592	images/properties/B61_P17_021373_1.png	42069
7593	images/properties/B61_P17_021373_2.png	42069
7594	images/properties/B61_P17_021373_3.png	42069
7595	images/properties/B61_P17_021373_4.png	42069
7596	images/properties/B61_P1_112377_1.png	42070
7597	images/properties/B61_P1_112377_2.png	42070
7598	images/properties/B61_P1_112377_3.png	42070
7599	images/properties/B61_P1_112377_4.png	42070
7600	images/properties/B61_P1_112377_5.png	42070
7601	images/properties/B61_P1_112377_6.png	42070
7602	images/properties/B61_P5A_081974_1.png	42071
7603	images/properties/B61_P5A_081974_2.png	42071
7604	images/properties/B61_P5A_100874_1.png	42071
7605	images/properties/B61_P5A_100874_2.png	42071
7606	images/properties/B61_P5B_081974_1.png	42071
7607	images/properties/B61_P5B_100874_1.png	42071
7608	images/properties/B61_P6_081974_1.png	42072
7609	images/properties/B61_P6_081974_2.png	42072
7610	images/properties/B61_P6_100974_1.png	42072
7611	images/properties/B62_P1A_022074_1.png	42073
7612	images/properties/B62_P1A_022074_2.png	42073
7613	images/properties/B62_P1A_041474_1.png	42073
7614	images/properties/B62_P1B_022074_1.png	42073
7615	images/properties/B62_P1B_022074_2.png	42073
7616	images/properties/B62_P1B_041474_1.png	42073
7617	images/properties/B62_P2_022074_1.png	42074
7618	images/properties/B62_P2_022074_2.png	42074
7619	images/properties/B62_P2_041474_1.png	42074
7620	images/properties/B62_P3_011674_1.png	42075
7621	images/properties/B62_P3_011674_2.png	42075
7622	images/properties/B62_P3_040674_1.png	42075
7623	images/properties/B62_P4_022074_1.png	42076
7624	images/properties/B62_P4_041474_1.png	42076
7625	images/properties/B62_P5_022074_1.png	42077
7626	images/properties/B62_P5_022074_2.png	42077
7627	images/properties/B62_P5_041474_1.png	42077
7628	images/properties/B62_P6_062066_1.png	42078
7629	images/properties/B62_P6_062066_2.png	42078
7630	images/properties/B62_P6_062066_3.png	42078
7631	images/properties/B62_P6_062066_4.png	42078
7632	images/properties/B62_P6_080668_1.png	42078
7633	images/properties/B62_P6_080768_1.png	42078
7634	images/properties/B62_P6_080768_2.png	42078
7635	images/properties/B62_P6_080768_3.png	42078
7636	images/properties/B62_P6_080768_4.png	42078
7637	images/properties/B62_P6_080768_5.png	42078
7638	images/properties/B62_P6_nodate_1.png	42078
7639	images/properties/B62_P6_nodate_2.png	42078
7640	images/properties/B62_P6_nodate_3.png	42078
7641	images/properties/B62_P6_nodate_4.png	42078
7642	images/properties/B62_P6_nodate_5.png	42078
7643	images/properties/B63_P12_011574_1.png	42079
7644	images/properties/B63_P12_011574_2.png	42079
7645	images/properties/B63_P12_020674_1.png	42079
7646	images/properties/B64_P5_030475_1.png	42080
7647	images/properties/B64_P5_030475_2.png	42080
7648	images/properties/B64_P5_030475_3.png	42080
7649	images/properties/B64_P5_030475_4.png	42080
7650	images/properties/B6_P12_090469_1.png	42081
7651	images/properties/B6_P13_030174_1.png	42082
7652	images/properties/B6_P13_052374_1.png	42082
7653	images/properties/B6_P13_062066_1.png	42082
7654	images/properties/B6_P13_081668_1.png	42082
7655	images/properties/B6_P14A_011074_1.png	42083
7656	images/properties/B6_P14A_011074_2.png	42083
7657	images/properties/B6_P14A_020674_1.png	42083
7658	images/properties/B6_P14C_011074_1.png	42083
7659	images/properties/B6_P14C_011074_2.png	42083
7660	images/properties/B6_P14C_020674_1.png	42083
7661	images/properties/B6_P15_082368_1.png	42084
7662	images/properties/B6_P15_091565_1.png	42084
7663	images/properties/B6_P15_092966_1.png	42084
7664	images/properties/B6_P17_082368_1.png	42085
7665	images/properties/B6_P17_082368_2.png	42085
7666	images/properties/B6_P17_101966_1.png	42085
7667	images/properties/B6_P1_080568_1.png	42086
7668	images/properties/B6_P1_091565_1.png	42086
7669	images/properties/B6_P1_100568_1.png	42086
7670	images/properties/B6_P1_100568_2.png	42086
7671	images/properties/B6_P21_082368_1.png	42087
7672	images/properties/B6_P21_082368_2.png	42087
7673	images/properties/B6_P21_091565_1.png	42087
7674	images/properties/B6_P22_070165_1.png	42088
7675	images/properties/B6_P22_070165_2.png	42088
7676	images/properties/B6_P22_070165_3.png	42088
7677	images/properties/B6_P22_090768_1.png	42088
7678	images/properties/B6_P22_090768_2.png	42088
7679	images/properties/B6_P25_079165_1.png	42089
7680	images/properties/B6_P25_082368_1.png	42089
7681	images/properties/B6_P2_090165_1.png	42090
7682	images/properties/B6_P2_nodate_1.png	42090
7683	images/properties/B6_P2_nodate_2.png	42090
7684	images/properties/B6_P36_031674_1.png	42091
7685	images/properties/B6_P36_041474_1.png	42091
7686	images/properties/B6_P37_082468_1.png	42092
7687	images/properties/B6_P37_082775_1.png	42092
7688	images/properties/B6_P37_101375_1.png	42092
7689	images/properties/B6_P37_101375_2.png	42092
7690	images/properties/B6_P37_101375_3.png	42092
7691	images/properties/B6_P37_nodate_1.png	42092
7692	images/properties/B6_P37_nodate_2.png	42092
7693	images/properties/B6_P37_nodate_3.png	42092
7694	images/properties/B6_P38_030575_1.png	42093
7695	images/properties/B6_P38_030575_2.png	42093
7696	images/properties/B6_P38_030575_3.png	42093
7697	images/properties/B6_P38_030575_4.png	42093
7698	images/properties/B6_P38_030575_5.png	42093
7699	images/properties/B6_P38_030575_6.png	42093
7700	images/properties/B6_P38_091565_1.png	42093
7701	images/properties/B6_P38_092668_1.png	42093
7702	images/properties/B6_P38_092668_2.png	42093
7703	images/properties/B6_P38_nodate_1.png	42093
7704	images/properties/B6_P38_nodate_2.png	42093
7705	images/properties/B6_P39_082468_1.png	42094
7706	images/properties/B6_P39_092474_1.png	42094
7707	images/properties/B6_P39_093074_1.png	42094
7708	images/properties/B6_P39_101366_1.png	42094
7709	images/properties/B6_P3_082668_1.png	42095
7710	images/properties/B6_P3_091565_1.png	42095
7711	images/properties/B6_P3_101568_1.png	42095
7712	images/properties/B6_P40_nodate_1.png	42096
7713	images/properties/B6_P40_nodate_2.png	42096
7714	images/properties/B6_P40_nodate_3.png	42096
7715	images/properties/B6_P41_083168_1.png	42097
7716	images/properties/B6_P41_nodate_1.png	42097
7717	images/properties/B6_P41_nodate_2.png	42097
7718	images/properties/B6_P42_090768_1.png	42098
7719	images/properties/B6_P42_101166_1.png	42098
7720	images/properties/B6_P43_101166_1.png	42099
7721	images/properties/B6_P43_nodate_1.png	42099
7722	images/properties/B6_P44_030474_1.png	42100
7723	images/properties/B6_P44_030474_2.png	42100
7724	images/properties/B6_P44_030474_3.png	42100
7725	images/properties/B6_P44_041474_1.png	42100
7726	images/properties/B6_P44_041474_2.png	42100
7727	images/properties/B6_P47_090768_1.png	42101
7728	images/properties/B6_P47_091565_1.png	42101
7729	images/properties/B6_P48_083168_1.png	42102
7730	images/properties/B6_P48_083168_2.png	42102
7731	images/properties/B6_P48_101166_1.png	42102
7732	images/properties/B6_P49_091565_1.png	42103
7733	images/properties/B6_P49_091565_2.png	42103
7734	images/properties/B6_P49_111568_1.png	42103
7735	images/properties/B6_P49_111568_2.png	42103
7736	images/properties/B6_P49_111568_3.png	42103
7737	images/properties/B6_P49_nodate_1.png	42103
7738	images/properties/B6_P49_nodate_2.png	42103
7739	images/properties/B6_P4_081668_1.png	42104
7740	images/properties/B6_P4_103068_1.png	42104
7741	images/properties/B6_P50_091565_1.png	42105
7742	images/properties/B6_P51_nodate_1.png	42106
7743	images/properties/B6_P51_nodate_2.png	42106
7744	images/properties/B6_P52_nodate_1.png	42107
7745	images/properties/B6_P52_nodate_2.png	42107
7746	images/properties/B6_P53_083168_1.png	42108
7747	images/properties/B6_P53_nodate_1.png	42108
7748	images/properties/B6_P54_120668_1.png	42109
7749	images/properties/B6_P54_nodate_1.png	42109
7750	images/properties/B6_P55_091468_1.png	42110
7751	images/properties/B6_P55_091468_2.png	42110
7752	images/properties/B6_P55_nodate_1.png	42110
7753	images/properties/B6_P56_091468_1.png	42111
7754	images/properties/B6_P56_nodate_1.png	42111
7755	images/properties/B6_P57_091565_1.png	42112
7756	images/properties/B6_P57_100566_1.png	42112
7757	images/properties/B6_P58_050575_1.png	42113
7758	images/properties/B6_P58_050575_2.png	42113
7759	images/properties/B6_P58_050575_3.png	42113
7760	images/properties/B6_P58_050575_4.png	42113
7761	images/properties/B6_P58_050575_5.png	42113
7762	images/properties/B6_P58_050575_6.png	42113
7763	images/properties/B6_P58_050575_7.png	42113
7764	images/properties/B6_P58_091565_1.png	42113
7765	images/properties/B6_P58_091565_2.png	42113
7766	images/properties/B6_P58_100566_1.png	42113
7767	images/properties/B6_P59_091565_1.png	42114
7768	images/properties/B6_P59_091565_2.png	42114
7769	images/properties/B6_P59_092168_1.png	42114
7770	images/properties/B6_P59_092168_2.png	42114
7771	images/properties/B6_P59_093066_1.png	42114
7772	images/properties/B6_P5_030774_1.png	42115
7773	images/properties/B6_P5_030774_2.png	42115
7774	images/properties/B6_P5_030774_3.png	42115
7775	images/properties/B6_P5_041474_1.png	42115
7776	images/properties/B6_P5_041474_2.png	42115
7777	images/properties/B6_P60_091565_1.png	42116
7778	images/properties/B6_P60_092168_1.png	42116
7779	images/properties/B6_P61_091468_1.png	42117
7780	images/properties/B6_P61_091565_1.png	42117
7781	images/properties/B6_P62_091468_1.png	42118
7782	images/properties/B6_P62_093066_1.png	42118
7783	images/properties/B6_P63_070866_1.png	42119
7784	images/properties/B6_P63_091463_1.png	42119
7785	images/properties/B6_P65_091468_1.png	42120
7786	images/properties/B6_P65_091565_1.png	42120
7787	images/properties/B6_P66_091565_1.png	42121
7788	images/properties/B6_P66_092966_1.png	42121
7789	images/properties/B6_P67_082268_1.png	42122
7790	images/properties/B6_P67_091468_1.png	42122
7791	images/properties/B6_P68_062066_1.png	42123
7792	images/properties/B6_P68_091468_1.png	42123
7793	images/properties/B6_P69_062066_1.png	42124
7794	images/properties/B6_P69_093066_1.png	42124
7795	images/properties/B6_P6_080668_1.png	42125
7796	images/properties/B6_P6_091565_1.png	42125
7797	images/properties/B6_P6_101568_1.png	42125
7798	images/properties/B6_P70_070866_1.png	42126
7799	images/properties/B6_P70_092168_1.png	42126
7800	images/properties/B6_P72_011574_1.png	42127
7801	images/properties/B6_P72_011574_2.png	42127
7802	images/properties/B6_P72_020674_1.png	42127
7803	images/properties/B6_P75_072077_1.png	42128
7804	images/properties/B6_P75_072077_2.png	42128
7805	images/properties/B6_P75_072077_3.png	42128
7806	images/properties/B6_P75_081277_1.png	42128
7807	images/properties/B6_P75_091565_1.png	42128
7808	images/properties/B6_P75_091565_2.png	42128
7809	images/properties/B6_P75_092966_1.png	42128
7810	images/properties/B6_P75_092966_2.png	42128
7811	images/properties/B6_P75_110268_1.png	42128
7812	images/properties/B6_P75_110268_2.png	42128
7813	images/properties/B6_P75_110268_3.png	42128
7814	images/properties/B6_P75_110268_4.png	42128
7815	images/properties/B6_P75_nodate_1.png	42128
7816	images/properties/B6_P77_091565_1.png	42129
7817	images/properties/B6_P77_091565_2.png	42129
7818	images/properties/B6_P78_092166_1.png	42130
7819	images/properties/B6_P78_110268_1.png	42130
7820	images/properties/B6_P79_091565_1.png	42131
7821	images/properties/B6_P79_091565_2.png	42131
7822	images/properties/B6_P79_091565_3.png	42131
7823	images/properties/B6_P79_092266_1.png	42131
7824	images/properties/B6_P79_111568_1.png	42131
7825	images/properties/B6_P79_nodate_1.png	42131
7826	images/properties/B6_P79_nodate_2.png	42131
7827	images/properties/B6_P79_nodate_3.png	42131
7828	images/properties/B6_P79_nodate_4.png	42131
7829	images/properties/B6_P7_091565_1.png	42132
7830	images/properties/B6_P7_101868_1.png	42132
7831	images/properties/B6_P8_062266_1.png	42133
7832	images/properties/B71_P10_021567_1.png	42134
7833	images/properties/B71_P10_062066_1.png	42134
7834	images/properties/B71_P10_070568_1.png	42134
7835	images/properties/B71_P11_021567_1.png	42135
7836	images/properties/B71_P11_062066_1.png	42135
7837	images/properties/B71_P11_070568_1.png	42135
7838	images/properties/B71_P12_021667_1.png	42136
7839	images/properties/B71_P12_062066_1.png	42136
7840	images/properties/B71_P12_070568_1.png	42136
7841	images/properties/B71_P13_021667_1.png	42137
7842	images/properties/B71_P13_062066_1.png	42137
7843	images/properties/B71_P13_070568_1.png	42137
7844	images/properties/B71_P14_021567_1.png	42138
7845	images/properties/B71_P14_062066_1.png	42138
7846	images/properties/B71_P14_070568_1.png	42138
7847	images/properties/B71_P15_022467_1.png	42139
7848	images/properties/B71_P15_062066_1.png	42139
7849	images/properties/B71_P15_062066_2.png	42139
7850	images/properties/B71_P15_082376_1.png	42139
7851	images/properties/B71_P15_082376_2.png	42139
7852	images/properties/B71_P15_082376_3.png	42139
7853	images/properties/B71_P15_082376_4.png	42139
7854	images/properties/B71_P15_082376_5.png	42139
7855	images/properties/B71_P15_082376_6.png	42139
7856	images/properties/B71_P15_082376_7.png	42139
7857	images/properties/B71_P15_090376_1.png	42139
7858	images/properties/B71_P15_nodate_1.png	42139
7859	images/properties/B71_P15_nodate_2.png	42139
7860	images/properties/B71_P15_nodate_3.png	42139
7861	images/properties/B71_P15_nodate_4.png	42139
7862	images/properties/B71_P15_nodate_5.png	42139
7863	images/properties/B71_P16_070866_1.png	42140
7864	images/properties/B71_P16_081968_1.png	42140
7865	images/properties/B71_P16_082368_1.png	42140
7866	images/properties/B71_P17_022267_1.png	42141
7867	images/properties/B71_P17_062066_1.png	42141
7868	images/properties/B71_P17_070568_1.png	42141
7869	images/properties/B71_P18_070866_1.png	42142
7870	images/properties/B71_P18_070866_2.png	42142
7871	images/properties/B71_P18_071568_1.png	42142
7872	images/properties/B71_P18_080168_1.png	42142
7873	images/properties/B71_P19_022267_1.png	42143
7874	images/properties/B71_P19_070866_1.png	42143
7875	images/properties/B71_P19_071568_1.png	42143
7876	images/properties/B71_P1_010276_1.png	42144
7877	images/properties/B71_P1_010276_2.png	42144
7878	images/properties/B71_P1_010276_3.png	42144
7879	images/properties/B71_P1_010276_4.png	42144
7880	images/properties/B71_P1_010276_5.png	42144
7881	images/properties/B71_P1_010276_6.png	42144
7882	images/properties/B71_P1_010276_7.png	42144
7883	images/properties/B71_P20_030467_1.png	42145
7884	images/properties/B71_P20_070866_1.png	42145
7885	images/properties/B71_P20_070866_2.png	42145
7886	images/properties/B71_P20_070866_3.png	42145
7887	images/properties/B71_P20_070866_4.png	42145
7888	images/properties/B71_P20_070866_5.png	42145
7889	images/properties/B71_P20_073068_1.png	42145
7890	images/properties/B71_P20_080368_1.png	42145
7891	images/properties/B71_P20_080368_2.png	42145
7892	images/properties/B71_P22_022467_1.png	42146
7893	images/properties/B71_P22_041974_1.png	42146
7894	images/properties/B71_P22_051976_1.png	42146
7895	images/properties/B71_P22_051976_2.png	42146
7896	images/properties/B71_P22_061274_1.png	42146
7897	images/properties/B71_P22_061976_1.png	42146
7898	images/properties/B71_P22_070568_1.png	42146
7899	images/properties/B71_P23_030267_1.png	42147
7900	images/properties/B71_P23_062066_1.png	42147
7901	images/properties/B71_P23_070968_1.png	42147
7902	images/properties/B71_P24_062066_1.png	42148
7903	images/properties/B71_P24_072768_1.png	42148
7904	images/properties/B71_P25_022467_1.png	42149
7905	images/properties/B71_P25_062066_1.png	42149
7906	images/properties/B71_P25_070968_1.png	42149
7907	images/properties/B71_P26_062066_1.png	42150
7908	images/properties/B71_P26_081168_1.png	42150
7909	images/properties/B71_P26_082968_1.png	42150
7910	images/properties/B71_P27_022367_1.png	42151
7911	images/properties/B71_P27_062066_1.png	42151
7912	images/properties/B71_P27_070968_1.png	42151
7913	images/properties/B71_P28_022567_1.png	42152
7914	images/properties/B71_P28_062066_1.png	42152
7915	images/properties/B71_P28_082068_1.png	42152
7916	images/properties/B71_P29_121175_1.png	42153
7917	images/properties/B71_P29_121175_2.png	42153
7918	images/properties/B71_P2_102075_1.png	42154
7919	images/properties/B71_P2_102075_2.png	42154
7920	images/properties/B71_P2_102275_1.png	42154
7921	images/properties/B71_P30_010276_1.png	42155
7922	images/properties/B71_P30_010276_2.png	42155
7923	images/properties/B71_P30_010276_3.png	42155
7924	images/properties/B71_P31_121175_1.png	42156
7925	images/properties/B71_P31_121175_2.png	42156
7926	images/properties/B71_P32_121175_1.png	42157
7927	images/properties/B71_P32_121175_2.png	42157
7928	images/properties/B71_P32_121175_3.png	42157
7929	images/properties/B71_P3_102075_1.png	42158
7930	images/properties/B71_P3_102075_2.png	42158
7931	images/properties/B71_P3_102275_1.png	42158
7932	images/properties/B71_P4_102275_1.png	42159
7933	images/properties/B71_P4_102275_2.png	42159
7934	images/properties/B71_P4_102275_3.png	42159
7935	images/properties/B71_P5_102275_1.png	42160
7936	images/properties/B71_P5_102275_2.png	42160
7937	images/properties/B71_P5_102275_3.png	42160
7938	images/properties/B71_P6_102275_1.png	42161
7939	images/properties/B71_P6_102275_2.png	42161
7940	images/properties/B71_P6_102275_3.png	42161
7941	images/properties/B71_P7_102175_1.png	42162
7942	images/properties/B71_P7_102175_2.png	42162
7943	images/properties/B71_P7_102175_3.png	42162
7944	images/properties/B71_P8_102075_1.png	42163
7945	images/properties/B71_P8_102075_2.png	42163
7946	images/properties/B71_P8_102275_1.png	42163
7947	images/properties/B71_P9_021567_1.png	42164
7948	images/properties/B71_P9_062066_1.png	42164
7949	images/properties/B71_P9_070968_1.png	42164
7950	images/properties/B72_P10_011574_1.png	42165
7951	images/properties/B72_P10_011574_2.png	42165
7952	images/properties/B72_P10_020674_1.png	42165
7953	images/properties/B72_P10_020674_2.png	42165
7954	images/properties/B72_P10_080268_1.png	42165
7955	images/properties/B72_P1_093074_1.png	42166
7956	images/properties/B72_P1_093074_2.png	42166
7957	images/properties/B72_P1_112174_1.png	42166
7958	images/properties/B72_P2_100474_1.png	42167
7959	images/properties/B72_P2_100474_2.png	42167
7960	images/properties/B72_P2_112174_1.png	42167
7961	images/properties/B72_P2_112174_2.png	42167
7962	images/properties/B72_P2_112174_3.png	42167
7963	images/properties/B72_P3_030467_1.png	42168
7964	images/properties/B72_P3_062066_1.png	42168
7965	images/properties/B72_P3_072068_1.png	42168
7966	images/properties/B72_P4_021767_1.png	42169
7967	images/properties/B72_P4_070866_1.png	42169
7968	images/properties/B72_P4_081468_1.png	42169
7969	images/properties/B72_P5_021767_1.png	42170
7970	images/properties/B72_P5_062066_1.png	42170
7971	images/properties/B72_P5_071568_1.png	42170
7972	images/properties/B72_P6_021767_1.png	42171
7973	images/properties/B72_P6_062066_1.png	42171
7974	images/properties/B72_P6_072068_1.png	42171
7975	images/properties/B72_P7_021767_1.png	42172
7976	images/properties/B72_P7_062066_1.png	42172
7977	images/properties/B72_P7_071268_1.png	42172
7978	images/properties/B72_P8_111474_1.png	42173
7979	images/properties/B72_P8_120674_1.png	42173
7980	images/properties/B72_P9_082644_2.png	42174
7981	images/properties/B72_P9_082664_1.png	42174
7982	images/properties/B72_P9_082674_2.png	42174
7983	images/properties/B72_P9_092474_1.png	42174
7984	images/properties/B76_P1_031868_1.png	42175
7985	images/properties/B76_P1_070866_1.png	42175
7986	images/properties/B76_P2_031868_1.png	42176
7987	images/properties/B76_P2_062066_1.png	42176
7988	images/properties/B76_P2_072068_1.png	42176
7989	images/properties/B76_P3_031868_1.png	42177
7990	images/properties/B76_P3_062066_1.png	42177
7991	images/properties/B76_P3_071368_1.png	42177
7992	images/properties/B76_P4_031868_1.png	42178
7993	images/properties/B76_P4_062066_1.png	42178
7994	images/properties/B76_P4_071268_1.png	42178
7995	images/properties/B76_P5_031868_1.png	42179
7996	images/properties/B76_P5_062066_1.png	42179
7997	images/properties/B76_P5_071268_1.png	42179
7998	images/properties/B76_P6_032068_1.png	42180
7999	images/properties/B76_P6_062066_1.png	42180
8000	images/properties/B76_P6_062066_2.png	42180
8001	images/properties/B76_P7_031868_1.png	42181
8002	images/properties/B76_P7_062066_1.png	42181
8003	images/properties/B76_P7_081368_1.png	42181
8004	images/properties/B76_P8_031868_1.png	42182
8005	images/properties/B76_P8_062066_1.png	42182
8006	images/properties/B76_P8_071268_1.png	42182
8007	images/properties/B76_P9_031868_1.png	42183
8008	images/properties/B76_P9_062066_1.png	42183
8009	images/properties/B76_P9_071268_1.png	42183
8010	images/properties/B7_P14_070375_1.png	42184
8011	images/properties/B7_P14_070375_2.png	42184
8012	images/properties/B7_P14_070375_3.png	42184
8013	images/properties/B7_P14_070375_4.png	42184
8014	images/properties/B7_P14_070375_5.png	42184
8015	images/properties/B7_P14_070375_6.png	42184
8016	images/properties/B7_P14_070375_7.png	42184
8017	images/properties/B7_P14_070375_8.png	42184
8018	images/properties/B7_P14_070375_9.png	42184
8019	images/properties/B7_P14_071168_1.png	42184
8020	images/properties/B7_P14_082875_1.png	42184
8021	images/properties/B7_P14_082875_2.png	42184
8022	images/properties/B7_P14_082875_3.png	42184
8023	images/properties/B7_P14_082875_4.png	42184
8024	images/properties/B7_P14_082875_5.png	42184
8025	images/properties/B7_P14_091565_1.png	42184
8026	images/properties/B7_P14_091565_2.png	42184
8027	images/properties/B7_P14_091565_3.png	42184
8028	images/properties/B7_P14_091565_4.png	42184
8029	images/properties/B7_P14_091565_5.png	42184
8030	images/properties/B7_P14_091565_6.png	42184
8031	images/properties/B7_P14_091565_7.png	42184
8032	images/properties/B7_P14_102671_1.png	42184
8033	images/properties/B7_P14_102671_2.png	42184
8034	images/properties/B7_P14_102671_3.png	42184
8035	images/properties/B7_P14_nodate_1.png	42184
8036	images/properties/B7_P14_nodate_2 (1).png	42184
8037	images/properties/B7_P14_nodate_2.png	42184
8038	images/properties/B7_P14_nodate_3.png	42184
8039	images/properties/B7_P14_nodate_5.png	42184
8040	images/properties/B7_P14_nodate_6.png	42184
\.


--
-- Name: image_paths_image_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('humanface.image_paths_image_id_seq', 8040, true);


--
-- Data for Name: parcels; Type: TABLE DATA; Schema: humanface; Owner: postgres
--

COPY humanface.parcels (parcel_id, block_no, parcel_no, ward_no, land_use) FROM stdin;
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
14152	50	2	4	residential                                                     
14153	50	3	4	residential                                                     
14154	50	4	4	residential                                                     
14155	50	5	4	residential                                                     
14156	50	6	4	residential                                                     
14157	50	7	4	residential                                                     
14158	50	8	4	residential                                                     
14159	50	9	4	residential                                                     
14160	50	10	4	residential                                                     
14161	50	11	4	residential                                                     
14162	50	12	4	residential                                                     
14163	50	13	4	residential                                                     
14164	50	13	4	residential                                                     
14165	50	14	4	residential                                                     
14166	50	15	4	residential                                                     
14167	50	16	4	residential                                                     
14168	50	17	4	residential                                                     
14169	50	18	4	residential                                                     
14170	50	19	4	residential                                                     
14171	50	20	4	residential                                                     
14172	53	11	4	residential                                                     
14173	53	12	4	residential                                                     
14174	53	16	4	residential                                                     
14175	53	15	4	residential                                                     
14176	53	152	4	residential                                                     
14177	56	17	4	residential                                                     
14179	55	48	4	residential                                                     
14180	55	15	4	residential                                                     
14181	56	2	4	residential                                                     
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
42075	62	3	\N	\N
42076	62	4	\N	\N
42077	62	5	\N	\N
42078	62	6	\N	\N
42079	63	12	\N	\N
42080	64	5	\N	\N
42081	6	12	\N	\N
42082	6	13	\N	\N
42083	6	14	\N	\N
42084	6	15	\N	\N
42085	6	17	\N	\N
42086	6	1	\N	\N
42087	6	21	\N	\N
42088	6	22	\N	\N
42089	6	25	\N	\N
42090	6	2	\N	\N
42091	6	36	\N	\N
42092	6	37	\N	\N
42093	6	38	\N	\N
42094	6	39	\N	\N
42095	6	3	\N	\N
42096	6	40	\N	\N
42097	6	41	\N	\N
42098	6	42	\N	\N
42099	6	43	\N	\N
42100	6	44	\N	\N
42101	6	47	\N	\N
42102	6	48	\N	\N
42103	6	49	\N	\N
42104	6	4	\N	\N
42105	6	50	\N	\N
42106	6	51	\N	\N
42107	6	52	\N	\N
42108	6	53	\N	\N
42109	6	54	\N	\N
42110	6	55	\N	\N
42111	6	56	\N	\N
42112	6	57	\N	\N
42113	6	58	\N	\N
42114	6	59	\N	\N
42115	6	5	\N	\N
42116	6	60	\N	\N
42117	6	61	\N	\N
42118	6	62	\N	\N
42119	6	63	\N	\N
42120	6	65	\N	\N
42121	6	66	\N	\N
42122	6	67	\N	\N
42123	6	68	\N	\N
42124	6	69	\N	\N
42125	6	6	\N	\N
42126	6	70	\N	\N
42127	6	72	\N	\N
42128	6	75	\N	\N
42129	6	77	\N	\N
42130	6	78	\N	\N
42131	6	79	\N	\N
42132	6	7	\N	\N
42133	6	8	\N	\N
42134	71	10	\N	\N
42135	71	11	\N	\N
42136	71	12	\N	\N
42137	71	13	\N	\N
42138	71	14	\N	\N
42139	71	15	\N	\N
42140	71	16	\N	\N
42141	71	17	\N	\N
42142	71	18	\N	\N
42143	71	19	\N	\N
42144	71	1	\N	\N
42145	71	20	\N	\N
42146	71	22	\N	\N
42147	71	23	\N	\N
42148	71	24	\N	\N
42149	71	25	\N	\N
42150	71	26	\N	\N
42151	71	27	\N	\N
42152	71	28	\N	\N
42153	71	29	\N	\N
42154	71	2	\N	\N
42155	71	30	\N	\N
42156	71	31	\N	\N
42157	71	32	\N	\N
42158	71	3	\N	\N
42159	71	4	\N	\N
42160	71	5	\N	\N
42161	71	6	\N	\N
42162	71	7	\N	\N
42163	71	8	\N	\N
42164	71	9	\N	\N
42165	72	10	\N	\N
42166	72	1	\N	\N
42167	72	2	\N	\N
42168	72	3	\N	\N
42169	72	4	\N	\N
42170	72	5	\N	\N
42171	72	6	\N	\N
42172	72	7	\N	\N
42173	72	8	\N	\N
42174	72	9	\N	\N
42175	76	1	\N	\N
42176	76	2	\N	\N
42177	76	3	\N	\N
42178	76	4	\N	\N
42179	76	5	\N	\N
42180	76	6	\N	\N
42181	76	7	\N	\N
42182	76	8	\N	\N
42183	76	9	\N	\N
42184	7	14	\N	\N
41373	10	12	\N	\N
41374	10	13	\N	\N
41375	10	14	\N	\N
41376	10	15	\N	\N
41377	10	16	\N	\N
41378	10	17	\N	\N
41379	10	18	\N	\N
41380	10	19	\N	\N
41381	10	2	\N	\N
41382	10	3	\N	\N
41383	10	4	\N	\N
41384	10	6	\N	\N
41385	11	10	\N	\N
41386	11	11	\N	\N
41387	11	12	\N	\N
41388	11	14	\N	\N
41389	11	15	\N	\N
41390	11	16	\N	\N
41391	11	17	\N	\N
41392	11	18	\N	\N
41393	11	19	\N	\N
41394	11	20	\N	\N
41395	11	21	\N	\N
41396	11	22	\N	\N
41397	11	23	\N	\N
41398	11	24	\N	\N
41399	11	25	\N	\N
41400	11	27	\N	\N
41401	11	28	\N	\N
41402	11	29	\N	\N
41403	11	2	\N	\N
41404	11	30	\N	\N
41405	11	31	\N	\N
41406	11	32	\N	\N
41407	11	33	\N	\N
41408	11	34	\N	\N
41409	11	35	\N	\N
41410	11	36	\N	\N
41411	11	37	\N	\N
41412	11	38	\N	\N
41413	11	39	\N	\N
41414	11	3	\N	\N
41415	11	40	\N	\N
41416	11	41	\N	\N
41417	11	42	\N	\N
41418	11	43	\N	\N
41419	11	44	\N	\N
41420	11	45	\N	\N
41421	11	4	\N	\N
41422	11	5	\N	\N
41423	11	6	\N	\N
41424	11	7	\N	\N
41425	11	8	\N	\N
41426	11	9	\N	\N
41427	14	12	\N	\N
41428	14	13	\N	\N
41429	14	14	\N	\N
41430	14	15	\N	\N
41431	14	16	\N	\N
41432	14	1	\N	\N
41433	14	2	\N	\N
41434	15	12	\N	\N
41435	15	13	\N	\N
41436	15	14	\N	\N
41437	15	15	\N	\N
41438	15	16	\N	\N
41439	15	17	\N	\N
41440	15	18	\N	\N
41441	15	19	\N	\N
41442	15	1	\N	\N
41443	15	2	\N	\N
41444	15	7	\N	\N
41445	15	8	\N	\N
41446	16	10	\N	\N
41447	16	11	\N	\N
41448	16	12	\N	\N
41449	16	13	\N	\N
41450	16	14	\N	\N
41451	16	15	\N	\N
41452	16	16	\N	\N
41453	16	17	\N	\N
41454	16	18	\N	\N
41455	16	19	\N	\N
41456	16	1	\N	\N
41457	16	20	\N	\N
41458	16	2	\N	\N
41459	16	3	\N	\N
41460	16	4	\N	\N
41461	16	5	\N	\N
41462	16	6	\N	\N
41463	16	7	\N	\N
41464	16	8	\N	\N
41465	16	9	\N	\N
41466	17	10	\N	\N
41467	17	11	\N	\N
41468	17	12	\N	\N
41469	17	13	\N	\N
41470	17	14	\N	\N
41471	17	15	\N	\N
41472	17	17	\N	\N
41473	17	19	\N	\N
41474	17	1	\N	\N
41475	17	20	\N	\N
41476	17	21	\N	\N
41477	17	22	\N	\N
41478	17	23	\N	\N
41479	17	24	\N	\N
41480	17	25	\N	\N
41481	17	26	\N	\N
41482	17	27	\N	\N
41483	17	28	\N	\N
41484	17	29	\N	\N
41485	17	2	\N	\N
41486	17	30	\N	\N
41487	17	32	\N	\N
41488	17	33	\N	\N
41489	17	34	\N	\N
41490	17	35	\N	\N
41491	17	36	\N	\N
41492	17	37	\N	\N
41493	17	3	\N	\N
41494	17	4	\N	\N
41495	17	5	\N	\N
41496	17	6	\N	\N
41497	17	8	\N	\N
41498	17	9	\N	\N
41499	18	3	\N	\N
41500	18	4	\N	\N
41501	18	5	\N	\N
41502	18	6	\N	\N
41503	18	7	\N	\N
41504	19	10	\N	\N
41505	19	11	\N	\N
41506	19	13	\N	\N
41507	19	14	\N	\N
41508	19	17	\N	\N
41509	19	18	\N	\N
41510	19	1	\N	\N
41511	19	22	\N	\N
41512	19	23	\N	\N
41513	19	24	\N	\N
41514	19	25	\N	\N
41515	19	26	\N	\N
41516	19	27	\N	\N
41517	19	28	\N	\N
41518	19	29	\N	\N
41519	19	2	\N	\N
41520	19	3	\N	\N
41521	19	5	\N	\N
41522	19	6	\N	\N
41523	19	9	\N	\N
41524	1	10	\N	\N
41525	1	11	\N	\N
41526	1	12	\N	\N
41527	1	13	\N	\N
41528	1	14	\N	\N
41529	1	15	\N	\N
41530	1	16	\N	\N
41531	1	17	\N	\N
41532	1	18	\N	\N
41533	1	19	\N	\N
41534	1	20	\N	\N
41535	1	21	\N	\N
41536	1	22	\N	\N
41537	1	24	\N	\N
41538	1	25	\N	\N
41539	1	27	\N	\N
41540	1	28	\N	\N
41541	1	29	\N	\N
41542	1	2	\N	\N
41543	1	30	\N	\N
41544	1	31	\N	\N
41545	1	32	\N	\N
41546	1	33	\N	\N
41547	1	34	\N	\N
41548	1	35	\N	\N
41549	1	36	\N	\N
41550	1	37	\N	\N
41551	1	38	\N	\N
41552	1	39	\N	\N
41553	1	3	\N	\N
41554	1	40	\N	\N
41555	1	41	\N	\N
41556	1	42	\N	\N
41557	1	43	\N	\N
41558	1	44	\N	\N
41559	1	45	\N	\N
41560	1	46	\N	\N
41561	1	47	\N	\N
41562	1	48	\N	\N
41563	1	49	\N	\N
41564	1	4	\N	\N
41565	1	50	\N	\N
41566	1	51	\N	\N
41567	1	5	\N	\N
41568	1	6	\N	\N
41569	1	7	\N	\N
41570	1	8	\N	\N
41571	1	9	\N	\N
41572	20	1	\N	\N
41573	20	24	\N	\N
41574	20	2	\N	\N
41575	20	6	\N	\N
41576	20	7	\N	\N
41577	21	13	\N	\N
41578	21	14	\N	\N
41579	21	6	\N	\N
41580	25	10	\N	\N
41581	25	1	\N	\N
41582	25	2	\N	\N
41583	25	3	\N	\N
41584	25	4	\N	\N
41585	25	5	\N	\N
41586	25	6	\N	\N
41587	25	7	\N	\N
41588	25	8	\N	\N
41589	25	9	\N	\N
41590	26	1	\N	\N
41591	26	2	\N	\N
41592	26	3	\N	\N
41593	26	4	\N	\N
41594	26	5	\N	\N
41595	26	6	\N	\N
41596	26	7	\N	\N
41597	26	8	\N	\N
41598	27	10	\N	\N
41599	27	11	\N	\N
41600	27	12	\N	\N
41601	27	13	\N	\N
41602	27	14	\N	\N
41603	27	15	\N	\N
41604	27	16	\N	\N
41605	27	17	\N	\N
41606	27	18	\N	\N
41607	27	19	\N	\N
41608	27	1	\N	\N
41609	27	20	\N	\N
41610	27	21	\N	\N
41611	27	22	\N	\N
41612	27	23	\N	\N
41613	27	24	\N	\N
41614	27	25	\N	\N
41615	27	26	\N	\N
41616	27	27	\N	\N
41617	27	28	\N	\N
41618	27	29	\N	\N
41619	27	2	\N	\N
41620	27	3	\N	\N
41621	27	4	\N	\N
41622	27	5	\N	\N
41623	27	6	\N	\N
41624	27	7	\N	\N
41625	27	8	\N	\N
41626	28	10	\N	\N
41627	28	11	\N	\N
41628	28	12	\N	\N
41629	28	13	\N	\N
41630	28	14	\N	\N
41631	28	15	\N	\N
41632	28	16	\N	\N
41633	28	18	\N	\N
41634	28	19	\N	\N
41635	28	1	\N	\N
41636	28	20	\N	\N
41637	28	21	\N	\N
41638	28	22	\N	\N
41639	28	23	\N	\N
41640	28	3	\N	\N
41641	28	4	\N	\N
41642	28	5	\N	\N
41643	28	6	\N	\N
41644	28	7	\N	\N
41645	28	8	\N	\N
41646	28	9	\N	\N
41647	29	12	\N	\N
41648	29	1	\N	\N
41649	29	3	\N	\N
41650	29	7	\N	\N
41651	2	1	\N	\N
41652	2	2	\N	\N
41653	30	27	\N	\N
41654	31	23	\N	\N
41655	32	14	\N	\N
41656	33	10	\N	\N
41657	33	11	\N	\N
41658	33	1	\N	\N
41659	33	5	\N	\N
41660	33	7	\N	\N
41661	34	10	\N	\N
41662	34	11	\N	\N
41663	34	12	\N	\N
41664	34	13	\N	\N
41665	34	14	\N	\N
41666	34	15	\N	\N
41667	34	16	\N	\N
41668	34	17	\N	\N
41669	34	18	\N	\N
41670	34	1	\N	\N
41671	34	2	\N	\N
41672	34	3	\N	\N
41673	34	4	\N	\N
41674	34	5	\N	\N
41675	34	6	\N	\N
41676	34	7	\N	\N
41677	34	8	\N	\N
41678	34	9	\N	\N
41679	35	1	\N	\N
41680	35	2	\N	\N
41681	35	3	\N	\N
41682	35	4	\N	\N
41683	35	7	\N	\N
41684	35	8	\N	\N
41685	36	3	\N	\N
41686	36	4	\N	\N
41687	36	6	\N	\N
41688	36	7	\N	\N
41689	36	8	\N	\N
41690	37	10	\N	\N
41691	37	11	\N	\N
41692	37	2	\N	\N
41693	37	3	\N	\N
41694	37	4	\N	\N
41695	37	5	\N	\N
41696	37	6	\N	\N
41697	37	7	\N	\N
41698	37	8	\N	\N
41699	37	9	\N	\N
41700	38	13	\N	\N
41701	38	15	\N	\N
41702	38	16	\N	\N
41703	38	17	\N	\N
41704	38	6	\N	\N
41705	39	10	\N	\N
41706	39	11	\N	\N
41707	39	15	\N	\N
41708	39	16	\N	\N
41709	39	17	\N	\N
41710	3	11	\N	\N
41711	3	13	\N	\N
41712	3	14	\N	\N
41713	3	15	\N	\N
41714	3	16	\N	\N
41715	3	17	\N	\N
41716	3	18	\N	\N
41717	3	19	\N	\N
41718	3	20	\N	\N
41719	3	21	\N	\N
41720	3	22	\N	\N
41721	3	23	\N	\N
41722	3	24	\N	\N
41723	3	25	\N	\N
41724	3	2	\N	\N
41725	3	3	\N	\N
41726	3	4	\N	\N
41727	3	5	\N	\N
41728	3	6	\N	\N
41729	3	7	\N	\N
41730	3	8	\N	\N
41731	3	9	\N	\N
41732	40	10	\N	\N
41733	40	11	\N	\N
41734	40	12	\N	\N
41735	40	13	\N	\N
41736	40	14	\N	\N
41737	40	15	\N	\N
41738	40	16	\N	\N
41739	40	17	\N	\N
41740	40	18	\N	\N
41741	40	19	\N	\N
41742	40	20	\N	\N
41743	40	21	\N	\N
41744	40	22	\N	\N
41745	40	23	\N	\N
41746	40	24	\N	\N
41747	40	25	\N	\N
41748	40	26	\N	\N
41749	40	27	\N	\N
41750	40	28	\N	\N
41751	40	29	\N	\N
41752	40	4	\N	\N
41753	40	5	\N	\N
41754	40	7	\N	\N
41755	41	10	\N	\N
41756	41	11	\N	\N
41757	41	12	\N	\N
41758	41	8	\N	\N
41759	41	9	\N	\N
41760	42	13	\N	\N
41761	42	14	\N	\N
41762	42	18	\N	\N
41763	42	4	\N	\N
41764	42	5	\N	\N
41765	43	10	\N	\N
41766	43	11	\N	\N
41767	43	12	\N	\N
41768	43	14	\N	\N
41769	43	15	\N	\N
41770	43	16	\N	\N
41771	43	17	\N	\N
41772	43	1	\N	\N
41773	43	23	\N	\N
41774	43	24	\N	\N
41775	43	26	\N	\N
41776	43	2	\N	\N
41777	43	30	\N	\N
41778	43	32	\N	\N
41779	43	33	\N	\N
41780	43	34	\N	\N
41781	43	35	\N	\N
41782	43	3	\N	\N
41783	43	4	\N	\N
41784	43	5	\N	\N
41785	43	9	\N	\N
41786	44	10	\N	\N
41787	44	11	\N	\N
41788	44	12	\N	\N
41789	44	13	\N	\N
41790	44	14	\N	\N
41791	44	15	\N	\N
41792	44	17	\N	\N
41793	44	18	\N	\N
41794	44	1	\N	\N
41795	44	24	\N	\N
41796	44	25	\N	\N
41797	44	26	\N	\N
41798	44	2	\N	\N
41799	44	3	\N	\N
41800	44	4	\N	\N
41801	44	5	\N	\N
41802	44	6	\N	\N
41803	44	7	\N	\N
41804	44	8	\N	\N
41805	44	9	\N	\N
41806	45	10	\N	\N
41807	45	11	\N	\N
41808	45	13	\N	\N
41809	45	14	\N	\N
41810	45	15	\N	\N
41811	45	16	\N	\N
41812	45	17	\N	\N
41813	45	18	\N	\N
41814	45	19	\N	\N
41815	45	20	\N	\N
41816	45	21	\N	\N
41817	45	22	\N	\N
41818	45	23	\N	\N
41819	45	24	\N	\N
41820	45	25	\N	\N
41821	45	26	\N	\N
41822	45	27	\N	\N
41823	45	28	\N	\N
41824	45	29	\N	\N
41825	45	2	\N	\N
41826	45	30	\N	\N
41827	45	31	\N	\N
41828	45	32	\N	\N
41829	45	33	\N	\N
41830	45	34	\N	\N
41831	45	3	\N	\N
41832	45	4	\N	\N
41833	45	5	\N	\N
41834	45	6	\N	\N
41835	45	7	\N	\N
41836	45	8	\N	\N
41837	45	9	\N	\N
41838	46	10	\N	\N
41839	46	11	\N	\N
41840	46	12	\N	\N
41841	46	13	\N	\N
41842	46	15	\N	\N
41843	46	16	\N	\N
41844	46	17	\N	\N
41845	46	18	\N	\N
41846	46	19	\N	\N
41847	46	1	\N	\N
41848	46	2	\N	\N
41849	46	3	\N	\N
41850	46	4	\N	\N
41851	46	5	\N	\N
41852	46	6	\N	\N
41853	46	7	\N	\N
41854	46	8	\N	\N
41855	46	9	\N	\N
41856	47	10	\N	\N
41857	47	11	\N	\N
41858	47	12	\N	\N
41859	47	13	\N	\N
41860	47	14	\N	\N
41861	47	15	\N	\N
41862	47	16	\N	\N
41863	47	17	\N	\N
41864	47	18	\N	\N
41865	47	19	\N	\N
41866	47	1	\N	\N
41867	47	20	\N	\N
41868	47	21	\N	\N
41869	47	22	\N	\N
41870	47	23	\N	\N
41871	47	24	\N	\N
41872	47	25	\N	\N
41873	47	26	\N	\N
41874	47	27	\N	\N
41875	47	2	\N	\N
41876	47	3	\N	\N
41877	47	4	\N	\N
41878	47	5	\N	\N
41879	47	6	\N	\N
41880	47	7	\N	\N
41881	47	8	\N	\N
41882	47	9	\N	\N
41883	48	11	\N	\N
41884	48	12	\N	\N
41885	48	13	\N	\N
41886	48	14	\N	\N
41887	48	15	\N	\N
41888	48	16	\N	\N
41889	48	17	\N	\N
41890	48	18	\N	\N
41891	48	19	\N	\N
41892	48	1	\N	\N
41893	48	20	\N	\N
41894	48	21	\N	\N
41895	48	22	\N	\N
41896	48	23	\N	\N
41897	48	24	\N	\N
41898	48	25	\N	\N
41899	48	26	\N	\N
41900	48	27	\N	\N
41901	48	28	\N	\N
41902	48	2	\N	\N
41903	48	3	\N	\N
41904	48	4	\N	\N
41905	48	5	\N	\N
41906	48	6	\N	\N
41907	48	7	\N	\N
41908	48	8	\N	\N
41909	48	9	\N	\N
41910	49	10	\N	\N
41911	49	11	\N	\N
41912	49	12	\N	\N
41913	49	13	\N	\N
41914	49	14	\N	\N
41915	49	15	\N	\N
41916	49	16	\N	\N
41917	49	17	\N	\N
41918	49	18	\N	\N
41919	49	1	\N	\N
41920	49	2	\N	\N
41921	49	3	\N	\N
41922	49	4	\N	\N
41923	49	5	\N	\N
41924	49	7	\N	\N
41925	49	8	\N	\N
41926	49	9	\N	\N
41927	4	10	\N	\N
41928	4	14	\N	\N
41929	4	15	\N	\N
41930	4	16	\N	\N
41931	4	17	\N	\N
41932	4	18	\N	\N
41933	4	19	\N	\N
41934	4	1	\N	\N
41935	4	20	\N	\N
41936	4	21	\N	\N
41937	4	22	\N	\N
41938	4	23	\N	\N
41939	4	24	\N	\N
41940	4	25	\N	\N
41941	4	26	\N	\N
41942	4	2	\N	\N
41943	4	4	\N	\N
41944	4	5	\N	\N
41945	4	6	\N	\N
41946	4	9	\N	\N
41947	50	1	\N	\N
41948	51	1	\N	\N
41949	52	10	\N	\N
41950	52	1	\N	\N
41951	52	3	\N	\N
41952	52	4	\N	\N
41953	52	5	\N	\N
41954	52	6	\N	\N
41955	52	7	\N	\N
41956	52	8	\N	\N
41957	52	9	\N	\N
41958	53	10	\N	\N
41959	53	5	\N	\N
41960	53	6	\N	\N
41961	53	7	\N	\N
41962	53	8	\N	\N
41963	53	9	\N	\N
41964	55	14	\N	\N
41965	55	16	\N	\N
41966	55	18	\N	\N
41967	55	19	\N	\N
41968	55	20	\N	\N
41969	55	21	\N	\N
41970	55	22	\N	\N
41971	55	23	\N	\N
41972	55	24	\N	\N
41973	55	25	\N	\N
41974	55	26	\N	\N
41975	55	27	\N	\N
41976	55	28	\N	\N
41977	55	29	\N	\N
41978	55	30	\N	\N
41979	55	31	\N	\N
41980	55	32	\N	\N
41981	55	33	\N	\N
41982	55	34	\N	\N
41983	55	35	\N	\N
41984	55	36	\N	\N
41985	55	37	\N	\N
41986	55	38	\N	\N
41987	55	39	\N	\N
41988	55	40	\N	\N
41989	55	41	\N	\N
41990	55	42	\N	\N
41991	55	43	\N	\N
41992	55	44	\N	\N
41993	55	45	\N	\N
41994	55	46	\N	\N
41995	55	47	\N	\N
41996	55	49	\N	\N
41997	55	50	\N	\N
41998	55	51	\N	\N
41999	55	52	\N	\N
42000	56	13	\N	\N
42001	56	25	\N	\N
42002	56	4	\N	\N
42003	56	16	\N	\N
42004	56	18	\N	\N
42005	56	19	\N	\N
42006	57	10	\N	\N
42007	57	11	\N	\N
42008	57	12	\N	\N
42009	57	13	\N	\N
42010	57	14	\N	\N
42011	57	1	\N	\N
42012	57	2	\N	\N
42013	57	3	\N	\N
42014	57	4	\N	\N
42015	57	5	\N	\N
42016	57	6	\N	\N
42017	57	7	\N	\N
42018	57	8	\N	\N
42019	57	9	\N	\N
42020	58	3	\N	\N
42021	58	4	\N	\N
42022	58	6	\N	\N
42023	59	10	\N	\N
42024	59	11	\N	\N
42025	59	12	\N	\N
42026	59	13	\N	\N
42027	59	16	\N	\N
42028	59	17	\N	\N
42029	59	1	\N	\N
42030	59	2	\N	\N
42031	59	3	\N	\N
42032	59	4	\N	\N
42033	59	5	\N	\N
42034	59	6	\N	\N
42035	59	7	\N	\N
42036	59	8	\N	\N
42037	59	9	\N	\N
42038	5	10	\N	\N
42039	5	11	\N	\N
42040	5	12	\N	\N
42041	5	13	\N	\N
42042	5	16	\N	\N
42043	5	17	\N	\N
42044	5	18	\N	\N
42045	5	19	\N	\N
42046	5	20	\N	\N
42047	5	21	\N	\N
42048	5	22	\N	\N
42049	5	23	\N	\N
42050	5	24	\N	\N
42051	5	25	\N	\N
42052	5	26	\N	\N
42053	5	27	\N	\N
42054	5	2	\N	\N
42055	5	6	\N	\N
42056	5	9	\N	\N
42057	60	10	\N	\N
42058	60	11	\N	\N
42059	60	1	\N	\N
42060	60	2	\N	\N
42061	60	3	\N	\N
42062	60	4	\N	\N
42063	60	6	\N	\N
42064	60	7	\N	\N
42065	60	8	\N	\N
42066	60	9	\N	\N
42067	61	15	\N	\N
42068	61	16	\N	\N
42069	61	17	\N	\N
42070	61	1	\N	\N
42071	61	5	\N	\N
42072	61	6	\N	\N
42073	62	1	\N	\N
42074	62	2	\N	\N
42185	11	2	4	commercial                                                      
42186	11	3	4	residential                                                     
42187	11	4	4	residential                                                     
42188	11	5	4	residential                                                     
42189	11	6	4	residential                                                     
42190	11	7	4	residential                                                     
42191	11	8	4	residential                                                     
42192	11	9	4	residential                                                     
42193	11	10	4	residential                                                     
42194	11	11	4	commercial                                                      
42195	11	12	4	Industrial                                                      
42196	11	14	4	residential                                                     
42197	11	15	4	residential                                                     
42198	11	16	4	residential                                                     
42199	11	17	4	residential                                                     
42200	11	18	4	residential                                                     
42201	16	1	4	residential                                                     
42202	16	2	4	residential                                                     
42203	16	3	4	residential                                                     
42204	16	4	4	residential                                                     
42205	16	5	4	residential                                                     
42206	11	19	4	uses permitted under O.I. Zoning                                
42207	16	6	4	residential                                                     
42208	11	23	4	residential                                                     
42209	11	24	4	residential                                                     
42210	11	25	4	residential                                                     
42211	11	27	4	residential                                                     
42212	11	28	4	residential                                                     
42213	11	29	4	residential                                                     
42214	11	30	4	residential                                                     
42215	11	31	4	residential                                                     
42216	11	33	4	residential                                                     
42217	11	34	4	residential                                                     
42218	11	35	4	residential                                                     
42219	11	39	4	residential                                                     
42220	17	1	4	residential                                                     
42221	11	42	4	residential                                                     
42222	11	26	4	residential                                                     
42223	17	2	4	residential                                                     
42224	11	32	4	residential                                                     
42225	11	32	4	residential                                                     
42226	17	4	4	residential                                                     
42227	16	7	4	residential                                                     
42228	17	5	4	residential                                                     
42229	11	20	4	residential                                                     
42230	11	36	4	residential                                                     
42231	11	21	4	residential                                                     
42232	16	8	4	residential                                                     
42233	11	22	4	residential                                                     
42234	16	9	4	residential                                                     
42235	11	37	4	residential                                                     
42236	16	10	4	residential                                                     
42237	16	11	4	residential                                                     
42238	17	6	4	residential                                                     
42239	11	38	4	residential                                                     
42240	17	8	4	residential                                                     
42241	16	12	4	residential                                                     
42242	11	40	4	residential                                                     
42243	16	13	4	residential                                                     
42244	16	14	4	residential                                                     
42245	16	15	4	residential                                                     
42246	17	10	4	residential                                                     
42247	16	16	4	residential                                                     
42248	11	41	4	residential                                                     
42249	16	18	4	residential                                                     
42250	17	11	4	residential                                                     
42251	16	19	4	residential                                                     
42252	17	12	4	residential                                                     
42253	16	20	4	residential                                                     
42254	17	13	4	residential                                                     
42255	16	17	4	residential                                                     
42256	17	29	4	residential                                                     
42257	17	15	4	residential                                                     
42258	17	29	4	residential                                                     
42259	17	30	4	residential                                                     
42260	17	31	4	residential                                                     
42261	17	33	4	residential                                                     
42262	17	34	4	commercial                                                      
42263	17	35	4	residential                                                     
42264	17	36	4	residential                                                     
42265	17	37	4	residential                                                     
42266	16	16	4	residential                                                     
42267	16	17	4	residential                                                     
42268	16	18	4	residential                                                     
42269	16	19	4	residential                                                     
42270	16	20	4	residential                                                     
42271	45	3	4	residential                                                     
42272	45	5	4	residential                                                     
42273	45	5	4	residential                                                     
42274	45	6	4	residential                                                     
42275	45	7	4	residential                                                     
42276	45	30	4	residential                                                     
42277	45	31	4	residential                                                     
42278	45	32	4	residential                                                     
42279	45	33	4	residential                                                     
42280	45	34	4	residential                                                     
42281	17	5	4	residential                                                     
42282	17	6	0	residential                                                     
42283	26	4	4	residential                                                     
42284	26	5	4	residential                                                     
42285	26	6	4	residential                                                     
\.


--
-- Name: parcels_parcel_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('humanface.parcels_parcel_id_seq', 42285, true);


--
-- Data for Name: people; Type: TABLE DATA; Schema: humanface; Owner: postgres
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
200	                                                                                                                                                                                                                                                               
201	Cora J. Shuford                                                                                                                                                                                                                                                
202	HACA                                                                                                                                                                                                                                                           
203	                                                                                                                                                                                                                                                               
204	                                                                                                                                                                                                                                                               
205	Carolina Power & Light Company                                                                                                                                                                                                                                 
206	HACA                                                                                                                                                                                                                                                           
207	Carolina Power & Light Comapny                                                                                                                                                                                                                                 
208	J.g. Stikeleather Jr.                                                                                                                                                                                                                                          
209	                                                                                                                                                                                                                                                               
210	J.G. Stikeleather, Jr.                                                                                                                                                                                                                                         
211	Charles Sprouse, et als                                                                                                                                                                                                                                        
212	Annie Sprouser                                                                                                                                                                                                                                                 
213	Jennie L. Wooten                                                                                                                                                                                                                                               
214	                                                                                                                                                                                                                                                               
215	                                                                                                                                                                                                                                                               
216	B.H. Duncan and Lou R. Duncan                                                                                                                                                                                                                                  
217	Margaret B. Fox and Robert W. Fox                                                                                                                                                                                                                              
218	                                                                                                                                                                                                                                                               
219	Margaret B. Fox                                                                                                                                                                                                                                                
220	John F. Shuford and Cora J. Shuford                                                                                                                                                                                                                            
221	                                                                                                                                                                                                                                                               
222	Trint A. Smathers & Fay Smathers                                                                                                                                                                                                                               
223	                                                                                                                                                                                                                                                               
224	                                                                                                                                                                                                                                                               
225	John M. Reynolds and Nancy Davis Reynods and Lucille Pace                                                                                                                                                                                                      
226	John M. Reynolds and Nancy Davis Reynolds and Lucille Pace                                                                                                                                                                                                     
227	                                                                                                                                                                                                                                                               
228	Horace Samuel Johnston and Ella Johnston                                                                                                                                                                                                                       
229	                                                                                                                                                                                                                                                               
230	William A. Webb and Mary Webb                                                                                                                                                                                                                                  
231	                                                                                                                                                                                                                                                               
232	                                                                                                                                                                                                                                                               
233	Madeline McFarland Hagan                                                                                                                                                                                                                                       
234	                                                                                                                                                                                                                                                               
235	Annie Sprouser and Jennie Wooten                                                                                                                                                                                                                               
236	                                                                                                                                                                                                                                                               
237	Eloise I. S. Wells                                                                                                                                                                                                                                             
238	T. R. Ray                                                                                                                                                                                                                                                      
239	Mary Ray                                                                                                                                                                                                                                                       
240	                                                                                                                                                                                                                                                               
241	Agnes B. Johnson                                                                                                                                                                                                                                               
242	Hugh C. Johnson                                                                                                                                                                                                                                                
243	Margaret Johnson                                                                                                                                                                                                                                               
244	                                                                                                                                                                                                                                                               
245	Helen Eugenia Powers Stevens                                                                                                                                                                                                                                   
246	John Morris Stevens                                                                                                                                                                                                                                            
247	Helen M. Powers                                                                                                                                                                                                                                                
248	Helen Eugenia Powers                                                                                                                                                                                                                                           
249	                                                                                                                                                                                                                                                               
250	Mary M. Williams                                                                                                                                                                                                                                               
251	Elizabeth S. Nichols                                                                                                                                                                                                                                           
252	Herman Nichols                                                                                                                                                                                                                                                 
253	                                                                                                                                                                                                                                                               
254	Mary Strickland                                                                                                                                                                                                                                                
255	Manuel Strickland                                                                                                                                                                                                                                              
256	Bessie Watts                                                                                                                                                                                                                                                   
257	Ulysses Watts                                                                                                                                                                                                                                                  
258	                                                                                                                                                                                                                                                               
259	                                                                                                                                                                                                                                                               
260	Bruce A. Elmore                                                                                                                                                                                                                                                
261	Eva King                                                                                                                                                                                                                                                       
262	Frances King                                                                                                                                                                                                                                                   
263	                                                                                                                                                                                                                                                               
264	C.Baber                                                                                                                                                                                                                                                        
265	Winton T. Baber                                                                                                                                                                                                                                                
266	Lola Lee Posey                                                                                                                                                                                                                                                 
267	Lola Lee Posey Crowder                                                                                                                                                                                                                                         
268	                                                                                                                                                                                                                                                               
269	Minnie Porter                                                                                                                                                                                                                                                  
270	                                                                                                                                                                                                                                                               
271	Minnie Porter                                                                                                                                                                                                                                                  
272	Jessie Knox                                                                                                                                                                                                                                                    
273	                                                                                                                                                                                                                                                               
274	W.P. Shuford                                                                                                                                                                                                                                                   
275	Anna S. Moore                                                                                                                                                                                                                                                  
276	Meredith Moore                                                                                                                                                                                                                                                 
277	                                                                                                                                                                                                                                                               
278	Harry D.Weaver                                                                                                                                                                                                                                                 
279	Nellie Mae Weaver                                                                                                                                                                                                                                              
280	E.S Lamb                                                                                                                                                                                                                                                       
281	Leslie May Lamb                                                                                                                                                                                                                                                
282	                                                                                                                                                                                                                                                               
283	S.J Pegram                                                                                                                                                                                                                                                     
284	Mary Jane Pegram                                                                                                                                                                                                                                               
285	Fred Charles Gosnell                                                                                                                                                                                                                                           
286	Irene Gosnell                                                                                                                                                                                                                                                  
287	                                                                                                                                                                                                                                                               
288	N.J Waldrup                                                                                                                                                                                                                                                    
289	Gladys H. Waldrup                                                                                                                                                                                                                                              
290	Raymond Collins                                                                                                                                                                                                                                                
291	                                                                                                                                                                                                                                                               
292	Robinson Bros. Contractors                                                                                                                                                                                                                                     
293	Albert Kodack                                                                                                                                                                                                                                                  
294	A.G. Carver, Jr                                                                                                                                                                                                                                                
295	Ann Kodack                                                                                                                                                                                                                                                     
296	A.G. Carver, Jr.                                                                                                                                                                                                                                               
297	Evelyn M. Carver                                                                                                                                                                                                                                               
298	A.G Carver, Jr.                                                                                                                                                                                                                                                
299	                                                                                                                                                                                                                                                               
300	Gay Green                                                                                                                                                                                                                                                      
301	Effie M. Green                                                                                                                                                                                                                                                 
302	Ada Bass                                                                                                                                                                                                                                                       
303	Lawrence Bass Jr.                                                                                                                                                                                                                                              
304	Angelina Bass                                                                                                                                                                                                                                                  
305	Beatrice Bass                                                                                                                                                                                                                                                  
306	Dorothy Bass Rector                                                                                                                                                                                                                                            
307	Grover Rector                                                                                                                                                                                                                                                  
308	Penley                                                                                                                                                                                                                                                         
309	Flossie Penley                                                                                                                                                                                                                                                 
310	Flossey Penley                                                                                                                                                                                                                                                 
311	                                                                                                                                                                                                                                                               
312	David Bates                                                                                                                                                                                                                                                    
313	Sue Bates                                                                                                                                                                                                                                                      
314	Charles W. Gates                                                                                                                                                                                                                                               
315	Effie Bates Gaze                                                                                                                                                                                                                                               
316	Leila Lamb                                                                                                                                                                                                                                                     
317	Edgar Lamb                                                                                                                                                                                                                                                     
318	Clara Clark                                                                                                                                                                                                                                                    
319	Lloyd Clark                                                                                                                                                                                                                                                    
320	Bessie Arrowood                                                                                                                                                                                                                                                
321	James Arrowood                                                                                                                                                                                                                                                 
322	                                                                                                                                                                                                                                                               
323	Marshall Meredith                                                                                                                                                                                                                                              
324	Charles G. Lee III                                                                                                                                                                                                                                             
325	Ann P. Lee                                                                                                                                                                                                                                                     
326	Marshall F. Meredith                                                                                                                                                                                                                                           
327	Dorothy N. Meredith                                                                                                                                                                                                                                            
328	Charles G. Lee                                                                                                                                                                                                                                                 
329	                                                                                                                                                                                                                                                               
330	P. H. Branch and Florence Branch                                                                                                                                                                                                                               
331	Ernest H. Moore and Amos D. Moore                                                                                                                                                                                                                              
332	Ernest H. Moore Verline Moore Amos D. Moore                                                                                                                                                                                                                    
333	Ernest Moore and Amos D. Moore                                                                                                                                                                                                                                 
334	                                                                                                                                                                                                                                                               
335	Faron W. Scott                                                                                                                                                                                                                                                 
336	Asheville Power and Light Co.                                                                                                                                                                                                                                  
337	                                                                                                                                                                                                                                                               
338	Robert Ernest Shuford Jr.                                                                                                                                                                                                                                      
339	Ann Shuford Lindamood                                                                                                                                                                                                                                          
340	Robert Ernest Shufold Jr.                                                                                                                                                                                                                                      
341	                                                                                                                                                                                                                                                               
342	Luther Hollingsworth and Maggie Bell Hollingsworth                                                                                                                                                                                                             
343	Maggie Bell Hollingsworth                                                                                                                                                                                                                                      
344	                                                                                                                                                                                                                                                               
345	Earl J. Hollingsworth                                                                                                                                                                                                                                          
346	Ollie Hollingsworth                                                                                                                                                                                                                                            
347	Thomas J. Hollingsworth                                                                                                                                                                                                                                        
348	Margaret Hollingsworth                                                                                                                                                                                                                                         
349	HACA                                                                                                                                                                                                                                                           
350	                                                                                                                                                                                                                                                               
351	                                                                                                                                                                                                                                                               
352	Albert Kodak and Ann Kodack                                                                                                                                                                                                                                    
353	Charles E. Thompson                                                                                                                                                                                                                                            
354	Charles E. Thompson and Carolyn Thompson                                                                                                                                                                                                                       
355	                                                                                                                                                                                                                                                               
356	Mary Burgin                                                                                                                                                                                                                                                    
357	James Burgin                                                                                                                                                                                                                                                   
358	Mary Burgin Harris                                                                                                                                                                                                                                             
359	James Harris                                                                                                                                                                                                                                                   
360	                                                                                                                                                                                                                                                               
361	Ella E. Teasley                                                                                                                                                                                                                                                
362	Hettie Anderson Pettie                                                                                                                                                                                                                                         
363	Charles Crowell and Margaret Crowell                                                                                                                                                                                                                           
364	Hettie Anderson                                                                                                                                                                                                                                                
365	                                                                                                                                                                                                                                                               
366	Dread Coleman and Carrie Coleman                                                                                                                                                                                                                               
367	                                                                                                                                                                                                                                                               
368	C.J. Woody                                                                                                                                                                                                                                                     
369	L.E. Woody                                                                                                                                                                                                                                                     
370	Burnett E. Gentry                                                                                                                                                                                                                                              
371	The heirs, devisees, legal reps of Burnett E. Gentry                                                                                                                                                                                                           
372	HACA                                                                                                                                                                                                                                                           
373	                                                                                                                                                                                                                                                               
374	James Massey & Etta Banks                                                                                                                                                                                                                                      
375	                                                                                                                                                                                                                                                               
376	James Massey                                                                                                                                                                                                                                                   
377	Herman C. Nichols                                                                                                                                                                                                                                              
378	H. C. Thrasher                                                                                                                                                                                                                                                 
379	Maude                                                                                                                                                                                                                                                          
380	Henry C. Thrasher                                                                                                                                                                                                                                              
381	                                                                                                                                                                                                                                                               
382	                                                                                                                                                                                                                                                               
383	The heirs of James R. Buckner                                                                                                                                                                                                                                  
384	Ludy Teague                                                                                                                                                                                                                                                    
385	Willie Mae Teague                                                                                                                                                                                                                                              
386	Anderson Stribbling                                                                                                                                                                                                                                            
387	Viola Stribbling                                                                                                                                                                                                                                               
388	                                                                                                                                                                                                                                                               
389	R.N. McFarlin                                                                                                                                                                                                                                                  
390	Annie May McFarlin                                                                                                                                                                                                                                             
391	Thomas R. Byrd                                                                                                                                                                                                                                                 
392	William D. McKee                                                                                                                                                                                                                                               
393	Lilly B. McKee                                                                                                                                                                                                                                                 
394	Donald S. Peterkin                                                                                                                                                                                                                                             
395	Mary B. Peterkin                                                                                                                                                                                                                                               
396	Lilly B. Mckee                                                                                                                                                                                                                                                 
397	William D. Mckee                                                                                                                                                                                                                                               
398	                                                                                                                                                                                                                                                               
399	John W. Rowe                                                                                                                                                                                                                                                   
400	Eloise Rowe                                                                                                                                                                                                                                                    
401	Elouise Rowe Locke                                                                                                                                                                                                                                             
402	Benjamin A. Locke                                                                                                                                                                                                                                              
403	                                                                                                                                                                                                                                                               
404	H. McKenzie                                                                                                                                                                                                                                                    
405	P. P. Marsh                                                                                                                                                                                                                                                    
406	Kathleen H. Marsh                                                                                                                                                                                                                                              
407	                                                                                                                                                                                                                                                               
408	George T Leonard                                                                                                                                                                                                                                               
409	Howell Clinkscales and Nellie Clinkscales                                                                                                                                                                                                                      
410	Howell Clinkscales and Ann Sclinkscales                                                                                                                                                                                                                        
411	                                                                                                                                                                                                                                                               
412	Howell Clinkscales and Ann Clinkscales                                                                                                                                                                                                                         
413	Howell Clinkscales and Ann clinkscales                                                                                                                                                                                                                         
414	Irene Williams                                                                                                                                                                                                                                                 
415	Ruby Jackson                                                                                                                                                                                                                                                   
416	J.L. Owens                                                                                                                                                                                                                                                     
417	Della E.                                                                                                                                                                                                                                                       
418	J.B. Herman                                                                                                                                                                                                                                                    
419	F.W. Scott                                                                                                                                                                                                                                                     
420	Larry E. Metcalf                                                                                                                                                                                                                                               
421	                                                                                                                                                                                                                                                               
422	Cullen Martin and Roxanna Martin                                                                                                                                                                                                                               
423	M. Strickland and Mary Strickland                                                                                                                                                                                                                              
424	                                                                                                                                                                                                                                                               
425	Samuel Lander                                                                                                                                                                                                                                                  
426	Alice Lander                                                                                                                                                                                                                                                   
427	John L. Cobb                                                                                                                                                                                                                                                   
428	                                                                                                                                                                                                                                                               
429	E.S Anderson                                                                                                                                                                                                                                                   
430	Ruby V.                                                                                                                                                                                                                                                        
431	M.A Dumas                                                                                                                                                                                                                                                      
432	Eugene S. Dumas                                                                                                                                                                                                                                                
433	Lois W. Dumas                                                                                                                                                                                                                                                  
434	M.A Dumas Jr.                                                                                                                                                                                                                                                  
435	Oleta L. Dumas                                                                                                                                                                                                                                                 
436	Clyde Idol                                                                                                                                                                                                                                                     
437	M.A Dumas Jr,                                                                                                                                                                                                                                                  
438	                                                                                                                                                                                                                                                               
439	J. L. Widman                                                                                                                                                                                                                                                   
440	Sallie E. Widman                                                                                                                                                                                                                                               
441	Fred Martin                                                                                                                                                                                                                                                    
442	Henrietta Martin                                                                                                                                                                                                                                               
443	                                                                                                                                                                                                                                                               
444	Alice Shuford                                                                                                                                                                                                                                                  
445	Mamie E. Walker                                                                                                                                                                                                                                                
446	                                                                                                                                                                                                                                                               
447	Mamie Walker                                                                                                                                                                                                                                                   
448	John Thompkins                                                                                                                                                                                                                                                 
449	Mattie Thompkins                                                                                                                                                                                                                                               
450	                                                                                                                                                                                                                                                               
451	Robert G. Monteith                                                                                                                                                                                                                                             
452	John H. Monteith                                                                                                                                                                                                                                               
453	Horace L. Wilson and Evelyn Wilson                                                                                                                                                                                                                             
454	Brian F. D. LaVelle                                                                                                                                                                                                                                            
455	Theodore Dean                                                                                                                                                                                                                                                  
456	Aletha Dean                                                                                                                                                                                                                                                    
457	Mary P. Williams                                                                                                                                                                                                                                               
458	                                                                                                                                                                                                                                                               
459	C.P Edwards                                                                                                                                                                                                                                                    
460	Helen B.                                                                                                                                                                                                                                                       
461	Powers Engineering and Construction Company                                                                                                                                                                                                                    
462	                                                                                                                                                                                                                                                               
463	George Evans                                                                                                                                                                                                                                                   
464	Robert MacAdams                                                                                                                                                                                                                                                
465	Claudia MacAdams                                                                                                                                                                                                                                               
466	Robert McAdams                                                                                                                                                                                                                                                 
467	Claudia McAdams                                                                                                                                                                                                                                                
468	                                                                                                                                                                                                                                                               
469	                                                                                                                                                                                                                                                               
470	Realty Purchase Corp                                                                                                                                                                                                                                           
471	Willie B. Burton and Eleanor W. Burton                                                                                                                                                                                                                         
472	Wille B. Burton and Eleanor W. Burton                                                                                                                                                                                                                          
473	Grace W. Hinton                                                                                                                                                                                                                                                
474	James E. Foster                                                                                                                                                                                                                                                
475	Florence Foster                                                                                                                                                                                                                                                
476	Lois Foster                                                                                                                                                                                                                                                    
477	                                                                                                                                                                                                                                                               
478	Aubrey E. Duncan                                                                                                                                                                                                                                               
479	Ethel M. Duncan                                                                                                                                                                                                                                                
480	Aubrey E. Duncan and Ethel M. Duncan                                                                                                                                                                                                                           
481	                                                                                                                                                                                                                                                               
482	Corrie N. Harris                                                                                                                                                                                                                                               
483	Timothy Nicholas                                                                                                                                                                                                                                               
484	Farrie Nicholas                                                                                                                                                                                                                                                
485	Farrie Nicholas Reid                                                                                                                                                                                                                                           
486	Francis Reid                                                                                                                                                                                                                                                   
487	                                                                                                                                                                                                                                                               
488	Aileen Gudger                                                                                                                                                                                                                                                  
489	Winthro Collins                                                                                                                                                                                                                                                
490	                                                                                                                                                                                                                                                               
491	Thomas E. Gidney                                                                                                                                                                                                                                               
492	Gertrude M. Gidney                                                                                                                                                                                                                                             
493	Corrie N. Harris                                                                                                                                                                                                                                               
494	Sanders E. Harris                                                                                                                                                                                                                                              
495	                                                                                                                                                                                                                                                               
496	Charles Westall                                                                                                                                                                                                                                                
497	Helen J. Westall                                                                                                                                                                                                                                               
498	                                                                                                                                                                                                                                                               
499	N.A. Pierce, Trustee                                                                                                                                                                                                                                           
500	Helen G. Westall                                                                                                                                                                                                                                               
501	H.E. Johnson                                                                                                                                                                                                                                                   
502	Mrs. Charles Westall                                                                                                                                                                                                                                           
503	Joe Falk Harvey                                                                                                                                                                                                                                                
504	Leanner Hill                                                                                                                                                                                                                                                   
505	                                                                                                                                                                                                                                                               
506	Charles Westall and wofe, Helen J. Westall                                                                                                                                                                                                                     
507	charles westall and wife, Helen J. Westall                                                                                                                                                                                                                     
508	Helen J. Westall                                                                                                                                                                                                                                               
509	                                                                                                                                                                                                                                                               
510	William T. Duckworth                                                                                                                                                                                                                                           
511	Charles W. Bradshaw, Inc.                                                                                                                                                                                                                                      
512	Annie Lee Calhoun and husband, WIllie Calhoun                                                                                                                                                                                                                  
513	Annie Lee Calhoun and husband, Willie Calhoun                                                                                                                                                                                                                  
514	Annie iLee Calhoun and husband, Willie Calhoun                                                                                                                                                                                                                 
515	                                                                                                                                                                                                                                                               
516	Nelson Roberson                                                                                                                                                                                                                                                
517	W.T. Duckworth Company                                                                                                                                                                                                                                         
518	Walter I. Sasportas and wife, Virginia H. Sasportas                                                                                                                                                                                                            
519	Housing authority of the city of ashevillw                                                                                                                                                                                                                     
520	                                                                                                                                                                                                                                                               
521	Housing authority of the city of Asheville                                                                                                                                                                                                                     
522	T.W. Norvell                                                                                                                                                                                                                                                   
523	Cora Carter                                                                                                                                                                                                                                                    
524	Mary Lou Thompson                                                                                                                                                                                                                                              
525	Mary Low Thomposon                                                                                                                                                                                                                                             
526	Mary Lou Thompson and Spurgeon Thompson                                                                                                                                                                                                                        
527	W.A. McElduff                                                                                                                                                                                                                                                  
528	                                                                                                                                                                                                                                                               
529	Luevinia Johnson, widow                                                                                                                                                                                                                                        
530	Luevinia Johnson, Widow                                                                                                                                                                                                                                        
531	Luevinia Johnson and husband, SImpson Johnson                                                                                                                                                                                                                  
532	Clyde R. SImmons and wife, Janie Lee Simmons                                                                                                                                                                                                                   
533	                                                                                                                                                                                                                                                               
534	Winnie Lee Hall Jackson and husband, James Otto Jackson; Lillie Mae Griffin (single) and Carrie Martin Davidson and husband, James Alex Davidson                                                                                                               
535	Carrie Martin, Lillie Mae Griffith, Walter Hall, Minnie Lee Hall                                                                                                                                                                                               
536	John F. Shuford, and wife, Caney Shuford                                                                                                                                                                                                                       
537	                                                                                                                                                                                                                                                               
538	Edward Rogers, Groge W. Self, et als, Trustees of Mt. Zion Missionary Baptist Church                                                                                                                                                                           
539	Claude Tatum, J. Van Evans and Nathaniel Hines Trustees of Mt. Zion Missionary Baptist Church                                                                                                                                                                  
540	Daisy Smith and husband, Albert Smith                                                                                                                                                                                                                          
541	                                                                                                                                                                                                                                                               
542	Edward Young and wife                                                                                                                                                                                                                                          
543	Arthure York and wife                                                                                                                                                                                                                                          
544	Edward Young and wife, Minnie Young                                                                                                                                                                                                                            
545	Mary P. Williams                                                                                                                                                                                                                                               
546	                                                                                                                                                                                                                                                               
547	Peter Connet                                                                                                                                                                                                                                                   
548	Paul                                                                                                                                                                                                                                                           
549	Ed Sale                                                                                                                                                                                                                                                        
550	Lawrence D Holt                                                                                                                                                                                                                                                
551	                                                                                                                                                                                                                                                               
552	                                                                                                                                                                                                                                                               
553	                                                                                                                                                                                                                                                               
554	Peter T. Connet                                                                                                                                                                                                                                                
555	                                                                                                                                                                                                                                                               
556	H. Johnson                                                                                                                                                                                                                                                     
557	John Ochsenreiter                                                                                                                                                                                                                                              
558	                                                                                                                                                                                                                                                               
559	Jacob Halloway Jr and Wife Ruth                                                                                                                                                                                                                                
560	Rosella F Haynes                                                                                                                                                                                                                                               
561	Ruth Holloway                                                                                                                                                                                                                                                  
562	ruth holloway                                                                                                                                                                                                                                                  
563	Henri M Dill and wife Louise Dill                                                                                                                                                                                                                              
564	James I Mason and wife Alema M Mason                                                                                                                                                                                                                           
565	Henri Dill                                                                                                                                                                                                                                                     
566	Chester Dean Ray and wife Mary Helen Ray                                                                                                                                                                                                                       
567	Bert N Parmenter                                                                                                                                                                                                                                               
568	Ellen Williams McAdams                                                                                                                                                                                                                                         
569	Lila M Bryant                                                                                                                                                                                                                                                  
570	F.B. Short and wife Katherine F. Short                                                                                                                                                                                                                         
571	Fred Chandler and wife Queen E Chandler                                                                                                                                                                                                                        
572	Robert B Griffith and wife Lelia Griffith                                                                                                                                                                                                                      
573	Robert B Griffith Jr                                                                                                                                                                                                                                           
574	Julia Clements                                                                                                                                                                                                                                                 
575	Ned Carver and wife Alfa Jo Carver                                                                                                                                                                                                                             
576	Tom Lyles and wife Daisy Lyles                                                                                                                                                                                                                                 
577	Georgia Cooke                                                                                                                                                                                                                                                  
578	Clarence J Cooper and wife Jesse T Cooper                                                                                                                                                                                                                      
579	Clarence Cooper                                                                                                                                                                                                                                                
580	Louis Holloway                                                                                                                                                                                                                                                 
581	Levi Lee Wilson and wife Mary Wilson                                                                                                                                                                                                                           
582	Hettie Anderson Crowell Petty                                                                                                                                                                                                                                  
583	                                                                                                                                                                                                                                                               
584	Hettie Anderson Crowell Pettie                                                                                                                                                                                                                                 
585	Charles H. Crowell                                                                                                                                                                                                                                             
586	Margaret Crowell (wife)                                                                                                                                                                                                                                        
587	Hettie Crowell Anderson Petty                                                                                                                                                                                                                                  
588	Hettie Crowson Anderson Petty                                                                                                                                                                                                                                  
589	                                                                                                                                                                                                                                                               
590	Karl H. Straus & Sylvia P (wife)                                                                                                                                                                                                                               
591	                                                                                                                                                                                                                                                               
592	Rand Holding Company                                                                                                                                                                                                                                           
593	                                                                                                                                                                                                                                                               
594	Frances Rhodes Bowditch                                                                                                                                                                                                                                        
595	Heber Coleman                                                                                                                                                                                                                                                  
596	Mrs. Frances Rhodes Northcutt                                                                                                                                                                                                                                  
597	Weldon Willis                                                                                                                                                                                                                                                  
598	Weldon''s wife, Iva                                                                                                                                                                                                                                            
599	Frances Rhodes                                                                                                                                                                                                                                                 
600	                                                                                                                                                                                                                                                               
601	Robert J. Jordan                                                                                                                                                                                                                                               
602	Grace Jordan                                                                                                                                                                                                                                                   
603	Grace J. Jordan (Robert''s wife)                                                                                                                                                                                                                               
604	J.S. Suddreth                                                                                                                                                                                                                                                  
605	Grace Jordan (Robert''s wife)                                                                                                                                                                                                                                  
606	Grace Jordan (Robert''s Wife)                                                                                                                                                                                                                                  
\.


--
-- Name: people_id_seq; Type: SEQUENCE SET; Schema: humanface; Owner: postgres
--

SELECT pg_catalog.setval('humanface.people_id_seq', 606, true);


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
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

