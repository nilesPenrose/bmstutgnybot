--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg22.04+1)
-- Dumped by pg_dump version 15.1 (Ubuntu 15.1-1.pgdg22.04+1)

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
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    chat_id bigint NOT NULL,
    username text,
    phone text,
    vk_page text,
    study_group text,
    birthday date,
    evening_event text,
    media text,
    confirm text,
    confirm_qr text
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (chat_id, username, phone, vk_page, study_group, birthday, evening_event, media, confirm, confirm_qr) FROM stdin;
772785461	Уразова Марина Алексеевна	+79601201930	https://vk.com/marinaurazova	СМ11-71Б	2002-05-22	Не знаю английского	🥲	\N	\N
715653793	Ольга Мещерякова	+79649983565	https://vk.com/omesheryakova	СМ5-11М	2001-03-20	Буду петь	Нет	\N	\N
672050233	Иван Голихин	+79252766197	vk.com/blupunkk	ЮР-53	2002-05-13	Клоуны	Нет	\N	\N
639233480	Борисова Анастасия Петровна	+79771491281	https://vk.com/n.borisova2020	СГН2-71Б	2000-10-27	Нет	Хорошо	\N	\N
392875761	Антон ТОха	+79678244577	_vk.com/_username__	ef	2001-01-15	-	-	yes	\N
274986220	Хехахцт  лцщзй сшщц	777777777777	Нет	Нет	2000-03-22	________	____]+.+_	yes	\N
630325386	Демьянов Максим Владимирович	+79026984129	https://vk.com/demyanovmv	РК4-51	2003-06-19	Нет	Нет	\N	\N
464120237	Коленченко Александр Алексеевич	+79043537274	vk.com/olexander4you	ИУ1-51Б	2003-03-31	да	🤡	\N	\N
180448532	Иванов Иван Иванович	+77777777777	vk.com/ssdfdsfsdghsdfdsaf	Уже умею	1333-05-13	конечно	хорошо	\N	\N
321484381	Аксенов Павел Сергеевич	+79191007217	_vk.com/id99602432_	ИБМ3-71Б	1998-02-01	+	-	\N	\N
510993111	Белов Кирилл Романович	89213079657	vk.com/dub.kirill	СМ13-51Б	2002-09-28	Танцую пою играю	Я материал	\N	\N
479020307	Литвина Екатерина Александровна	+79166794610	Нет	СГН2-72Б	2001-06-02	Не хочу	Нет	\N	\N
706980337	Не	+79779175264	vk.com/yakin246	Ак4-51	1830-07-02	Да	Ок	\N	\N
507699394	яшин андрей валерьевич	89859880385	https://vk.com/vkvk8	мт7-52	2002-06-11	неа	нет	yes	\N
501258826	Вакулина Ольга Игоревна	+78005553535	vk.com/o_vakulina	ИУ2-72	2001-07-01	Да	Нет	yes	\N
324920154	Пупи дупи да	+79993335555	https://vk.com/mar___1	РЛ4-99999А	2022-03-12	Я когда упаду сальтуху ебану	Сделаю	yes	\N
475373469	/	123213132221	vk.com/.	ЮМ1	0001-01-01	+	C:	\N	yes
\.


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (chat_id);


--
-- Name: TABLE clients; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.clients TO new_year;


--
-- PostgreSQL database dump complete
--

