--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12rc1

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
-- Name: ortalamamaas(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ortalamamaas() RETURNS real
    LANGUAGE plpgsql IMMUTABLE SECURITY DEFINER
    AS $$
DECLARE
    sonuc REAL;
BEGIN 
    sonuc := (SELECT AVG("asgariMaas") FROM "Departman");
    RETURN sonuc;
END;
$$;


ALTER FUNCTION public.ortalamamaas() OWNER TO postgres;

--
-- Name: tl2dollar(real); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.tl2dollar(lira real) RETURNS real
    LANGUAGE plpgsql
    AS $$ -- Fonksiyon govdesinin (tanımının) başlangıcı
BEGIN
    RETURN  lira / 7.30;
END;
$$;


ALTER FUNCTION public.tl2dollar(lira real) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: AcilanHesap; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."AcilanHesap" (
    "hesapNo" integer NOT NULL,
    "hesapTuruKodu" smallint NOT NULL,
    "musteriId" integer NOT NULL,
    "acilmaTarihi" date DEFAULT CURRENT_DATE,
    "icindekiPara" money,
    "personelId" integer NOT NULL
);


ALTER TABLE public."AcilanHesap" OWNER TO postgres;

--
-- Name: Banka; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Banka" (
    "bankaNo" integer NOT NULL,
    "bankaAdi" character varying(40) NOT NULL,
    telefon integer NOT NULL,
    "genelMudur" smallint NOT NULL
);


ALTER TABLE public."Banka" OWNER TO postgres;

--
-- Name: Banka_bankaNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Banka_bankaNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Banka_bankaNo_seq" OWNER TO postgres;

--
-- Name: Banka_bankaNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Banka_bankaNo_seq" OWNED BY public."Banka"."bankaNo";


--
-- Name: Departman; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Departman" (
    "departmanKodu" integer NOT NULL,
    "deparmantAdi" character varying(40),
    "asgariMaas" real
);


ALTER TABLE public."Departman" OWNER TO postgres;

--
-- Name: Departman_departmanKodu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Departman_departmanKodu_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Departman_departmanKodu_seq" OWNER TO postgres;

--
-- Name: Departman_departmanKodu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Departman_departmanKodu_seq" OWNED BY public."Departman"."departmanKodu";


--
-- Name: Hesap; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Hesap" (
    "hesapTuruKodu" integer NOT NULL,
    "hesapTuru" character varying(40) NOT NULL
);


ALTER TABLE public."Hesap" OWNER TO postgres;

--
-- Name: HesapParaTransferi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HesapParaTransferi" (
    "hesapNo" integer NOT NULL,
    "transferTuruKodu" smallint NOT NULL,
    "transferTarihi" date DEFAULT CURRENT_DATE,
    "personelId" integer NOT NULL,
    miktar real NOT NULL
);


ALTER TABLE public."HesapParaTransferi" OWNER TO postgres;

--
-- Name: Hesap_hesapTuruKodu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Hesap_hesapTuruKodu_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Hesap_hesapTuruKodu_seq" OWNER TO postgres;

--
-- Name: Hesap_hesapTuruKodu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Hesap_hesapTuruKodu_seq" OWNED BY public."Hesap"."hesapTuruKodu";


--
-- Name: HesapsizParaTransferi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HesapsizParaTransferi" (
    "musteriId" integer NOT NULL,
    "transferTuruKodu" smallint NOT NULL,
    "transferTarihi" date DEFAULT CURRENT_DATE,
    "personelId" integer NOT NULL,
    miktar real NOT NULL
);


ALTER TABLE public."HesapsizParaTransferi" OWNER TO postgres;

--
-- Name: Il; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Il" (
    "ilKodu" integer NOT NULL,
    "ilAdi" character varying NOT NULL
);


ALTER TABLE public."Il" OWNER TO postgres;

--
-- Name: Il_ilKodu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Il_ilKodu_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Il_ilKodu_seq" OWNER TO postgres;

--
-- Name: Il_ilKodu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Il_ilKodu_seq" OWNED BY public."Il"."ilKodu";


--
-- Name: Ilce; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ilce" (
    "ilceKodu" integer NOT NULL,
    "ilceAdi" character varying(40) NOT NULL,
    "ilKodu" smallint NOT NULL
);


ALTER TABLE public."Ilce" OWNER TO postgres;

--
-- Name: Ilce_ilceKodu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Ilce_ilceKodu_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Ilce_ilceKodu_seq" OWNER TO postgres;

--
-- Name: Ilce_ilceKodu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Ilce_ilceKodu_seq" OWNED BY public."Ilce"."ilceKodu";


--
-- Name: Iletisim; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Iletisim" (
    "iletisimId" integer NOT NULL,
    telefon integer NOT NULL,
    email character varying(320) NOT NULL,
    adres text,
    "ilceKodu" smallint NOT NULL,
    "kisiId" integer NOT NULL
);


ALTER TABLE public."Iletisim" OWNER TO postgres;

--
-- Name: Iletisim_iletisimId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Iletisim_iletisimId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Iletisim_iletisimId_seq" OWNER TO postgres;

--
-- Name: Iletisim_iletisimId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Iletisim_iletisimId_seq" OWNED BY public."Iletisim"."iletisimId";


--
-- Name: Kisi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Kisi" (
    "kisiId" integer NOT NULL,
    "tcNo" integer NOT NULL,
    adi character varying(40) NOT NULL,
    soyadi character varying(40) NOT NULL
);


ALTER TABLE public."Kisi" OWNER TO postgres;

--
-- Name: Kisi_kisiId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Kisi_kisiId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Kisi_kisiId_seq" OWNER TO postgres;

--
-- Name: Kisi_kisiId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Kisi_kisiId_seq" OWNED BY public."Kisi"."kisiId";


--
-- Name: Kredi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Kredi" (
    "krediNo" integer NOT NULL,
    "krediTuruKodu" smallint NOT NULL,
    tarih date DEFAULT CURRENT_DATE NOT NULL,
    taksit smallint NOT NULL,
    "musteriId" integer NOT NULL,
    "personelId" integer NOT NULL,
    miktar real NOT NULL,
    "odenecekMiktar" real NOT NULL,
    "odenenenMiktar" real NOT NULL
);


ALTER TABLE public."Kredi" OWNER TO postgres;

--
-- Name: KrediTuru; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."KrediTuru" (
    "krediTuruKodu" integer NOT NULL,
    "krediAdi" character varying(40) NOT NULL,
    "faizOrani" smallint NOT NULL,
    "maxMiktar" real NOT NULL,
    CONSTRAINT "krediTuruCheck" CHECK (("faizOrani" >= 5))
);


ALTER TABLE public."KrediTuru" OWNER TO postgres;

--
-- Name: KrediTuru_krediTuruKodu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."KrediTuru_krediTuruKodu_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."KrediTuru_krediTuruKodu_seq" OWNER TO postgres;

--
-- Name: KrediTuru_krediTuruKodu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."KrediTuru_krediTuruKodu_seq" OWNED BY public."KrediTuru"."krediTuruKodu";


--
-- Name: Musteri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Musteri" (
    "kisiId" integer NOT NULL,
    "bankMusterisiMi" boolean NOT NULL
);


ALTER TABLE public."Musteri" OWNER TO postgres;

--
-- Name: Personel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Personel" (
    "kisiId" integer NOT NULL,
    "girisTarihi" date DEFAULT CURRENT_DATE,
    "departmanKodu" smallint NOT NULL,
    "subeKodu" smallint NOT NULL,
    maas real NOT NULL
);


ALTER TABLE public."Personel" OWNER TO postgres;

--
-- Name: Sube; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Sube" (
    "subeKodu" integer NOT NULL,
    "subeAdi" character varying(40) NOT NULL,
    adres text NOT NULL,
    "ilceKodu" smallint NOT NULL,
    "bankaNo" smallint NOT NULL,
    mudur smallint
);


ALTER TABLE public."Sube" OWNER TO postgres;

--
-- Name: Sube_subeKodu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Sube_subeKodu_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Sube_subeKodu_seq" OWNER TO postgres;

--
-- Name: Sube_subeKodu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Sube_subeKodu_seq" OWNED BY public."Sube"."subeKodu";


--
-- Name: TransferTuru; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TransferTuru" (
    "transferTuruKodu" integer NOT NULL,
    "transferTuru" character varying(40) NOT NULL
);


ALTER TABLE public."TransferTuru" OWNER TO postgres;

--
-- Name: TransferTuru_transferTuruKodu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."TransferTuru_transferTuruKodu_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."TransferTuru_transferTuruKodu_seq" OWNER TO postgres;

--
-- Name: TransferTuru_transferTuruKodu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."TransferTuru_transferTuruKodu_seq" OWNED BY public."TransferTuru"."transferTuruKodu";


--
-- Name: Banka bankaNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Banka" ALTER COLUMN "bankaNo" SET DEFAULT nextval('public."Banka_bankaNo_seq"'::regclass);


--
-- Name: Departman departmanKodu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Departman" ALTER COLUMN "departmanKodu" SET DEFAULT nextval('public."Departman_departmanKodu_seq"'::regclass);


--
-- Name: Hesap hesapTuruKodu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Hesap" ALTER COLUMN "hesapTuruKodu" SET DEFAULT nextval('public."Hesap_hesapTuruKodu_seq"'::regclass);


--
-- Name: Il ilKodu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Il" ALTER COLUMN "ilKodu" SET DEFAULT nextval('public."Il_ilKodu_seq"'::regclass);


--
-- Name: Ilce ilceKodu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ilce" ALTER COLUMN "ilceKodu" SET DEFAULT nextval('public."Ilce_ilceKodu_seq"'::regclass);


--
-- Name: Iletisim iletisimId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Iletisim" ALTER COLUMN "iletisimId" SET DEFAULT nextval('public."Iletisim_iletisimId_seq"'::regclass);


--
-- Name: Kisi kisiId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kisi" ALTER COLUMN "kisiId" SET DEFAULT nextval('public."Kisi_kisiId_seq"'::regclass);


--
-- Name: KrediTuru krediTuruKodu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KrediTuru" ALTER COLUMN "krediTuruKodu" SET DEFAULT nextval('public."KrediTuru_krediTuruKodu_seq"'::regclass);


--
-- Name: Sube subeKodu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sube" ALTER COLUMN "subeKodu" SET DEFAULT nextval('public."Sube_subeKodu_seq"'::regclass);


--
-- Name: TransferTuru transferTuruKodu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TransferTuru" ALTER COLUMN "transferTuruKodu" SET DEFAULT nextval('public."TransferTuru_transferTuruKodu_seq"'::regclass);


--
-- Data for Name: AcilanHesap; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: Banka; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: Departman; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Departman" VALUES
	(1, 'Gişe Memuru', 2500),
	(3, 'Müdür', 7500),
	(4, 'Genel Müdür', 10000),
	(2, 'Müşteri Temsilcisi', 3500);


--
-- Data for Name: Hesap; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: HesapParaTransferi; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: HesapsizParaTransferi; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: Il; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Il" VALUES
	(1, 'Adana'),
	(2, 'Adıyaman'),
	(11, 'Afyon'),
	(12, 'Bingöl'),
	(13, 'Bitlis');


--
-- Data for Name: Ilce; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: Iletisim; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: Kisi; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: Kredi; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: KrediTuru; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: Musteri; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: Personel; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: Sube; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: TransferTuru; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: Banka_bankaNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Banka_bankaNo_seq"', 1, false);


--
-- Name: Departman_departmanKodu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Departman_departmanKodu_seq"', 4, true);


--
-- Name: Hesap_hesapTuruKodu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Hesap_hesapTuruKodu_seq"', 1, false);


--
-- Name: Il_ilKodu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Il_ilKodu_seq"', 13, true);


--
-- Name: Ilce_ilceKodu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Ilce_ilceKodu_seq"', 1, false);


--
-- Name: Iletisim_iletisimId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Iletisim_iletisimId_seq"', 1, false);


--
-- Name: Kisi_kisiId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Kisi_kisiId_seq"', 1, false);


--
-- Name: KrediTuru_krediTuruKodu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."KrediTuru_krediTuruKodu_seq"', 1, false);


--
-- Name: Sube_subeKodu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Sube_subeKodu_seq"', 1, false);


--
-- Name: TransferTuru_transferTuruKodu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."TransferTuru_transferTuruKodu_seq"', 1, false);


--
-- Name: Departman DepartmanPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Departman"
    ADD CONSTRAINT "DepartmanPK" PRIMARY KEY ("departmanKodu");


--
-- Name: Kredi KrediPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kredi"
    ADD CONSTRAINT "KrediPK" PRIMARY KEY ("krediNo");


--
-- Name: Personel PersonelPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Personel"
    ADD CONSTRAINT "PersonelPK" PRIMARY KEY ("kisiId");


--
-- Name: AcilanHesap acilanHesapPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AcilanHesap"
    ADD CONSTRAINT "acilanHesapPK" PRIMARY KEY ("hesapNo");


--
-- Name: Banka bankaPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Banka"
    ADD CONSTRAINT "bankaPK" PRIMARY KEY ("bankaNo");


--
-- Name: Banka bankaUnique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Banka"
    ADD CONSTRAINT "bankaUnique" UNIQUE ("genelMudur");


--
-- Name: Hesap hesapPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Hesap"
    ADD CONSTRAINT "hesapPK" PRIMARY KEY ("hesapTuruKodu");


--
-- Name: HesapParaTransferi hesapParaTransferiPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HesapParaTransferi"
    ADD CONSTRAINT "hesapParaTransferiPK" PRIMARY KEY ("hesapNo", "transferTuruKodu");


--
-- Name: HesapsizParaTransferi hesapsizParaTransferiPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HesapsizParaTransferi"
    ADD CONSTRAINT "hesapsizParaTransferiPK" PRIMARY KEY ("musteriId", "transferTuruKodu");


--
-- Name: Il ilPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Il"
    ADD CONSTRAINT "ilPK" PRIMARY KEY ("ilKodu");


--
-- Name: Il ilUnique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Il"
    ADD CONSTRAINT "ilUnique" UNIQUE ("ilAdi");


--
-- Name: Ilce ilcePK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ilce"
    ADD CONSTRAINT "ilcePK" PRIMARY KEY ("ilceKodu");


--
-- Name: Iletisim iletisimPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Iletisim"
    ADD CONSTRAINT "iletisimPK" PRIMARY KEY ("iletisimId");


--
-- Name: Iletisim iletisimUnique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Iletisim"
    ADD CONSTRAINT "iletisimUnique" UNIQUE (telefon, email, "kisiId");


--
-- Name: Kisi kisiPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kisi"
    ADD CONSTRAINT "kisiPK" PRIMARY KEY ("kisiId");


--
-- Name: Kisi kisiUnique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kisi"
    ADD CONSTRAINT "kisiUnique" UNIQUE ("tcNo");


--
-- Name: KrediTuru krediTuruPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KrediTuru"
    ADD CONSTRAINT "krediTuruPK" PRIMARY KEY ("krediTuruKodu");


--
-- Name: KrediTuru krediTuruUnique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."KrediTuru"
    ADD CONSTRAINT "krediTuruUnique" UNIQUE ("krediAdi");


--
-- Name: Musteri musteriPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Musteri"
    ADD CONSTRAINT "musteriPK" PRIMARY KEY ("kisiId");


--
-- Name: Sube subePK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sube"
    ADD CONSTRAINT "subePK" PRIMARY KEY ("subeKodu");


--
-- Name: Sube subeUnique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sube"
    ADD CONSTRAINT "subeUnique" UNIQUE ("subeAdi", mudur);


--
-- Name: TransferTuru transferTuruPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TransferTuru"
    ADD CONSTRAINT "transferTuruPK" PRIMARY KEY ("transferTuruKodu");


--
-- Name: TransferTuru transferTuruUnique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TransferTuru"
    ADD CONSTRAINT "transferTuruUnique" UNIQUE ("transferTuru");


--
-- Name: HesapParaTransferi HesapliHNoFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HesapParaTransferi"
    ADD CONSTRAINT "HesapliHNoFK" FOREIGN KEY ("hesapNo") REFERENCES public."AcilanHesap"("hesapNo");


--
-- Name: HesapParaTransferi HesapliPersonelFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HesapParaTransferi"
    ADD CONSTRAINT "HesapliPersonelFK" FOREIGN KEY ("personelId") REFERENCES public."Personel"("kisiId");


--
-- Name: HesapParaTransferi HesapliTransferFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HesapParaTransferi"
    ADD CONSTRAINT "HesapliTransferFK" FOREIGN KEY ("transferTuruKodu") REFERENCES public."TransferTuru"("transferTuruKodu");


--
-- Name: HesapsizParaTransferi HesapsizMusteriFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HesapsizParaTransferi"
    ADD CONSTRAINT "HesapsizMusteriFK" FOREIGN KEY ("musteriId") REFERENCES public."Musteri"("kisiId");


--
-- Name: HesapsizParaTransferi HesapsizPersonelFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HesapsizParaTransferi"
    ADD CONSTRAINT "HesapsizPersonelFK" FOREIGN KEY ("personelId") REFERENCES public."Personel"("kisiId");


--
-- Name: HesapsizParaTransferi HesapsizTransferTuruFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HesapsizParaTransferi"
    ADD CONSTRAINT "HesapsizTransferTuruFK" FOREIGN KEY ("transferTuruKodu") REFERENCES public."TransferTuru"("transferTuruKodu");


--
-- Name: Ilce IlceFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ilce"
    ADD CONSTRAINT "IlceFK" FOREIGN KEY ("ilKodu") REFERENCES public."Il"("ilKodu");


--
-- Name: Sube SubeBankaFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sube"
    ADD CONSTRAINT "SubeBankaFK" FOREIGN KEY ("bankaNo") REFERENCES public."Banka"("bankaNo");


--
-- Name: Sube SubeIlceFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sube"
    ADD CONSTRAINT "SubeIlceFK" FOREIGN KEY ("ilceKodu") REFERENCES public."Ilce"("ilceKodu");


--
-- Name: Sube SubePersonelFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Sube"
    ADD CONSTRAINT "SubePersonelFK" FOREIGN KEY (mudur) REFERENCES public."Personel"("kisiId");


--
-- Name: AcilanHesap ahHesapTuruFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AcilanHesap"
    ADD CONSTRAINT "ahHesapTuruFK" FOREIGN KEY ("hesapTuruKodu") REFERENCES public."Hesap"("hesapTuruKodu");


--
-- Name: AcilanHesap ahMusteriFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AcilanHesap"
    ADD CONSTRAINT "ahMusteriFK" FOREIGN KEY ("musteriId") REFERENCES public."Musteri"("kisiId");


--
-- Name: AcilanHesap ahPersonelFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."AcilanHesap"
    ADD CONSTRAINT "ahPersonelFK" FOREIGN KEY ("personelId") REFERENCES public."Personel"("kisiId");


--
-- Name: Banka bankaFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Banka"
    ADD CONSTRAINT "bankaFK" FOREIGN KEY ("genelMudur") REFERENCES public."Personel"("kisiId");


--
-- Name: Iletisim iletisimIlceFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Iletisim"
    ADD CONSTRAINT "iletisimIlceFK" FOREIGN KEY ("ilceKodu") REFERENCES public."Ilce"("ilceKodu");


--
-- Name: Iletisim iletisimKisiFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Iletisim"
    ADD CONSTRAINT "iletisimKisiFK" FOREIGN KEY ("kisiId") REFERENCES public."Kisi"("kisiId") ON DELETE RESTRICT;


--
-- Name: Kredi krediMusteriFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kredi"
    ADD CONSTRAINT "krediMusteriFK" FOREIGN KEY ("musteriId") REFERENCES public."Musteri"("kisiId");


--
-- Name: Kredi krediPersonelFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kredi"
    ADD CONSTRAINT "krediPersonelFK" FOREIGN KEY ("personelId") REFERENCES public."Personel"("kisiId");


--
-- Name: Kredi krediTuruFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Kredi"
    ADD CONSTRAINT "krediTuruFK" FOREIGN KEY ("krediTuruKodu") REFERENCES public."KrediTuru"("krediTuruKodu");


--
-- Name: Musteri musteriFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Musteri"
    ADD CONSTRAINT "musteriFK" FOREIGN KEY ("kisiId") REFERENCES public."Kisi"("kisiId") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Personel personelDepartmanFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Personel"
    ADD CONSTRAINT "personelDepartmanFK" FOREIGN KEY ("departmanKodu") REFERENCES public."Departman"("departmanKodu");


--
-- Name: Personel personelFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Personel"
    ADD CONSTRAINT "personelFK" FOREIGN KEY ("kisiId") REFERENCES public."Kisi"("kisiId") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Personel personelSubeFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Personel"
    ADD CONSTRAINT "personelSubeFK" FOREIGN KEY ("subeKodu") REFERENCES public."Sube"("subeKodu");


--
-- PostgreSQL database dump complete
--

