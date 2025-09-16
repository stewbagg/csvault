--
-- PostgreSQL database dump
--

\restrict dOqP7ZcmnGYQzeYW43maHoXQsuErnOSHOpfdaQAiKF3Xnyg73W427kMCQWpFA9g

-- Dumped from database version 17.6 (Debian 17.6-0+deb13u1)
-- Dumped by pg_dump version 17.6 (Debian 17.6-0+deb13u1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cases; Type: TABLE; Schema: public; Owner: stew
--

CREATE TABLE public.cases (
    id integer NOT NULL,
    name text NOT NULL,
    release_date date,
    icon_url text,
    collection_id integer NOT NULL
);


ALTER TABLE public.cases OWNER TO stew;

--
-- Name: cases_id_seq; Type: SEQUENCE; Schema: public; Owner: stew
--

CREATE SEQUENCE public.cases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cases_id_seq OWNER TO stew;

--
-- Name: cases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stew
--

ALTER SEQUENCE public.cases_id_seq OWNED BY public.cases.id;


--
-- Name: collections; Type: TABLE; Schema: public; Owner: stew
--

CREATE TABLE public.collections (
    id integer NOT NULL,
    name text NOT NULL,
    release_date date NOT NULL,
    icon_url text NOT NULL
);


ALTER TABLE public.collections OWNER TO stew;

--
-- Name: collections_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: stew
--

CREATE SEQUENCE public.collections_collection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.collections_collection_id_seq OWNER TO stew;

--
-- Name: collections_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stew
--

ALTER SEQUENCE public.collections_collection_id_seq OWNED BY public.collections.id;


--
-- Name: packages; Type: TABLE; Schema: public; Owner: stew
--

CREATE TABLE public.packages (
    id integer NOT NULL,
    name text NOT NULL,
    release_date date,
    icon_url text,
    collection_id integer
);


ALTER TABLE public.packages OWNER TO stew;

--
-- Name: packages_id_seq; Type: SEQUENCE; Schema: public; Owner: stew
--

CREATE SEQUENCE public.packages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.packages_id_seq OWNER TO stew;

--
-- Name: packages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stew
--

ALTER SEQUENCE public.packages_id_seq OWNED BY public.packages.id;


--
-- Name: skins; Type: TABLE; Schema: public; Owner: stew
--

CREATE TABLE public.skins (
    id integer NOT NULL,
    name text NOT NULL,
    collection_id integer NOT NULL,
    grade text,
    icon_url text,
    case_id integer
);


ALTER TABLE public.skins OWNER TO stew;

--
-- Name: skins_id_seq; Type: SEQUENCE; Schema: public; Owner: stew
--

CREATE SEQUENCE public.skins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.skins_id_seq OWNER TO stew;

--
-- Name: skins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: stew
--

ALTER SEQUENCE public.skins_id_seq OWNED BY public.skins.id;


--
-- Name: cases id; Type: DEFAULT; Schema: public; Owner: stew
--

ALTER TABLE ONLY public.cases ALTER COLUMN id SET DEFAULT nextval('public.cases_id_seq'::regclass);


--
-- Name: collections id; Type: DEFAULT; Schema: public; Owner: stew
--

ALTER TABLE ONLY public.collections ALTER COLUMN id SET DEFAULT nextval('public.collections_collection_id_seq'::regclass);


--
-- Name: packages id; Type: DEFAULT; Schema: public; Owner: stew
--

ALTER TABLE ONLY public.packages ALTER COLUMN id SET DEFAULT nextval('public.packages_id_seq'::regclass);


--
-- Name: skins id; Type: DEFAULT; Schema: public; Owner: stew
--

ALTER TABLE ONLY public.skins ALTER COLUMN id SET DEFAULT nextval('public.skins_id_seq'::regclass);


--
-- Data for Name: cases; Type: TABLE DATA; Schema: public; Owner: stew
--

COPY public.cases (id, name, release_date, icon_url, collection_id) FROM stdin;
1	CS:GO Weapon Case	2013-08-13	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsRVx4MwFo5_T3eAQ3i6DMIW0X7ojiwoHax6egMOKGxj4G68Nz3-jCp4itjFWx-ktqfSmtcwqVx6sT	1
2	eSports 2013 Case	2013-08-13	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsVk5kKhZDpYX3e1YznfCcdzkR74vnw9TZwa-sYOOCzzoF6ZJ0jL6Qp9uj3Qbj_Uc6Z2z1I9WLMlhp9VPHu3g	5
3	Operation Bravo Case	2013-09-18	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsXE1xNwVDv7WrFA5pnabNJGwSuN3gxtnawKOlMO6HzzhQucAm0uvFo4n2iw3h_UM-ZmilJNeLMlhpjfjxEoE	12
4	CS:GO Weapon Case 2	2013-11-07	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsRVx4MwFo5PT8elUwgKKZJmtEvo_kxITZk6StNe-Fz2pTu8Aj3eqVpIqgjVfjrRI9fSmtc1Nw-Kh3	13
5	eSports 2013 Winter Case	2013-12-17	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsVk5kKhZDpYX3e1Yz7KKcPzwav9jnzdfdlfWmY7_TzmkF6ZMlj77A9o3x0Qe1qhBkZGjxI9LBJgMgIQaH1G7WeaA	21
6	Winter Offensive Weapon Case	2013-12-17	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsUFJ5KBFZv668FFYu0aKfJz8a793gxNLfzvOkMunUwWgH7JIjj-qW8d7x2VXt_UBuMT3zIpjVLFEGDSGUSQ	22
7	CS:GO Weapon Case 3	2014-02-11	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsRVx4MwFo5fSnf15k0KGacG0UtYXnzdTdkq-gariGlDgHvMcmjryZotqg2wCxrUVtfSmtc20v4quI	23
8	Operation Phoenix Weapon Case	2014-02-19	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsUFJ5KBFZv668FFUuh6qZJmlD7tiyl4OIlaGhYuLTzjhVupJ12urH89ii3lHlqEdoMDr2I5jVLFFSv_J2Rg	24
9	Huntsman Weapon Case	2014-04-30	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsUFJ5KBFZv668FFQu0PaQIm9DtY6wzYaIxKWtN7iJwW8G6Z0h2LqWoY6s2Qy2-0Q_Nzv7IJjVLFGZqUbjlQ	26
10	Operation Breakout Weapon Case	2014-06-30	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsUFJ5KBFZv668FFMu1aPMI24auITjxteJwPXxY72AkGgIvZAniLjHpon2jlbl-kpvNjz3JJjVLFG9rl1YLQ	28
11	eSports 2014 Summer Case	2014-07-09	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsVk5kKhZDpYX3e1Y07ODdfDBH_pKzwdfSkqTyZLjQxjsF7sEoiLyQ9I2ljgHt_EZlYzr6J4DHIA9oZ1-D5BHglkR7Cs6C	31
12	Operation Vanguard Weapon Case	2014-11-10	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsUFJ5KBFZv668FFIuh6rJImVGvtjllYaNka6la7rUxWkE65BzibvD9N7z0Q22-0Fka2GlJ5jVLFHqavWW2g	33
13	Chroma Case	2015-01-07	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsUFJ5KBFZv668FFEuh_KQJTtEuI63xIXbxqOtauyClTMEsJV1jruS89T3iQKx_BBqa2j3JpjVLFH1xpp0EQ	34
14	Chroma 2 Case	2015-04-14	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsUFJ5KBFZv668FFAuhqSaKWtEu43mxtbbk6b1a77Twm4Iu8Yl3bCU9Imii1Xt80M5MmD7JZjVLFH-6VnQJQ	35
15	Falchion Case	2015-05-25	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsUFJ5KBFZv668FF8ugPDMIWpAuIq1w4KIlaChZOyFwzgJuZNy3-2T89T0jlC2rhZla2vwIJjVLFHz75yKpg	37
16	Shadow Case	2015-09-17	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsUFJ5KBFZv668FF4u1qubIW4Su4mzxYHbzqGtZ-KGlz8EuJcg3rnE9NiijVe3_UY-Zzr2JJjVLFEEeiQRtg	40
17	Revolver Case	2015-12-07	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsUFJ5KBFZv668FFYwnfKfcG9HvN7iktaOkqD1auLTxD5SvZYgiLvFpo7xjVLh-kdrYWnzcoGLMlhpsyM-5vg	41
18	Operation Wildfire Case	2016-02-16	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsUFJ5KBFZv668FFYxnaeQImRGu4S1x9TawfSmY-iHkmoD7cEl2LiQpIjz3wPl_ERkYWHwLY-LMlhp9pkR_UQ	42
19	Chroma 3 Case	2016-04-26	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsUFJ5KBFZv668FFYynaSdJGhE74y0wNWIw_OlNuvXkDpSuZQmi--SrN-h3gey-Uo6YWmlIoCLMlhplhFFvwI	43
20	Gamma Case	2016-06-14	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsUFJ5KBFZv668FFYznarJJjkQ6ovjw4SPlfP3auqEl2oBuJB1j--WoY322QziqkdpZGr3IteLMlhpw4RJCv8	44
21	Gamma 2 Case	2016-08-17	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsVFx5KAVo5PSkKV4xhfGfKTgVvIXlxNPSwaOmMLiGwzgJvJMniO-Zoo_z2wXg-EVvfSmtc78HsNoy	45
22	Glove Case	2016-11-27	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsUFJ5KBFZv668FFY1naTMdzwTtNrukteIkqT2MO_Uwz5Q6cYhibyXo4rw2ALsrkRoYjuncNCLMlhpEV4XDTk	46
23	Spectrum Case	2017-03-14	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsUFJ5KBFZv668FFY2nfKadD4U7Y7lwYXexaGlYb3QzjlUvZ0k0ujHptug2VbirkRrNW2md4SLMlhph09hpX0	47
24	Operation Hydra Case	2017-05-22	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsUFJ5KBFZv668FFY3navMJWgQtNm1ldLZzvOiZr-BlToIsZcoi-yTpdutiVW2-Es4NWjwIo-LMlhpinMS53M	48
25	Spectrum 2 Case	2017-09-13	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsUFJ5KBFZv668FFY4naeaJGhGtdnmx4Tek_bwY-iFlGlUsJMp3LuTot-mjFGxqUttZ2r3d4eLMlhpnZPxZK0	49
26	Clutch Case	2018-12-14	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsUFJ5KBFZv668FFY5naqQIz4R7Yjix9bZkvKiZrmAzzlTu5AoibiT8d_x21Wy8hY_MWz1doSLMlhpM3FKbNs	55
27	Horizon Case	2018-08-02	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsUFJ5KBFZv668FFUwnfbOdDgavYXukYTZkqf2ZbrTwmkE6scgj7CY94ml3FXl-ENkMW3wctOLMlhpVHKV9YA	50
28	Danger Zone Case	2018-12-05	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsUFJ5KBFZv668FFUxnaPLJz5H74y1xtTcz6etNumIx29U6Zd3j7yQoYih3lG1-UJqY27xJIeLMlhpaD9Aclo	54
29	Prisma Case	2019-03-12	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsUFJ5KBFZv668FFUynfWaI25G6Ijkl9iPw_SnNrjXw2oBu8cj3b2Qo4_33QbnrUdlYD37ddCLMlhpvs0XIz0	56
30	X-Ray P250 Package	2019-09-29	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsS091PDtH5O_1FAthwfTNP2kTvomzzYHdlqLxZb7XlW4IuJwk3u2S8NWl3QS1_EA6YT2iddeXdgIgIQaHHJc2aVo	57
31	CS20 Case	2019-10-17	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsUFJ5KBFZv668FFU0naHKIj9D7oTgl4LelaGnMuqIwDgFusR337HCpYmhiwzm8ktqMjv2INKLMlhprbp6CTE	58
32	Shattered Web Case	2019-11-17	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsUFJ5KBFZv668FFUznaCaJWVDvozlzdONwvKjYLiBk24IsZEl0uuYrNjw0A3n80JpZWzwIYWLMlhpLvhcskA	61
33	Prisma 2 Case	2020-03-30	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsUFJ5KBFZv668FFU1nfbOIj8W7oWzkYLdlPOsMOmIk2kGscAj2erE99Sn2AGw_0M4NW2hIYOLMlhpcmY0CRM	63
34	Fracture Case	2020-08-05	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsUFJ5KBFZv668FFU2nfGaJG0btN2wwYHfxa-hY-uFxj4Dv50nj7uXpI7w3AewrhBpMWH6d9CLMlhpEbAe-Zk	64
35	Operation Broken Fang Case	2020-12-03	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsUFJ5KBFZv668FFU3naeZIWUStYjgxdnewfGmZb6DxW8AupMp27yT9IqiilCxqkRkZGyldoaLMlhp6IQjKcg	68
36	Snakebite Case	2021-05-02	https://community.akamai.steamstatic.com/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsUFJ5KBFZv668FFU4naLOJzgUuYqyzIaIxa6jMOLXxGkHvcMjibmU99Sg3Qaw-hA_ZWrzLISLMlhpgJJUhGE	69
37	Operation Riptide Case	2021-09-21	https://wiki.cs.money/images/cases/operation-riptide-case.png	74
38	Dreams & Nightmares Case	2022-01-20	https://community.cloudflare.steamstatic.com/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsUFJ5KBFZv668FFQwnfCcJmxDv9rhwIHZwqP3a-uGwz9Xv8F0j-qQrI3xiVLkrxVuZW-mJoWLMlhpWhFkc9M	75
39	Recoil Case	2022-06-30	https://community.akamai.steamstatic.com/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXU5A1PIYQNqhpOSV-fRPasw8rsUFJ5KBFZv668FFQxnaecIT8Wv9rilYTYkfTyNuiFwmhUvpZz3-2Z9oqg0Vew80NvZzuiJdeLMlhpwFO-XdA/360fx360f	76
40	Revolution Case	2023-02-09	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_community_32.png	77
41	Kilowatt Case	2024-02-07	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_community_33_png.png	79
42	Gallery Case	2024-09-30	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_community_34_png.png	80
\.


--
-- Data for Name: collections; Type: TABLE DATA; Schema: public; Owner: stew
--

COPY public.collections (id, name, release_date, icon_url) FROM stdin;
1	The Arms Deal Collection	2013-08-13	https://wiki.cs.money/images/collections/the-arms-deal-collection.png
2	The Assault Collection	2013-08-13	https://wiki.cs.money/images/collections/the-assault-collection.png
3	The Aztec Collection	2013-08-13	https://wiki.cs.money/images/collections/the-aztec-collection.png
4	The Dust Collection	2013-08-13	https://wiki.cs.money/images/collections/the-dust-collection.png
5	The eSports 2013 Collection	2013-08-13	https://wiki.cs.money/images/collections/the-esports-2013-collection.png
6	The Inferno Collection	2013-08-13	https://wiki.cs.money/images/collections/the-inferno-collection.png
7	The Militia Collection	2013-08-13	https://wiki.cs.money/images/collections/the-militia-collection.png
8	The Nuke Collection	2013-08-13	https://wiki.cs.money/images/collections/the-nuke-collection.png
9	The Office Collection	2013-08-13	https://wiki.cs.money/images/collections/the-office-collection.png
10	The Vertigo Collection	2013-08-13	https://wiki.cs.money/images/collections/the-vertigo-collection.png
11	The Alpha Collection	2013-09-18	https://wiki.cs.money/images/collections/the-alpha-collection.png
12	The Bravo Collection	2013-09-18	https://wiki.cs.money/images/collections/the-bravo-collection.png
13	The Arms Deal 2 Collection	2013-11-07	https://wiki.cs.money/images/collections/the-arms-deal-2-collection.png
16	The Italy Collection	2013-11-26	https://wiki.cs.money/images/collections/the-italy-collection.png
17	The Lake Collection	2013-11-26	https://wiki.cs.money/images/collections/the-lake-collection.png
18	The Mirage Collection	2013-11-26	https://wiki.cs.money/images/collections/the-mirage-collection.png
19	The Safehouse Collection	2013-11-26	https://wiki.cs.money/images/collections/the-safehouse-collection.png
20	The Train Collection	2013-11-26	https://wiki.cs.money/images/collections/the-train-collection.png
21	The eSports 2013 Winter Collection	2013-12-17	https://wiki.cs.money/images/collections/the-esports-2013-winter-collection.png
22	The Winter Offensive Collection	2013-12-17	https://wiki.cs.money/images/collections/the-winter-offensive-collection.png
23	The Arms Deal 3 Collection	2014-02-11	https://wiki.cs.money/images/collections/the-arms-deal-3-collection.png
24	The Phoenix Collection	2014-02-19	https://wiki.cs.money/images/collections/the-phoenix-collection.png
25	The Bank Collection	2014-04-30	https://wiki.cs.money/images/collections/the-bank-collection.png
26	The Huntsman Collection	2014-04-30	https://wiki.cs.money/images/collections/the-huntsman-collection.png
27	The Baggage Collection	2014-06-30	https://wiki.cs.money/images/collections/the-baggage-collection.png
28	The Breakout Collection	2014-06-30	https://wiki.cs.money/images/collections/the-breakout-collection.png
29	The Cobblestone Collection	2014-06-30	https://wiki.cs.money/images/collections/the-cobblestone-collection.png
30	The Overpass Collection	2014-06-30	https://wiki.cs.money/images/collections/the-overpass-collection.png
31	The eSports 2014 Summer Collection	2014-07-09	https://wiki.cs.money/images/collections/the-esports-2014-summer-collection.png
32	The Cache Collection	2014-08-07	https://wiki.cs.money/images/collections/the-cache-collection.png
33	The Vanguard Collection	2014-11-10	https://wiki.cs.money/images/collections/the-vanguard-collection.png
34	The Chroma Collection	2015-01-07	https://wiki.cs.money/images/collections/the-chroma-collection.png
35	The Chroma 2 Collection	2015-04-14	https://wiki.cs.money/images/collections/the-chroma-2-collection.png
36	The Chop Shop Collection	2015-05-25	https://wiki.cs.money/images/collections/the-chop-shop-collection.png
37	The Falchion Collection	2015-05-25	https://wiki.cs.money/images/collections/the-falchion-collection.png
38	The Gods and Monsters Collection	2015-05-25	https://wiki.cs.money/images/collections/the-gods-and-monsters-collection.png
39	The Rising Sun Collection	2015-05-25	https://wiki.cs.money/images/collections/the-rising-sun-collection.png
40	The Shadow Collection	2015-09-17	https://wiki.cs.money/images/collections/the-shadow-collection.png
41	The Revolver Case Collection	2015-12-07	https://wiki.cs.money/images/collections/the-revolver-case-collection.png
42	The Wildfire Collection	2016-02-16	https://wiki.cs.money/images/collections/the-wildfire-collection.png
43	The Chroma 3 Collection	2016-04-26	https://wiki.cs.money/images/collections/the-chroma-3-collection.png
44	The Gamma Collection	2016-06-14	https://wiki.cs.money/images/collections/the-gamma-collection.png
45	The Gamma 2 Collection	2016-08-17	https://wiki.cs.money/images/collections/the-gamma-2-collection.png
46	The Glove Collection	2016-11-27	https://wiki.cs.money/images/collections/the-glove-collection.png
47	The Spectrum Collection	2017-03-14	https://wiki.cs.money/images/collections/the-spectrum-collection.png
48	Operation Hydra	2017-05-22	https://wiki.cs.money/images/collections/operation-hydra.png
49	The Spectrum 2 Collection	2017-09-13	https://wiki.cs.money/images/collections/the-spectrum-2-collection.png
50	The Horizon Collection	2018-08-02	https://wiki.cs.money/images/collections/the-horizon-collection.png
51	The 2018 Inferno Collection	2018-08-31	https://wiki.cs.money/images/collections/the-2018-inferno-collection.png
52	The 2018 Nuke Collection	2018-08-31	https://wiki.cs.money/images/collections/the-2018-nuke-collection.png
53	The Blacksite Collection	2018-12-05	https://wiki.cs.money/images/collections/the-blacksite-collection.png
54	The Danger Zone Collection	2018-12-05	https://wiki.cs.money/images/collections/the-danger-zone-collection.png
55	The Clutch Collection	2018-12-14	https://wiki.cs.money/images/collections/the-clutch-collection.png
56	The Prisma Collection	2019-03-12	https://wiki.cs.money/images/collections/the-prisma-collection.png
57	The X-Ray Collection	2019-09-29	https://wiki.cs.money/images/collections/the-x-ray-collection.png
58	The CS20 Collection	2019-10-17	https://wiki.cs.money/images/collections/the-cs20-collection.png
59	The Canals Collection	2019-11-17	https://wiki.cs.money/images/collections/the-canals-collection.png
60	The Norse Collection	2019-11-17	https://wiki.cs.money/images/collections/the-norse-collection.png
15	The Dust II Collection	2013-11-26	https://wiki.cs.money/images/collections/the-dust-2-collection.png
61	The Shattered Web Collection	2019-11-17	https://wiki.cs.money/images/collections/the-shattered-web-collection.png
62	The St. Marc Collection	2019-11-17	https://wiki.cs.money/images/collections/the-st-marc-collection.png
63	The Prisma 2 Collection	2020-03-30	https://wiki.cs.money/images/collections/the-prisma-2-collection.png
64	The Fracture Collection	2020-08-05	https://wiki.cs.money/images/collections/the-fracture-collection.png
65	The Ancient Collection	2020-12-02	https://wiki.cs.money/images/collections/the-ancient-collection.png
66	The Control Collection	2020-12-02	https://wiki.cs.money/images/collections/the-control-collection.png
67	The Havoc Collection	2020-12-02	https://wiki.cs.money/images/collections/the-havoc-collection.png
68	The Operation Broken Fang Collection	2020-12-03	https://wiki.cs.money/images/collections/the-operation-broken-fang-collection.png
69	The Snakebite Collection	2021-05-02	https://wiki.cs.money/images/collections/the-snakebite-collection.png
71	The 2021 Mirage Collection	2021-09-21	https://wiki.cs.money/images/collections/the-2021-mirage-collection.png
72	The 2021 Train Collection	2021-09-21	https://wiki.cs.money/images/collections/the-2021-train-collection.png
73	The 2021 Vertigo Collection	2021-09-21	https://wiki.cs.money/images/collections/the-2021-vertigo-collection.png
74	The Operation Riptide Collection	2021-09-21	https://wiki.cs.money/images/collections/the-operation-riptide-collection.png
75	The Dreams & Nightmares Collection	2022-01-20	https://wiki.cs.money/images/collections/the-dreams-nightmares-collection.png
76	The Recoil Collection	2022-06-30	https://wiki.cs.money/images/collections/the-recoil-collection.png
77	The Revolution Collection	2023-02-09	https://wiki.cs.money/images/collections/the-revolution-collection.png
78	The Anubis Collection	2023-04-24	https://wiki.cs.money/images/collections/the-anubis-collection.png
79	The Kilowatt Collection	2024-02-07	https://wiki.cs.money/images/collections/the-kilowatt-collection.png
80	The Gallery Collection	2024-09-30	https://wiki.cs.money/images/collections/collection-set-community-34.png
81	The Graphic Design Collection	2024-09-30	https://wiki.cs.money/images/collections/collection-set-graphic-design.png
82	Limited Edition Item	2024-09-30	https://wiki.cs.money/images/collections/collection-set-xpshop-wpn-01.png
83	The Overpass 2024 Collection	2024-09-30	https://wiki.cs.money/images/collections/collection-set-overpass-2024.png
84	The Sport & Field Collection	2024-09-30	https://wiki.cs.money/images/collections/collection-set-realism-camo.png
85	The Ascent Collection	2025-03-30	https://wiki.cs.money/images/collections/the-ascent-collection.png
86	The Boreal Collection	2025-03-30	https://wiki.cs.money/images/collections/the-boreal-collection.png
87	The Fever Collection	2025-03-30	https://wiki.cs.money/images/collections/the-fever-collection.png
88	The Radiant Collection	2025-03-30	https://wiki.cs.money/images/collections/the-radiant-collection.png
89	The Train 2025 Collection	2025-03-30	https://wiki.cs.money/images/collections/the-train-2025-collection.png
70	The 2021 Dust II Collection	2021-09-21	https://wiki.cs.money/images/collections/the-2021-dust-2-collection.png
\.


--
-- Data for Name: packages; Type: TABLE DATA; Schema: public; Owner: stew
--

COPY public.packages (id, name, release_date, icon_url, collection_id) FROM stdin;
1	DreamHack 2013 Souvenir Package	2013-11-27	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_dhw13_promo.png	\N
2	EMS One 2014 Souvenir Package	2014-03-12	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_ems14_promo.png	\N
4	ESL One Cologne 2014 Dust II Souvenir Package	2014-08-13	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_esl14_promo_de_dust2.png	15
5	ESL One Cologne 2014 Cobblestone Souvenir Package	2014-08-13	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_esl14_promo_de_cbble.png	29
15	DreamHack 2014 Cobblestone Souvenir Package	2014-11-25	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_dhw14_promo_de_cbble.png	29
19	ESL One Katowice 2015 Cobblestone Souvenir Package	2015-03-11	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_eslkatowice2015_promo_de_cbble.png	29
22	ESL One Cologne 2015 Cobblestone Souvenir Package	2015-08-19	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_eslcologne2015_promo_de_cbble.png	29
33	DreamHack Cluj-Napoca 2015 Cobblestone Souvenir Package	2015-10-27	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_cluj2015_promo_de_cbble.png	29
6	ESL One Cologne 2014 2014 Mirage Souvenir Package	2014-08-13	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_esl14_promo_de_mirage.png	18
10	DreamHack 2014 Mirage Souvenir Package	2014-11-25	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_dhw14_promo_de_mirage.png	18
21	ESL One Katowice 2015 Mirage Souvenir Package	2015-03-11	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_eslkatowice2015_promo_de_mirage.png	18
24	ESL One Cologne 2015 Mirage Souvenir Package	2015-08-19	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_eslcologne2015_promo_de_mirage.png	18
32	DreamHack Cluj-Napoca 2015 Mirage Souvenir Package	2015-10-27	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_cluj2015_promo_de_mirage.png	18
7	ESL One Cologne 2014 Cache Souvenir Package	2014-08-13	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_esl14_promo_de_cache.png	32
12	DreamHack 2014 Cache Souvenir Package	2014-11-25	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_dhw14_promo_de_cache.png	32
18	ESL One Katowice 2015 Cache Souvenir Package	2015-03-11	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_eslkatowice2015_promo_de_cache.png	32
28	ESL One Cologne 2015 Cache Souvenir Package	2015-08-19	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_eslcologne2015_promo_de_cache.png	32
35	DreamHack Cluj-Napoca 2015 Cache Souvenir Package	2015-10-27	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_cluj2015_promo_de_cache.png	32
8	ESL One Cologne 2014 Overpass Souvenir Package	2014-08-13	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_esl14_promo_de_overpass.png	30
11	DreamHack 2014 Overpass Souvenir Package	2014-11-25	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_dhw14_promo_de_overpass.png	30
27	ESL One Cologne 2015 Overpass Souvenir Package	2015-08-19	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_eslcologne2015_promo_de_overpass.png	30
31	DreamHack Cluj-Napoca 2015 Overpass Souvenir Package	2015-10-27	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_cluj2015_promo_de_overpass.png	30
9	ESL One Cologne 2014 Nuke Souvenir Package	2014-08-13	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_esl14_promo_de_nuke.png	8
13	DreamHack 2014 Nuke Souvenir Package	2014-11-25	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_dhw14_promo_de_nuke.png	8
23	ESL One Cologne 2015 Train Souvenir Package	2015-08-19	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_eslcologne2015_promo_de_train.png	20
30	DreamHack Cluj-Napoca 2015 Train Souvenir Package	2015-10-27	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_cluj2015_promo_de_train.png	20
36	MLG Columbus 2016 Train Souvenir Package	2016-03-28	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_columbus2016_promo_de_train.png	20
16	DreamHack 2014 Inferno Souvenir Package	2014-11-25	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_dhw14_promo_de_inferno.png	6
20	ESL One Katowice 2015 Inferno Souvenir Package	2015-03-11	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_eslkatowice2015_promo_de_inferno.png	6
25	ESL One Cologne 2015 Inferno Souvenir Package	2015-08-19	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_eslcologne2015_promo_de_inferno.png	6
29	DreamHack Cluj-Napoca 2015 Inferno Souvenir Package	2015-10-27	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_cluj2015_promo_de_inferno.png	6
40	MLG Columbus 2016 Cobblestone Souvenir Package	2016-03-18	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_columbus2016_promo_de_cbble.png	29
43	Cologne 2016 Cobblestone Souvenir Package	2016-07-04	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_cologne2016_promo_de_cbble.png	29
41	MLG Columbus 2016 Mirage Souvenir Package	2016-03-18	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_columbus2016_promo_de_mirage.png	18
46	Cologne 2016 Mirage Souvenir Package	2016-07-04	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_cologne2016_promo_de_mirage.png	18
53	Atlanta 2017 Mirage Souvenir Package	2017-01-20	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_atlanta2017_promo_de_mirage.png	18
61	Krakow 2017 Mirage Souvenir Package	2017-07-13	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_krakow2017_promo_de_mirage.png	18
62	Boston 2018 Mirage Souvenir Package	2018-01-10	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_boston2018_promo_de_mirage.png	18
39	MLG Columbus 2016 Cache Souvenir Package	2016-03-28	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_columbus2016_promo_de_cache.png	32
42	Cologne 2016 Cache Souvenir Package	2016-07-04	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_cologne2016_promo_de_cache.png	32
54	Atlanta 2017 Cache Souvenir Package	2017-01-20	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_atlanta2017_promo_de_cache.png	32
58	Krakow 2017 Cache Souvenir Package	2017-07-13	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_krakow2017_promo_de_cache.png	32
64	Boston 2018 Cache Souvenir Package	2018-01-10	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_boston2018_promo_de_cache.png	32
48	Cologne 2016 Overpass Souvenir Package	2016-07-04	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_cologne2016_promo_de_overpass.png	30
55	Atlanta 2017 Overpass Souvenir Package	2017-01-20	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_atlanta2017_promo_de_overpass.png	30
60	Krakow 2017 Overpass Souvenir Package	2017-07-13	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_krakow2017_promo_de_overpass.png	30
63	Boston 2018 Overpass Souvenir Package	2018-01-10	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_boston2018_promo_de_overpass.png	30
69	London 2018 Overpass Souvenir Package	2018-09-03	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_london2018_promo_de_overpass.png	30
38	MLG Columbus 2016 Nuke Souvenir Package	2016-03-28	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_columbus2016_promo_de_nuke.png	8
44	Cologne 2016 Nuke Souvenir Package	2016-07-04	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_cologne2016_promo_de_nuke.png	8
52	Atlanta 2017 Nuke Souvenir Package	2017-01-20	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_atlanta2017_promo_de_nuke.png	8
59	Krakow 2017 Nuke Souvenir Package	2017-07-13	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_krakow2017_promo_de_nuke.png	8
68	Boston 2018 Nuke Souvenir Package	2018-01-10	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_boston2018_promo_de_nuke.png	8
71	London 2018 Nuke Souvenir Package	2018-09-03	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_london2018_promo_de_nuke.png	8
47	Cologne 2016 Train Souvenir Package	2016-07-04	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_cologne2016_promo_de_train.png	20
51	Atlanta 2017 Train Souvenir Package	2017-01-20	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_atlanta2017_promo_de_train.png	20
57	Krakow 2017 Train Souvenir Package	2017-07-13	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_krakow2017_promo_de_train.png	20
65	Boston 2018 Train Souvenir Package	2018-01-10	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_boston2018_promo_de_train.png	20
74	London 2018 Train Souvenir Package	2018-09-03	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_london2018_promo_de_train.png	20
3	ESL One Cologne 2014 Inferno Souvenir Package	2014-08-13	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_esl14_promo_de_inferno.png	6
67	Boston 2018 Inferno Souvenir Package	2018-01-10	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_boston2018_promo_de_inferno.png	6
73	London 2018 Inferno Souvenir Package	2018-09-03	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_london2018_promo_de_inferno.png	6
77	Katowice 2019 Mirage Souvenir Package	2019-02-12	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_katowice2019_promo_de_mirage.png	18
85	Berlin 2019 Mirage Souvenir Package	2019-08-21	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_berlin2019_promo_de_mirage.png	18
90	Stockholm 2021 Mirage Souvenir Package	2021-10-21	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_stockh2021_promo_de_mirage.png	18
100	Antwerp 2022 Mirage Souvenir Package	2022-05-03	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_antwerp2022_promo_de_mirage.png	18
108	Rio 2022 Mirage Souvenir Package	2022-10-21	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_rio2022_promo_de_mirage.png	18
75	London 2018 Cache Souvenir Package	2018-09-03	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_london2018_promo_de_cache.png	32
79	Katowice 2019 Cache Souvenir Package	2019-02-12	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_katowice2019_promo_de_cache.png	32
81	Katowice 2019 Overpass Souvenir Package	2019-02-12	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_katowice2019_promo_de_overpass.png	30
86	Berlin 2019 Overpass Souvenir Package	2019-08-21	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_berlin2019_promo_de_overpass.png	30
96	Antwerp 2022 Overpass Souvenir Package	2022-05-03	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_antwerp2022_promo_de_overpass.png	30
109	Rio 2022 Overpass Souvenir Package	2022-10-21	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_rio2022_promo_de_overpass.png	30
80	Katowice 2019 Nuke Souvenir Package	2019-02-12	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_katowice2019_promo_de_nuke.png	8
84	Berlin 2019 Nuke Souvenir Package	2019-08-21	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_berlin2019_promo_de_nuke.png	8
93	Stockholm 2021 Nuke Souvenir Package	2021-10-21	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_stockh2021_promo_de_nuke.png	8
98	Antwerp 2022 Nuke Souvenir Package	2022-05-03	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_antwerp2022_promo_de_nuke.png	8
106	Rio 2022 Nuke Souvenir Package	2022-10-21	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_rio2022_promo_de_nuke.png	8
82	Katowice 2019 Train Souvenir Package	2019-02-12	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_katowice2019_promo_de_train.png	20
87	Berlin 2019 Train Souvenir Package	2019-08-21	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_berlin2019_promo_de_train.png	20
95	Stockholm 2021 Ancient Souvenir Package	2021-10-21	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_stockh2021_promo_de_ancient.png	65
102	Antwerp 2022 Ancient Souvenir Package	2022-05-03	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_antwerp2022_promo_de_ancient.png	65
105	Rio 2022 Ancient Souvenir Package	2022-10-21	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_rio2022_promo_de_ancient.png	65
112	Paris 2023 Anubis Souvenir Package	2023-05-04	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_paris2023_promo_de_anubis.png	78
76	Katowice 2019 Inferno Souvenir Package	2019-02-12	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_katowice2019_promo_de_inferno.png	6
83	Berlin 2019 Inferno Souvenir Package	2019-08-21	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_berlin2019_promo_de_inferno.png	6
91	Stockholm 2021 Inferno Souvenir Package	2021-10-21	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_stockh2021_promo_de_inferno.png	6
99	Antwerp 2022 Inferno Souvenir Package	2022-05-03	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_antwerp2022_promo_de_inferno.png	6
89	Berlin 2019 Vertigo Souvenir Package	2019-08-21	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_berlin2019_promo_de_vertigo.png	10
92	Stockholm 2021 Vertigo Souvenir Package	2021-10-21	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_stockh2021_promo_de_vertigo.png	10
97	Antwerp 2022 Vertigo Souvenir Package	2022-05-03	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_antwerp2022_promo_de_vertigo.png	10
107	Rio 2022 Vertigo Souvenir Package	2022-10-21	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_rio2022_promo_de_vertigo.png	10
111	Paris 2023 Vertigo Souvenir Package	2023-05-04	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_paris2023_promo_de_vertigo.png	10
114	Paris 2023 Mirage Souvenir Package	2023-05-04	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_paris2023_promo_de_mirage.png	18
117	Copenhagen 2024 Mirage Souvenir Package	2024-03-13	https://cdn.csgoskins.gg/public/uih/items/aHR0cHM6Ly9jZG4uY3Nnb3NraW5zLmdnL3B1YmxpYy9pbWFnZXMvYnVja2V0cy9lY29uL3dlYXBvbl9jYXNlcy9jcmF0ZV9jcGgyMDI0X3Byb21vX2RlX21pcmFnZS4wZTJmNjU3YTVjNDlkNzQwZjdkNWNiMWEzYzA1OTkyNTkyNzI4ZDVjLnBuZw--/auto/auto/85/notrim/29a3cec380502c859e4f4559debc1276.webp	18
116	Copenhagen 2024 Overpass Souvenir Package	2024-03-13	https://cdn.csgoskins.gg/public/uih/items/aHR0cHM6Ly9jZG4uY3Nnb3NraW5zLmdnL3B1YmxpYy9pbWFnZXMvYnVja2V0cy9lY29uL3dlYXBvbl9jYXNlcy9jcmF0ZV9jcGgyMDI0X3Byb21vX2RlX292ZXJwYXNzLmI1ZWE4MDU4NzZjYTUxMGM1ZjU4OTg0MTEzYTUxMzExMDJhMjExZWYucG5n/auto/auto/85/notrim/d2e83aa46ed1f0aa7baad12f196ab8f5.webp	30
122	Copenhagen 2024 Nuke Souvenir Package	2024-03-13	https://cdn.csgoskins.gg/public/uih/items/aHR0cHM6Ly9jZG4uY3Nnb3NraW5zLmdnL3B1YmxpYy9pbWFnZXMvYnVja2V0cy9lY29uL3dlYXBvbl9jYXNlcy9jcmF0ZV9jcGgyMDI0X3Byb21vX2RlX251a2UuMGY0NzQ2ZDg4NjgzYjQ3ODJhMmM4MmM0OTM1Zjc1ODI1YWFhZjVjOS5wbmc-/auto/auto/85/notrim/cc382683a9bb0d36c99bf50b55a0595f.webp	8
128	Shanghai 2024 Nuke Souvenir Package	2024-11-27	https://cdn.csgoskins.gg/public/uih/items/aHR0cHM6Ly9jZG4uY3Nnb3NraW5zLmdnL3B1YmxpYy9pbWFnZXMvYnVja2V0cy9lY29uL3RvdXJuYW1lbnRzL3NoYTIwMjQvY3JhdGVfc2hhMjAyNF9wcm9tb19kZV9udWtlLjNiOGMwYmNiMmZjMjkwMWIzZmRhOGJmYTNlZDU1MjI2MzhiYWVmOGQucG5n/auto/auto/85/notrim/2785c083fa3edc7f0f87ca101d847ac7.webp	8
135	Austin 2025 Nuke Souvenir Package	2025-05-22	https://cdn.csgoskins.gg/public/uih/items/aHR0cHM6Ly9jZG4uY3Nnb3NraW5zLmdnL3B1YmxpYy9pbWFnZXMvYnVja2V0cy9lY29uL3RvdXJuYW1lbnRzL2F1czIwMjUvY3JhdGVfYXVzMjAyNV9wcm9tb19kZV9udWtlLmZhNTQ5NjQ4NmU4ZGQ3MWVmY2MxN2E2MzkwYWE1Yzk5YmMxZGE0NzEucG5n/auto/auto/85/notrim/c1075f67dfb731915c09a0fac899017d.webp	8
132	Austin 2025 Train Souvenir Package	2025-05-22	https://cdn.csgoskins.gg/public/uih/items/aHR0cHM6Ly9jZG4uY3Nnb3NraW5zLmdnL3B1YmxpYy9pbWFnZXMvYnVja2V0cy9lY29uL3RvdXJuYW1lbnRzL2F1czIwMjUvY3JhdGVfYXVzMjAyNV9wcm9tb19kZV90cmFpbi40NDBmMzM2MDg3OWI1N2FmM2RlM2Y0MDQzMzQ1OTQ2YzRhNTMwMGQ1LnBuZw--/auto/auto/85/notrim/50dad6cd01a226796ebe9dc0fcb3407d.webp	20
113	Paris 2023 Ancient Souvenir Package	2023-05-04	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_paris2023_promo_de_ancient.png	65
119	Copenhagen 2024 Ancient Souvenir Package	2024-03-13	https://cdn.csgoskins.gg/public/uih/items/aHR0cHM6Ly9jZG4uY3Nnb3NraW5zLmdnL3B1YmxpYy9pbWFnZXMvYnVja2V0cy9lY29uL3dlYXBvbl9jYXNlcy9jcmF0ZV9jcGgyMDI0X3Byb21vX2RlX2FuY2llbnQuYmNmN2VmY2Q2NDdkMzBlMGQ5M2FkMTUwNDJlN2U3YmNmMjgyZTEyOS5wbmc-/auto/auto/85/notrim/97677a1c4e0d9264999a0cff5edba3bd.webp	65
126	Shanghai 2024 Ancient Souvenir Package	2024-11-27	https://cdn.csgoskins.gg/public/uih/items/aHR0cHM6Ly9jZG4uY3Nnb3NraW5zLmdnL3B1YmxpYy9pbWFnZXMvYnVja2V0cy9lY29uL3RvdXJuYW1lbnRzL3NoYTIwMjQvY3JhdGVfc2hhMjAyNF9wcm9tb19kZV9hbmNpZW50LjkwOWNhMDA3MjI1MDgzOWNiN2M3MDA0YmIxMGZmYzJiYjQ1MmJiYTMucG5n/auto/auto/85/notrim/fbab2ed9110fd20a96e254361cb19551.webp	65
120	Copenhagen 2024 Anubis Souvenir Package	2024-03-13	https://cdn.csgoskins.gg/public/uih/items/aHR0cHM6Ly9jZG4uY3Nnb3NraW5zLmdnL3B1YmxpYy9pbWFnZXMvYnVja2V0cy9lY29uL3dlYXBvbl9jYXNlcy9jcmF0ZV9jcGgyMDI0X3Byb21vX2RlX2FudWJpcy5kMTlhOTg4MmM5MWZhZmNhNmZjMWNkZTg3ZWM1YTVmYTJkMWU5MDFhLnBuZw--/auto/auto/85/notrim/85b34cb42cb141d2731fb2b79a62f600.webp	78
127	Shanghai 2024 Anubis Souvenir Package	2024-11-27	https://cdn.csgoskins.gg/public/uih/items/aHR0cHM6Ly9jZG4uY3Nnb3NraW5zLmdnL3B1YmxpYy9pbWFnZXMvYnVja2V0cy9lY29uL3RvdXJuYW1lbnRzL3NoYTIwMjQvY3JhdGVfc2hhMjAyNF9wcm9tb19kZV9hbnViaXMuZGQzNjQ5ZjJlOTQyYzA2YzU2YjAzOGQwNDZlMzlkYzVlMmUzNTA3ZS5wbmc-/auto/auto/85/notrim/bbb5ac064e1246ecc05a7727fa470536.webp	78
115	Paris 2023 Inferno Souvenir Package	2023-05-04	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_paris2023_promo_de_inferno.png	6
118	Copenhagen 2024 Inferno Souvenir Package	2024-03-13	https://cdn.csgoskins.gg/public/uih/items/aHR0cHM6Ly9jZG4uY3Nnb3NraW5zLmdnL3B1YmxpYy9pbWFnZXMvYnVja2V0cy9lY29uL3dlYXBvbl9jYXNlcy9jcmF0ZV9jcGgyMDI0X3Byb21vX2RlX2luZmVybm8uMTFmYmZmMzAyODRhMjBlNTE2MDUzOWVlZTYwMTUwMmJmYmQ5MGZmNC5wbmc-/auto/auto/85/notrim/dd010986d5d9cf44158f3855e3aec7d2.webp	6
129	Shanghai 2024 Inferno Souvenir Package	2024-11-27	https://cdn.csgoskins.gg/public/uih/items/aHR0cHM6Ly9jZG4uY3Nnb3NraW5zLmdnL3B1YmxpYy9pbWFnZXMvYnVja2V0cy9lY29uL3RvdXJuYW1lbnRzL3NoYTIwMjQvY3JhdGVfc2hhMjAyNF9wcm9tb19kZV9pbmZlcm5vLmM1M2FkNmJjM2QzMjE2M2FjMzdjM2I5YjdiMjI0MTZkYWI1YzZiNGIucG5n/auto/auto/85/notrim/f4375749463ed53c56b8ac1ea44b1adc.webp	6
121	Copenhagen 2024 Vertigo Souvenir Package	2024-03-13	https://cdn.csgoskins.gg/public/uih/items/aHR0cHM6Ly9jZG4uY3Nnb3NraW5zLmdnL3B1YmxpYy9pbWFnZXMvYnVja2V0cy9lY29uL3dlYXBvbl9jYXNlcy9jcmF0ZV9jcGgyMDI0X3Byb21vX2RlX3ZlcnRpZ28uOWVkYjQ1MDFhMjJhYmQzM2VhZTg0MWUxN2NjNjUyYjAyMTRjYTBhYi5wbmc-/auto/auto/85/notrim/72c424b3c21d16f7d548b2c6b8c850b0.webp	10
123	Shanghai 2024 Vertigo Souvenir Package	2024-11-27	https://cdn.csgoskins.gg/public/uih/items/aHR0cHM6Ly9jZG4uY3Nnb3NraW5zLmdnL3B1YmxpYy9pbWFnZXMvYnVja2V0cy9lY29uL3RvdXJuYW1lbnRzL3NoYTIwMjQvY3JhdGVfc2hhMjAyNF9wcm9tb19kZV92ZXJ0aWdvLjE4M2JjNTJlOTQyYjA4MWE2OWU4ZmZiZWQyYTM1YjM1YzkxYzE1MDgucG5n/auto/auto/85/notrim/ba582dc8825777e25aa2d78d2d98250b.webp	10
14	DreamHack 2014 Dust II Souvenir Package	2014-11-25	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_dhw14_promo_de_dust2.png	15
17	ESL One Katowice 2015 Dust II Souvenir Package	2015-03-11	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_eslkatowice2015_promo_de_dust2.png	15
26	ESL One Cologne 2015 Dust II Souvenir Package	2015-08-19	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_eslcologne2015_promo_de_dust2.png	15
34	DreamHack Cluj-Napoca 2015 Dust II Souvenir Package	2015-10-27	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_cluj2015_promo_de_dust2.png	15
37	MLG Columbus 2016 Dust II Souvenir Package	2016-03-28	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_columbus2016_promo_de_dust2.png	15
45	Cologne 2016 Dust II Souvenir Package	2016-07-04	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_cologne2016_promo_de_dust2.png	15
50	Atlanta 2017 Dust II Souvenir Package	2017-01-20	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_atlanta2017_promo_de_dust2.png	15
70	London 2018 Dust II Souvenir Package	2018-09-03	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_london2018_promo_de_dust2.png	15
78	Katowice 2019 Dust II Souvenir Package	2019-02-12	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_katowice2019_promo_de_dust2.png	15
88	Berlin 2019 Dust II Souvenir Package	2019-08-21	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_berlin2019_promo_de_dust2.png	15
94	Stockholm 2021 Dust II Souvenir Package	2021-10-21	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_stockh2021_promo_de_dust2.png	15
101	Antwerp 2022 Dust II Souvenir Package	2022-05-03	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_antwerp2022_promo_de_dust2.png	15
104	Rio 2022 Dust II Souvenir Package	2022-10-21	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_rio2022_promo_de_dust2.png	15
124	Shanghai 2024 Dust II Souvenir Package	2024-11-27	https://cdn.csgoskins.gg/public/uih/items/aHR0cHM6Ly9jZG4uY3Nnb3NraW5zLmdnL3B1YmxpYy9pbWFnZXMvYnVja2V0cy9lY29uL3RvdXJuYW1lbnRzL3NoYTIwMjQvY3JhdGVfc2hhMjAyNF9wcm9tb19kZV9kdXN0Mi40ODlkODJhYWJlYTMyNDZkZWFkODZlNmRkMjRmZDA5NTg3NjQ2MzgxLnBuZw--/auto/auto/85/notrim/9fe587a5a33c3e20c70425c0f560d6a2.webp	15
130	Austin 2025 Dust II Souvenir Package	2025-05-22	https://cdn.csgoskins.gg/public/uih/items/aHR0cHM6Ly9jZG4uY3Nnb3NraW5zLmdnL3B1YmxpYy9pbWFnZXMvYnVja2V0cy9lY29uL3RvdXJuYW1lbnRzL2F1czIwMjUvY3JhdGVfYXVzMjAyNV9wcm9tb19kZV9kdXN0Mi43ZWM3NzZlMjg4YmFjMWVkMGM4NDIxNjJhZjdlNjBhYjI2YTcyMDNjLnBuZw--/auto/auto/85/notrim/9e3ff6e99233234bd1f134db2e094fea.webp	15
49	Atlanta 2017 Cobblestone Souvenir Package	2017-01-20	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_atlanta2017_promo_de_cbble.png	29
56	Krakow 2017 Cobblestone Souvenir Package	2017-07-13	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_krakow2017_promo_de_cbble.png	29
66	Boston 2018 Cobblestone Souvenir Package	2018-01-10	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_boston2018_promo_de_cbble.png	29
72	London 2018 Mirage Souvenir Package	2018-09-03	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_london2018_promo_de_mirage.png	18
125	Shanghai 2024 Mirage Souvenir Package	2024-11-27	https://cdn.csgoskins.gg/public/uih/items/aHR0cHM6Ly9jZG4uY3Nnb3NraW5zLmdnL3B1YmxpYy9pbWFnZXMvYnVja2V0cy9lY29uL3RvdXJuYW1lbnRzL3NoYTIwMjQvY3JhdGVfc2hhMjAyNF9wcm9tb19kZV9taXJhZ2UuMDE0NDk2MmJlYTg3ODYxY2RjYTBhMjVlZTZlMDlkNjNiNDYxMDM2NC5wbmc-/auto/auto/85/notrim/1990381d43ffe5dc0900104437be528e.webp	18
131	Austin 2025 Mirage Souvenir Package	2025-05-22	https://cdn.csgoskins.gg/public/uih/items/aHR0cHM6Ly9jZG4uY3Nnb3NraW5zLmdnL3B1YmxpYy9pbWFnZXMvYnVja2V0cy9lY29uL3RvdXJuYW1lbnRzL2F1czIwMjUvY3JhdGVfYXVzMjAyNV9wcm9tb19kZV9taXJhZ2UuM2M0YzhmY2M4NTk5MGRhNTM4YzZhNWM4ZmJkN2IxMzFkOWNmNzZiZS5wbmc-/auto/auto/85/notrim/9752862bcbefbb936f2511a515f65359.webp	18
110	Paris 2023 Overpass Souvenir Package	2023-05-04	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_paris2023_promo_de_overpass.png	30
133	Austin 2025 Ancient Souvenir Package	2025-05-22	https://cdn.csgoskins.gg/public/uih/items/aHR0cHM6Ly9jZG4uY3Nnb3NraW5zLmdnL3B1YmxpYy9pbWFnZXMvYnVja2V0cy9lY29uL3RvdXJuYW1lbnRzL2F1czIwMjUvY3JhdGVfYXVzMjAyNV9wcm9tb19kZV9hbmNpZW50LjcyZmQxMGIxNzAyZGNkOGM1ZTcwMDg0NGE2NTU1YzY4ZmIyYmIyYjQucG5n/auto/auto/85/notrim/dd29d6492f3a0f439be3993ca7181f75.webp	65
136	Austin 2025 Anubis Souvenir Package	2025-05-22	https://cdn.csgoskins.gg/public/uih/items/aHR0cHM6Ly9jZG4uY3Nnb3NraW5zLmdnL3B1YmxpYy9pbWFnZXMvYnVja2V0cy9lY29uL3RvdXJuYW1lbnRzL2F1czIwMjUvY3JhdGVfYXVzMjAyNV9wcm9tb19kZV9hbnViaXMuOTRlNzdlYTExOGU0ZDM0YzZlYWE2MjU5YWYyYWU0YmRjZTAwNDlhNi5wbmc-/auto/auto/85/notrim/a7e937b1d095c811ee8591ea5f8d7873.webp	78
137	Anubis Collection Package	2023-04-24	https://cdn.csgoskins.gg/public/uih/items/aHR0cHM6Ly9jZG4uY3Nnb3NraW5zLmdnL3B1YmxpYy9pbWFnZXMvYnVja2V0cy9lY29uL3dlYXBvbl9jYXNlcy9jcmF0ZV9hbnViaXNfc3RvcmVwcm9tby42NTJjZTBmM2Y3MGY5MjE1NzU5MWEyOWQzZTM2ZjJjZWJjYzI3ZjY0LnBuZw--/auto/auto/85/notrim/90af246c9ec4e7bf250f84cebb15106f.webp	78
103	Rio 2022 Inferno Souvenir Package	2022-10-21	https://pub-5f12f7508ff04ae5925853dee0438460.r2.dev/data/csgo/resource/flash/econ/weapon_cases/crate_rio2022_promo_de_inferno.png	6
134	Austin 2025 Inferno Souvenir Package	2025-05-22	https://cdn.csgoskins.gg/public/uih/items/aHR0cHM6Ly9jZG4uY3Nnb3NraW5zLmdnL3B1YmxpYy9pbWFnZXMvYnVja2V0cy9lY29uL3RvdXJuYW1lbnRzL2F1czIwMjUvY3JhdGVfYXVzMjAyNV9wcm9tb19kZV9pbmZlcm5vLjZiMzg5Mjk2OThjYjJjYjQzMjFhOGRhYTc2MGVkZmU3ZDc0OTk0MzMucG5n/auto/auto/85/notrim/e6cc2264bfefa07af8550e7ee6774bb1.webp	6
\.


--
-- Data for Name: skins; Type: TABLE DATA; Schema: public; Owner: stew
--

COPY public.skins (id, name, collection_id, grade, icon_url, case_id) FROM stdin;
10	UMP-45 | Caramel	2	Consumer	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpoo7e1f1JfwPz3cjxQ7dGzmL-HnvD8J_WFzjMC7Mdwj7CZrImsiwLl80NpMjj2J9XEd1c-Y1HY-Qe5xejqgsS1ot2XnhE4oDtN	\N
11	SG 553 | Tornado	2	Consumer	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpopb3wflFfwPz3ZTJQ4t2ym7-HnvD8J_WCxG8AvZcp2LyXpY6n2AGyqUBkZDqlLIGTJFU_aAyB-Vm_yOvujJ66ot2XnuhtLzwJ	\N
12	Five-SeveN | Candy Apple	2	Industrial	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgposLOzLhRlxfbGTi5N086zkL-HnvD8J_WDz2pUv8cj2L-V94iniQft-xY_NWzydYOUcA89NVqD-FO-w7i70Me1ot2XnkOsbUS5	\N
13	Negev | Anodized Navy	2	Mil-Spec	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpouL-iLhFf0v33fzxU9eO6nYeDg7mhN7rXlTgDuMQi3-vCpdjw2Ae2qRZsMG2mINSUIAQ3YlvZ8gW_k7q-m9bi60E-BDow	\N
14	AUG | Hot Rod	2	Mil-Spec	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpot6-iFAZu7OHNdQJO5du-gM7SlvP2a-KFkDsD6cN33b6Z84rz0QXs8xJuZzymdYfDclU2M17W_Fm7366x0jzU3_8y	\N
15	MP9 | Bulldozer	2	Restricted	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpou6r8FBRv7OrNfTFN--O6nYeDg7nwNbqExmlV7pUjiOrC99Wl2Aaw-0o_a2DycIKUIFc4ZArRqQS8lee8m9bi6-WeLRzM	\N
16	Glock-18 | Fade	2	Restricted	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgposbaqKAxf0vL3dzxG6eO6nYeDg7miYr7VlWgHscN32LyT8dmm31XgrxdtZzvzJYDGIFM2Y16D-FfvlOu9m9bi66Oq9HyE	\N
17	SSG 08 | Lichen Dashed	3	Consumer	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpopamie19fwOP3YjVN_siJgIGbksj4OrzZgiVXusMk3r6Xo4qi2lfs80I-MGnxJNSccAJsNF2Br1G8x7q805a6ucmY1zI97WgcbLEr	\N
18	Nova | Forest Leaves	3	Consumer	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpouLWzKjhzw8zEdDxU6c-JmImMn-O6MeyElWkB65Rz0rvCoY-kiQHh8hVsMWincYWUcwVtN1HW_VG8yO_og4j84sqw9HSVkg	\N
19	Fiven-SeveN | Jungle	3	Consumer	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgposLOzLhRlxfbGTi5N09ajmoeHksj4OrzZgiVVsZ102LyUp9SmiQy3rRdsajiid9SXdwI-ZAnS_AS7ye66hsK9vpSf1zI97brss9rb	\N
20	M4A4 | Jungle Tiger	3	Industrial	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpou-6kejhoyszeTilL69mkq4yCkP_gfbjVkDhXsMAl2b3E9N-j0ADmrRJpYWmgddTAIQ4_Yw2BqAC9l-y51JOi_MOeuFGxnXQ	\N
21	AK-47 | Jungle Spray	3	Industrial	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpot7HxfDhzw8zbYS9D9eO8gY6Mm_LLP7LWnn8f6cMk2L3E9NqkilHm8hI-a2inctSWcAc8Zl-C81nvw-_uhpW06MjKzmwj5Hd9a9y0Zw	\N
22	Tec-9 | Ossified	3	Mil-Spec	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpoor-mcjhh3szHYi5L6sWJmImMn-O6YeLTx24FuMByiLyWrd3wjQKy_0Q-Z2_zcIWWdQRsZAvW_FG_lenpjYj84srtx4T2zA	\N
1	SG 553 | Ultraviolet	1	Mil-Spec	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpopb3wflFfwPz3YShQ_NCzq4yCkP_gfe-FwjMCu5AniLqSodij3lW3qUU5ZGHyJIOSJg5oaF6B_VLtk-3og8Ci_MOeaX_CtlE	1
2	MP7 | Skulls	1	Mil-Spec	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpou6ryFA957ODDZDFO_-O6nYeDg7mnNuiJzzoD6sFzj-iZ9N732Ae2-kdlNm_yLdCcJAc6YA3V_gfvkri7m9bi63NqHUO4	1
3	AUG | Wings	1	Mil-Spec	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpot6-iFA957PXNcClK6c6lq4GekMj4OrzZgiVUuZEg0-uUp42mjFCw_xE5N2zwJo7DdgU2NAnVrgTvwem9hcTtvpnB1zI97VRJemoq	1
4	USP-S | Dark Water	1	Restricted	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpoo6m1FBRp3_bGcjhQ0927q5qOleX1DL_QhGBu5Mx2gv2P9Ijx3wTtqUE5MW_7J46QcVA3ZFjYrgXoyL3th5O8v8nOnCQxsykg4GGdwUKSxD9j6w	1
5	M4A1-S | Dark Water	1	Restricted	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpou-6kejhz2v_Nfz5H_uO3mb-RkvXmMoTVl3la18l4jeHVu4qh0ADn_Us9Z277coPAcgRqYArZrlTrw-bug5W5uMucznJmvyAhs3zD30vg05sSVoA	1
6	Glock-18 | Dragon Tattoo	1	Restricted	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgposbaqKAxf0v73dS9D69O4q4eHmPT_DLfYkWNFpsAl2OiWp42k0VXm-UBlMGD6JoOScVQ2aVnX81m3xr-5hpHvu8vBzXt9-n51h9NwnXk	1
7	Desert Eagle | Hypnotic	1	Classified	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgposr-kLAtl7PLJTitH_si_k4-0m_7zO6-fzj5QuZN03uvH99T32Ve3_UBlYDqiIdKVIQBqYgnRr1frx-7thpW-v4OJlyUwDcxXZA	1
8	AK-47 | Case Hardened	1	Classified	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpot7HxfDhhwszHeDFH6OO6nYeDg7mtYbiJkjoDvcAlj7yVotmtjAfjrkpoZW36IoaWclM3MFnY8lK9k-vnm9bi67lSw9Es	1
9	AWP | Lightning Strike	1	Covert	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpot621FAZt7P_BdjVW4tW4k7-KgOfLP7LWnn8fu5In27GYod2l21Gx-xU5MGDzddCRdw83Y1DW-VS3wu291JS76Z7PnWwj5Hc0AjJzVA	1
23	SCAR-20 | Palm	4	Industrial	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpopbmkOVUw7ODYTi1D4NGJmImMn-O6Nr-IxT5VsZYj3biQrNqk3gThqEA-Y2qhLI-TdwA-N1yFqAfryebphIj84spWYPOlFA	\N
24	M4A4 | Desert Storm	4	Industrial	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpou-6kejhoyszMdC5H_siJmImMn-O6YOvVx24C7MZy2rrD9I_00FDgqkA6YWvxdoXHegM_MAzR-AK5xunmjIj84sqcbwbCfw	\N
25	AK-47 | Predator	4	Industrial	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpot7HxfDhzw8zSdD9Q7d-3mb-HnvD8J_WEkDoE65x03rjDrI322QfhqUtrMD2icNSRcgFtaFDX-AS9wL3u05S1ot2Xnn9ZGujG	\N
26	Sawed-Off | Copper	4	Mil-Spec	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpopbuyLgNv1fX3cCx979OmhIWZqPv9NLPF2GoD7JZ107uSo92n2AXk8hI4NWGncofHIQM9M1-E-lO8xO65g8e5vMzXiSw0JNfqxwk	\N
27	AWP | Snake Camo	4	Mil-Spec	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpot621FBRw7ODGcDZH09C_k4if2fSkMeiDwW8IvpVwjLGU9tWt31axr0poZ2v7I4-Wd1BsZQrWq1a2wb_xxcjrod6PdbI	\N
28	AUG | Copperhead	4	Mil-Spec	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpot6-iFA957PDHYS1H_tSzlYS0m_7zO6-fxz0H7sEk37zDpdyi3VKxqUVla277J4-ce1I3YV6D_lS8yLrt0ZC_vYOJlyXik3twsg	\N
29	P2000 | Scorpion	4	Restricted	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpovrG1eVcwg8zJfAJR79OkhImEmcjkYeuBxlRd4cJ5nqeZo9-m21Xh8kY-MG-gIoeWe1c6NFDU_VK6lOi6156078nKyiZg7yEm-z-DyIv3UiOT	\N
30	Glock-18 | Brass	4	Restricted	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgposbaqKAxf0uL3cy9D_8-JmImMn-O6MOLXlGkJvJ0iieiW99mt3Q2yqhU_YDr7ctORewNsYgzT81e8weu70Yj84sojP1pYAA	\N
31	Desert Eagle | Blaze	4	Restricted	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgposr-kLAtl7PLJTjtO7dGzh7-HnvD8J_XVkjoFuMYiiLqUrI-k3le3r0s5amj7d9eTI1I-M1rW-Fm_xO-50Jfvot2XnhS4_w8U	\N
32	MAG-7 | Memento	5	Mil-Spec	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpou7uifDhoyszBcjJR7dSzkJKEmcj4OrzZgiVXv8Bw0urC9Nz33Ay1-0dqYD3zLIGSI1A3MlHUr1boxOq7hcC96JrA1zI97TI-pHTn	2
33	M4A4 | Faded Zebra	5	Mil-Spec	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkGpou-6kejhzw8zSdD9Q7d-3mb-JgMj4OrzZgiVV7ZUpj--T9Nrx3wHm_xZqa2vyJY7GJ1A7NVnS-1O6kuvugJDo6szB1zI97QRjcl-G	2
34	FAMAS | Doomkitty	5	Mil-Spec	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgposLuoKhRf2-r3dTJN4de_gJSSqPv9NLPF2GgI7MEmiLHH99303ACw_kVlYm_7INfEJwI-ZwzT_FG6wu3qgJa4upXXiSw0PlrXJeI	2
35	Sawed-Off | Orange DDPAT	5	Restricted	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpopbuyLgNv1fX3eSR96NimlZS0mOX1PbzUqWdY781lxLmV84mk3gfs_EM9N2_2cYeSJg5rZQyE81W-wu_nhcPov87MmHBisnQ8pSGKv4w_r3Q	2
36	P250 | Splash	5	Restricted	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpopujwezhzw8zbYTFD_9SJhNLex8j4OrzZgiUIupIhjrHFpNj22w21rhVkYG3zI9PEdwZrZFmG-gTsyee8hJG-up6d1zI97bay_VK1	2
37	Galil AR | Orange DDPAT	5	Restricted	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgposbupIgthwczAaAJG6My3gL-Ehfb6NL7ummJW4NE_0r2YrI2l2gex_UI6ZT3wcoHBcgU-YFrV-FC6w-y90MLt6cmdzyFh6D5iuyiP2N48lg	2
38	AWP | BOOM	5	Classified	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpot621FA957PHEcDB9_9W7hIyOqPv9NLPF2G5VuZQl072WodSkjQTn_UU-YTqncYaccFc2NQyBqVXqxuzqhZG7uc_XiSw0f3y6kYU	2
39	AK-47 | Red Laminate	5	Classified	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpot7HxfDhoyszJemkV4N27q4yCkP_gfeqIzz0DuMAp2rGUotWj2w3m_Uc_NW72J9KVdAM-ZlrRqFXsku-5hpGi_MOeuhMPC0E	2
40	P90 | Death by Kitty	5	Covert	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpopuP1FAR17PDJZS5J-dC6h7-bzqfLP7LWnn8fuMN32OqU9tmmiQLt-hZuaz2mJITGJgFsZViF-Vi7levs0Z7vupXLz2wj5HegSjteqg	2
41	Nova | Walnut	6	Consumer	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpouLWzKjhjxszfcDFM-ciJmo-dlsj4OrzZgiUCsMZ12u-Zrd2j2lGw80s5MWHycNCSc1A7NwrR8lC9yL3s1JW675rO1zI97bNGh6Jj	\N
42	MAG-7 | Sand Dune	6	Consumer	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpou7uifDhz3MzbcDNG09C_k4if2a7wNbiFwG1VvpVwi7CTotqtigTmr0BlYG7ycIPEI1U-ZQrY81Pol-bxxcjrdUalW9E	\N
43	P250 | Gunsmoke	6	Industrial	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpopujwezhoyszPdDFS6dKJmImMn-O6YeqFlzID6pZzj-qY9I6t2VWw-xBtYGv0ItDEdldtZF3S_1K-l-3u04j84srtbNcI-g	\N
44	M4A4 | Tornado	6	Industrial	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpou-6kejhz3Mzcfi9M7di5q4yCkP_gfe7Uzj4D6pUo37vA89iii1Cx8hFkMG_zcdLDcwU5N1vUqFm_l7vnhJSi_MOeBFODA4o	\N
45	Tec-9 | Brass	6	Mil-Spec	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpoor-mcjhhwszKYzxR_-O6nYeDg7mkNuyJwD0E7pEo3uySrNz02ALgqEs9a2r7JIWVIAI6ZFDV-VfqyL-6m9bi6w7M2nK8	\N
46	Dual Berettas | Anodized Navy	6	Mil-Spec	https://steamcommunity-a.akamaihd.net/economy/image/-9a81dlWLwJ2UUGcVs_nsVtzdOEdtWwKGZZLQHTxDZ7I56KU0Zwwo4NUX4oFJZEHLbXH5ApeO4YmlhxYQknCRvCo04DEVlxkKgpos7asPwJf0v33fzxU9eO6nYeDg7msZOKIz2hS7ZEki7mS89Tw0Ae3-Us4MWD7LIGRegc-MF2D81i-ku_vm9bi644LgQp9	\N
\.


--
-- Name: cases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stew
--

SELECT pg_catalog.setval('public.cases_id_seq', 42, true);


--
-- Name: collections_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stew
--

SELECT pg_catalog.setval('public.collections_collection_id_seq', 89, true);


--
-- Name: packages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stew
--

SELECT pg_catalog.setval('public.packages_id_seq', 137, true);


--
-- Name: skins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: stew
--

SELECT pg_catalog.setval('public.skins_id_seq', 46, true);


--
-- Name: cases cases_pkey; Type: CONSTRAINT; Schema: public; Owner: stew
--

ALTER TABLE ONLY public.cases
    ADD CONSTRAINT cases_pkey PRIMARY KEY (id);


--
-- Name: collections collections_name_key; Type: CONSTRAINT; Schema: public; Owner: stew
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT collections_name_key UNIQUE (name);


--
-- Name: collections collections_pkey; Type: CONSTRAINT; Schema: public; Owner: stew
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT collections_pkey PRIMARY KEY (id);


--
-- Name: packages packages_pkey; Type: CONSTRAINT; Schema: public; Owner: stew
--

ALTER TABLE ONLY public.packages
    ADD CONSTRAINT packages_pkey PRIMARY KEY (id);


--
-- Name: skins skins_pkey; Type: CONSTRAINT; Schema: public; Owner: stew
--

ALTER TABLE ONLY public.skins
    ADD CONSTRAINT skins_pkey PRIMARY KEY (id);


--
-- Name: idx_name_gist; Type: INDEX; Schema: public; Owner: stew
--

CREATE INDEX idx_name_gist ON public.cases USING gist (name public.gist_trgm_ops);


--
-- Name: cases cases_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: stew
--

ALTER TABLE ONLY public.cases
    ADD CONSTRAINT cases_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES public.collections(id);


--
-- Name: packages packages_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: stew
--

ALTER TABLE ONLY public.packages
    ADD CONSTRAINT packages_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES public.collections(id);


--
-- Name: skins skins_case_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: stew
--

ALTER TABLE ONLY public.skins
    ADD CONSTRAINT skins_case_id_fkey FOREIGN KEY (case_id) REFERENCES public.cases(id);


--
-- Name: skins skins_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: stew
--

ALTER TABLE ONLY public.skins
    ADD CONSTRAINT skins_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES public.collections(id);


--
-- PostgreSQL database dump complete
--

\unrestrict dOqP7ZcmnGYQzeYW43maHoXQsuErnOSHOpfdaQAiKF3Xnyg73W427kMCQWpFA9g

