--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-1.pgdg18.04+1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-1.pgdg18.04+1)

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: agama; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.agama AS ENUM (
    'Islam',
    'Kristen',
    'Khatolik',
    'Hindu',
    'Budha',
    'KongHuCu'
);


ALTER TYPE public.agama OWNER TO postgres;

--
-- Name: gender; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.gender AS ENUM (
    'L',
    'P'
);


ALTER TYPE public.gender OWNER TO postgres;

--
-- Name: haris; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.haris AS ENUM (
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
    'Minggu'
);


ALTER TYPE public.haris OWNER TO postgres;

--
-- Name: matkul_semester; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.matkul_semester AS ENUM (
    'Ganjil',
    'Genap',
    'Ganjil/Genap'
);


ALTER TYPE public.matkul_semester OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: fasilitas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fasilitas (
    nama character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer,
    id integer NOT NULL
);


ALTER TABLE public.fasilitas OWNER TO postgres;

--
-- Name: COLUMN fasilitas.nama; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.fasilitas.nama IS 'Nama';


--
-- Name: fasilitas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fasilitas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fasilitas_id_seq OWNER TO postgres;

--
-- Name: fasilitas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fasilitas_id_seq OWNED BY public.fasilitas.id;


--
-- Name: hari; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hari (
    id integer NOT NULL,
    nama character varying(50)
);


ALTER TABLE public.hari OWNER TO postgres;

--
-- Name: hari_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hari_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hari_id_seq OWNER TO postgres;

--
-- Name: hari_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hari_id_seq OWNED BY public.hari.id;


--
-- Name: jamke; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jamke (
    id integer NOT NULL,
    kode character varying(5),
    mulai time without time zone,
    akhir time without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE public.jamke OWNER TO postgres;

--
-- Name: COLUMN jamke.kode; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.jamke.kode IS 'Kode';


--
-- Name: COLUMN jamke.mulai; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.jamke.mulai IS 'Mulai';


--
-- Name: COLUMN jamke.akhir; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.jamke.akhir IS 'Akhir';


--
-- Name: jamke_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jamke_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jamke_id_seq OWNER TO postgres;

--
-- Name: jamke_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jamke_id_seq OWNED BY public.jamke.id;


--
-- Name: jenis_prasarana; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jenis_prasarana (
    id integer NOT NULL,
    nama character varying(30),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE public.jenis_prasarana OWNER TO postgres;

--
-- Name: COLUMN jenis_prasarana.nama; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.jenis_prasarana.nama IS 'Nama';


--
-- Name: jenis_prasarana_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jenis_prasarana_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jenis_prasarana_id_seq OWNER TO postgres;

--
-- Name: jenis_prasarana_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jenis_prasarana_id_seq OWNED BY public.jenis_prasarana.id;


--
-- Name: jenis_ruang; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jenis_ruang (
    id integer NOT NULL,
    nama character varying(30),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE public.jenis_ruang OWNER TO postgres;

--
-- Name: COLUMN jenis_ruang.nama; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.jenis_ruang.nama IS 'Nama';


--
-- Name: jenis_ruang_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jenis_ruang_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jenis_ruang_id_seq OWNER TO postgres;

--
-- Name: jenis_ruang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jenis_ruang_id_seq OWNED BY public.jenis_ruang.id;


--
-- Name: kategori_kampus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kategori_kampus (
    id integer NOT NULL,
    nama character varying(40),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE public.kategori_kampus OWNER TO postgres;

--
-- Name: kategori_kampus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kategori_kampus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kategori_kampus_id_seq OWNER TO postgres;

--
-- Name: kategori_kampus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kategori_kampus_id_seq OWNED BY public.kategori_kampus.id;


--
-- Name: kelas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kelas (
    id integer NOT NULL,
    ta_id integer,
    mk_id integer,
    ruang_id integer,
    dosen_id integer,
    asdos_id integer,
    jamke_mulai integer,
    jamke_akhir integer,
    status smallint,
    hari character varying(10),
    semester character varying(5),
    kode text,
    abbr character(3),
    tm smallint,
    prk smallint,
    lap smallint DEFAULT 0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer,
    prodi_id integer,
    tgl_mulai date,
    tgl_akhir date,
    ka_id integer,
    jam_mulai time without time zone,
    jam_akhir time without time zone,
    publish_nilai smallint DEFAULT 0
);


ALTER TABLE public.kelas OWNER TO postgres;

--
-- Name: kelas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kelas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kelas_id_seq OWNER TO postgres;

--
-- Name: kelas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kelas_id_seq OWNED BY public.kelas.id;


--
-- Name: kelas_prodi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kelas_prodi (
    id integer NOT NULL,
    prodi_id integer,
    kelas_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE public.kelas_prodi OWNER TO postgres;

--
-- Name: kelas_prodi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kelas_prodi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kelas_prodi_id_seq OWNER TO postgres;

--
-- Name: kelas_prodi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kelas_prodi_id_seq OWNED BY public.kelas_prodi.id;


--
-- Name: mahasiswa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mahasiswa (
    mhsid integer NOT NULL,
    nim character varying(20),
    thn_masuk integer,
    ipk double precision,
    total_sks integer,
    no_ijazah character varying(20),
    tgl_lulus date,
    camaba_id integer,
    prodi_id integer,
    status_id integer,
    peminatan_id integer DEFAULT 0,
    kode_rombel character varying(6),
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer,
    id_sk integer,
    batas_studi integer,
    status_awal_id integer,
    nilai_sas integer,
    foto character varying(100),
    email character varying(40)
);


ALTER TABLE public.mahasiswa OWNER TO postgres;

--
-- Name: mahasiswa_mhsid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mahasiswa_mhsid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mahasiswa_mhsid_seq OWNER TO postgres;

--
-- Name: mahasiswa_mhsid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mahasiswa_mhsid_seq OWNED BY public.mahasiswa.mhsid;


--
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    nama character varying(50) NOT NULL,
    jk public.gender,
    tmp_lahir character varying(30),
    tgl_lahir date,
    alamat character varying(100),
    noktp character varying(30),
    email character varying(40),
    agama public.agama,
    telpon character varying(40),
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer
);


ALTER TABLE public.person OWNER TO postgres;

--
-- Name: COLUMN person.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.person.user_id IS 'User ID';


--
-- Name: pegawai; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pegawai (
    nik character varying(20) NOT NULL,
    orgid integer,
    gelar_depan character varying(6),
    gelar_belakang character varying(20),
    tglmulai_kerja date,
    aktif smallint DEFAULT 0,
    golongan character varying(10),
    id integer NOT NULL,
    foto character varying(100)
)
INHERITS (public.person);


ALTER TABLE public.pegawai OWNER TO postgres;

--
-- Name: pegawai_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pegawai_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pegawai_id_seq OWNER TO postgres;

--
-- Name: pegawai_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pegawai_id_seq OWNED BY public.pegawai.id;


--
-- Name: peminjaman_ruang; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.peminjaman_ruang (
    id integer NOT NULL,
    peminjam integer,
    tanggal date,
    id_ruang integer,
    jam_awal integer,
    jam_akhir integer,
    keperluan character varying,
    kontak character varying,
    status character varying,
    keterangan character varying,
    "timestamp" character varying,
    status_baak character varying
);


ALTER TABLE public.peminjaman_ruang OWNER TO postgres;

--
-- Name: peminjaman_ruang_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.peminjaman_ruang_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.peminjaman_ruang_id_seq OWNER TO postgres;

--
-- Name: peminjaman_ruang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.peminjaman_ruang_id_seq OWNED BY public.peminjaman_ruang.id;


--
-- Name: penilaian_kelas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.penilaian_kelas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.penilaian_kelas_id_seq OWNER TO postgres;

--
-- Name: prasarana; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prasarana (
    id integer,
    alamat character varying(60),
    luas double precision,
    jenis_id integer,
    jenis_prasarana character varying(50)
)
INHERITS (public.fasilitas);


ALTER TABLE public.prasarana OWNER TO postgres;

--
-- Name: prasarana_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prasarana_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prasarana_id_seq OWNER TO postgres;

--
-- Name: prasarana_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prasarana_id_seq OWNED BY public.prasarana.id;


--
-- Name: profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile (
    user_id integer NOT NULL,
    name character varying(255),
    public_email character varying(255),
    gravatar_email character varying(255),
    gravatar_id character varying(32),
    location character varying(255),
    website character varying(255),
    bio text
);


ALTER TABLE public.profile OWNER TO postgres;

--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id integer NOT NULL,
    role character varying
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- Name: ruang; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ruang (
    id integer NOT NULL,
    gedung_id integer,
    kode character varying(10),
    kapasitas integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by integer,
    updated_by integer,
    kapasitas_ujian integer,
    lantai integer,
    jenis_ruang_id integer
);


ALTER TABLE public.ruang OWNER TO postgres;

--
-- Name: ruang_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ruang_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ruang_id_seq OWNER TO postgres;

--
-- Name: ruang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ruang_id_seq OWNED BY public.ruang.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password_hash character varying(60) NOT NULL,
    auth_key character varying(32) NOT NULL,
    confirmed_at integer,
    unconfirmed_email character varying(255),
    blocked_at integer,
    registration_ip character varying(45),
    created_at integer NOT NULL,
    updated_at integer NOT NULL,
    flags integer DEFAULT 0 NOT NULL,
    last_login_at integer
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: user_peminjaman; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_peminjaman (
    id integer NOT NULL,
    username character varying NOT NULL,
    id_role integer NOT NULL,
    status character varying,
    password character varying
);


ALTER TABLE public.user_peminjaman OWNER TO postgres;

--
-- Name: user_peminjaman_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_peminjaman_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_peminjaman_id_seq OWNER TO postgres;

--
-- Name: user_peminjaman_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_peminjaman_id_seq OWNED BY public.user_peminjaman.id;


--
-- Name: fasilitas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fasilitas ALTER COLUMN id SET DEFAULT nextval('public.fasilitas_id_seq'::regclass);


--
-- Name: hari id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hari ALTER COLUMN id SET DEFAULT nextval('public.hari_id_seq'::regclass);


--
-- Name: jamke id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jamke ALTER COLUMN id SET DEFAULT nextval('public.jamke_id_seq'::regclass);


--
-- Name: jenis_prasarana id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jenis_prasarana ALTER COLUMN id SET DEFAULT nextval('public.jenis_prasarana_id_seq'::regclass);


--
-- Name: jenis_ruang id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jenis_ruang ALTER COLUMN id SET DEFAULT nextval('public.jenis_ruang_id_seq'::regclass);


--
-- Name: kategori_kampus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategori_kampus ALTER COLUMN id SET DEFAULT nextval('public.kategori_kampus_id_seq'::regclass);


--
-- Name: kelas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kelas ALTER COLUMN id SET DEFAULT nextval('public.kelas_id_seq'::regclass);


--
-- Name: kelas_prodi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kelas_prodi ALTER COLUMN id SET DEFAULT nextval('public.kelas_prodi_id_seq'::regclass);


--
-- Name: mahasiswa mhsid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mahasiswa ALTER COLUMN mhsid SET DEFAULT nextval('public.mahasiswa_mhsid_seq'::regclass);


--
-- Name: pegawai id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pegawai ALTER COLUMN id SET DEFAULT nextval('public.pegawai_id_seq'::regclass);


--
-- Name: peminjaman_ruang id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peminjaman_ruang ALTER COLUMN id SET DEFAULT nextval('public.peminjaman_ruang_id_seq'::regclass);


--
-- Name: prasarana id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prasarana ALTER COLUMN id SET DEFAULT nextval('public.prasarana_id_seq'::regclass);


--
-- Name: role id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- Name: ruang id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruang ALTER COLUMN id SET DEFAULT nextval('public.ruang_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Name: user_peminjaman id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_peminjaman ALTER COLUMN id SET DEFAULT nextval('public.user_peminjaman_id_seq'::regclass);


--
-- Data for Name: fasilitas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fasilitas (nama, created_at, updated_at, created_by, updated_by, id) FROM stdin;
Kampus B2	\N	\N	\N	\N	1
\.


--
-- Data for Name: hari; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hari (id, nama) FROM stdin;
1	Senin
2	Selasa
3	Rabu
4	Kamis
5	Jumat
6	Sabtu
\.


--
-- Data for Name: jamke; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jamke (id, kode, mulai, akhir, created_at, updated_at, created_by, updated_by) FROM stdin;
1	I	08:00:00	08:50:00	\N	\N	\N	\N
2	II	09:00:00	09:50:00	\N	\N	\N	\N
3	III	10:00:00	10:50:00	\N	\N	\N	\N
4	IV	11:00:00	11:50:00	\N	\N	\N	\N
5	V	12:00:00	12:50:00	\N	\N	\N	\N
6	VI	13:00:00	13:50:00	\N	\N	\N	\N
7	VII	14:00:00	14:50:00	\N	\N	\N	\N
8	VIII	15:00:00	15:50:00	\N	\N	\N	\N
9	IX	16:00:00	16:50:00	\N	\N	\N	\N
10	X	17:00:00	17:50:00	\N	\N	\N	\N
11	XI	18:00:00	18:50:00	\N	\N	\N	\N
12	XII	19:00:00	19:50:00	\N	\N	\N	\N
13	XIII	20:00:00	20:50:00	\N	\N	\N	\N
14	XIV	21:00:00	21:50:00	\N	\N	\N	\N
\.


--
-- Data for Name: jenis_prasarana; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jenis_prasarana (id, nama, created_at, updated_at, created_by, updated_by) FROM stdin;
1	Gedung	\N	\N	\N	\N
2	Tempat Ibadah	\N	\N	\N	\N
3	Lapangan OR	\N	\N	\N	\N
\.


--
-- Data for Name: jenis_ruang; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jenis_ruang (id, nama, created_at, updated_at, created_by, updated_by) FROM stdin;
1	Ruang Kuliah	\N	\N	\N	\N
2	Lab Komputer	\N	\N	\N	\N
3	Ruang Dosen	\N	\N	\N	\N
4	Ruang Rapat	\N	\N	\N	\N
5	Ruang Kantor	\N	\N	\N	\N
6	Ruang Perpustakaan	\N	\N	\N	\N
7	Ruang Lain	\N	\N	\N	\N
8	Aula	\N	\N	\N	\N
\.


--
-- Data for Name: kategori_kampus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kategori_kampus (id, nama, created_at, updated_at, created_by, updated_by) FROM stdin;
1	Akademi	\N	\N	\N	\N
2	Universitas	\N	\N	\N	\N
3	Sekolah Tinggi	\N	\N	\N	\N
4	Institut	\N	\N	\N	\N
\.


--
-- Data for Name: kelas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kelas (id, ta_id, mk_id, ruang_id, dosen_id, asdos_id, jamke_mulai, jamke_akhir, status, hari, semester, kode, abbr, tm, prk, lap, created_at, updated_at, created_by, updated_by, prodi_id, tgl_mulai, tgl_akhir, ka_id, jam_mulai, jam_akhir, publish_nilai) FROM stdin;
11	5	4	4	9	\N	1	2	1	Sabtu	20181		\N	14	\N	0	2018-09-11 22:59:50.640983	2018-09-21 21:44:02.590836	54	54	1	2018-09-10	2019-01-05	5	08:00:00	09:30:00	0
30	5	6	1	53	\N	6	8	1	Jumat	20181		\N	14	\N	0	2018-09-11 23:38:01.809942	2018-09-21 21:02:27.335786	54	54	2	2018-09-10	2019-01-05	5	13:00:00	15:30:00	0
31	5	3	10	54	\N	11	12	1	Jumat	20181		\N	14	\N	0	2018-09-18 16:14:27.123727	2018-09-21 21:29:14.793802	54	54	2	2018-09-10	2019-01-05	5	18:30:00	19:50:00	0
32	5	1	10	27	\N	13	13	1	Jumat	20181		\N	14	\N	0	2018-09-18 16:17:25.785514	2018-09-21 21:29:37.342389	54	54	2	2018-09-10	2019-01-05	5	20:00:00	21:20:00	0
33	5	4	4	9	\N	1	2	1	Sabtu	20181		\N	14	\N	0	2018-09-18 16:18:56.262206	2018-09-21 21:30:36.94897	54	54	2	2018-09-10	2019-01-05	5	08:00:00	09:30:00	0
34	5	7	4	48	\N	3	4	1	Sabtu	20181		\N	14	\N	0	2018-09-18 16:19:30.639817	2018-09-21 21:30:54.015095	54	54	2	2018-09-10	2019-01-05	5	10:00:00	11:30:00	0
35	5	5	4	23	\N	5	5	1	Sabtu	20181		\N	14	\N	0	2018-09-18 16:20:25.311103	2018-09-21 21:31:14.74514	54	54	2	2018-09-10	2019-01-05	5	12:00:00	13:00:00	0
36	5	2	4	29	\N	6	6	1	Sabtu	20181		\N	14	\N	0	2018-09-18 16:21:04.497165	2018-09-21 21:32:41.861983	54	54	2	2018-09-10	2019-01-05	5	13:05:00	14:00:00	0
37	5	8	4	3	\N	7	8	1	Sabtu	20181		\N	14	\N	0	2018-09-18 16:22:30.365444	2018-09-21 21:33:01.312432	54	54	2	2018-09-10	2019-01-05	5	14:05:00	15:30:00	0
38	5	6	4	55	\N	9	9	1	Sabtu	20181		\N	14	\N	0	2018-09-18 16:22:59.910244	2018-09-21 21:33:14.67352	54	54	2	2018-09-10	2019-01-05	5	16:00:00	17:00:00	0
1	5	2	10001	29	\N	2	3	1	Selasa	20181		\N	14	\N	0	2018-09-11 22:45:18.718409	2018-09-21 21:35:07.387937	54	54	1	2018-09-10	2019-01-05	5	09:00:00	11:00:00	0
2	5	3	10	21	\N	6	7	1	Selasa	20181		\N	14	\N	0	2018-09-11 22:46:05.802431	2018-09-21 21:35:25.902149	54	54	1	2018-09-10	2019-01-05	5	13:00:00	15:00:00	0
3	5	5	1	50	\N	1	2	1	Rabu	20181		\N	14	\N	0	2018-09-11 22:46:55.504581	2018-09-21 21:35:42.054701	54	54	1	2018-09-10	2019-01-05	5	08:00:00	10:00:00	0
4	5	1	10	51	\N	6	7	1	Rabu	20181		\N	14	\N	0	2018-09-11 22:48:49.420461	2018-09-21 21:36:55.207878	54	54	1	2018-09-10	2019-01-05	5	13:00:00	15:00:00	0
5	5	7	3	52	\N	2	4	1	Kamis	20181		\N	14	\N	0	2018-09-11 22:50:14.69968	2018-09-21 21:38:04.802267	54	54	1	2018-09-10	2019-01-05	5	09:00:00	11:30:00	0
6	5	8	3	45	\N	6	8	1	Kamis	20181		\N	14	\N	0	2018-09-11 22:51:43.023083	2018-09-21 21:38:24.369631	54	54	1	2018-09-10	2019-01-05	5	13:00:00	15:30:00	0
7	5	4	10001	9	\N	1	2	1	Jumat	20181		\N	14	\N	0	2018-09-11 22:53:34.510962	2018-09-21 21:39:27.610655	54	54	1	2018-09-10	2019-01-05	5	07:30:00	10:00:00	0
8	5	6	10001	53	\N	3	4	1	Jumat	20181		\N	14	\N	0	2018-09-11 22:54:47.442948	2018-09-21 21:41:31.135652	54	54	1	2018-09-10	2019-01-05	5	10:05:00	12:30:00	0
9	5	3	10	54	\N	11	12	1	Jumat	20181		\N	14	\N	0	2018-09-11 22:57:33.71126	2018-09-21 21:42:49.260733	54	54	1	2018-09-10	2019-01-05	5	18:30:00	19:50:00	0
10	5	1	10	27	\N	13	13	1	Jumat	20181		\N	14	\N	0	2018-09-11 22:58:38.436417	2018-09-21 21:43:27.136733	54	54	1	2018-09-10	2019-01-05	5	20:00:00	21:20:00	0
12	5	7	4	48	\N	3	4	1	Sabtu	20181		\N	14	\N	0	2018-09-11 23:02:06.14843	2018-09-21 21:45:18.821693	54	54	1	2018-09-10	2019-01-05	5	10:00:00	11:30:00	0
13	5	5	4	23	\N	5	5	1	Sabtu	20181		\N	14	\N	0	2018-09-11 23:04:11.827332	2018-09-21 21:45:36.17317	54	54	1	2018-09-10	2019-01-05	5	12:00:00	13:00:00	0
14	5	2	4	29	\N	6	6	1	Sabtu	20181		\N	14	\N	0	2018-09-11 23:04:54.663851	2018-09-21 21:46:02.937	54	54	1	2018-09-10	2019-01-05	5	13:05:00	14:00:00	0
15	5	8	4	3	\N	7	8	1	Sabtu	20181		\N	14	\N	0	2018-09-11 23:06:30.718401	2018-09-21 21:47:48.430649	54	54	1	2018-09-10	2019-01-05	5	14:05:00	15:30:00	0
16	5	6	4	55	\N	9	9	1	Sabtu	20181		\N	14	\N	0	2018-09-11 23:07:02.743738	2018-09-21 21:48:05.699048	54	54	1	2018-09-10	2019-01-05	5	16:00:00	17:00:00	0
18	5	3	10	21	\N	6	7	1	Selasa	20181	TI1801,TI1802	\N	14	\N	0	2018-09-11 23:23:05.716312	2018-11-12 21:17:46.178327	54	54	2	2018-09-10	2019-01-05	5	13:00:00	15:00:00	0
17	5	4	4	9	\N	1	2	1	Selasa	20181	TI1801	\N	14	\N	0	2018-09-11 23:22:20.047628	2018-11-12 21:18:01.741988	54	54	2	2018-09-10	2019-01-05	5	07:30:00	10:00:00	0
19	5	5	1	50	\N	3	4	1	Rabu	20181	TI1801	\N	14	\N	0	2018-09-11 23:23:51.272324	2018-11-12 16:00:26.429489	54	54	2	2018-09-10	2019-01-05	5	10:00:00	12:00:00	0
29	5	4	4	9	\N	2	4	1	Jumat	20181	TI1802	\N	14	\N	0	2018-09-11 23:37:02.279257	2018-11-12 22:17:16.483235	54	54	2	2018-09-10	2019-01-05	5	09:00:00	11:30:00	0
22	5	2	4	49	\N	6	7	1	Kamis	20181	TI1801	\N	14	\N	0	2018-09-11 23:27:14.756613	2018-11-12 16:00:55.310475	54	54	2	2018-09-10	2019-01-05	5	13:00:00	15:00:00	0
23	5	8	1	56	\N	1	3	1	Jumat	20181	TI1801	\N	14	\N	0	2018-09-11 23:28:05.983545	2018-11-12 16:01:09.641962	54	54	2	2018-09-10	2019-01-05	5	08:00:00	10:30:00	0
43	5	6	1	55	\N	\N	\N	1	Kamis	20181	TI1803	\N	14	\N	0	2018-09-21 21:21:16.468796	2018-11-13 10:06:53.9484	54	54	2	2018-09-10	2019-01-05	5	18:30:00	20:30:00	0
25	5	8	4	56	\N	3	5	1	Selasa	20181	TI1802	\N	14	\N	0	2018-09-11 23:30:02.572512	2018-11-12 20:24:30.680514	54	54	2	2018-09-10	2019-01-05	5	10:05:00	12:30:00	0
26	5	7	4	11	\N	2	4	1	Rabu	20181	TI1802	\N	14	\N	0	2018-09-11 23:32:41.351873	2018-11-12 21:51:53.80908	54	54	2	2018-09-10	2019-01-05	5	09:00:00	11:30:00	0
20	5	1	10	51	\N	6	7	1	Rabu	20181	TI1801,TI1802	\N	14	\N	0	2018-09-11 23:24:52.718814	2018-11-12 21:52:22.851426	54	54	2	2018-09-10	2019-01-05	5	13:00:00	15:00:00	0
39	5	8	10001	45	\N	\N	\N	1	Senin	20181	TI1803	\N	14	\N	0	2018-09-21 21:15:51.304547	2018-11-13 10:02:38.891368	54	54	2	2018-09-10	2019-01-05	5	18:30:00	20:30:00	0
27	5	5	10001	50	\N	1	2	1	Kamis	20181	TI1802	\N	14	\N	0	2018-09-11 23:33:40.610525	2018-11-12 22:16:14.109044	54	54	2	2018-09-10	2019-01-05	5	08:00:00	10:00:00	0
28	5	2	10001	49	\N	3	4	1	Kamis	20181	TI1802	\N	14	\N	0	2018-09-11 23:35:52.367893	2018-11-12 22:16:50.279445	54	54	2	2018-09-10	2019-01-05	5	10:05:00	12:00:00	0
40	5	5	10001	23	\N	\N	\N	1	Selasa	20181	TI1803	\N	14	\N	0	2018-09-21 21:18:35.778087	2018-11-13 10:05:47.613314	54	54	2	2018-09-10	2019-01-05	5	18:30:00	20:00:00	0
41	5	7	10001	37	\N	\N	\N	1	Selasa	20181	TI1803	\N	14	\N	0	2018-09-21 21:19:34.228312	2018-11-13 10:06:00.848066	54	54	2	2018-09-10	2019-01-05	5	20:05:00	22:00:00	0
42	5	4	5	18	\N	\N	\N	1	Rabu	20181	TI1803	\N	14	\N	0	2018-09-21 21:20:28.483234	2018-11-13 10:06:36.241221	54	54	2	2018-09-10	2019-01-05	5	20:00:00	22:00:00	0
44	5	2	1	29	\N	\N	\N	1	Kamis	20181	TI1803	\N	14	\N	0	2018-09-21 21:22:36.655704	2018-11-13 10:07:08.447052	54	54	2	2018-09-10	2019-01-05	5	20:35:00	22:00:00	0
45	5	1	1	27	\N	\N	\N	1	Jumat	20181	TI1803	\N	14	\N	0	2018-09-21 21:26:11.566673	2018-11-13 10:07:29.221035	54	54	2	2018-09-10	2019-01-05	5	18:30:00	19:50:00	0
46	5	3	1	54	\N	\N	\N	1	Jumat	20181	TI1803	\N	14	\N	0	2018-09-21 21:27:40.540047	2018-11-13 10:09:47.767705	54	54	2	2018-09-10	2019-01-05	5	20:00:00	21:20:00	0
21	5	7	4	11	\N	1	3	1	Kamis	20181	TI1801	\N	14	\N	0	2018-09-11 23:26:33.327291	2019-01-14 11:31:36.583299	54	233	2	2018-09-10	2019-01-05	5	08:00:00	10:30:00	1
24	5	6	4	55	\N	6	8	1	Jumat	20181	TI1801,TI1802	\N	14	\N	0	2018-09-11 23:28:32.284192	2019-01-14 11:15:38.5489	54	223	2	2018-09-10	2019-01-05	5	13:00:00	15:30:00	0
\.


--
-- Data for Name: kelas_prodi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kelas_prodi (id, prodi_id, kelas_id, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Data for Name: mahasiswa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mahasiswa (mhsid, nim, thn_masuk, ipk, total_sks, no_ijazah, tgl_lulus, camaba_id, prodi_id, status_id, peminatan_id, kode_rombel, user_id, created_at, updated_at, created_by, updated_by, id_sk, batas_studi, status_awal_id, nilai_sas, foto, email) FROM stdin;
153	0110118053	20181	\N	\N	\N	\N	158	1	1	0	\N	238	2018-09-18 14:18:52.359892	2018-09-18 14:18:52.359892	35	35	2	2022	1	\N	\N	\N
103	0110218062	20181	\N	\N	\N	\N	48	2	1	0	\N	167	2018-09-11 15:12:35.703274	2018-09-22 15:37:19.973213	35	54	2	2022	1	\N	\N	\N
154	0110118054	20181	\N	\N	\N	\N	157	1	1	0	\N	239	2018-09-18 14:18:54.571286	2018-09-18 14:18:54.571286	35	35	2	2022	1	\N	\N	\N
56	0110218023	20181	\N	\N	\N	\N	97	2	1	0	\N	120	2018-09-11 15:03:27.026991	2018-09-22 15:19:36.589876	35	54	2	2022	1	\N	\N	\N
158	0110218102	20181	\N	\N	\N	\N	153	2	1	0	\N	243	2018-09-18 14:18:57.383839	2018-09-22 15:44:43.282507	35	54	2	2022	1	\N	\N	\N
1	0110218001	20181	\N	\N	\N	\N	152	2	1	0	\N	65	2018-09-11 14:25:06.907131	2018-09-22 15:53:18.841937	35	54	2	2022	1	\N	\N	\N
81	0110218041	20181	\N	\N	\N	\N	72	2	1	0	\N	145	2018-09-11 15:12:18.277328	2018-09-22 15:58:28.319024	35	54	2	2022	1	\N	\N	\N
157	0110118056	20181	\N	\N	\N	\N	154	1	1	0	\N	242	2018-09-18 14:18:56.600136	2018-09-22 17:14:55.327481	35	54	2	2022	1	\N	\N	\N
155	0110218101	20181	\N	\N	\N	\N	156	2	1	0	\N	240	2018-09-18 14:18:55.217986	2018-09-22 18:08:50.43474	35	54	2	2022	1	\N	\N	\N
156	0110118055	20181	\N	\N	\N	\N	155	1	1	0	\N	241	2018-09-18 14:18:55.903781	2018-09-22 19:53:55.83073	35	54	2	2022	1	\N	\N	\N
68	0110218032	20181	\N	\N	\N	\N	85	2	1	0	\N	132	2018-09-11 15:12:09.2312	2018-09-22 15:17:09.022312	35	54	2	2022	1	\N	\N	\N
99	0110218058	20181	\N	\N	\N	\N	54	2	1	0	\N	163	2018-09-11 15:12:32.719817	2018-09-22 15:39:18.668124	35	54	2	2022	1	\N	\N	\N
79	0110218040	20181	\N	\N	\N	\N	74	2	1	0	\N	143	2018-09-11 15:12:16.917692	2018-09-22 16:12:05.705443	35	54	2	2022	1	\N	\N	\N
138	0110218092	20181	\N	\N	\N	\N	15	2	1	0	\N	202	2018-09-11 15:14:32.976981	2018-09-22 15:23:29.348635	35	54	2	2022	1	\N	\N	\N
66	0110218031	20181	\N	\N	\N	\N	87	2	1	0	\N	130	2018-09-11 15:12:07.526192	2018-09-22 15:44:20.211645	35	54	2	2022	1	\N	\N	\N
36	0110218009	20181	\N	\N	\N	\N	117	2	1	0	\N	100	2018-09-11 15:03:10.989069	2018-09-22 15:47:28.178806	35	54	2	2022	1	\N	\N	\N
33	0110218007	20181	\N	\N	\N	\N	120	2	1	0	\N	97	2018-09-11 15:03:08.488355	2018-09-22 15:47:39.661175	35	54	2	2022	1	\N	\N	\N
35	0110218008	20181	\N	\N	\N	\N	118	2	1	0	\N	99	2018-09-11 15:03:10.322862	2018-09-22 15:48:03.425761	35	54	2	2022	1	\N	\N	\N
8	0110218004	20181	\N	\N	\N	\N	145	2	1	0	\N	72	2018-09-11 14:25:12.013087	2018-09-22 15:48:18.339978	35	54	2	2022	1	\N	\N	\N
142	0110218095	20181	\N	\N	\N	\N	11	2	1	0	\N	206	2018-09-11 15:14:36.106885	2018-09-22 16:02:01.80461	35	54	2	2022	1	\N	\N	\N
140	0110218093	20181	\N	\N	\N	\N	13	2	1	0	\N	204	2018-09-11 15:14:34.437124	2018-09-22 16:02:11.086487	35	54	2	2022	1	\N	\N	\N
141	0110218094	20181	\N	\N	\N	\N	12	2	1	0	\N	205	2018-09-11 15:14:35.105984	2018-09-22 16:04:57.976413	35	54	2	2022	1	\N	\N	\N
5	0110218002	20181	\N	\N	\N	\N	148	2	1	0	\N	69	2018-09-11 14:25:09.982054	2018-09-22 16:13:13.008583	35	54	2	2022	1	\N	\N	\N
150	0110218099	20181	\N	\N	\N	\N	3	2	1	0	\N	214	2018-09-11 15:14:42.713606	2018-09-22 16:14:00.205858	35	54	2	2022	1	\N	\N	\N
15	0110218006	20181	\N	\N	\N	\N	138	2	1	0	\N	79	2018-09-11 15:02:55.662071	2018-09-22 16:14:00.220771	35	54	2	2022	1	\N	\N	\N
147	0110218098	20181	\N	\N	\N	\N	6	2	1	0	\N	211	2018-09-11 15:14:40.656783	2018-09-22 16:14:00.286865	35	54	2	2022	1	\N	\N	\N
13	0110218005	20181	\N	\N	\N	\N	140	2	1	0	\N	77	2018-09-11 15:02:54.321293	2018-09-22 16:14:00.303447	35	54	2	2022	1	\N	\N	\N
139	0110118047	20181	\N	\N	\N	\N	14	1	1	0	\N	203	2018-09-11 15:14:33.693415	2018-09-22 17:12:15.41777	35	54	2	2022	1	\N	\N	\N
29	0110118023	20181	\N	\N	\N	\N	124	1	1	0	\N	93	2018-09-11 15:03:05.79691	2018-09-11 15:03:05.79691	35	35	2	2022	1	\N	\N	\N
137	0110118046	20181	\N	\N	\N	\N	49	1	1	0	\N	201	2018-09-11 15:14:32.229461	2018-09-22 17:12:26.332194	35	54	2	2022	1	\N	\N	\N
80	0110118040	20181	\N	\N	\N	\N	73	1	1	0	\N	144	2018-09-11 15:12:17.608336	2018-09-22 17:13:52.652559	35	54	2	2022	1	\N	\N	\N
10	0110118006	20181	\N	\N	\N	\N	143	1	1	0	\N	74	2018-09-11 14:25:13.337354	2018-09-22 17:15:07.972816	35	54	2	2022	1	\N	\N	\N
16	0110118010	20181	\N	\N	\N	\N	137	1	1	0	\N	80	2018-09-11 15:02:56.333744	2018-09-22 17:15:20.365162	35	54	2	2022	1	\N	\N	\N
9	0110118005	20181	\N	\N	\N	\N	144	1	1	0	\N	73	2018-09-11 14:25:12.689484	2018-09-22 17:15:31.370976	35	54	2	2022	1	\N	\N	\N
148	0110118050	20181	\N	\N	\N	\N	5	1	1	0	\N	212	2018-09-11 15:14:41.327102	2018-09-22 17:19:34.853329	35	54	2	2022	1	\N	\N	\N
126	0110218083	20181	\N	\N	\N	\N	26	2	1	0	\N	190	2018-09-11 15:14:20.755399	2018-09-22 15:24:13.612626	35	54	2	2022	1	\N	\N	\N
123	0110218080	20181	\N	\N	\N	\N	29	2	1	0	\N	187	2018-09-11 15:14:18.691457	2018-09-22 15:24:30.078612	35	54	2	2022	1	\N	\N	\N
122	0110218079	20181	\N	\N	\N	\N	30	2	1	0	\N	186	2018-09-11 15:14:17.944776	2018-09-22 15:35:01.329909	35	54	2	2022	1	\N	\N	\N
117	0110218075	20181	\N	\N	\N	\N	34	2	1	0	\N	181	2018-09-11 15:14:14.109883	2018-09-22 15:35:39.646186	35	54	2	2022	1	\N	\N	\N
143	0110118048	20181	\N	\N	\N	\N	10	1	1	0	\N	207	2018-09-11 15:14:36.773681	2018-09-22 17:19:54.959431	35	54	2	2022	1	\N	\N	\N
32	0110118026	20181	\N	\N	\N	\N	121	1	1	0	\N	96	2018-09-11 15:03:07.809088	2018-09-22 17:46:04.455036	35	54	2	2022	1	\N	\N	\N
26	0110118020	20181	\N	\N	\N	\N	127	1	1	0	\N	90	2018-09-11 15:03:03.441554	2018-09-22 17:53:36.369251	35	54	2	2022	1	\N	\N	\N
145	0110218096	20181	\N	\N	\N	\N	8	2	1	0	\N	209	2018-09-11 15:14:38.141785	2018-09-11 15:14:38.141785	35	35	2	2022	1	\N	\N	\N
30	0110118024	20181	\N	\N	\N	\N	123	1	1	0	\N	94	2018-09-11 15:03:06.452934	2018-09-22 17:53:15.22904	35	54	2	2022	1	\N	\N	\N
31	0110118025	20181	\N	\N	\N	\N	122	1	1	0	\N	95	2018-09-11 15:03:07.117233	2018-09-22 17:53:24.174529	35	54	2	2022	1	\N	\N	\N
27	0110118021	20181	\N	\N	\N	\N	126	1	1	0	\N	91	2018-09-11 15:03:04.446526	2018-09-22 17:53:51.752335	35	54	2	2022	1	\N	\N	\N
11	0110118007	20181	\N	\N	\N	\N	142	1	1	0	\N	75	2018-09-11 15:02:52.75747	2018-09-22 17:57:46.706937	35	54	2	2022	1	\N	\N	\N
24	0110118018	20181	\N	\N	\N	\N	129	1	1	0	\N	88	2018-09-11 15:03:02.094444	2018-09-22 17:54:03.642331	35	54	2	2022	1	\N	\N	\N
25	0110118019	20181	\N	\N	\N	\N	128	1	1	0	\N	89	2018-09-11 15:03:02.757308	2018-09-22 17:54:13.425449	35	54	2	2022	1	\N	\N	\N
22	0110118016	20181	\N	\N	\N	\N	131	1	1	0	\N	86	2018-09-11 15:03:00.429911	2018-09-22 17:54:24.694519	35	54	2	2022	1	\N	\N	\N
23	0110118017	20181	\N	\N	\N	\N	130	1	1	0	\N	87	2018-09-11 15:03:01.104946	2018-09-22 17:54:36.983024	35	54	2	2022	1	\N	\N	\N
18	0110118012	20181	\N	\N	\N	\N	135	1	1	0	\N	82	2018-09-11 15:02:57.710059	2018-09-22 17:54:55.677736	35	54	2	2022	1	\N	\N	\N
19	0110118013	20181	\N	\N	\N	\N	134	1	1	0	\N	83	2018-09-11 15:02:58.383624	2018-09-22 17:55:05.781478	35	54	2	2022	1	\N	\N	\N
21	0110118015	20181	\N	\N	\N	\N	132	1	1	0	\N	85	2018-09-11 15:02:59.763066	2018-09-22 17:55:16.51535	35	54	2	2022	1	\N	\N	\N
17	0110118011	20181	\N	\N	\N	\N	136	1	1	0	\N	81	2018-09-11 15:02:56.983583	2018-09-22 17:55:24.663863	35	54	2	2022	1	\N	\N	\N
28	0110118022	20181	\N	\N	\N	\N	125	1	1	0	\N	92	2018-09-11 15:03:05.131775	2018-09-22 17:55:32.309445	35	54	2	2022	1	\N	\N	\N
34	0110118027	20181	\N	\N	\N	\N	119	1	1	0	\N	98	2018-09-11 15:03:09.209643	2018-09-22 17:55:43.747356	35	54	2	2022	1	\N	\N	\N
149	0110118051	20181	\N	\N	\N	\N	4	1	1	0	\N	213	2018-09-11 15:14:42.026015	2018-09-22 17:57:27.095232	35	54	2	2022	1	\N	\N	\N
12	0110118008	20181	\N	\N	\N	\N	141	1	1	0	\N	76	2018-09-11 15:02:53.537201	2018-09-22 17:57:37.760195	35	54	2	2022	1	\N	\N	\N
14	0110118009	20181	\N	\N	\N	\N	139	1	1	0	\N	78	2018-09-11 15:02:54.989166	2018-09-22 17:57:55.358183	35	54	2	2022	1	\N	\N	\N
7	0110118004	20181	\N	\N	\N	\N	146	1	1	0	\N	71	2018-09-11 14:25:11.298706	2018-09-22 17:58:04.624085	35	54	2	2022	1	\N	\N	\N
3	0110118002	20181	\N	\N	\N	\N	150	1	1	0	\N	67	2018-09-11 14:25:08.669895	2018-09-22 17:58:17.171332	35	54	2	2022	1	\N	\N	\N
4	0110118003	20181	\N	\N	\N	\N	149	1	1	0	\N	68	2018-09-11 14:25:09.31353	2018-09-22 17:58:26.27687	35	54	2	2022	1	\N	\N	\N
20	0110118014	20181	\N	\N	\N	\N	133	1	1	0	\N	84	2018-09-11 15:02:59.085801	2018-09-22 17:58:34.582686	35	54	2	2022	1	\N	\N	\N
2	0110118001	20181	\N	\N	\N	\N	151	1	1	0	\N	66	2018-09-11 14:25:07.695618	2018-09-22 17:58:46.608027	35	54	2	2022	1	\N	\N	\N
144	0110118049	20181	\N	\N	\N	\N	9	1	1	0	\N	208	2018-09-11 15:14:37.461274	2018-09-22 17:58:56.599436	35	54	2	2022	1	\N	\N	\N
135	0110218090	20181	\N	\N	\N	\N	17	2	1	\N	\N	199	2018-09-11 15:14:30.872392	2018-09-23 16:10:39.484054	35	1	2	2022	1	\N	\N	\N
6	0110218003	20181	\N	\N	\N	\N	147	2	1	\N	\N	70	2018-09-11 14:25:10.646337	2018-09-23 16:11:17.635787	35	1	2	2022	1	\N	\N	\N
106	0110218065	20181	\N	\N	\N	\N	45	2	1	0	\N	170	2018-09-11 15:12:37.800326	2018-09-22 15:38:21.564814	35	54	2	2022	1	\N	\N	\N
102	0110218061	20181	\N	\N	\N	\N	51	2	1	0	\N	166	2018-09-11 15:12:34.989147	2018-09-22 15:38:52.681594	35	54	2	2022	1	\N	\N	\N
96	0110218055	20181	\N	\N	\N	\N	57	2	1	0	\N	160	2018-09-11 15:12:30.137353	2018-09-22 15:39:30.485174	35	54	2	2022	1	\N	\N	\N
89	0110218048	20181	\N	\N	\N	\N	64	2	1	0	\N	153	2018-09-11 15:12:24.741188	2018-09-22 15:42:41.788692	35	54	2	2022	1	\N	\N	\N
77	0110218038	20181	\N	\N	\N	\N	76	2	1	0	\N	141	2018-09-11 15:12:15.290729	2018-09-22 15:42:49.524883	35	54	2	2022	1	\N	\N	\N
75	0110218036	20181	\N	\N	\N	\N	78	2	1	0	\N	139	2018-09-11 15:12:13.942797	2018-09-22 15:42:57.476312	35	54	2	2022	1	\N	\N	\N
94	0110218053	20181	\N	\N	\N	\N	59	2	1	0	\N	158	2018-09-11 15:12:28.487406	2018-09-22 15:43:20.239127	35	54	2	2022	1	\N	\N	\N
97	0110218056	20181	\N	\N	\N	\N	56	2	1	0	\N	161	2018-09-11 15:12:30.888198	2018-09-22 15:43:35.928848	35	54	2	2022	1	\N	\N	\N
71	0110218034	20181	\N	\N	\N	\N	82	2	1	0	\N	135	2018-09-11 15:12:11.23087	2018-09-22 15:43:46.765033	35	54	2	2022	1	\N	\N	\N
63	0110218028	20181	\N	\N	\N	\N	90	2	1	0	\N	127	2018-09-11 15:12:05.170898	2018-09-22 15:44:05.105128	35	54	2	2022	1	\N	\N	\N
65	0110218030	20181	\N	\N	\N	\N	88	2	1	0	\N	129	2018-09-11 15:12:06.829404	2018-09-22 15:44:31.810871	35	54	2	2022	1	\N	\N	\N
85	0110218045	20181	\N	\N	\N	\N	68	2	1	0	\N	149	2018-09-11 15:12:20.950083	2018-09-22 15:44:53.526169	35	54	2	2022	1	\N	\N	\N
57	0110218024	20181	\N	\N	\N	\N	96	2	1	0	\N	121	2018-09-11 15:03:27.749247	2018-09-22 15:45:05.282589	35	54	2	2022	1	\N	\N	\N
58	0110218025	20181	\N	\N	\N	\N	95	2	1	0	\N	122	2018-09-11 15:03:28.416306	2018-09-22 15:45:15.849897	35	54	2	2022	1	\N	\N	\N
53	0110218020	20181	\N	\N	\N	\N	100	2	1	0	\N	117	2018-09-11 15:03:24.599452	2018-09-22 15:45:34.940188	35	54	2	2022	1	\N	\N	\N
38	0110218011	20181	\N	\N	\N	\N	115	2	1	0	\N	102	2018-09-11 15:03:12.362025	2018-09-22 15:45:46.871637	35	54	2	2022	1	\N	\N	\N
52	0110218019	20181	\N	\N	\N	\N	101	2	1	0	\N	116	2018-09-11 15:03:23.840437	2018-09-22 15:45:58.799188	35	54	2	2022	1	\N	\N	\N
54	0110218021	20181	\N	\N	\N	\N	99	2	1	0	\N	118	2018-09-11 15:03:25.307283	2018-09-22 15:46:13.299577	35	54	2	2022	1	\N	\N	\N
55	0110218022	20181	\N	\N	\N	\N	98	2	1	0	\N	119	2018-09-11 15:03:26.003173	2018-09-22 15:46:32.338287	35	54	2	2022	1	\N	\N	\N
41	0110218012	20181	\N	\N	\N	\N	112	2	1	0	\N	105	2018-09-11 15:03:14.463263	2018-09-22 15:47:19.06896	35	54	2	2022	1	\N	\N	\N
90	0110218049	20181	\N	\N	\N	\N	63	2	1	0	\N	154	2018-09-11 15:12:25.710684	2018-09-22 15:47:50.748106	35	54	2	2022	1	\N	\N	\N
83	0110218043	20181	\N	\N	\N	\N	70	2	1	0	\N	147	2018-09-11 15:12:19.629955	2018-09-22 15:53:26.614781	35	54	2	2022	1	\N	\N	\N
104	0110218063	20181	\N	\N	\N	\N	47	2	1	0	\N	168	2018-09-11 15:12:36.381802	2018-09-22 15:56:13.158094	35	54	2	2022	1	\N	\N	\N
44	0110218015	20181	\N	\N	\N	\N	109	2	1	0	\N	108	2018-09-11 15:03:16.520856	2018-09-22 15:56:13.173148	35	54	2	2022	1	\N	\N	\N
42	0110218013	20181	\N	\N	\N	\N	111	2	1	0	\N	106	2018-09-11 15:03:15.1211	2018-09-22 15:56:13.208271	35	54	2	2022	1	\N	\N	\N
105	0110218064	20181	\N	\N	\N	\N	46	2	1	0	\N	169	2018-09-11 15:12:37.08352	2018-09-22 15:57:07.966077	35	54	2	2022	1	\N	\N	\N
100	0110218059	20181	\N	\N	\N	\N	53	2	1	0	\N	164	2018-09-11 15:12:33.454851	2018-09-22 15:57:21.139406	35	54	2	2022	1	\N	\N	\N
86	0110218046	20181	\N	\N	\N	\N	67	2	1	0	\N	150	2018-09-11 15:12:21.611455	2018-09-22 15:58:10.848157	35	54	2	2022	1	\N	\N	\N
69	0110218033	20181	\N	\N	\N	\N	84	2	1	0	\N	133	2018-09-11 15:12:09.87512	2018-09-22 15:58:38.75428	35	54	2	2022	1	\N	\N	\N
45	0110218016	20181	\N	\N	\N	\N	108	2	1	0	\N	109	2018-09-11 15:03:17.524201	2018-09-22 15:59:11.717042	35	54	2	2022	1	\N	\N	\N
37	0110218010	20181	\N	\N	\N	\N	116	2	1	0	\N	101	2018-09-11 15:03:11.681025	2018-09-22 15:59:20.84624	35	54	2	2022	1	\N	\N	\N
91	0110218050	20181	\N	\N	\N	\N	62	2	1	0	\N	155	2018-09-11 15:12:26.402907	2018-09-22 16:11:08.836234	35	54	2	2022	1	\N	\N	\N
93	0110218052	20181	\N	\N	\N	\N	60	2	1	0	\N	157	2018-09-11 15:12:27.747983	2018-09-22 16:11:17.747865	35	54	2	2022	1	\N	\N	\N
101	0110218060	20181	\N	\N	\N	\N	52	2	1	0	\N	165	2018-09-11 15:12:34.28084	2018-09-22 16:11:28.362112	35	54	2	2022	1	\N	\N	\N
78	0110218039	20181	\N	\N	\N	\N	75	2	1	0	\N	142	2018-09-11 15:12:16.278279	2018-09-22 16:11:49.267905	35	54	2	2022	1	\N	\N	\N
84	0110218044	20181	\N	\N	\N	\N	69	2	1	0	\N	148	2018-09-11 15:12:20.292789	2018-09-22 16:11:57.375646	35	54	2	2022	1	\N	\N	\N
64	0110218029	20181	\N	\N	\N	\N	89	2	1	0	\N	128	2018-09-11 15:12:05.836869	2018-09-22 16:12:23.640657	35	54	2	2022	1	\N	\N	\N
92	0110218051	20181	\N	\N	\N	\N	61	2	1	0	\N	156	2018-09-11 15:12:27.05964	2018-09-22 16:12:32.18669	35	54	2	2022	1	\N	\N	\N
62	0110218027	20181	\N	\N	\N	\N	91	2	1	0	\N	126	2018-09-11 15:12:04.502696	2018-09-22 16:12:41.049906	35	54	2	2022	1	\N	\N	\N
46	0110218017	20181	\N	\N	\N	\N	107	2	1	0	\N	110	2018-09-11 15:03:18.205883	2018-09-22 16:12:53.071917	35	54	2	2022	1	\N	\N	\N
43	0110218014	20181	\N	\N	\N	\N	110	2	1	0	\N	107	2018-09-11 15:03:15.830749	2018-09-22 16:13:04.88053	35	54	2	2022	1	\N	\N	\N
76	0110218037	20181	\N	\N	\N	\N	77	2	1	0	\N	140	2018-09-11 15:12:14.61653	2018-09-22 16:14:00.237646	35	54	2	2022	1	\N	\N	\N
107	0110118042	20181	\N	\N	\N	\N	44	1	1	0	\N	171	2018-09-11 15:12:39.283218	2018-09-22 17:12:36.129582	35	54	2	2022	1	\N	\N	\N
39	0110118028	20181	\N	\N	\N	\N	114	1	1	0	\N	103	2018-09-11 15:03:13.056394	2018-09-22 17:13:32.083249	35	54	2	2022	1	\N	\N	\N
88	0110118041	20181	\N	\N	\N	\N	65	1	1	0	\N	152	2018-09-11 15:12:22.919766	2018-09-22 17:13:40.665202	35	54	2	2022	1	\N	\N	\N
72	0110118038	20181	\N	\N	\N	\N	81	1	1	0	\N	136	2018-09-11 15:12:11.896773	2018-09-22 17:14:02.59597	35	54	2	2022	1	\N	\N	\N
61	0110118035	20181	\N	\N	\N	\N	92	1	1	0	\N	125	2018-09-11 15:12:03.738064	2018-09-22 17:14:18.03005	35	54	2	2022	1	\N	\N	\N
59	0110118034	20181	\N	\N	\N	\N	94	1	1	0	\N	123	2018-09-11 15:03:29.132896	2018-09-22 17:14:26.508293	35	54	2	2022	1	\N	\N	\N
50	0110118033	20181	\N	\N	\N	\N	103	1	1	0	\N	114	2018-09-11 15:03:22.37566	2018-09-22 17:14:35.067085	35	54	2	2022	1	\N	\N	\N
47	0110118030	20181	\N	\N	\N	\N	106	1	1	0	\N	111	2018-09-11 15:03:18.857302	2018-09-22 17:14:45.478847	35	54	2	2022	1	\N	\N	\N
74	0110118039	20181	\N	\N	\N	\N	79	1	1	0	\N	138	2018-09-11 15:12:13.244906	2018-09-22 17:20:15.931451	35	54	2	2022	1	\N	\N	\N
48	0110118031	20181	\N	\N	\N	\N	105	1	1	0	\N	112	2018-09-11 15:03:20.924292	2018-09-22 17:20:25.74104	35	54	2	2022	1	\N	\N	\N
40	0110118029	20181	\N	\N	\N	\N	113	1	1	0	\N	104	2018-09-11 15:03:13.752684	2018-09-22 17:57:14.420689	35	54	2	2022	1	\N	\N	\N
49	0110118032	20181	\N	\N	\N	\N	104	1	1	0	\N	113	2018-09-11 15:03:21.661985	2018-09-22 17:59:05.554648	35	54	2	2022	1	\N	\N	\N
73	0110218035	20181	\N	\N	\N	\N	80	2	1	0	\N	137	2018-09-11 15:12:12.578643	2018-09-22 18:03:49.386822	35	54	2	2022	1	\N	\N	\N
133	0110218089	20181	\N	\N	\N	\N	19	2	1	0	\N	197	2018-09-11 15:14:29.510215	2018-09-22 15:22:40.343836	35	54	2	2022	1	\N	\N	\N
128	0110218085	20181	\N	\N	\N	\N	24	2	1	0	\N	192	2018-09-11 15:14:22.15515	2018-09-22 15:23:46.057509	35	54	2	2022	1	\N	\N	\N
125	0110218082	20181	\N	\N	\N	\N	27	2	1	0	\N	189	2018-09-11 15:14:20.059526	2018-09-22 15:24:01.829526	35	54	2	2022	1	\N	\N	\N
95	0110118057	20181	\N	\N	\N	\N	58	1	1	\N	\N	159	2018-09-11 15:12:29.410888	2018-09-23 15:32:42.84107	35	54	2	2022	1	\N	\N	\N
131	0110218105	20181	\N	\N	\N	\N	21	2	1	\N	\N	195	2018-09-11 15:14:25.743975	2018-09-23 15:38:54.338541	35	54	2	2022	1	\N	\N	\N
82	0110218042	20181	\N	\N	\N	\N	71	2	1	\N	\N	146	2018-09-11 15:12:18.956392	2018-09-23 16:09:55.570704	35	1	2	2022	1	\N	\N	\N
60	0110218026	20181	\N	\N	\N	\N	93	2	1	\N	\N	124	2018-09-11 15:03:29.855916	2018-09-23 16:12:04.574289	35	1	2	2022	1	\N	\N	\N
114	0110218072	20181	\N	\N	\N	\N	37	2	1	0	\N	178	2018-09-11 15:14:11.992088	2018-09-22 15:35:52.474031	35	54	2	2022	1	\N	\N	\N
116	0110218074	20181	\N	\N	\N	\N	35	2	1	0	\N	180	2018-09-11 15:14:13.402394	2018-09-22 15:36:05.853473	35	54	2	2022	1	\N	\N	\N
121	0110218078	20181	\N	\N	\N	\N	31	2	1	0	\N	185	2018-09-11 15:14:17.25684	2018-09-22 15:36:18.264627	35	54	2	2022	1	\N	\N	\N
115	0110218073	20181	\N	\N	\N	\N	36	2	1	0	\N	179	2018-09-11 15:14:12.669166	2018-09-22 15:36:49.239664	35	54	2	2022	1	\N	\N	\N
112	0110218070	20181	\N	\N	\N	\N	39	2	1	0	\N	176	2018-09-11 15:14:10.576891	2018-09-22 15:37:01.465104	35	54	2	2022	1	\N	\N	\N
110	0110218068	20181	\N	\N	\N	\N	41	2	1	0	\N	174	2018-09-11 15:12:43.013351	2018-09-22 15:37:39.973169	35	54	2	2022	1	\N	\N	\N
109	0110218067	20181	\N	\N	\N	\N	42	2	1	0	\N	173	2018-09-11 15:12:42.347109	2018-09-22 15:37:58.557627	35	54	2	2022	1	\N	\N	\N
51	0110218018	20181	\N	\N	\N	\N	102	2	1	0	\N	115	2018-09-11 15:03:23.102631	2018-09-22 15:47:07.591779	35	54	2	2022	1	\N	\N	\N
119	0110218077	20181	\N	\N	\N	\N	50	2	1	0	\N	183	2018-09-11 15:14:15.520662	2018-09-22 15:48:28.94193	35	54	2	2022	1	\N	\N	\N
118	0110218076	20181	\N	\N	\N	\N	33	2	1	0	\N	182	2018-09-11 15:14:14.841384	2018-09-22 15:56:13.241557	35	54	2	2022	1	\N	\N	\N
113	0110218071	20181	\N	\N	\N	\N	38	2	1	0	\N	177	2018-09-11 15:14:11.308037	2018-09-22 15:56:13.256015	35	54	2	2022	1	\N	\N	\N
152	0110218100	20181	\N	\N	\N	\N	1	2	1	0	\N	216	2018-09-11 15:14:44.062683	2018-09-22 16:01:52.413446	35	54	2	2022	1	\N	\N	\N
130	0110218087	20181	\N	\N	\N	\N	22	2	1	0	\N	194	2018-09-11 15:14:23.557875	2018-09-22 16:05:05.931019	35	54	2	2022	1	\N	\N	\N
132	0110218088	20181	\N	\N	\N	\N	20	2	1	0	\N	196	2018-09-11 15:14:28.836073	2018-09-22 16:09:37.278438	35	54	2	2022	1	\N	\N	\N
111	0110218069	20181	\N	\N	\N	\N	40	2	1	0	\N	175	2018-09-11 15:14:09.779148	2018-09-22 16:14:00.177945	35	54	2	2022	1	\N	\N	\N
129	0110218086	20181	\N	\N	\N	\N	23	2	1	0	\N	193	2018-09-11 15:14:22.830014	2018-09-22 16:14:00.25465	35	54	2	2022	1	\N	\N	\N
151	0110118052	20181	\N	\N	\N	\N	2	1	1	0	\N	215	2018-09-11 15:14:43.370609	2018-09-22 17:19:45.007655	35	54	2	2022	1	\N	\N	\N
134	0110118045	20181	\N	\N	\N	\N	18	1	1	0	\N	198	2018-09-11 15:14:30.17039	2018-09-22 17:20:06.10111	35	54	2	2022	1	\N	\N	\N
70	0110118037	20181	\N	\N	\N	\N	83	1	1	0	\N	134	2018-09-11 15:12:10.581271	2018-09-22 19:52:17.001852	35	54	2	2022	1	\N	\N	\N
120	0110218104	20181	\N	\N	\N	\N	32	2	1	\N	\N	184	2018-09-11 15:14:16.285152	2018-09-23 15:26:46.644372	35	54	2	2022	1	\N	\N	\N
67	0110218103	20181	\N	\N	\N	\N	86	2	1	\N	\N	131	2018-09-11 15:12:08.57538	2018-09-23 15:26:46.66908	35	54	2	2022	1	\N	\N	\N
98	0110218057	20181	\N	\N	\N	\N	55	2	1	\N	\N	162	2018-09-11 15:12:31.91631	2018-09-23 15:27:54.301939	35	1	2	2022	1	\N	\N	\N
124	0110218081	20181	\N	\N	\N	\N	28	2	1	\N	\N	188	2018-09-11 15:14:19.382426	2018-09-23 15:36:35.181071	35	1	2	2022	1	\N	\N	\N
127	0110218084	20181	\N	\N	\N	\N	25	2	1	\N	\N	191	2018-09-11 15:14:21.477484	2018-09-23 15:37:18.705106	35	1	2	2022	1	\N	\N	\N
159	0110118058	20181	\N	\N	\N	\N	169	1	1	0	\N	246	2018-10-02 16:49:23.301523	2018-10-02 16:49:23.301523	35	35	2	2022	1	\N	\N	\N
160	0110118059	20181	\N	\N	\N	\N	168	1	1	0	\N	247	2018-10-02 16:49:24.035464	2018-10-02 16:49:24.035464	35	35	2	2022	1	\N	\N	\N
161	0110218106	20181	\N	\N	\N	\N	167	2	1	0	\N	248	2018-10-02 16:49:24.692016	2018-10-02 16:49:24.692016	35	35	2	2022	1	\N	\N	\N
162	0110218107	20181	\N	\N	\N	\N	166	2	1	0	\N	249	2018-10-02 16:49:25.344882	2018-10-02 16:49:25.344882	35	35	2	2022	1	\N	\N	\N
163	0110218108	20181	\N	\N	\N	\N	165	2	1	0	\N	250	2018-10-02 16:49:26.321516	2018-10-02 16:49:26.321516	35	35	2	2022	1	\N	\N	\N
164	0110218109	20181	\N	\N	\N	\N	164	2	1	0	\N	251	2018-10-02 16:49:27.007907	2018-10-02 16:49:27.007907	35	35	2	2022	1	\N	\N	\N
165	0110118060	20181	\N	\N	\N	\N	163	1	1	0	\N	252	2018-10-02 16:49:27.673442	2018-10-02 16:49:27.673442	35	35	2	2022	1	\N	\N	\N
166	0110218110	20181	\N	\N	\N	\N	162	2	1	0	\N	253	2018-10-02 16:49:28.355831	2018-10-02 16:49:28.355831	35	35	2	2022	1	\N	\N	\N
167	0110118061	20181	\N	\N	\N	\N	161	1	1	0	\N	254	2018-10-02 16:49:29.020343	2018-10-02 16:49:29.020343	35	35	2	2022	1	\N	\N	\N
168	0110218111	20181	\N	\N	\N	\N	160	2	1	0	\N	255	2018-10-02 16:49:29.699704	2018-10-02 16:49:29.699704	35	35	2	2022	1	\N	\N	\N
169	0110118062	20181	\N	\N	\N	\N	159	1	1	0	\N	256	2018-10-02 16:49:30.353775	2018-10-02 16:49:30.353775	35	35	2	2022	1	\N	\N	\N
136	0110218091	20181	3.64999999999999991	6	\N	\N	16	2	1	\N	TI1802	200	2018-09-11 15:14:31.568691	2019-01-14 11:31:22.892638	35	233	2	2022	1	\N	\N	\N
146	0110218097	20181	3.85000000000000009	6	\N	\N	7	2	1	0	TI1802	210	2018-09-11 15:14:38.842201	2019-01-14 11:31:23.081152	35	233	2	2022	1	\N	\N	\N
108	0110218066	20181	3.64999999999999991	6	\N	\N	43	2	1	0	TI1802	172	2018-09-11 15:12:40.362406	2019-01-14 11:31:23.289361	35	233	2	2022	1	\N	\N	\N
87	0110218047	20181	3.64999999999999991	6	\N	\N	66	2	1	0	TI1802	151	2018-09-11 15:12:22.253409	2019-01-14 11:31:23.492132	35	233	2	2022	1	\N	\N	\N
\.


--
-- Data for Name: pegawai; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pegawai (nama, jk, tmp_lahir, tgl_lahir, alamat, noktp, email, agama, telpon, user_id, created_at, updated_at, created_by, updated_by, nik, orgid, gelar_depan, gelar_belakang, tglmulai_kerja, aktif, golongan, id, foto) FROM stdin;
Misna Azqia	P	Pemalang	2018-02-26			misna@nurulfikri.co.id	Islam	-	54	2018-02-26 14:52:20.616094	2018-09-21 14:55:11.287754	1	1	012182173	12		M.Kom.	\N	1	\N	1	FaPKiw0zVkjzscqgHQhS6DpcDWdmPU2C.png
Fanny	P		\N				Islam		234	2018-09-11 23:52:52.957061	2018-11-10 14:03:29.289872	1	1	748678	\N			\N	\N	\N	2	\N
Samsudin	L		\N	RTM Depok		samsudin@nurulfikri.co.id	Islam		8	2018-09-16 10:47:53.129986	2018-11-10 14:16:40.676186	1	1	712911	14			\N	1	\N	58	\N
Lina Guslina	P		\N			lina@nurulfikri.co.id	Islam		237	2018-09-16 10:49:57.194495	2018-11-10 14:35:40.827205	1	1	477508	14			\N	1	\N	59	\N
\.


--
-- Data for Name: peminjaman_ruang; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.peminjaman_ruang (id, peminjam, tanggal, id_ruang, jam_awal, jam_akhir, keperluan, kontak, status, keterangan, "timestamp", status_baak) FROM stdin;
12	153	2019-10-29	10001	1	2	sadasdsad	087888583949	accepted	kemahasiswaan	\N	accepted
13	153	2019-10-29	8	3	5	asdsadsad	34232432	accepted	upt	\N	accepted
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person (nama, jk, tmp_lahir, tgl_lahir, alamat, noktp, email, agama, telpon, user_id, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- Data for Name: prasarana; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prasarana (nama, created_at, updated_at, created_by, updated_by, id, alamat, luas, jenis_id, jenis_prasarana) FROM stdin;
Kampus B1	\N	\N	\N	\N	2	Jl. Lenteng Agung No.20 Jakarta Selatan	\N	1	\N
Kampus B2	\N	\N	\N	\N	4	Jl. Lenteng Agung No.20 Jakarta Selatan	\N	1	\N
Kampus A	\N	\N	\N	\N	1	Jl. Situ Indah No. 116 RTM Kelapa Dua Cimanggis	\N	1	\N
\.


--
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile (user_id, name, public_email, gravatar_email, gravatar_id, location, website, bio) FROM stdin;
1	\N	\N	\N	\N	\N	\N	\N
6	\N	\N	\N	\N	\N	\N	\N
7	\N	\N	\N	\N	\N	\N	\N
8	\N	\N	\N	\N	\N	\N	\N
9	\N	\N	\N	\N	\N	\N	\N
10	\N	\N	\N	\N	\N	\N	\N
12	Sirojul Munir			d41d8cd98f00b204e9800998ecf8427e			
55	\N	\N	\N	\N	\N	\N	\N
56	\N	\N	\N	\N	\N	\N	\N
57	\N	\N	\N	\N	\N	\N	\N
35	Admin PMB STTNF	pmb@nurulfikri.ac.id		d41d8cd98f00b204e9800998ecf8427e	Lenteng Agung, Jakarta Selatan	http://www.nurulfikri.ac.id	Petugas PMB STT NF
54	\N	\N	\N	\N	\N	\N	\N
59	\N	\N	\N	\N	\N	\N	\N
60	\N	\N	\N	\N	\N	\N	\N
61	\N	\N	\N	\N	\N	\N	\N
64	\N	\N	\N	\N	\N	\N	\N
65	\N	\N	\N	\N	\N	\N	\N
66	\N	\N	\N	\N	\N	\N	\N
67	\N	\N	\N	\N	\N	\N	\N
68	\N	\N	\N	\N	\N	\N	\N
69	\N	\N	\N	\N	\N	\N	\N
70	\N	\N	\N	\N	\N	\N	\N
71	\N	\N	\N	\N	\N	\N	\N
72	\N	\N	\N	\N	\N	\N	\N
73	\N	\N	\N	\N	\N	\N	\N
74	\N	\N	\N	\N	\N	\N	\N
75	\N	\N	\N	\N	\N	\N	\N
76	\N	\N	\N	\N	\N	\N	\N
77	\N	\N	\N	\N	\N	\N	\N
78	\N	\N	\N	\N	\N	\N	\N
79	\N	\N	\N	\N	\N	\N	\N
80	\N	\N	\N	\N	\N	\N	\N
81	\N	\N	\N	\N	\N	\N	\N
82	\N	\N	\N	\N	\N	\N	\N
83	\N	\N	\N	\N	\N	\N	\N
84	\N	\N	\N	\N	\N	\N	\N
85	\N	\N	\N	\N	\N	\N	\N
86	\N	\N	\N	\N	\N	\N	\N
87	\N	\N	\N	\N	\N	\N	\N
88	\N	\N	\N	\N	\N	\N	\N
89	\N	\N	\N	\N	\N	\N	\N
90	\N	\N	\N	\N	\N	\N	\N
91	\N	\N	\N	\N	\N	\N	\N
92	\N	\N	\N	\N	\N	\N	\N
93	\N	\N	\N	\N	\N	\N	\N
94	\N	\N	\N	\N	\N	\N	\N
95	\N	\N	\N	\N	\N	\N	\N
96	\N	\N	\N	\N	\N	\N	\N
97	\N	\N	\N	\N	\N	\N	\N
98	\N	\N	\N	\N	\N	\N	\N
99	\N	\N	\N	\N	\N	\N	\N
100	\N	\N	\N	\N	\N	\N	\N
101	\N	\N	\N	\N	\N	\N	\N
102	\N	\N	\N	\N	\N	\N	\N
103	\N	\N	\N	\N	\N	\N	\N
104	\N	\N	\N	\N	\N	\N	\N
105	\N	\N	\N	\N	\N	\N	\N
106	\N	\N	\N	\N	\N	\N	\N
107	\N	\N	\N	\N	\N	\N	\N
108	\N	\N	\N	\N	\N	\N	\N
109	\N	\N	\N	\N	\N	\N	\N
110	\N	\N	\N	\N	\N	\N	\N
111	\N	\N	\N	\N	\N	\N	\N
112	\N	\N	\N	\N	\N	\N	\N
113	\N	\N	\N	\N	\N	\N	\N
114	\N	\N	\N	\N	\N	\N	\N
115	\N	\N	\N	\N	\N	\N	\N
116	\N	\N	\N	\N	\N	\N	\N
117	\N	\N	\N	\N	\N	\N	\N
118	\N	\N	\N	\N	\N	\N	\N
119	\N	\N	\N	\N	\N	\N	\N
120	\N	\N	\N	\N	\N	\N	\N
121	\N	\N	\N	\N	\N	\N	\N
122	\N	\N	\N	\N	\N	\N	\N
123	\N	\N	\N	\N	\N	\N	\N
124	\N	\N	\N	\N	\N	\N	\N
125	\N	\N	\N	\N	\N	\N	\N
126	\N	\N	\N	\N	\N	\N	\N
127	\N	\N	\N	\N	\N	\N	\N
128	\N	\N	\N	\N	\N	\N	\N
129	\N	\N	\N	\N	\N	\N	\N
130	\N	\N	\N	\N	\N	\N	\N
131	\N	\N	\N	\N	\N	\N	\N
132	\N	\N	\N	\N	\N	\N	\N
133	\N	\N	\N	\N	\N	\N	\N
134	\N	\N	\N	\N	\N	\N	\N
135	\N	\N	\N	\N	\N	\N	\N
136	\N	\N	\N	\N	\N	\N	\N
137	\N	\N	\N	\N	\N	\N	\N
138	\N	\N	\N	\N	\N	\N	\N
139	\N	\N	\N	\N	\N	\N	\N
140	\N	\N	\N	\N	\N	\N	\N
141	\N	\N	\N	\N	\N	\N	\N
142	\N	\N	\N	\N	\N	\N	\N
143	\N	\N	\N	\N	\N	\N	\N
144	\N	\N	\N	\N	\N	\N	\N
145	\N	\N	\N	\N	\N	\N	\N
146	\N	\N	\N	\N	\N	\N	\N
147	\N	\N	\N	\N	\N	\N	\N
148	\N	\N	\N	\N	\N	\N	\N
149	\N	\N	\N	\N	\N	\N	\N
150	\N	\N	\N	\N	\N	\N	\N
151	\N	\N	\N	\N	\N	\N	\N
152	\N	\N	\N	\N	\N	\N	\N
153	\N	\N	\N	\N	\N	\N	\N
154	\N	\N	\N	\N	\N	\N	\N
155	\N	\N	\N	\N	\N	\N	\N
156	\N	\N	\N	\N	\N	\N	\N
157	\N	\N	\N	\N	\N	\N	\N
158	\N	\N	\N	\N	\N	\N	\N
159	\N	\N	\N	\N	\N	\N	\N
160	\N	\N	\N	\N	\N	\N	\N
161	\N	\N	\N	\N	\N	\N	\N
162	\N	\N	\N	\N	\N	\N	\N
163	\N	\N	\N	\N	\N	\N	\N
164	\N	\N	\N	\N	\N	\N	\N
165	\N	\N	\N	\N	\N	\N	\N
166	\N	\N	\N	\N	\N	\N	\N
167	\N	\N	\N	\N	\N	\N	\N
168	\N	\N	\N	\N	\N	\N	\N
169	\N	\N	\N	\N	\N	\N	\N
170	\N	\N	\N	\N	\N	\N	\N
171	\N	\N	\N	\N	\N	\N	\N
172	\N	\N	\N	\N	\N	\N	\N
173	\N	\N	\N	\N	\N	\N	\N
174	\N	\N	\N	\N	\N	\N	\N
175	\N	\N	\N	\N	\N	\N	\N
176	\N	\N	\N	\N	\N	\N	\N
177	\N	\N	\N	\N	\N	\N	\N
178	\N	\N	\N	\N	\N	\N	\N
179	\N	\N	\N	\N	\N	\N	\N
180	\N	\N	\N	\N	\N	\N	\N
181	\N	\N	\N	\N	\N	\N	\N
182	\N	\N	\N	\N	\N	\N	\N
183	\N	\N	\N	\N	\N	\N	\N
184	\N	\N	\N	\N	\N	\N	\N
185	\N	\N	\N	\N	\N	\N	\N
186	\N	\N	\N	\N	\N	\N	\N
187	\N	\N	\N	\N	\N	\N	\N
188	\N	\N	\N	\N	\N	\N	\N
189	\N	\N	\N	\N	\N	\N	\N
190	\N	\N	\N	\N	\N	\N	\N
191	\N	\N	\N	\N	\N	\N	\N
192	\N	\N	\N	\N	\N	\N	\N
193	\N	\N	\N	\N	\N	\N	\N
194	\N	\N	\N	\N	\N	\N	\N
195	\N	\N	\N	\N	\N	\N	\N
196	\N	\N	\N	\N	\N	\N	\N
197	\N	\N	\N	\N	\N	\N	\N
198	\N	\N	\N	\N	\N	\N	\N
199	\N	\N	\N	\N	\N	\N	\N
200	\N	\N	\N	\N	\N	\N	\N
201	\N	\N	\N	\N	\N	\N	\N
202	\N	\N	\N	\N	\N	\N	\N
203	\N	\N	\N	\N	\N	\N	\N
204	\N	\N	\N	\N	\N	\N	\N
205	\N	\N	\N	\N	\N	\N	\N
206	\N	\N	\N	\N	\N	\N	\N
207	\N	\N	\N	\N	\N	\N	\N
208	\N	\N	\N	\N	\N	\N	\N
209	\N	\N	\N	\N	\N	\N	\N
210	\N	\N	\N	\N	\N	\N	\N
211	\N	\N	\N	\N	\N	\N	\N
212	\N	\N	\N	\N	\N	\N	\N
213	\N	\N	\N	\N	\N	\N	\N
214	\N	\N	\N	\N	\N	\N	\N
215	\N	\N	\N	\N	\N	\N	\N
216	\N	\N	\N	\N	\N	\N	\N
218	\N	\N	\N	\N	\N	\N	\N
219	\N	\N	\N	\N	\N	\N	\N
220	\N	\N	\N	\N	\N	\N	\N
221	\N	\N	\N	\N	\N	\N	\N
222	\N	\N	\N	\N	\N	\N	\N
223	\N	\N	\N	\N	\N	\N	\N
224	\N	\N	\N	\N	\N	\N	\N
225	\N	\N	\N	\N	\N	\N	\N
226	\N	\N	\N	\N	\N	\N	\N
227	\N	\N	\N	\N	\N	\N	\N
228	\N	\N	\N	\N	\N	\N	\N
229	\N	\N	\N	\N	\N	\N	\N
230	\N	\N	\N	\N	\N	\N	\N
231	\N	\N	\N	\N	\N	\N	\N
232	\N	\N	\N	\N	\N	\N	\N
233	\N	\N	\N	\N	\N	\N	\N
234	\N	\N	\N	\N	\N	\N	\N
235	\N	\N	\N	\N	\N	\N	\N
237	\N	\N	\N	\N	\N	\N	\N
238	\N	\N	\N	\N	\N	\N	\N
239	\N	\N	\N	\N	\N	\N	\N
240	\N	\N	\N	\N	\N	\N	\N
241	\N	\N	\N	\N	\N	\N	\N
242	\N	\N	\N	\N	\N	\N	\N
243	\N	\N	\N	\N	\N	\N	\N
244	\N	\N	\N	\N	\N	\N	\N
245	\N	\N	\N	\N	\N	\N	\N
246	\N	\N	\N	\N	\N	\N	\N
247	\N	\N	\N	\N	\N	\N	\N
248	\N	\N	\N	\N	\N	\N	\N
249	\N	\N	\N	\N	\N	\N	\N
250	\N	\N	\N	\N	\N	\N	\N
251	\N	\N	\N	\N	\N	\N	\N
252	\N	\N	\N	\N	\N	\N	\N
253	\N	\N	\N	\N	\N	\N	\N
254	\N	\N	\N	\N	\N	\N	\N
255	\N	\N	\N	\N	\N	\N	\N
256	\N	\N	\N	\N	\N	\N	\N
263	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id, role) FROM stdin;
1	Admin
2	BAAK
3	Kemahasiswaan
4	UPT
\.


--
-- Data for Name: ruang; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ruang (id, gedung_id, kode, kapasitas, created_at, updated_at, created_by, updated_by, kapasitas_ujian, lantai, jenis_ruang_id) FROM stdin;
4	2	B1-102	40	2016-12-07 14:02:51.656695	2016-12-07 14:02:51.656695	1	1	\N	1	1
3	4	B2-205	30	\N	2016-12-07 14:03:13.629963	\N	1	\N	2	1
2	4	B2-203	30	\N	2016-12-07 14:03:23.804648	\N	1	\N	2	1
1	4	B2-204	50	\N	2016-12-07 14:04:11.928371	\N	1	\N	2	1
10001	2	B1-101	50	\N	2016-12-07 14:06:00.325972	\N	1	\N	1	1
5	2	B1-105	30	2016-12-07 14:21:56.044163	2016-12-07 14:21:56.044163	1	1	\N	1	2
6	2	B1-106	30	2016-12-07 14:22:24.958002	2016-12-07 14:22:24.958002	1	1	\N	1	2
7	2	B1-107	20	2016-12-07 14:23:14.163895	2016-12-07 14:23:14.163895	1	1	\N	1	2
8	4	B2-206	30	2016-12-09 10:37:23.659468	2016-12-09 10:37:23.659468	1	1	\N	2	2
9	4	B2-207	30	2016-12-09 10:39:46.297143	2016-12-09 10:39:46.297143	1	1	\N	2	2
10	4	B2-AUDIT	150	2018-02-26 14:49:21.360699	2018-02-26 14:49:21.360699	1	1	\N	1	8
11	4	B2-304	10	2018-09-11 22:30:22.008457	2018-09-11 22:30:22.008457	1	1	0	3	4
12	4	B2-305	10	2018-09-11 22:30:42.468632	2018-09-11 22:30:42.468632	1	1	0	3	4
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, username, email, password_hash, auth_key, confirmed_at, unconfirmed_email, blocked_at, registration_ip, created_at, updated_at, flags, last_login_at) FROM stdin;
9	hendrasas	hendrasas@nurulfikri.ac.id	$2y$12$Liz7uP4ep1iY1LPOI4UITe09LBSMWCmRAWEmPEPb1QVmUAwHL3Pka	mPzcfy0hT4awtD2AgwicmZQ6OvHNObwj	1449084088	\N	\N	127.0.0.1	1449084089	1449084089	0	\N
55	operator1	operator1.pmb@nurulfikri.ac.id	$2y$12$7yXAJ8uK.0sVFo9TeSV0W.GbY.sJJGkNQxQjQCGYW90uaRZuVKkJK	u2BoHzu-cOHcshPYh1MshKUK2jeEv717	1478860362	\N	\N	127.0.0.1	1478860362	1479178038	0	\N
56	operator2	operator2.pmb@nurulfikri.ac.id	$2y$12$rUrAN.egf2iKDARdCP3JKu1atI.GcqjmV9y3dVbzowntNMojd1Nqa	KaDjJP1xjKpbyAfabVSJWeb7liXWp5Yu	1479178063	\N	\N	127.0.0.1	1479178063	1479178063	0	\N
57	operator3	operator3.pmb@nurulfikri.ac.id	$2y$12$Vp4Dgat3pouKDBzcYTA4z.80vEr3VwkD21ywgoHvabzczDi.DJl1a	tQKV8PD4xRPec51N8Af4JktCt6KuddVc	1479178084	\N	\N	127.0.0.1	1479178085	1479178085	0	\N
59	henry.saptono	henry@nurulfikri.ac.id	$2y$12$9I/fQG3Y5aysOkuyCpBlyeH.L1j2qx0i6mTztSBCsnrZZC9uyYzWW	j2uId5iEVHEybmDUBR8HpAdYVSSX5kSv	1502261935	\N	\N	127.0.0.1	1502261935	1502261935	0	1516786658
65	adel18001ti	adel18001ti@unf.ac.id	$2y$12$XiNOqg6urgMFgvulr6xQj.ABAS6y5Mu5VE9mhumPPrkcYVtUDXG5e	_eGA-nUQv24SIbnJQ3VQ6nCRTCueRRMf	1536650707	\N	\N	127.0.0.1	1536650707	1536650707	0	\N
66	risk18001si	risk18001si@unf.ac.id	$2y$12$rBWBs.8oHQoDxPdvZCKQJuHDdTmmdktwJ9ZA7IfhwGwgBGLzRKAAO	HkSr8mi1P-x9mmwl2JEAOuvVrT76mMBJ	1536650708	\N	\N	127.0.0.1	1536650708	1536650708	0	\N
68	tirs18003si	tirs18003si@unf.ac.id	$2y$12$IigrhxgTGTN0tGopwmi/PeGZ1bzgDknnoa0HCOc.AmJpKtkEF1Fvi	Z3VPZWmSIXIQ84WFRBfSV-MFkiaFzum0	1536650709	\N	\N	127.0.0.1	1536650709	1536650709	0	\N
70	muha18003ti	muha18003ti@unf.ac.id	$2y$12$tQRfry8XwA/N2yPHid9BluvN9wzWRq463ESjcZ/C205h06hMuetwG	2l2tUG7pFN6RwR6qsS67kgZFuIdNv_rL	1536650710	\N	\N	127.0.0.1	1536650711	1536650711	0	\N
71	odez18004si	odez18004si@unf.ac.id	$2y$12$LFBCRo.io7iN/otxsPwbpOQYEcGk2CGaUI4J0YofAj1UmaY0ZBR52	j-KtjG29f5dlPcLE_vYLwfmtuzv4LY6c	1536650711	\N	\N	127.0.0.1	1536650711	1536650711	0	\N
72	hamm18004ti	hamm18004ti@unf.ac.id	$2y$12$lQnIx2.uIOFZvUueJZ0k9.P0/AI3Begr7MIHhURFhYKE1EXncfyji	CWra3mXimqgVXMONMqHUIkBCVe4IKr4M	1536650712	\N	\N	127.0.0.1	1536650712	1536650712	0	\N
73	nabi18005si	nabi18005si@unf.ac.id	$2y$12$Tf.t57hHp4EqUQu9AcrXG.PwmiVFT2sXthqaEwDuTaaeCY3J2l9zK	6bMG_BJrgoHWf4XIKgwKIwPLA3GO6LzP	1536650712	\N	\N	127.0.0.1	1536650713	1536650713	0	\N
74	srid18006si	srid18006si@unf.ac.id	$2y$12$LMehlhs1vDfhjvZ6oJE84unVZ0H52u7CvSifL1OVPFr6FFnTmKhZy	p4e1iBjIivTGkiM9asrWNqeahEU3r6Uu	1536650713	\N	\N	127.0.0.1	1536650713	1536650713	0	\N
67	anni18002si	anni18002si@unf.ac.id	$2y$12$p0qAL5FZIxIlUQvVE4KxqeBPDIhqoDZT3fa7fhzurRuH6lzwTNyL6	7W9tPQ1_jMRzV8R0IJWMz8KY7HAKmQZX	1536650708	\N	\N	127.0.0.1	1536650709	1536650709	0	1536650930
69	alab18002ti	alab18002ti@unf.ac.id	$2y$12$xsgE.WqXeHW8Q3q2BIzEz.yVQU71zNJBbRuDdVFBZ8XuEIlyxUb1a	O6LZR7QMSnIuxJPq-DwnWTz-0vQyLFwD	1536650710	\N	\N	127.0.0.1	1536650710	1536650710	0	1536651561
75	hizi18007si	hizi18007si@unf.ac.id	$2y$12$VG6JSzYVexGZeVUOM/pPzed273iouHQZLdwb1HfrXINaM.fAG2xVC	c9h9tWatyZnRtpe9g-gogH9OpHkiwL6K	1536652973	\N	\N	127.0.0.1	1536652973	1536652973	0	\N
76	evel18008si	evel18008si@unf.ac.id	$2y$12$JBvjSUghbZY7pxw2uw3U8elHPXzCmF90TjNXVnwslA3DkweywVVrG	3R8M3LjaRJpguwQPIFwL9vEOq2PUJ_8S	1536652973	\N	\N	127.0.0.1	1536652974	1536652974	0	\N
77	zulk18005ti	zulk18005ti@unf.ac.id	$2y$12$OOIRhenfq3cw4jng66WCQOi7NcL7LSfnG.jZZP1uXE9vKJobrTkTS	sc6xVP8zvJ56dv8gk-z-_CKwrk6l5Z-G	1536652974	\N	\N	127.0.0.1	1536652974	1536652974	0	\N
78	indi18009si	indi18009si@unf.ac.id	$2y$12$jTJwaTIqezxbNHdHANgBGumZ28qxsmQutDgmWlXHU9U3V6VrBwUTy	0VdWeO5P9g50jGutC-ufjZIUR5aayG1d	1536652975	\N	\N	127.0.0.1	1536652975	1536652975	0	\N
79	aris18006ti	aris18006ti@unf.ac.id	$2y$12$7i3Kt6MDp.0YT1wgrsTc4Oyzn4DTLvg5tUhzLncOpy6qrA1ccwm2S	rYwWJEGkDgJ_0ULMISsf9t10sw2kDWoK	1536652975	\N	\N	127.0.0.1	1536652976	1536652976	0	\N
80	ahma18010si	ahma18010si@unf.ac.id	$2y$12$uKl6BGGDeK0ofYqqGc3aB.IzXZdsi6GT9R729L6nDf4SBdbGCLi/C	_GyFt_xnFhLwJPvpuYfhdA__3ZVfw-kP	1536652976	\N	\N	127.0.0.1	1536652976	1536652976	0	\N
81	muha18011si	muha18011si@unf.ac.id	$2y$12$LXqcgQNg5VUjIqx.aVWCBOOg5O/JY9EWvvXqyppATONdgkuAHcjOq	fS8TQ2PexZxbuLa8LakARLZM62L5Luap	1536652977	\N	\N	127.0.0.1	1536652977	1536652977	0	\N
82	apri18012si	apri18012si@unf.ac.id	$2y$12$vOHMjGsguAtDNCFlYqdXFuFs80btjOVzX4F2A2bOnYJf/6J1IX6U.	J23GvH7KEZDXy52vNHKUVzng6GRNi1bG	1536652977	\N	\N	127.0.0.1	1536652978	1536652978	0	\N
83	aten18013si	aten18013si@unf.ac.id	$2y$12$UKnimS0qZgoe5IUAnGakTORVevH/ixJc.iKcElftaiGijPPvOkaYO	ZuqUJ0IWHCa6fn2Q306rnWWzs-YFFwZJ	1536652978	\N	\N	127.0.0.1	1536652978	1536652978	0	\N
84	ridu18014si	ridu18014si@unf.ac.id	$2y$12$2N922ykj0CJI9f2L3yBDYuj/DtXkuXhnml.w4/Oa9trol0dK0WP9q	v-lYSuNPLDKc8OXZbsnu-IklBhEuHP6h	1536652979	\N	\N	127.0.0.1	1536652979	1536652979	0	\N
85	nura18015si	nura18015si@unf.ac.id	$2y$12$dK9P3QwvaDDbMhD/le3Rd.BowopsAbOlgixF1HuWNqVDjr7HDEdYG	XvsG6XxBeZ83KCIHYgskS22ZExGF2EXX	1536652979	\N	\N	127.0.0.1	1536652980	1536652980	0	\N
86	tabr18016si	tabr18016si@unf.ac.id	$2y$12$/0N2P4zjrYYN7oll6Y/wjujeUv3Bg8/B8EZPOhq8j1azSrSHek/iu	ZuMgImwBtWgkWktp7Q6yAppmxDdya0HQ	1536652980	\N	\N	127.0.0.1	1536652981	1536652981	0	\N
87	duls18017si	duls18017si@unf.ac.id	$2y$12$fL8VUmxVaT0jqLj9teyT9.sa9IIvHB8Axaxml4rnIRt8Qdl76UUhG	aHCP_sVc3AIfHBiH_0Y_ZuKYRR-1AOoo	1536652981	\N	\N	127.0.0.1	1536652981	1536652981	0	\N
88	alis18018si	alis18018si@unf.ac.id	$2y$12$8h/KSfoF0HODCCAR.fbwxe8v7cV70fwVdjuZEKUUj/alU4mJykkk.	ataBVDJenz9No3Di-talitdRaXx_ym9B	1536652982	\N	\N	127.0.0.1	1536652982	1536652982	0	\N
89	wawa18019si	wawa18019si@unf.ac.id	$2y$12$oRZzmz4MDdDjFo7mSOCgsOJxoHrxsvG3FKGdExc3W0T9ldaKvk.Om	Q99WCM7OsSxu_kyzJY8YYQ9kvlmLbjLk	1536652982	\N	\N	127.0.0.1	1536652983	1536652983	0	\N
90	rmuh18020si	rmuh18020si@unf.ac.id	$2y$12$DhX6x.qLPjGkuoWKJIfsE.0mpW0sNpa9uyggTe31v7tZGXTCVKF8y	UW9hBN2fOSL_J_1nGooPRm_nH_aef2fW	1536652983	\N	\N	127.0.0.1	1536652984	1536652984	0	\N
91	ikra18021si	ikra18021si@unf.ac.id	$2y$12$.BzQSOH96SQtiJMfsAZpouYe3DhpWTkbm71o1pvCB/RqU.tTwoFUy	SGBKwnPYouyNdRMo1UsZ5oAFrLOTl9oG	1536652984	\N	\N	127.0.0.1	1536652985	1536652985	0	\N
10	indra.hermawan	indra@nurulfikri.ac.id	$2y$12$3LslxXJTW2yL48KhDCl2oeW2pbMnAJSrz74zxH.u2/UPMzLow92Ou	uLlKCJkhC0J9RIc3Rkf429qG9pPptO0B	1451233804	\N	\N	::1	1451233805	1537699413	0	\N
61	ahmad.rio	rio@nurulfikri.ac.id	$2y$12$h/m3C6GCwyqE2pk9./n2VugL3i5I0pf2PVKJPucuqlv9hGV0adrUe	Ml-Fq2EMCf3J6V83-_fSYjebaFPvugMH	1509958667	\N	\N	127.0.0.1	1509958667	1537699775	0	1537694058
6	rusmanto	rus@nurulfikri.com	$2y$12$/O2l4qANlxYWclPdr6.ljOZum6IzczSBPH7jljwqyyTR5QlpRKy8u	x4iUGLcPBz1wjAmsZH84sl9eczCU0ioB	1449075897	\N	\N	127.0.0.1	1449075897	1537702311	0	1537696142
92	widy18022si	widy18022si@unf.ac.id	$2y$12$UIt2dvx2kK/Mna84bszr9uz3/QWHbyZ.30LKYTmOSiG6EBTJSrAJq	zhT6gP_UoWMSkEyynp0CFe2Pi-MBxxZE	1536652985	\N	\N	127.0.0.1	1536652985	1536652985	0	\N
93	mias18023si	mias18023si@unf.ac.id	$2y$12$WTbWcAhuDWA0iZot7U4/GeQnVI0QCQoUMEOcq7OMKx.nGEXAFiAkG	o0_uWADiQrdVr7Gq7l3UvyjCMIAHPUQl	1536652986	\N	\N	127.0.0.1	1536652986	1536652986	0	\N
35	pmbadmin	pmb@nurulfikri.ac.id	$2y$12$VffLCX58dBpEWQEURwXomOFSrkOHlcHsnWHzCbsW/HwO2XCNzm5D2	uOWHsn-H_K4QAXV7YzcwnagFZ6YotREP	1461207892	\N	\N	127.0.0.1	1461207893	1464612239	0	1545397818
64	hilmi.at	hilmi@nurulfikri.ac.id	$2y$12$/.tM24gb1mlDs.4bLNyua.8BVd2wIc3YqMUww5NMWraqflNu2chNO	n2eRSoN_2e2wp3kxSMBlEOikYVI1KIE-	1516088622	\N	\N	127.0.0.1	1516088622	1537702049	0	1542082651
8	samsudin	samsudin@nurulfikri.co.id	$2y$12$EsHzlPzJhbatmpsSqF.ZKuHpQlftvbIIqY5h.oVaby4A9P5LQDCbK	wM9hexs0LNxi2MwJN9bie19Kh9orZhEn	1449082822	\N	\N	127.0.0.1	1449082822	1536677963	0	1538994047
94	putr18024si	putr18024si@unf.ac.id	$2y$12$nIaKQhw7etAGfhHsQXwk/eQB03SREIWtAKlaxMRbxL2fM6Gl.WYzK	ITqDd1ylOoKHTN_kdn8TO92Uc-hfd_39	1536652986	\N	\N	127.0.0.1	1536652987	1536652987	0	\N
95	mibt18025si	mibt18025si@unf.ac.id	$2y$12$fbTznoiCuZQzOnIy71KvJezxImiScjwPZ.30p2Z2MooqD8csyVvnC	S4Q9dTb-2S9H2yChsvw52dCMwffi0UPp	1536652987	\N	\N	127.0.0.1	1536652987	1536652987	0	\N
96	yuni18026si	yuni18026si@unf.ac.id	$2y$12$F/WWt0uHO5fod5KICP34pOTGaWFpBw2eg63ZUc0GfDOcvB6eP7ftO	6s6c9pm8Rcl0BDGcfRqRt78AtWYw71tx	1536652988	\N	\N	127.0.0.1	1536652988	1536652988	0	\N
97	zulk18007ti	zulk18007ti@unf.ac.id	$2y$12$/tQR7STl0oGpxN0/.2k9x.DUD0nDnQ2uBVvKZXWx030wcrZBuwvhS	AXNFWlZn9nqJHdR_ouBAMLa--VoGmc7X	1536652988	\N	\N	127.0.0.1	1536652989	1536652989	0	\N
98	adam18027si	adam18027si@unf.ac.id	$2y$12$I3GaNTvGXleoVkcQEMoyoe8F3soFMGgqAcNxmEjiVeH91jlKPJIyO	jk2WtqXcWWjxcRgTdkC_uHXh5OpsXKpL	1536652989	\N	\N	127.0.0.1	1536652990	1536652990	0	\N
99	alfa18008ti	alfa18008ti@unf.ac.id	$2y$12$TKAT8r5qQN3WO5Z7tWYtv.pLZtB/av3Fa.3i/FBxkRDJny24ESxQa	1QzK4c99QrsGoa2NAuW1pO3KImiX8PPw	1536652990	\N	\N	127.0.0.1	1536652990	1536652990	0	\N
100	aswa18009ti	aswa18009ti@unf.ac.id	$2y$12$qnu.8KWzMn7i3dn1zrorD.t4uqvw2ALBB3SOGDff/mCRQoohceqKW	UXh4eNb3oepXGo0CkqKm399UIdspxiBi	1536652991	\N	\N	127.0.0.1	1536652991	1536652991	0	\N
101	muha18010ti	muha18010ti@unf.ac.id	$2y$12$JKea.SCUZ1QNRQ3DljI71uoB01rX6Mgbm8ptVMBfoOoSzQ2cPLzWO	anLfJTLeKD7Eg3il6ASxYMEcXKUp2_xC	1536652991	\N	\N	127.0.0.1	1536652992	1536652992	0	\N
102	maul18011ti	maul18011ti@unf.ac.id	$2y$12$fEu8rjCp5Zr3Oc7p1oFNu.RlfGHVLO4NNOOzc5DQa5yv2kCEH.QCe	pjvauINV09qbzpthu9ZpD8kYYiaVUe7g	1536652992	\N	\N	127.0.0.1	1536652992	1536652992	0	\N
103	muha18028si	muha18028si@unf.ac.id	$2y$12$kgNvfAyugFRHK6pcmn.neuqwy6drmdr0080YQTDELE0yG19W6hOqm	Fpqy_Zq9h3FYTfLLL11_kUNhQCyxEUWV	1536652993	\N	\N	127.0.0.1	1536652993	1536652993	0	\N
104	chae18029si	chae18029si@unf.ac.id	$2y$12$qdH4EkH8Gz2B2opWXsfI5ORxWgVJvIVrpY2jk67Nqnfmy5Tarwbjm	CC8IzN1UbPJxuxT5VrOOdeHH-YZ1Jh2A	1536652994	\N	\N	127.0.0.1	1536652994	1536652994	0	\N
105	nauf18012ti	nauf18012ti@unf.ac.id	$2y$12$fjVwfAQAq8BIioYYGxvxdu6yNEGp.QjVt6ikabV8aFb1I4LLKqdW6	ta--u9g6P_JMsaDimgM9h2HMUUawJtK1	1536652994	\N	\N	127.0.0.1	1536652995	1536652995	0	\N
106	ikhs18013ti	ikhs18013ti@unf.ac.id	$2y$12$mnuK3Yx5pCmrw13dTcKi4uSe3oo90d4I.kZrsJMh23LE6KB.kLWr.	MPmWrmEnHQTecwG5phr2K7jDLZFb4Z2L	1536652995	\N	\N	127.0.0.1	1536652995	1536652995	0	\N
107	arsy18014ti	arsy18014ti@unf.ac.id	$2y$12$iZOr4kRCTzeShWAgC7S.GeZNm6j65DIcMh.aqVspdxKGfTrEPlsIC	zNjzh80sjCp-TV0TRpN49wS5ypaPvw-D	1536652996	\N	\N	127.0.0.1	1536652996	1536652996	0	\N
108	husn18015ti	husn18015ti@unf.ac.id	$2y$12$Ye8zMkM6crSAR1EnH2.yyu.TzopaM9qKZr6FkQS7aHTsDheh.E.ru	qDsoxoDor2ckAT9_t0Zs0XpyrgKIGVzM	1536652997	\N	\N	127.0.0.1	1536652997	1536652997	0	\N
109	nove18016ti	nove18016ti@unf.ac.id	$2y$12$gC2T2WNQxJb.XPtuDOc0qektuZVmkfpBK8RseRLrDPjd5FjlNONHK	6zZmh1QPYo6rOJb0f29hvC24zMGde46M	1536652997	\N	\N	127.0.0.1	1536652998	1536652998	0	\N
110	ahma18017ti	ahma18017ti@unf.ac.id	$2y$12$66OUHMeVB2MFL.F7Xttm/.dIBNc7Tdkjw5T6zVyDUsr3V95vdj5iy	qeVXOJmKGHxLksxm9ic7TKF5IKlNMFdm	1536652998	\N	\N	127.0.0.1	1536652998	1536652998	0	\N
111	vini18030si	vini18030si@unf.ac.id	$2y$12$5UzXwN.4CfWWqKjU8RQ5KOq6.nR2hnukP6EnOoDjV1c1hyJ7eT4Mi	M5OD-2K6jFu65K_q5o9RKZDj-W20Ugbf	1536653000	\N	\N	127.0.0.1	1536653000	1536653000	0	\N
112	fakh18031si	fakh18031si@unf.ac.id	$2y$12$E4uT9jTZRqgN4ENabss3uO5hyIAMtScZz.toEQIukHb/Y.w2GYTJG	ZPBbtogrOwLi5aHjjGGPKM1FiBzL9-Kf	1536653001	\N	\N	127.0.0.1	1536653001	1536653001	0	\N
113	muja18032si	muja18032si@unf.ac.id	$2y$12$1bXYk4YN9RzEcid24/Mi9ek4cSTU.DGLrLu86VsMqS/PkobKRZLR.	KxGgxm_FeKitQoUCFHGppiCnbdvH4OA-	1536653001	\N	\N	127.0.0.1	1536653002	1536653002	0	\N
114	nurf18033si	nurf18033si@unf.ac.id	$2y$12$lBhm82TH7NacBw8UxTdx8.WqZJW9BJNEv0ogtHMLcLq5LJsyyXXF.	3Hf6YILPl4yzYJe0VS9JJzfFbYqb9GWE	1536653002	\N	\N	127.0.0.1	1536653002	1536653002	0	\N
115	ahma18018ti	ahma18018ti@unf.ac.id	$2y$12$FeQOV.MxZHhGXVMfGzmYZO41gnUdjuCliTYNlznTVWVC8IOZGves6	g0X5nND-ymYS94-dZ633HbQoT-qtNYD3	1536653003	\N	\N	127.0.0.1	1536653003	1536653003	0	\N
116	moha18019ti	moha18019ti@unf.ac.id	$2y$12$9N0fpjGmJDwxL1WUCV8SJeoQ0yxKZBwj4h8C7HLiOZRlMNGPdr70O	dRXnC-SK6X89fszBDBloNPsd65xOM8oX	1536653004	\N	\N	127.0.0.1	1536653004	1536653004	0	\N
117	qeis18020ti	qeis18020ti@unf.ac.id	$2y$12$UpO58Lt0CTMba1cFXP6.le70GDXKZN1a2qu52uqy5SqFBw6sP6jSa	8SUw6uKxfyPBc-zjdZJ-_eXQAG5DRy0w	1536653004	\N	\N	127.0.0.1	1536653005	1536653005	0	\N
118	muha18021ti	muha18021ti@unf.ac.id	$2y$12$H7UgGmV0b5tNskF4ogOYFeEXprquWBJ.Cks5.9RBE0Gue1JJTPMie	iNkCT11QkQ7hgd-OXxlsD_bZ5Vu4Mz1H	1536653005	\N	\N	127.0.0.1	1536653005	1536653005	0	\N
119	muha18022ti	muha18022ti@unf.ac.id	$2y$12$aQbL.plZywa3NtgB7OaiJuO0dP17GRrf.dfrlgwl1t6vka1oBJlk6	xmaPuX-_Tj6_F2FJO89SggR70nbGF-Lf	1536653006	\N	\N	127.0.0.1	1536653006	1536653006	0	\N
120	khal18023ti	khal18023ti@unf.ac.id	$2y$12$Q84bqQrCk6LCX3oDTDGjPOne2Pd/XsdHx4KXx/SUw2sQuOMR4iKCO	uv887rfJQIHaNgS-Dui7NpyNHCThpYJf	1536653007	\N	\N	127.0.0.1	1536653007	1536653007	0	\N
121	efri18024ti	efri18024ti@unf.ac.id	$2y$12$sXNJ.XL12ajdu0AteobeDOwcr79X4mMu1sYRM1tptjMmj2wRXZnXu	J29DZCL1W4aY1M1ZTMjTipNuzLdVRLhj	1536653007	\N	\N	127.0.0.1	1536653008	1536653008	0	\N
122	moha18025ti	moha18025ti@unf.ac.id	$2y$12$61Zej1b/lcio0kmBP2dVC./FDvFAItFTSeUwlQF0OKX9O0XSlcakG	eQyac0d4bKaZLk-GzFBuCAAqCkyspAxN	1536653008	\N	\N	127.0.0.1	1536653009	1536653009	0	\N
123	chan18034si	chan18034si@unf.ac.id	$2y$12$LTn5tNlgfBJ12dg1FZ9lr.hWF8e7ExStorbMyob5hhNazM.VRR5Fi	AQgEWPZCqkLwsup44KbtIEu0qmzIiR-A	1536653009	\N	\N	127.0.0.1	1536653009	1536653009	0	\N
124	tuba18026ti	tuba18026ti@unf.ac.id	$2y$12$JQ2u3eLe6RCsn39VtHrSHeGuwHzhMGaZ/Xph2Li/fzU.RLX6M2ZOy	46fkx_drvbPcdp3dUcfih4fyVS8oaahm	1536653010	\N	\N	127.0.0.1	1536653010	1536653010	0	\N
125	arin18035si	arin18035si@unf.ac.id	$2y$12$5Lcrz.1bj7VSVfv5v2.OhOyNOiJuxgnZIx3dFD7/J1PXhV.nYRIO.	E_G6vXwYTKOEe-C1Lg95Q4lyXJgt7wL8	1536653524	\N	\N	127.0.0.1	1536653524	1536653524	0	\N
126	ling18027ti	ling18027ti@unf.ac.id	$2y$12$PMYU9jG82yP1yEpUitO2huWqnBF410aqqC4rLB0BkbRcgtl3LvwRG	mvgpWoAm-dHs-iSuYAanl7JqKzPFFCTm	1536653524	\N	\N	127.0.0.1	1536653525	1536653525	0	\N
127	muha18028ti	muha18028ti@unf.ac.id	$2y$12$RYBexVEqhE2GELM2XLSScu5KyA5hLx5LHn5U6l7R.x9RT0sHRBEmC	GWbg9XOhJyTlpQnDJZXyHx2UPLhb6JUw	1536653525	\N	\N	127.0.0.1	1536653525	1536653525	0	\N
128	muha18029ti	muha18029ti@unf.ac.id	$2y$12$zRce1.ZEcThtKD4twJtZkuv/W6x41ot46zBkdChGFRle3AqPUylhm	exRtUP_ZpOC1RBwh-0l0d1dlOGhScJx3	1536653526	\N	\N	127.0.0.1	1536653526	1536653526	0	\N
129	isma18030ti	isma18030ti@unf.ac.id	$2y$12$Pf0kp0fuega0ckl0GUEK0.PEd89oxjsYqnz1C/JAqAcfQXn8HwA3C	BF90Gp_X3WOsUFPu1XRqu-xzXfmCUUS_	1536653527	\N	\N	127.0.0.1	1536653527	1536653527	0	\N
130	rahm18031ti	rahm18031ti@unf.ac.id	$2y$12$QVitxQaDQK.Gz8fldymmFO7dcQ66F89xIk8sZrZ9VekCwUE/oiiom	pb2fsrRUS6oFDFPd5a6VAXtzkVsfRQtr	1536653528	\N	\N	127.0.0.1	1536653528	1536653528	0	\N
132	hasa18032ti	hasa18032ti@unf.ac.id	$2y$12$g1VHLiGfqUgn8sYGgjx5lu1SLofYk8Gy1p.pJ9nMc9Zxc74QpCtnC	AuIW6zWoYkZyqJAw0UuXbREto9QU6u3c	1536653529	\N	\N	127.0.0.1	1536653529	1536653529	0	\N
133	irva18033ti	irva18033ti@unf.ac.id	$2y$12$0fKhq6mLMIKhf9SQ1cmUVexm/3obrXKS60rgTirMV2d/xUyoKQn.2	N9oyKEjIz1eXhGhXNe1wmFcDS6Sc1Cl2	1536653530	\N	\N	127.0.0.1	1536653530	1536653530	0	\N
134	nabi18037si	nabi18037si@unf.ac.id	$2y$12$pZwdwLJJnHjnXUWas75HYOzEwYE8gIh1GSJwGrd2wKQsS5F7JTmPO	Ft9PRpv1F5TVqPtCh7ycq9I5cg0E-CAO	1536653530	\N	\N	127.0.0.1	1536653531	1536653531	0	\N
135	muti18034ti	muti18034ti@unf.ac.id	$2y$12$gJ9AjursXunnVnmoNeA7ROezH3kup3Dn9Rj3QaG6zY3BXttgZ91V.	M4DeipdN-H2glMkV1bIWxSMiQ3uFvG6s	1536653531	\N	\N	127.0.0.1	1536653531	1536653531	0	\N
136	muha18038si	muha18038si@unf.ac.id	$2y$12$64zG2V2S8Z8e7WR7vRlmGOo58Vp6INd7Qs5nZnTzd9yOEaeXh5ikq	u0AIuRUyzaatA_MWVpVMKp4i6-z5eoP8	1536653532	\N	\N	127.0.0.1	1536653532	1536653532	0	\N
137	ferd18035ti	ferd18035ti@unf.ac.id	$2y$12$vUtWmhs/gDdkH/xShb7uYegxcGMJVp39urhq3KBLZxxru/MAE63su	82mDXCotARkNrHp7avbbZqBEaal2u46Y	1536653532	\N	\N	127.0.0.1	1536653533	1536653533	0	\N
138	widi18039si	widi18039si@unf.ac.id	$2y$12$kdsaxwr4Ho8BDoEfWCcZ2e03M/nzZBhOsmxVR0w1cGbnqmzSTEROe	F9th_USw3B9PcXdcJTbPhuyAJKPr3OcF	1536653533	\N	\N	127.0.0.1	1536653533	1536653533	0	\N
139	andi18036ti	andi18036ti@unf.ac.id	$2y$12$kqno9iu6lPxhWbTyRjBBtuwiIe6hUpuzhqnGkJn/je9XUTn1yJ4PC	ho9dzqIWh4Spo8kKRlip6U4_pIA1tsmi	1536653534	\N	\N	127.0.0.1	1536653534	1536653534	0	\N
140	mdaa18037ti	mdaa18037ti@unf.ac.id	$2y$12$afBbKWjtBCYnZQQ7BbRmq.80sTCIuikQGuv6f.8g/VJnTVo9yeGcy	Zt44PtG8nY1iBm_PfEL78O2h_L8xlq5s	1536653534	\N	\N	127.0.0.1	1536653535	1536653535	0	\N
141	dima18038ti	dima18038ti@unf.ac.id	$2y$12$IV.Fehln3uy.5dgCo3HajOuvikYz3iXiu1TkiVzhZivY5RkRrzFL2	XBd5cSGrfRK8XMUpK27JtcJRaOxNuzRb	1536653535	\N	\N	127.0.0.1	1536653535	1536653535	0	\N
142	ilha18039ti	ilha18039ti@unf.ac.id	$2y$12$MbWyRIlRCle7CWQCqMFbX.RjM2fj3/5yQ2fsDv5xh4Ph2w8LE.43O	JtGd_Uv8VJgWO7i4q3tQCdjN3oisAQ3I	1536653536	\N	\N	127.0.0.1	1536653536	1536653536	0	\N
143	firm18040ti	firm18040ti@unf.ac.id	$2y$12$4cg44gTGOXgFFetyRdbv4.DdTwxS.DqeSU5gq5ytva2SVq7tIyHEy	88jkW92EtpBT5fgfgurdwqX1XI7607Sg	1536653537	\N	\N	127.0.0.1	1536653537	1536653537	0	\N
144	mift18040si	mift18040si@unf.ac.id	$2y$12$Tf9dru/od7nrfToPzXquSeo7qz8dm0RyGksvl5FueW4IGOi46zyx6	fsYvU0u75wGj1DXUhOvrSnkX2Ic7_8xY	1536653537	\N	\N	127.0.0.1	1536653538	1536653538	0	\N
145	indr18041ti	indr18041ti@unf.ac.id	$2y$12$WBxdE7GtTndujlAQf5I2pu2D8CsABA6DFJHQTncDOjn0Y8iIa3W.m	J8qQINTCf16IxsDmeOcUrwT9AgZU_1n0	1536653538	\N	\N	127.0.0.1	1536653538	1536653538	0	\N
146	fauz18042ti	fauz18042ti@unf.ac.id	$2y$12$kp/wLA1bIMs3JSs61FAY6u5sVH/9jKGnbimKhk9sE8AoEChwv39c6	6K-20-HdCaMLk6c_Djg9_ltPU8RrgJhi	1536653539	\N	\N	127.0.0.1	1536653539	1536653539	0	\N
147	anel18043ti	anel18043ti@unf.ac.id	$2y$12$/ZH1ZmImtJ35FXvXtqiO5uhUR44A/18lJpyj9ylfae1ondAT825Lu	66fnH--mIdoTi7Przjmu_tOWMddUUd8X	1536653539	\N	\N	127.0.0.1	1536653540	1536653540	0	\N
148	ridw18044ti	ridw18044ti@unf.ac.id	$2y$12$pR1z3aBiSMIcd08fAa.AY.PnKPeft6uqToOQJRm6SZe8VxXD7rq0O	vLbvI75P9UhtdoXNn0_8kzmAzOd1g_5Z	1536653540	\N	\N	127.0.0.1	1536653540	1536653540	0	\N
149	imam18045ti	imam18045ti@unf.ac.id	$2y$12$lWaQOlekSsRiFepwl5bTde/djDK2xDxsY2XBtr3F2fuJKlRFT8Hn6	0BJE6G6yfgwwZy7y1v5exQLwgep3CYHG	1536653541	\N	\N	127.0.0.1	1536653541	1536653541	0	\N
150	hamz18046ti	hamz18046ti@unf.ac.id	$2y$12$as6ifFsY7W.2uue3tlDtJurmHSSqgeat4.KIEg44Z9yCw/kbjJtlm	7gTYJPfxc5s4oz7ZF-8MIEbQhrKF4Ht_	1536653541	\N	\N	127.0.0.1	1536653542	1536653542	0	\N
152	maya18041si	maya18041si@unf.ac.id	$2y$12$ZqcLVD8SsUeNjVUKsHHbxunzxKZOC2JuIO6VMz/rdihukjue1u7xS	Pxc38C8nKfLBddk6yH9EN6vIUOPYMoje	1536653544	\N	\N	127.0.0.1	1536653544	1536653544	0	\N
153	lili18048ti	lili18048ti@unf.ac.id	$2y$12$izz2kMVZfs.34nCK04N6tep/K5bFq4Zx7FmDKSgnqDMuq.kml8CIi	9FSGnSV6uGa3sKnG-tItbV8Z91Myi-Er	1536653545	\N	\N	127.0.0.1	1536653545	1536653545	0	\N
154	muha18049ti	muha18049ti@unf.ac.id	$2y$12$6fcf7f3jh7eHT9jVwsnPuufFv58F5ZO/LmL7ZhF2fo6wkUNA16A8m	3ZwxYTh1TmnonytQWEv6xMhlmQrayHOO	1536653545	\N	\N	127.0.0.1	1536653546	1536653546	0	\N
155	muha18050ti	muha18050ti@unf.ac.id	$2y$12$vGu/ESAzbRRuYgQFw0ZKteIX7R6S30qFYAyzAuQWGdBz01b/IIkpu	WhSbrjX7ECznGbPum5vNpkIJNyADWXWo	1536653546	\N	\N	127.0.0.1	1536653546	1536653546	0	\N
156	amin18051ti	amin18051ti@unf.ac.id	$2y$12$PJ//0lqDJqjY75bDz74xaeFudeYOdkZlW/7kgxELMnOCvNaKa/Gke	09_HbcCzK_mb3aqOTSguvJIcOyHoJi9M	1536653547	\N	\N	127.0.0.1	1536653547	1536653547	0	\N
157	andr18052ti	andr18052ti@unf.ac.id	$2y$12$SmgAJ8o3UifeInbiNvOu9OXCadPCHN30rJHPPPvWg0rnUC9cb45oW	csZyPTkfdSYIE06fh-FxUOFUU6LX9QTQ	1536653547	\N	\N	127.0.0.1	1536653548	1536653548	0	\N
158	muha18053ti	muha18053ti@unf.ac.id	$2y$12$pgt9F6NxoYYqpOqLL//sVeaIZ3rm1.MvtjGVGSlIzaY25V/2tK/Kq	KXzQtjddXZFgoeF2zoWzWT7V8DrzX5MU	1536653548	\N	\N	127.0.0.1	1536653549	1536653549	0	\N
160	muha18055ti	muha18055ti@unf.ac.id	$2y$12$y83tK1tGzxcFkTDu0CLcoOOoyF25oLEGXeXNW19.Q55CPL3/EjDwW	tCE3GboUz9_Am7jbkYFjOuRvDYkbeMeT	1536653550	\N	\N	127.0.0.1	1536653550	1536653550	0	\N
161	raih18056ti	raih18056ti@unf.ac.id	$2y$12$JxDb3N/tnsrVPkntZAoB1uzV.c4R.H7dmBmtiBsD0p2cmt5RDdXMe	OFWUIl-vb53HZ6b6KTnlyglB3DSNOGKb	1536653551	\N	\N	127.0.0.1	1536653551	1536653551	0	\N
162	achm18057ti	achm18057ti@unf.ac.id	$2y$12$dcZB5A7rcPTrr6pwqqrE9OOVSSFxQeBmUU7Q5gvm.bm.VCsLSsU3S	WBPKQl5Q3wXFW2efdh_YmxxvWGqL32mC	1536653552	\N	\N	127.0.0.1	1536653552	1536653552	0	\N
163	just18058ti	just18058ti@unf.ac.id	$2y$12$z9voYq10riP0VRqXPTK7/.7RtlFwv7bD63otJ0pCJvjkvMHu0E3O2	Cx151zxyFH1gVAXjjtT7EllwQrbvIdmB	1536653553	\N	\N	127.0.0.1	1536653553	1536653553	0	\N
164	muha18059ti	muha18059ti@unf.ac.id	$2y$12$HetzitPU3ZhXiX.amuRIkOrUsOxmnxaqhqVpOILzJm3743vhRayla	QKTFgSZZ9W4Za0JpieDizv9A05nXrYwj	1536653553	\N	\N	127.0.0.1	1536653554	1536653554	0	\N
165	marl18060ti	marl18060ti@unf.ac.id	$2y$12$hwldK1QWWMAuAmvnXsaoiuY6dyDL8Nk0V328tOEA9l2LdLI.Feh3i	TsvyR_IV6vtY88I_mIVyeYi1lrZwaUe5	1536653554	\N	\N	127.0.0.1	1536653554	1536653554	0	\N
166	abid18061ti	abid18061ti@unf.ac.id	$2y$12$yk3epQEOoO.qEizsvVCkPuijXerEjKUUdJk4H80BsOzN077LcQN1K	za_raP9J6XBPioOYRNqF-ll46Emm4_b1	1536653555	\N	\N	127.0.0.1	1536653555	1536653555	0	\N
167	omar18062ti	omar18062ti@unf.ac.id	$2y$12$9nxZqOkPqZlJGiFWGxaCi.TT6kdUbqYjGVIH/trtlMEO7ZDz7wsH.	lnprYPKg45FYoSuDXrkwOY2fDs7nQ3mx	1536653555	\N	\N	127.0.0.1	1536653556	1536653556	0	\N
168	andy18063ti	andy18063ti@unf.ac.id	$2y$12$aUEBeLuGV8JiXEjpaJKiEO3cAzZ/Ac9L31Dy1MW0fFo2X3rl4yDrG	6lf2hN8ucHGXcpVoCuc2oLn1s0zibtPe	1536653556	\N	\N	127.0.0.1	1536653556	1536653556	0	\N
169	bayu18064ti	bayu18064ti@unf.ac.id	$2y$12$N4fzdo9G2GZa05DuHdYpfuYqKw87Nc0lx88JAOMVRLo/ZpmA9LSFe	L8FLqizUWKwxcxmp9T2OR-Ar-gTghE_F	1536653557	\N	\N	127.0.0.1	1536653557	1536653557	0	\N
170	alir18065ti	alir18065ti@unf.ac.id	$2y$12$XL.16drp.zOobpGdFrfPBe0j75w5uvR8zLfja65btL4Y7WHtn3kwi	4yBhwB61AT_BSSCS48W4i1vETtEbLP0A	1536653558	\N	\N	127.0.0.1	1536653559	1536653559	0	\N
171	yuni18042si	yuni18042si@unf.ac.id	$2y$12$fKB8.sVG65AJu0qQzJG07.1lHMGaCVL4qsinP86EmrY43cPj3UjZK	uMIuOeh4OTCFR7qH45mPiA3zHOdzaZao	1536653559	\N	\N	127.0.0.1	1536653560	1536653560	0	\N
172	abdu18066ti	abdu18066ti@unf.ac.id	$2y$12$lQcKkVcM5Yb2OHVY7jFZhOovMQmm20RZatYb8iEQaJqtr7L.1BvBe	m0M-1aRofU9uf8E8JO2JycxOz2nGmHc2	1536653561	\N	\N	127.0.0.1	1536653562	1536653562	0	\N
173	muha18067ti	muha18067ti@unf.ac.id	$2y$12$SbjQu5RTcHIiESq8hI6eyOeOBMZBHJERdjqN3hsW/1LucyZVhWZce	6NRStU5VBAZDPYYhRMwabFsTW03htTic	1536653562	\N	\N	127.0.0.1	1536653562	1536653562	0	\N
174	muha18068ti	muha18068ti@unf.ac.id	$2y$12$zhze8WiU1WT.U4mDHOsbretHDtYe53hXoalsoHCVfQ7835oJTMqXG	buV4rV04cF4D5cgX1cc0X0_fy5jMhVSP	1536653563	\N	\N	127.0.0.1	1536653563	1536653563	0	\N
175	adet18069ti	adet18069ti@unf.ac.id	$2y$12$z5YZoy.wKvZcCFDDt27.nurWWIk8RetxQ7vOx6EJzJYIEdnjjIufK	hsrnSN9p2s9tkE7_Sm4pbkgSjCIPU-ey	1536653650	\N	\N	127.0.0.1	1536653650	1536653650	0	\N
176	muha18070ti	muha18070ti@unf.ac.id	$2y$12$70Kflnm.wV/ho2lKhb1AIedcmj/VAI/11vrecyt.mq8Fq5dDUxFNC	8uBv1HjCHpsf5e6HyvtB2VfDWZQzhLM_	1536653650	\N	\N	127.0.0.1	1536653651	1536653651	0	\N
178	muha18072ti	muha18072ti@unf.ac.id	$2y$12$Cy3JCNoGE/ekUb5HOJoZg.a89KCesc5EP79u0ohV8V41Xh7h/kVY.	jh8Sl_XFm6CuKtdQoTuAOD4b8bH6uP3Q	1536653652	\N	\N	127.0.0.1	1536653652	1536653652	0	\N
179	muha18073ti	muha18073ti@unf.ac.id	$2y$12$FA5IZIM6GmINH8Rc8nswGecQkFwV/7wCK55AMJfT0OTx7DOdUHJ9S	6sz54yqutXonpcW3FF2JClqC3nJGCoxe	1536653652	\N	\N	127.0.0.1	1536653653	1536653653	0	\N
180	rama18074ti	rama18074ti@unf.ac.id	$2y$12$Bk8qQ39B.hj3NpbLvN450el7RyjQZ34z/q9RXsVskJLKLs0XwDr6y	aSFY_I9zTCge4PYqL2Ms2n1Nilx0OKFW	1536653653	\N	\N	127.0.0.1	1536653654	1536653654	0	\N
181	alif18075ti	alif18075ti@unf.ac.id	$2y$12$35kEPNq4m1QplX6ocHexu.83Gsj07Q/xt1s4MRVQobZTW6gCHtrka	wpGT5ySo9klgYuXP0XMbOwUf2dTE25Oj	1536653654	\N	\N	127.0.0.1	1536653654	1536653654	0	\N
182	muha18076ti	muha18076ti@unf.ac.id	$2y$12$.WlmyvKG5Xbz/887zmxoaOZtzefuV5nBhdPIlLsmbvJgIBwZfnTFK	JyEvP7VeuvzzI1cXpflEWhicTU63z_de	1536653655	\N	\N	127.0.0.1	1536653655	1536653655	0	\N
183	hilm18077ti	hilm18077ti@unf.ac.id	$2y$12$mzNt7SJnB9sOQkps2onB.umSWqjIn98.UFSU9wr44ybLqPaQMGpLq	I_DDUyZkahYes7wofPJifqffqPy_W48b	1536653655	\N	\N	127.0.0.1	1536653656	1536653656	0	\N
185	rafi18078ti	rafi18078ti@unf.ac.id	$2y$12$eHMkLKOHIXN4FQ.7L2yHLeX6t26mACKhZgKZgeUJpOBGdFIQZziVS	ojxpl67SCKXqKdU8POK7cBfUczht4EI6	1536653657	\N	\N	127.0.0.1	1536653657	1536653657	0	\N
186	ihza18079ti	ihza18079ti@unf.ac.id	$2y$12$3kLE/KHir/PjhgupyNNgc.hmK3LJ.sSHTrltltjVdc.1SecZ6fxsm	qbdFSkpED5zlP75oolNBryKnsqk5fUXn	1536653658	\N	\N	127.0.0.1	1536653658	1536653658	0	\N
187	tega18080ti	tega18080ti@unf.ac.id	$2y$12$GxQI2VVnfnzqQhLWLadaK.cK27Ql0vBJ7KnMtUmqJMV4Egm7lak/C	8-GlFXK10YHWdchtdYoAQV-t94EbwU99	1536653658	\N	\N	127.0.0.1	1536653659	1536653659	0	\N
188	angg18081ti	angg18081ti@unf.ac.id	$2y$12$SkWJOFOcoxPjIhynV1mM8ullBfzXWZ4KINEYhf3OCaVu30cy1f3X6	mlhQwh7OwI0mK7DeH45_vEivGDNQPcQt	1536653659	\N	\N	127.0.0.1	1536653659	1536653659	0	\N
189	mriz18082ti	mriz18082ti@unf.ac.id	$2y$12$msPJ.B/oDE/niTKe5EeyOODXw.jrFDkE65bt1JYTDoi75t8/518OO	bnaJmHSaflXCvTXqICoKkdVYxfGLkuOc	1536653660	\N	\N	127.0.0.1	1536653660	1536653660	0	\N
190	moch18083ti	moch18083ti@unf.ac.id	$2y$12$IMwB.W3lWWPtzkmUgz3S9.gQYF7SHiPCwmVJarLzONpFDbGJZQWbe	jJbFZYRHGdzYr_GIXAhAzlUMbaF-vwHy	1536653661	\N	\N	127.0.0.1	1536653661	1536653661	0	\N
191	kevi18084ti	kevi18084ti@unf.ac.id	$2y$12$Z/4ISxIWsu1g.o6VT9nCvusXvuSLtcvx7d5ZRBtwnah863ZLnQwq.	KS5S7FsuCiOCifE-ytcY5lppiqCrWFqV	1536653661	\N	\N	127.0.0.1	1536653662	1536653662	0	\N
192	erdi18085ti	erdi18085ti@unf.ac.id	$2y$12$wyQ4JGdV3n9gUGDDlsSVzerveeS62a1oYPODpGNrmHjOcpfhybxFy	q0qM_mNlYLydVhmAY00Dv1J1T2Y3BLIL	1536653662	\N	\N	127.0.0.1	1536653662	1536653662	0	\N
193	nabi18086ti	nabi18086ti@unf.ac.id	$2y$12$RkDBEMyGJNz5EUffA4aHN.8.jhevffEjazQA3q.EKtGSFnNpzOba6	nfCelRQzS2WtGtUzAFk-xQuSKsmizIBL	1536653663	\N	\N	127.0.0.1	1536653663	1536653663	0	\N
194	ekod18087ti	ekod18087ti@unf.ac.id	$2y$12$8ALfMG3NxOPOyrlC3NpXdOUXi7TEkdOsxenF8snjL/BkrAgzCqAh2	wLX8PtYD4d_NNU-X7_JeFS2pd1zQie19	1536653664	\N	\N	127.0.0.1	1536653664	1536653664	0	\N
196	fitr18088ti	fitr18088ti@unf.ac.id	$2y$12$DtRjGzzuywfdY6TwooTtXe7Yeia4kfaw0aDu3uoyQnM84LtTfIfIa	gkUYowoGjwmk3We7kN45EO8k6sxWnVcm	1536653669	\N	\N	127.0.0.1	1536653669	1536653669	0	\N
197	pria18089ti	pria18089ti@unf.ac.id	$2y$12$Z0cO71wrqCbElvERMgkcGOqaAFOzi5wqUpnTNU.4QwsHTtUBCcATK	oXaLsBEhtbDr9cB-aHEgCtSoaBBjsgcY	1536653669	\N	\N	127.0.0.1	1536653670	1536653670	0	\N
198	hudz18045si	hudz18045si@unf.ac.id	$2y$12$UIx3F.TvHnT6bX04s7JsueUWTxUsOHKoFUbxg65WnAr5d46VZDbPe	Q_VK7XmSnWCPO6gl4XkLMYtyloxJPgfW	1536653670	\N	\N	127.0.0.1	1536653670	1536653670	0	\N
199	fauz18090ti	fauz18090ti@unf.ac.id	$2y$12$a47uI8kiJJzxpNvs4K/GNOQ5r5DluUVlJgxW5KT3Us37KnXToM2Q.	jYRpKvUQvBvtbCWf94occu2L9OaDPp_b	1536653671	\N	\N	127.0.0.1	1536653671	1536653671	0	\N
201	abdu18046si	abdu18046si@unf.ac.id	$2y$12$6jBAyRpD7SvaPVxKbsAdouYDD4zHlxzFKRH3CBEd6heItzJnyqUQu	_hYBv_cz1rClsoFML8PkkjNah-afuKSG	1536653672	\N	\N	127.0.0.1	1536653672	1536653672	0	\N
202	gian18092ti	gian18092ti@unf.ac.id	$2y$12$tHUy.tdoEDPRB2AyboVXm.5xNE9Cevv9dslmQP5rpo2sw6C1oG/8i	8gHtvPXL520E5nBoNb3oMRHaqT9oMKE-	1536653673	\N	\N	127.0.0.1	1536653673	1536653673	0	\N
203	adig18047si	adig18047si@unf.ac.id	$2y$12$lQgRc66bTsgnUbe2w.yCBOHcsjAlVZEJ8dmROeZfZc1rWCNM.YzX.	1TRiRhgK9VdPCaqi7Z8VyqVh1tENQQF7	1536653674	\N	\N	127.0.0.1	1536653674	1536653674	0	\N
204	muha18093ti	muha18093ti@unf.ac.id	$2y$12$JJWnZenj2yhbcyv2ofecGOaXBz4moZ.qW/I.t.i4qvU2d.AA2iwWq	8C-hWh0Ppq9oI-DK8WuxNtTK0ioTI9Fk	1536653674	\N	\N	127.0.0.1	1536653675	1536653675	0	\N
205	bobi18094ti	bobi18094ti@unf.ac.id	$2y$12$7FaQMLHA3ZFDA7hosgszceeY8jX1tfSbNeIdjUHcY9XX3y7Z8Hyge	QK1IP4i1jj02LmsQujeSzVbaofubpef2	1536653675	\N	\N	127.0.0.1	1536653676	1536653676	0	\N
206	izzu18095ti	izzu18095ti@unf.ac.id	$2y$12$X36c1A9yR.Gy0ALcrEU81ekROhhWl/2dbAAxPZzbVhZ2pWAVdQwCO	LC85NveQJ5wbYAogED5Sf9Bd7u0C5jHM	1536653676	\N	\N	127.0.0.1	1536653676	1536653676	0	\N
207	farh18048si	farh18048si@unf.ac.id	$2y$12$OJAAYLaiOb4nacOMZTLDJORN52njuM1fAF//8o8K/qXOA1mrMCkv2	rqoMw7dbsc38BO5MaKuISMm1yHBd1q-y	1536653677	\N	\N	127.0.0.1	1536653677	1536653677	0	\N
208	zhih18049si	zhih18049si@unf.ac.id	$2y$12$Jkz4hMZPAdZzH41Vi4oZgOSMw//OFdPuQWhk.mSgac/yO2MIkDMyy	dzXStAXJUcQHWrGMoCD_NSBzuL6OmTCH	1536653677	\N	\N	127.0.0.1	1536653678	1536653678	0	\N
209	faza18096ti	faza18096ti@unf.ac.id	$2y$12$rhSr.yLRPF2ajkcgHhKcfOKPES6tT5VvCR43Fs3Ka6mJD6GXrjAoS	qGNDwZpi6T54omnHB8iSSs54MpvgAvfZ	1536653678	\N	\N	127.0.0.1	1536653678	1536653678	0	\N
210	abdu18097ti	abdu18097ti@unf.ac.id	$2y$12$Nu3EMlyrgi6oImWkul7zSegy8BdM4UoXhTD1UkX2Pxo0dWoj5VYla	1SDtFtmCZIvQ_4Q0QntDr9aHmi-h7RNE	1536653680	\N	\N	127.0.0.1	1536653680	1536653680	0	\N
211	syah18098ti	syah18098ti@unf.ac.id	$2y$12$d8/GwNshbtB9za6Ie8vBsuIUbWBfbRA0zuCeCJe5EOoz78qzYqVnu	s9442l0BqpHZyPPVwa-URzeqMDgXh6tK	1536653680	\N	\N	127.0.0.1	1536653681	1536653681	0	\N
212	iaan18050si	iaan18050si@unf.ac.id	$2y$12$MRUWBcTYZLN0/JUOBH6FjORa.TlbNDqekA0qwQddCsq2JOuYg9szW	pQkYa7titkyWtJZDsZTHqsKnGSwxj1jW	1536653681	\N	\N	127.0.0.1	1536653681	1536653681	0	\N
213	abdu18051si	abdu18051si@unf.ac.id	$2y$12$iT6.yhWk9o3oUhqoVSnpH.SMHMC7yC0Fs6k8kJB6NV7U4gTCsWepu	5_DDeVcAhsrcmGp_9psVTGGzO5OzPnyh	1536653682	\N	\N	127.0.0.1	1536653682	1536653682	0	\N
214	andr18099ti	andr18099ti@unf.ac.id	$2y$12$q/FbWLxCWOTrE3YluI81..3yY6EOa1aEBFNON.3PTtRyhlPaMg5pK	j0RL5nCF7U83eNjBVpPF-2LjlwsmJqlq	1536653682	\N	\N	127.0.0.1	1536653683	1536653683	0	\N
215	chri18052si	chri18052si@unf.ac.id	$2y$12$QwCk5p8FpBU0fK7Hb/HeuukJbgLjeV22f1u0wZCRcJqlBwo0oSKia	EetCtv2lkNReU_zElJnJOqn4LEQTFX0C	1536653683	\N	\N	127.0.0.1	1536653683	1536653683	0	\N
216	fikr18100ti	fikr18100ti@unf.ac.id	$2y$12$p0Uq58zCe25Sn/mmBBpsnOzSWyuYkNECbZEASc8jVvA8pGQX1CO9O	7mmbyBobyJl4NPXtXlWQxvYoFm2I_R1W	1536653684	\N	\N	127.0.0.1	1536653684	1536653684	0	\N
195	muha18105ti	muha18105ti@unf.ac.id	$2y$12$ckLepmi6aS/qWkiM6R7LceUbxisRsmtxJB2.Lh4lF5EukbXQOt9Q2	C_5KJzdTYDQIV2dIq8N5xmu8SHPq94DX	1537690998	\N	\N	127.0.0.1	1536653668	1537690998	0	\N
242	irfa18056si	irfa18056si@unf.ac.id	$2y$12$4rFNLqUUw4EzT53ICR94Q.40n2VD1sqH1CHwQFcTjX74J98EQAPQ6	2MaOIBlnJvPybbLgpEItC8lEeFx8LPUj	1537255136	\N	\N	127.0.0.1	1537255137	1537255137	0	\N
243	haik18102ti	haik18102ti@unf.ac.id	$2y$12$QMCwRsOd/xCxoLGiuoF.W.jkdYwHllf/jhD.i6l6wYSnW60pRUjQm	d4TyGIm0FRV4dK3qrvSs1zXqZAhJnjUl	1537255137	\N	\N	127.0.0.1	1537255137	1537255137	0	\N
234	fanny	fanny@nurulfikri.ac.id	$2y$12$zg7P6UdDDA.g..lDkka0X.2n5f0OmGWG1QHbJbnuFEkQQNMkhacmO	MNFFD9x7OMzUf2lL4zfS07NqFFbDojf6	1536678455	\N	\N	127.0.0.1	1536678455	1536678455	0	1536684806
238	muha18053si	muha18053si@unf.ac.id	$2y$12$ULS2YC9zoEJhUieriglX/.zAY8/2up7dgTMAQ83hTlNbI9UyuBfO6	9I-nzwSKYNG33jmB1bBL2XfOz8n6wR8E	1537255134	\N	\N	127.0.0.1	1537255134	1537255134	0	\N
239	neti18054si	neti18054si@unf.ac.id	$2y$12$fvzdxOGxpwuQ2Aaz1xnJH.pkVeujIVIuDIHoOkOZO1iDtzsOjnHHi	YF231QwI3sATBZafmu_DgC1W6C0cJhhY	1537255134	\N	\N	127.0.0.1	1537255135	1537255135	0	\N
240	usam18101ti	usam18101ti@unf.ac.id	$2y$12$gz6bcOE8a3AAVamZGGdtBugxDNHZtHDd.jVFUUI1MA4.Eg842uwce	EGfDdjPzbnCklA2uFnwp3CPOOJhP3N7r	1537255135	\N	\N	127.0.0.1	1537255135	1537255135	0	\N
241	nadi18055si	nadi18055si@unf.ac.id	$2y$12$xwl6P4gFXeQW75rKFH.5vughZRXBoMILPTZjsbhoO.ihYgqwkiKiu	9WVW3HiqEpV4HB57CayUm6qOawrA74oz	1537255136	\N	\N	127.0.0.1	1537255136	1537255136	0	\N
131	muwa18103ti	muwa18103ti@unf.ac.id	$2y$12$XyuetWbZIpbgAajGv9cP.eDRX.wonzw6drg4dlzNiCIa.MxohJc5W	tVEPb0qpiouxA2fnybH5_zKqU0qDQeVv	1537689776	\N	\N	127.0.0.1	1536653529	1537689776	0	1537689828
184	alwa18104ti	alwa18104ti@unf.ac.id	$2y$12$T/kKxqI9ZVGXdfUJiydpNeoIZOlf8Q7J/.T95ZM9q6RXqakLE6EQG	e4Vmgcm4uMCjlrysfEqH7K_C0GSkfVlm	1537690379	\N	\N	127.0.0.1	1536653657	1537690380	0	\N
159	musy18057si	musy18057si@unf.ac.id	$2y$12$vMB2R5yEBLqfdPoyevjmlOtSXQtt5.aVJb0skiCfVX7bgh3Oz7QVe	p2Z6pPGHe4gwXa2M5DbmCt23S89WreA4	1537690636	\N	\N	127.0.0.1	1536653550	1537690636	0	\N
218	isdhama.miswardana	isdhama@nurulfikri.ac.id	$2y$12$IjpZuGwBDdO0b7VNPyJYaeqpFQ6VIDB4FnBeUlJ.6fLjNfcrQ1aQm	HO3wYMM_MyfrQPeY_IOfX5uaAdIZlnMT	1536676161	\N	\N	127.0.0.1	1536676161	1537699334	0	\N
237	lina	lina@nurulfikri.co.id	$2y$12$JDZPS/BI5CkXOF0lz5VhfOcugx.z/InADJQerByXmVvrHlomuGaQ2	kZd7bgmDIUQFy5fXLJhWs4lzyzMNGwjx	1537069526	\N	\N	127.0.0.1	1537069526	1537069526	0	1537857809
244	salman	salman@nurulfikri.ac.id	$2y$12$XFSClOsBjnDnWgKWv38fre06lM3QB/AaUhxwzW87U6iJV3H11QyWi	tNRWvCSK1lrS7Iu-rjb-mN_yB6xIyfiP	1537267792	\N	\N	127.0.0.1	1537267792	1537702255	0	1537692503
219	lutfi	lutfi@nurulfikri.ac.id	$2y$12$27ptnYo.4BzGwlkTpTq5iOsOUt56n4ozTNpw7kWSl6ilxIibB3TBO	ZCRjGeZsOlRnXeZvJ0LDRD0e7n80SFXD	1536676248	\N	\N	127.0.0.1	1536676248	1537699365	0	\N
224	sapto.waluyo	sapto.waluyo@nurulfikri.ac.id	$2y$12$f59ybBrRbu8eVxZ9Piqzk.FrqCqykBwmE/XaJhkcDd/dYB8z9kS5K	-nYTHfGR90wefn-dhT_v1yTNRrciCN3b	1536676771	\N	\N	127.0.0.1	1536676771	1537699929	0	1537601716
220	reza.aditya	reza.af@nurulfikri.ac.id	$2y$12$EFq.dR4vYjo2.cYQmVrD.eajx7CIZSiFD2.CSMEXzLbZWKZlN6QGC	IKA6GjMIFYIgH9HbYdMUAmwNOFbOM2yP	1536676563	\N	\N	127.0.0.1	1536676563	1537699582	0	\N
221	suhendi	suhendi@nurulfikri.ac.id	$2y$12$HycWig3kgYhPll0Za844Vut325btfYCZjrk4sKjl8L7yRWkko4Zty	pYSejVV88mzu7-FDIEXHEhwIlwyjndiT	1536676608	\N	\N	127.0.0.1	1536676608	1537699641	0	\N
222	yahya.zulkarnain	yahya@nurulfikri.ac.id	$2y$12$/8/B4z1SSisIiFi0cfFXQewPcavWqnk9ORcL2292/YXPEpRNuKHBu	oCkICJh3F5tjR-GcsrE9Fw8j7B4nUhVW	1536676648	\N	\N	127.0.0.1	1536676648	1537699697	0	\N
225	maisarah	maisarah@nurulfikri.ac.id	$2y$12$2Oph756KXn/XSX9BwlJQfuW2Zj9yw9CBptwE9Ks1RC2kc1I7i26v2	N228qlnWIEiY7vLnZ-uy9XiTh-5_3r9w	1536676829	\N	\N	127.0.0.1	1536676829	1537699985	0	\N
226	camal.sugiharta	camal@nurulfikri.ac.id	$2y$12$fBE85CTaTvtqjiFjKKPhdOSyz0EBLAIEV5UEvF9iH1t69/o241VHW	y8uXTvnIPC-WSULlpJv556-WgnZrK4B8	1536676904	\N	\N	127.0.0.1	1536676904	1537700052	0	\N
227	misna.azqia	misna.azqia@nurulfikri.ac.id	$2y$12$hUzR.X8MIooes7x5i1n.YOEapI.SRyIyH7Q0oKZLAuxnl6wbzF2gq	Aj27g4sDt8zoOqB3Smxg6d81f9zBDfUt	1536676940	\N	\N	127.0.0.1	1536676940	1537700127	0	1537093355
228	firdaus.solihin	firdaus.solihin@nurulfikri.ac.id	$2y$12$68gc4quC1YMSeh1yX7uBM.793EMws8C1876Dhf7pIz90/ZiqMAhC6	3BcaOa3j0SFWJBCTi4GjgvorVAbs-A5m	1536676994	\N	\N	127.0.0.1	1536676994	1537700230	0	\N
229	umul.sidikoh	umul.sidikoh@nurulfikri.ac.id	$2y$12$b9c9L85VPgEril.YQsI2y.CzMwvMTSAtgT9bKREnPgueJpnWa6p6y	Hiuz1ynQ46V9Y8I6JQkDPCCZ2TUCJXSt	1536677024	\N	\N	127.0.0.1	1536677024	1537700344	0	\N
230	april.rustianto	april.rustianto@nurulfikri.ac.id	$2y$12$MTFw5mW2T7rKeUX6pMPqUeqJ05nVDEyWrTjrFDeOSAAuG/tCr0crK	PqhcgGEL26JjL5kMwwxXgXawDkxOo6Vf	1536677204	\N	\N	127.0.0.1	1536677204	1537700478	0	\N
60	reza.primardiansyah	reza.p@nurulfikri.ac.id	$2y$12$O7LQbKPF03k7G9gan2IAW.Iq7Hi44l.WnLD/Ctu4gLYiRMgoO1IQi	x5rSynsMpndDNVqSxG1r_G7BrJj98T3d	1502283313	\N	\N	127.0.0.1	1502283313	1537700575	0	1502284678
231	ichsani	ichsani@nurulfikri.ac.id	$2y$12$RiEinQ.fHbrHtjR232EKnOLZQmn2pOUtlj7NJRKuA8wB3OVFqT.A2	s-UpzGXMD6lbukhfbuidFpHnAquduE6r	1536677282	\N	\N	127.0.0.1	1536677282	1537701273	0	\N
232	hikmatul.khusna	hikmatul@nurulfikri.ac.id	$2y$12$nbzpeJ.tFmbo84.ks/pkLezlS3YiMVjDrFd.qOB/jBn/BRR/O.pGu	u1Atvm604J7lKnPTn68OFizCl_d7ynsT	1536677335	\N	\N	127.0.0.1	1536677335	1537701397	0	\N
245	yekti.wirani	yekti@nurulfikri.ac.id	$2y$12$H5NgxWaNUKrAUE7G5nDeFeB0cA/CCPqgWrpEs/cLfhvJr67Y5ffeO	AbSFSHcrogAGbo1q9H2_lCEydARDaSLw	1537692327	\N	\N	127.0.0.1	1537692327	1537702196	0	1537692376
246	roza18058si	roza18058si@unf.ac.id	$2y$12$m0.j6kb22xrmicPotgfXyenzotHtq4weLjGcQxoNI9.geAp7A5kve	uNMIN6zNwLmVrQurxnseehx8ky-2Rpl-	1538473763	\N	\N	127.0.0.1	1538473763	1538473763	0	\N
247	hady18059si	hady18059si@unf.ac.id	$2y$12$Nn/iT6/TQzAwae0u8C4weelj9HaJVc5KrQaOH7A6sD2klLxRFKQx.	nUurQO6RDysVbdavVvW37mETxQoH0ef-	1538473764	\N	\N	127.0.0.1	1538473764	1538473764	0	\N
248	mohi18106ti	mohi18106ti@unf.ac.id	$2y$12$QB53MUYCSs8NGRSd1KVVz.H50wlwFCB7Nvs0H1eYfT4SldP8YoWza	rLtY5Wyl6jEhHT-tX5RBM1J2-_jxTI2q	1538473764	\N	\N	127.0.0.1	1538473765	1538473765	0	\N
249	tedi18107ti	tedi18107ti@unf.ac.id	$2y$12$rGFoANDiknq54PSLVyiKbu51pEA7tb4t3s7vwbW.oSkQXJTGEcWBi	1mIL1pAY1lbtuL_Ehfmb22NQM-mbm4jP	1538473765	\N	\N	127.0.0.1	1538473765	1538473765	0	\N
250	hasa18108ti	hasa18108ti@unf.ac.id	$2y$12$1VR/bTvmtXLlhR/9q7HczevWcXzU0YIilkS8Pvg9JsSOXvm76JvZa	87CKC-mWzczlKLs0rsEZf6KJ35hPJIGo	1538473766	\N	\N	127.0.0.1	1538473766	1538473766	0	\N
252	muha18060si	muha18060si@unf.ac.id	$2y$12$nI4qnfH8FeYAPl2N2U4q1.h8kK3MbotfD8dP9fernDLyd57UkaMpa	azKsPlc3nELL5az3Q6K8567JVEI-CE02	1538473767	\N	\N	127.0.0.1	1538473768	1538473768	0	\N
253	habi18110ti	habi18110ti@unf.ac.id	$2y$12$411FbLuM3v3dt/kOSLO/gObJoB6jd0nB0/vHRyIAy0AyuzbK44wPi	8SWSbAkmjVG6HIo7KgOKVOyswrE6gwLE	1538473768	\N	\N	127.0.0.1	1538473768	1538473768	0	\N
251	haya18109ti	haya18109ti@unf.ac.id	$2y$12$KmdFtqSu/0mfumwFgnD35.7VMdnam31CfPpf4Y06hb1..rzfWhmrO	9IOyZLkc00jq82-LZepImxJ_PnZAE2cX	1538473767	\N	\N	127.0.0.1	1538473767	1538473767	0	1538476390
235	edoriansyah	edoriansyah@unf.ac.id	$2y$12$EkQlI3HmqHb6CPT5K1GzY.y.UrwupeI5WV3bX1fsCKnp7iAI1w5E6	QVm2mEvpYgHnaWbuhK0zfyoxb8B2_wAV	1536685129	\N	\N	127.0.0.1	1536685129	1537087528	0	1537257385
54	misna	misna@nurulfikri.co.id	$2y$12$8OWQ.auZBG6jXObojhFF2uxjdt85gOadmVVvjL5lXwL1VoCEiO.B.	hWsnLH6wE0YjMwhx8zTtt3AAwL2_8aUS	1469514445	\N	\N	127.0.0.1	1469514445	1537078667	0	1547212841
12	rojulman	rojulman@nurulfikri.ac.id	$2y$12$XZUvr3lYoZnCl/OHcO07POS53T7lj/sM1oZx/pDL0.G8J6rYUfWpC	hLkG148HG1-Uhm2kkV5kSW3wCdzzM_HR	1453134425	\N	\N	127.0.0.1	1453134426	1537702145	0	1542081718
200	abdi18091ti	abdi18091ti@unf.ac.id	$2y$12$v75DLPFEmPilpIR7h0KRx.5Esnwn3.TdfKNis9j76Bkszi.Th0rBm	dJzkg0OuMitYnr2asq-jM4UYSElL7LwG	1536653671	\N	\N	127.0.0.1	1536653672	1536653672	0	1547644664
233	lukman.rosyidi	lukman@nurulfikri.ac.id	$2y$12$lIR2n7vtXHODhg/BCbK3ouev9iS8y/k0Pt.hzmv925J9fZtXwm2aW	A1eSL6Ajavhvk2Ygcq2A8jZ9wqoliOQn	1536677400	\N	\N	127.0.0.1	1536677400	1537701336	0	1547440056
7	amalia	amalia@nurulfikri.co.id	$2y$12$2tZo89Vzx83gZtIpaFEg8uGt.ohbfFXDH7EbGCKbxzs64BsN5CT56	oyTEiioSGR9Tf9UNhlHIWVo0GZCg6llz	1449082788	\N	\N	127.0.0.1	1449082788	1449082788	0	1543477182
223	slamet.santoso	slamet.santoso@nurulfikri.ac.id	$2y$12$yCAY..ifDFbCG04he3aQv.RG6RygBZAJhz6FBCrJevW/t14Aif2gO	dmaUQ64xxhSSeGf_q3j6b_aLK4nqWxFU	1536676715	\N	\N	127.0.0.1	1536676715	1537699847	0	1547612330
254	ayud18061si	ayud18061si@unf.ac.id	$2y$12$2Yzso0qEnX07Ip8cS7FO8eDxZfgNEc9PZ0D/GjZyzBA.dt4ysrxhC	kBWLHpjxBhXZMUAQ93Bul2BcIiqYw4SH	1538473769	\N	\N	127.0.0.1	1538473769	1538473769	0	\N
255	coro18111ti	coro18111ti@unf.ac.id	$2y$12$dGOoGyG2v0poyYHUsjvDougHBtXzwbIe9kXHQd.dJcpYPBCK8S9f2	2DVlCF-T9p-acllzetDUMEjFTQL8rV34	1538473769	\N	\N	127.0.0.1	1538473770	1538473770	0	\N
256	muha18062si	muha18062si@unf.ac.id	$2y$12$qX15SUY9HcCQHAWIsmXJhOxwTz6z67fbSogo2BUvKpCjhjsePS3jG	o06T8aK803c5r1xEBO1hD8WnM0PS_HL_	1538473770	\N	\N	127.0.0.1	1538473770	1538473770	0	\N
177	muha18071ti	muha18071ti@unf.ac.id	$2y$12$zyaFtaaeJdMKQpGcBojumeTZW1zvRboaqP2eBjPwdDqFx2nWrizx2	tTHJQpLF_EJS8P5PD82PeISSMJpIXZYa	1536653651	\N	\N	127.0.0.1	1536653651	1536653651	0	1542947469
151	abdu18047ti	abdu18047ti@unf.ac.id	$2y$12$acSQkaATfRS4/rbIiAk.FeLxjK.dXqz8h7DOhsQhyZGHILYSvP0Gm	gQF6dYk-6jIob2ko4JcTEOJYEC3ouzIH	1536653542	\N	\N	127.0.0.1	1536653542	1536653542	0	1538571620
263	edo@nurulfikri.co.id	edo@nurulfikri.co.id	$2y$12$Y.9.GUIin/FCxd3C2FEry.sunH6xc0N1vmJkzspf6aWYdA68ZQlzS	xsXp2zWDSjVgyaLk2fQ21t7wh3xfsvgC	1539365861	\N	\N	127.0.0.1	1539365861	1542176938	0	1543396413
1	admin	adminpmb@nurulfikri.ac.id	$2y$12$5pHC7/Qqmf4FRFNgoKpSJue/GHe2d7tbY4PFqKA.uU/Jg31e65dnG	_ZHcdErJSgOaGp4M2hdhB7laVpfRfwPv	1444096721	\N	\N	127.0.0.1	1444019341	1461665979	0	1547694497
\.


--
-- Data for Name: user_peminjaman; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_peminjaman (id, username, id_role, status, password) FROM stdin;
2	admin	1	active	202cb962ac59075b964b07152d234b70
4	baak	2	active	202cb962ac59075b964b07152d234b70
9	kms	3	active	202cb962ac59075b964b07152d234b70
10	upt	4	active	202cb962ac59075b964b07152d234b70
\.


--
-- Name: fasilitas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fasilitas_id_seq', 2, true);


--
-- Name: hari_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hari_id_seq', 6, true);


--
-- Name: jamke_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jamke_id_seq', 14, true);


--
-- Name: jenis_prasarana_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jenis_prasarana_id_seq', 3, true);


--
-- Name: jenis_ruang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jenis_ruang_id_seq', 8, true);


--
-- Name: kategori_kampus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kategori_kampus_id_seq', 8, true);


--
-- Name: kelas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kelas_id_seq', 46, true);


--
-- Name: kelas_prodi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kelas_prodi_id_seq', 1, false);


--
-- Name: mahasiswa_mhsid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mahasiswa_mhsid_seq', 169, true);


--
-- Name: pegawai_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pegawai_id_seq', 59, true);


--
-- Name: peminjaman_ruang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.peminjaman_ruang_id_seq', 13, true);


--
-- Name: penilaian_kelas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.penilaian_kelas_id_seq', 11, true);


--
-- Name: prasarana_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prasarana_id_seq', 4, true);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 5, true);


--
-- Name: ruang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ruang_id_seq', 12, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 263, true);


--
-- Name: user_peminjaman_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_peminjaman_id_seq', 10, true);


--
-- Name: fasilitas fasilitas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fasilitas
    ADD CONSTRAINT fasilitas_pkey PRIMARY KEY (id);


--
-- Name: hari hari_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hari
    ADD CONSTRAINT hari_pkey PRIMARY KEY (id);


--
-- Name: jamke jamke_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jamke
    ADD CONSTRAINT jamke_pkey PRIMARY KEY (id);


--
-- Name: jenis_prasarana jenis_prasarana_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jenis_prasarana
    ADD CONSTRAINT jenis_prasarana_pkey PRIMARY KEY (id);


--
-- Name: jenis_ruang jenis_ruang_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jenis_ruang
    ADD CONSTRAINT jenis_ruang_pkey PRIMARY KEY (id);


--
-- Name: kategori_kampus kategori_kampus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategori_kampus
    ADD CONSTRAINT kategori_kampus_pkey PRIMARY KEY (id);


--
-- Name: kelas kelas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kelas
    ADD CONSTRAINT kelas_pkey PRIMARY KEY (id);


--
-- Name: kelas_prodi kelas_prodi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kelas_prodi
    ADD CONSTRAINT kelas_prodi_pkey PRIMARY KEY (id);


--
-- Name: mahasiswa mahasiswa_nim_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mahasiswa
    ADD CONSTRAINT mahasiswa_nim_key UNIQUE (nim);


--
-- Name: mahasiswa mahasiswa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mahasiswa
    ADD CONSTRAINT mahasiswa_pkey PRIMARY KEY (mhsid);


--
-- Name: pegawai pegawai_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pegawai
    ADD CONSTRAINT pegawai_pkey PRIMARY KEY (id);


--
-- Name: peminjaman_ruang peminjaman_ruang_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peminjaman_ruang
    ADD CONSTRAINT peminjaman_ruang_pk PRIMARY KEY (id);


--
-- Name: prasarana prasarana_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prasarana
    ADD CONSTRAINT prasarana_pkey PRIMARY KEY (id);


--
-- Name: profile profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (user_id);


--
-- Name: role role_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pk PRIMARY KEY (id);


--
-- Name: ruang ruang_kode_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruang
    ADD CONSTRAINT ruang_kode_key UNIQUE (kode);


--
-- Name: ruang ruang_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruang
    ADD CONSTRAINT ruang_pkey PRIMARY KEY (id);


--
-- Name: user_peminjaman user_peminjaman_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_peminjaman
    ADD CONSTRAINT user_peminjaman_pk PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user_unique_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX user_unique_email ON public."user" USING btree (email);


--
-- Name: user_unique_username; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX user_unique_username ON public."user" USING btree (username);


--
-- Name: profile fk_user_profile; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT fk_user_profile FOREIGN KEY (user_id) REFERENCES public."user"(id) ON UPDATE RESTRICT ON DELETE CASCADE;


--
-- Name: kelas kelas_jamke_akhir_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kelas
    ADD CONSTRAINT kelas_jamke_akhir_fkey FOREIGN KEY (jamke_akhir) REFERENCES public.jamke(id);


--
-- Name: kelas kelas_jamke_mulai_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kelas
    ADD CONSTRAINT kelas_jamke_mulai_fkey FOREIGN KEY (jamke_mulai) REFERENCES public.jamke(id);


--
-- Name: kelas_prodi kelas_prodi_kelas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kelas_prodi
    ADD CONSTRAINT kelas_prodi_kelas_id_fkey FOREIGN KEY (kelas_id) REFERENCES public.kelas(id);


--
-- Name: kelas kelas_ruang_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kelas
    ADD CONSTRAINT kelas_ruang_id_fkey FOREIGN KEY (ruang_id) REFERENCES public.ruang(id);


--
-- Name: mahasiswa mahasiswa_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mahasiswa
    ADD CONSTRAINT mahasiswa_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: peminjaman_ruang peminjaman_ruang_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peminjaman_ruang
    ADD CONSTRAINT peminjaman_ruang_fk FOREIGN KEY (jam_akhir) REFERENCES public.jamke(id);


--
-- Name: peminjaman_ruang peminjaman_ruang_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.peminjaman_ruang
    ADD CONSTRAINT peminjaman_ruang_fk_1 FOREIGN KEY (jam_akhir) REFERENCES public.jamke(id);


--
-- Name: prasarana prasarana_jenis_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prasarana
    ADD CONSTRAINT prasarana_jenis_id_fkey FOREIGN KEY (jenis_id) REFERENCES public.jenis_prasarana(id);


--
-- Name: ruang ruang_gedung_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruang
    ADD CONSTRAINT ruang_gedung_id_fkey FOREIGN KEY (gedung_id) REFERENCES public.prasarana(id);


--
-- Name: ruang ruang_jenis_ruang_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruang
    ADD CONSTRAINT ruang_jenis_ruang_id_fkey FOREIGN KEY (jenis_ruang_id) REFERENCES public.jenis_ruang(id);


--
-- Name: user_peminjaman user_peminjaman_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_peminjaman
    ADD CONSTRAINT user_peminjaman_fk FOREIGN KEY (id_role) REFERENCES public.role(id);


--
-- PostgreSQL database dump complete
--

