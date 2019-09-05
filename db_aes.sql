--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

-- Started on 2019-09-05 16:20:18

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

SET default_with_oids = false;

--
-- TOC entry 206 (class 1259 OID 16476)
-- Name: tb_analisis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_analisis (
    id bigint NOT NULL,
    banding_id bigint NOT NULL,
    jml_benar bigint NOT NULL,
    jml_salah bigint NOT NULL,
    hasil text NOT NULL
);


ALTER TABLE public.tb_analisis OWNER TO postgres;

--
-- TOC entry 2882 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE tb_analisis; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tb_analisis IS 'menyimpan hasil analisis';


--
-- TOC entry 205 (class 1259 OID 16468)
-- Name: tb_banding; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_banding (
    id bigint NOT NULL,
    topic text NOT NULL,
    label1 text NOT NULL,
    hasil bytea NOT NULL,
    soal_id bigint NOT NULL,
    lda_id bigint NOT NULL
);


ALTER TABLE public.tb_banding OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16428)
-- Name: tb_corpus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_corpus (
    id bigint NOT NULL,
    kata text NOT NULL,
    kata_lain text NOT NULL
);


ALTER TABLE public.tb_corpus OWNER TO postgres;

--
-- TOC entry 2883 (class 0 OID 0)
-- Dependencies: 200
-- Name: TABLE tb_corpus; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tb_corpus IS 'digunakan untuk menyimpan corpus';


--
-- TOC entry 199 (class 1259 OID 16420)
-- Name: tb_correction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_correction (
    id bigint NOT NULL,
    kata_awal text NOT NULL,
    kata_akhir text NOT NULL
);


ALTER TABLE public.tb_correction OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16444)
-- Name: tb_doc_finish; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_doc_finish (
    id bigint NOT NULL,
    doc json NOT NULL,
    soal_id bigint NOT NULL,
    stemming_id bigint NOT NULL
);


ALTER TABLE public.tb_doc_finish OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16436)
-- Name: tb_lda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_lda (
    id bigint NOT NULL,
    doc1 json NOT NULL,
    doc2 json NOT NULL,
    topic json NOT NULL,
    corpus_id bigint NOT NULL
);


ALTER TABLE public.tb_lda OWNER TO postgres;

--
-- TOC entry 2884 (class 0 OID 0)
-- Dependencies: 201
-- Name: TABLE tb_lda; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tb_lda IS 'menyimpan proses lda
';


--
-- TOC entry 197 (class 1259 OID 16404)
-- Name: tb_response; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_response (
    id bigint NOT NULL,
    response text NOT NULL,
    soal_id bigint NOT NULL,
    label1 text NOT NULL
);


ALTER TABLE public.tb_response OWNER TO postgres;

--
-- TOC entry 2885 (class 0 OID 0)
-- Dependencies: 197
-- Name: TABLE tb_response; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tb_response IS 'untuk menyimpan semua data jawaban';


--
-- TOC entry 196 (class 1259 OID 16396)
-- Name: tb_soal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_soal (
    id bigint NOT NULL,
    stimulus text NOT NULL,
    pertanyaan text NOT NULL,
    label_1 text NOT NULL,
    label_0 text NOT NULL
);


ALTER TABLE public.tb_soal OWNER TO postgres;

--
-- TOC entry 2886 (class 0 OID 0)
-- Dependencies: 196
-- Name: TABLE tb_soal; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tb_soal IS 'tabel untuk menyimpan soal-soal essay';


--
-- TOC entry 203 (class 1259 OID 16452)
-- Name: tb_stemming; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_stemming (
    id bigint NOT NULL,
    kata json NOT NULL,
    kata_dasar jsonb NOT NULL,
    term_id bigint NOT NULL
);


ALTER TABLE public.tb_stemming OWNER TO postgres;

--
-- TOC entry 2887 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE tb_stemming; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tb_stemming IS 'untuk menyimpan data stemming';


--
-- TOC entry 204 (class 1259 OID 16460)
-- Name: tb_term; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_term (
    id bigint NOT NULL,
    doc json NOT NULL,
    kata jsonb NOT NULL,
    term jsonb NOT NULL,
    correction_id bigint NOT NULL
);


ALTER TABLE public.tb_term OWNER TO postgres;

--
-- TOC entry 2888 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE tb_term; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tb_term IS 'menyimpan term';


--
-- TOC entry 198 (class 1259 OID 16412)
-- Name: tb_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tb_token (
    id bigint NOT NULL,
    kalimat_awal tsvector NOT NULL,
    kalimat_akhir tsvector NOT NULL,
    respon_id bigint
);


ALTER TABLE public.tb_token OWNER TO postgres;

--
-- TOC entry 2755 (class 2606 OID 16483)
-- Name: tb_analisis analisis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_analisis
    ADD CONSTRAINT analisis_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 16475)
-- Name: tb_banding tb_banding_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_banding
    ADD CONSTRAINT tb_banding_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 16435)
-- Name: tb_corpus tb_corpus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_corpus
    ADD CONSTRAINT tb_corpus_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 16427)
-- Name: tb_correction tb_correction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_correction
    ADD CONSTRAINT tb_correction_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 16451)
-- Name: tb_doc_finish tb_doc_finish_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_doc_finish
    ADD CONSTRAINT tb_doc_finish_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 16443)
-- Name: tb_lda tb_lda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_lda
    ADD CONSTRAINT tb_lda_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 16411)
-- Name: tb_response tb_response_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_response
    ADD CONSTRAINT tb_response_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 16403)
-- Name: tb_soal tb_soal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_soal
    ADD CONSTRAINT tb_soal_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 16459)
-- Name: tb_stemming tb_stemming_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_stemming
    ADD CONSTRAINT tb_stemming_pkey PRIMARY KEY (id);


--
-- TOC entry 2751 (class 2606 OID 16467)
-- Name: tb_term tb_term_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_term
    ADD CONSTRAINT tb_term_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 16419)
-- Name: tb_token token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tb_token
    ADD CONSTRAINT token_pkey PRIMARY KEY (id);


-- Completed on 2019-09-05 16:20:19

--
-- PostgreSQL database dump complete
--

