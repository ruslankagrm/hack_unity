--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4 (Ubuntu 13.4-4.pgdg20.04+1)
-- Dumped by pg_dump version 14.0 (Ubuntu 14.0-1.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres1
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres1;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres1
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres1;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres1
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres1
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres1;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres1
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres1;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres1
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres1
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres1;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres1
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres1;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres1
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres1
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres1;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres1
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres1;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres1
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres1;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres1
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres1
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres1;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres1
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres1
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres1;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres1
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres1;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres1
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres1
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres1;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres1
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres1;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres1
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres1
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres1;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres1
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres1;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres1
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres1
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres1;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres1
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres1;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres1
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres1
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres1;

--
-- Name: flight_reports; Type: TABLE; Schema: public; Owner: postgres1
--

CREATE TABLE public.flight_reports (
    guid uuid NOT NULL,
    user_id uuid NOT NULL,
    danger_close character varying(255),
    hits character varying(255),
    max_height character varying(255),
    max_speed character varying(255),
    points character varying(255),
    status character varying(255),
    "time" character varying(255),
    loose_connection character varying(255)
);


ALTER TABLE public.flight_reports OWNER TO postgres1;

--
-- Name: projects_user; Type: TABLE; Schema: public; Owner: postgres1
--

CREATE TABLE public.projects_user (
    guid uuid NOT NULL,
    name character varying(255),
    result character varying(255)
);


ALTER TABLE public.projects_user OWNER TO postgres1;

--
-- Name: questions; Type: TABLE; Schema: public; Owner: postgres1
--

CREATE TABLE public.questions (
    guid uuid NOT NULL,
    name character varying(255),
    test_id_id uuid NOT NULL
);


ALTER TABLE public.questions OWNER TO postgres1;

--
-- Name: results; Type: TABLE; Schema: public; Owner: postgres1
--

CREATE TABLE public.results (
    guid uuid NOT NULL,
    result double precision,
    user_id_id uuid NOT NULL
);


ALTER TABLE public.results OWNER TO postgres1;

--
-- Name: tests; Type: TABLE; Schema: public; Owner: postgres1
--

CREATE TABLE public.tests (
    guid uuid NOT NULL,
    name character varying(255)
);


ALTER TABLE public.tests OWNER TO postgres1;

--
-- Name: variants; Type: TABLE; Schema: public; Owner: postgres1
--

CREATE TABLE public.variants (
    guid uuid NOT NULL,
    name character varying(255),
    is_answer boolean NOT NULL,
    question_id_id uuid NOT NULL
);


ALTER TABLE public.variants OWNER TO postgres1;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres1
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres1
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres1
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add project user	7	add_projectuser
26	Can change project user	7	change_projectuser
27	Can delete project user	7	delete_projectuser
28	Can view project user	7	view_projectuser
29	Can add questions	8	add_questions
30	Can change questions	8	change_questions
31	Can delete questions	8	delete_questions
32	Can view questions	8	view_questions
33	Can add tests	9	add_tests
34	Can change tests	9	change_tests
35	Can delete tests	9	delete_tests
36	Can view tests	9	view_tests
37	Can add variants	10	add_variants
38	Can change variants	10	change_variants
39	Can delete variants	10	delete_variants
40	Can view variants	10	view_variants
41	Can add results	11	add_results
42	Can change results	11	change_results
43	Can delete results	11	delete_results
44	Can view results	11	view_results
45	Can add flight report	12	add_flightreport
46	Can change flight report	12	change_flightreport
47	Can delete flight report	12	delete_flightreport
48	Can view flight report	12	view_flightreport
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres1
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres1
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres1
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres1
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres1
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	unity_app	projectuser
8	unity_app	questions
9	unity_app	tests
10	unity_app	variants
11	unity_app	results
12	unity_app	flightreport
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres1
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-12-03 03:49:18.214654+05
2	auth	0001_initial	2021-12-03 03:49:18.373933+05
3	admin	0001_initial	2021-12-03 03:49:18.431593+05
4	admin	0002_logentry_remove_auto_add	2021-12-03 03:49:18.457205+05
5	admin	0003_logentry_add_action_flag_choices	2021-12-03 03:49:18.479553+05
6	contenttypes	0002_remove_content_type_name	2021-12-03 03:49:18.496746+05
7	auth	0002_alter_permission_name_max_length	2021-12-03 03:49:18.504712+05
8	auth	0003_alter_user_email_max_length	2021-12-03 03:49:18.512232+05
9	auth	0004_alter_user_username_opts	2021-12-03 03:49:18.51923+05
10	auth	0005_alter_user_last_login_null	2021-12-03 03:49:18.526631+05
11	auth	0006_require_contenttypes_0002	2021-12-03 03:49:18.52962+05
12	auth	0007_alter_validators_add_error_messages	2021-12-03 03:49:18.536373+05
13	auth	0008_alter_user_username_max_length	2021-12-03 03:49:18.55459+05
14	auth	0009_alter_user_last_name_max_length	2021-12-03 03:49:18.579389+05
15	auth	0010_alter_group_name_max_length	2021-12-03 03:49:18.592025+05
16	auth	0011_update_proxy_permissions	2021-12-03 03:49:18.600184+05
17	auth	0012_alter_user_first_name_max_length	2021-12-03 03:49:18.607419+05
18	sessions	0001_initial	2021-12-03 03:49:18.628474+05
19	unity_app	0001_initial	2021-12-03 03:49:18.725432+05
20	unity_app	0002_flightreport	2021-12-03 22:56:56.847761+05
21	unity_app	0003_auto_20211203_1806	2021-12-03 23:06:32.176665+05
22	unity_app	0004_flightreport_loose_connection	2021-12-04 00:17:14.494353+05
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres1
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: flight_reports; Type: TABLE DATA; Schema: public; Owner: postgres1
--

COPY public.flight_reports (guid, user_id, danger_close, hits, max_height, max_speed, points, status, "time", loose_connection) FROM stdin;
\.


--
-- Data for Name: projects_user; Type: TABLE DATA; Schema: public; Owner: postgres1
--

COPY public.projects_user (guid, name, result) FROM stdin;
cd78973b-ab18-4293-990f-3984fafde4ae	Jhon	\N
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: postgres1
--

COPY public.questions (guid, name, test_id_id) FROM stdin;
32862672-f0fa-4087-983e-956b1cc0fb23	Как определяется аэронавигационный запас при принятии решения на вылет без ЗА?	32862672-f0fa-4087-983e-956b1cc0fbf2
32862672-f0fa-4087-983e-956b1cc0fb25	По какой формуле рассчитывается возможная коммерческая загрузка?\n	32862672-f0fa-4087-983e-956b1cc0fbf2
32862672-f0fa-4087-983e-956b1cc0fb24	Что называется рубежом ухода (возврата)?	32862672-f0fa-4087-983e-956b1cc0fbf2
32862672-f0fa-4087-983e-956b1cc0fb22	Как определяется аэронавигационный запас?	32862672-f0fa-4087-983e-956b1cc0fbf2
\.


--
-- Data for Name: results; Type: TABLE DATA; Schema: public; Owner: postgres1
--

COPY public.results (guid, result, user_id_id) FROM stdin;
\.


--
-- Data for Name: tests; Type: TABLE DATA; Schema: public; Owner: postgres1
--

COPY public.tests (guid, name) FROM stdin;
32862672-f0fa-4087-983e-956b1cc0fbf2	Основы воздушной навигации 
\.


--
-- Data for Name: variants; Type: TABLE DATA; Schema: public; Owner: postgres1
--

COPY public.variants (guid, name, is_answer, question_id_id) FROM stdin;
31862672-f0fa-4087-983e-956b1cc0fbf1	По таблице в РЛЭ или по формуле Q анз = Q з.а. + Qкр.	f	32862672-f0fa-4087-983e-956b1cc0fb23
32862672-f0fa-4087-983e-956b1cc0fbf1	Согласно методических рекомендаций по расчету топлива	t	32862672-f0fa-4087-983e-956b1cc0fb23
33862672-f0fa-4087-983e-956b1cc0fbf1	30 % от общего запаса топлива на полет30 % от общего запаса топлива на полет	f	32862672-f0fa-4087-983e-956b1cc0fb23
34862672-f0fa-4087-983e-956b1cc0fbf1	По формуле Q анз = Q общ - Qпол.	f	32862672-f0fa-4087-983e-956b1cc0fb23
01862672-f0fa-4087-983e-956b1cc0fbf1	Gкомм.=МДВМ–(Gсн+Qобщ)	f	32862672-f0fa-4087-983e-956b1cc0fb25
02862672-f0fa-4087-983e-956b1cc0fbf1	Gкомм.=МДВМ+(Gсн + Qобщ)	t	32862672-f0fa-4087-983e-956b1cc0fb25
03862672-f0fa-4087-983e-956b1cc0fbf1	Gкомм.=Gсн+(МДВМ - Qобщ)	f	32862672-f0fa-4087-983e-956b1cc0fb25
04862672-f0fa-4087-983e-956b1cc0fbf1	Gкомм.=МДВМ–(Gсн - Qобщ)	f	32862672-f0fa-4087-983e-956b1cc0fb25
41862672-f0fa-4087-983e-956b1cc0fbf1	Рубеж, в случае ухода с которого на ЗА запас топлива на борту ВС к Трасч прилета был >=30мин полета на высоте круга.\n	f	32862672-f0fa-4087-983e-956b1cc0fb24
42862672-f0fa-4087-983e-956b1cc0fbf1	Рубеж, в случае ухода с которого запас топлива на борту ВС к Трасч прилета был равен Qпосадки.\n	f	32862672-f0fa-4087-983e-956b1cc0fb24
43862672-f0fa-4087-983e-956b1cc0fbf1	Рубеж, с которого начинается заход на посадку на ЗА, а запас топлива на борту ВС обеспечил 60мин полета.\n	f	32862672-f0fa-4087-983e-956b1cc0fb24
44862672-f0fa-4087-983e-956b1cc0fbf1	Рубеж, с которого начинается заход на посадку, а запас топлива на борту ВС обеспечил 120мин полета на высоте круга.\n	t	32862672-f0fa-4087-983e-956b1cc0fb24
12862671-f0fa-4087-983e-956b1cc0fbf1	По таблице в РЛЭ или по формуле Q анз = Q з.а. + Qкр.	f	32862672-f0fa-4087-983e-956b1cc0fb22
44862673-f0fa-4087-983e-956b1cc0fbf1	Согласно методических рекомендаций по расчету топлива	f	32862672-f0fa-4087-983e-956b1cc0fb22
44862674-f0fa-4087-983e-956b1cc0fbf1	30 % от общего запаса топлива на полет30 % от общего запаса топлива на полет.	t	32862672-f0fa-4087-983e-956b1cc0fb22
44862675-f0fa-4087-983e-956b1cc0fbf1	По формуле Q анз = Q общ - Qпол.	f	32862672-f0fa-4087-983e-956b1cc0fb22
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres1
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres1
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres1
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres1
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres1
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres1
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres1
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres1
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres1
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 22, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: flight_reports flight_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.flight_reports
    ADD CONSTRAINT flight_reports_pkey PRIMARY KEY (guid);


--
-- Name: projects_user projects_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.projects_user
    ADD CONSTRAINT projects_user_pkey PRIMARY KEY (guid);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (guid);


--
-- Name: results results_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_pkey PRIMARY KEY (guid);


--
-- Name: tests tests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT tests_pkey PRIMARY KEY (guid);


--
-- Name: variants variants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.variants
    ADD CONSTRAINT variants_pkey PRIMARY KEY (guid);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres1
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres1
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres1
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres1
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres1
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres1
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres1
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres1
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres1
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres1
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres1
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres1
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres1
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: flight_reports_user_id_58dd7836; Type: INDEX; Schema: public; Owner: postgres1
--

CREATE INDEX flight_reports_user_id_58dd7836 ON public.flight_reports USING btree (user_id);


--
-- Name: questions_test_id_id_778bbdef; Type: INDEX; Schema: public; Owner: postgres1
--

CREATE INDEX questions_test_id_id_778bbdef ON public.questions USING btree (test_id_id);


--
-- Name: results_user_id_id_43dbc5af; Type: INDEX; Schema: public; Owner: postgres1
--

CREATE INDEX results_user_id_id_43dbc5af ON public.results USING btree (user_id_id);


--
-- Name: variants_question_id_id_de53ed26; Type: INDEX; Schema: public; Owner: postgres1
--

CREATE INDEX variants_question_id_id_de53ed26 ON public.variants USING btree (question_id_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: flight_reports flight_reports_user_id_58dd7836_fk_projects_user_guid; Type: FK CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.flight_reports
    ADD CONSTRAINT flight_reports_user_id_58dd7836_fk_projects_user_guid FOREIGN KEY (user_id) REFERENCES public.projects_user(guid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: questions questions_test_id_id_778bbdef_fk_tests_guid; Type: FK CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_test_id_id_778bbdef_fk_tests_guid FOREIGN KEY (test_id_id) REFERENCES public.tests(guid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: results results_user_id_id_43dbc5af_fk_projects_user_guid; Type: FK CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_user_id_id_43dbc5af_fk_projects_user_guid FOREIGN KEY (user_id_id) REFERENCES public.projects_user(guid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: variants variants_question_id_id_de53ed26_fk_questions_guid; Type: FK CONSTRAINT; Schema: public; Owner: postgres1
--

ALTER TABLE ONLY public.variants
    ADD CONSTRAINT variants_question_id_id_de53ed26_fk_questions_guid FOREIGN KEY (question_id_id) REFERENCES public.questions(guid) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

