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
1286241900	Мельников Василий Дмитриевич	+79061756606	vk.com/bmelnikow	РК9-13Б	2005-02-01	Нет	Нет	\N	\N
1641721595	Соснин Марк Дмитриевич	+79223303959	vk.com/mini_potatick	РК9-13Б	2004-10-03	нет	нет	\N	\N
1082376287	Никитин Григорий Владимирович	+79166603237	vk.com/markussot	Л4-12Б	2005-03-17	нет	нет	\N	\N
1240284409	Карпович Александра Евгеньевна	+79854800173	vk.com/a.monakko	ИБМ4-12Б	2004-05-04	Нет	-	\N	\N
1014304392	Евсеева Юлия Александровна	+79670650455	vk.com/evsula	ИБМ2-32Б	2003-06-24	Нет	Нет	\N	\N
854482082	Вичирко Анастасия Сергеевна	+79098041804	vk.com/anastasia_vichirko	ИБМ4-12Б	2004-05-18	-	-	\N	\N
894811808	Еремян Руслан Артемович	+79881806200	vk.com/adrianpox	ФН4-31Б	2003-02-07	Нет	Нет	\N	\N
752465608	Баталичева Алиса Андреевна	+79017133477	https://vk.com/yng_lisa	ИБМ7-13Б	2004-05-31	Думаю, нет	-	\N	\N
971092358	Либерова Олеся Георгиевна	+79252764727	vk.com/_iamlassy	ПС2-11	2004-08-15	Да	Ок	\N	\N
882251416	Серышева Дарья Сергеевна	+79162375125	vk.com/ne_pridumal_nic	ИУ7-14Б	2004-07-25	Нет	👌	\N	\N
834157282	Фёдор Васильевич Новиков	+79645609994	vk.com/keevony	ФН2-11Б	2005-01-27	Не уверен	-	\N	\N
5035220104	Сафарова Николь Теймуровна	+79296047634	https://vk.com/id356023108	ПС2-11	2005-03-23	Да	Нет	\N	\N
967052485	Окутин Денис Алексеевич	+79022774215	https://vk.com/d.okutin	ИУ9-31Б	2003-09-19	Нет	Нет	\N	\N
816970020	Козлова Александра Романовна	+79013551534	vk.com/saasshaya	ИБМ6-14Б	2004-01-25	не знаю	-	\N	\N
1234983110	Козуб Екатерина Тарасовна	+79209901620	https://vk.com/ekaterinakozub	МТ3-53	2002-06-26	Речь про выступления_	Нет	\N	\N
700635558	Щербаков Даниил Александрович	+79164373931	https://vk.com/pp.piks	ИБМ2-12Б	2004-03-11	Не знаю	Нет	\N	\N
694473877	Еремин Иван Иванович	+79777038843	https://vk.com/untoff	ТМО-71	2003-07-24	Да	Нет	\N	\N
649854141	Исмаилов Адиль Назимович	+79999126118	vk.com/adilesley	ИУ9-12Б	2004-08-16	не знаю пока что	ок	\N	\N
505480293	Рогова Анна Андреевна	+79267384453	https://vk.com/rogovskayaan	МТ2-52	2003-01-15	Нет	Нет	\N	\N
864185083	Крылов Никита Сергееви	+79269335093	vk.com/id_polden	РК6-34Б	2003-10-30	Нет	-	\N	\N
1083487013	Корьевщикова Ксения Максимовна	+79648374974	vk.com/bobriha_ks	ИУ3-12б	2004-05-07	Да	Хорошо	\N	\N
1233420671	Вавилова Варвара Леонидовна	+79859088465	vk.com/id669539336	ИУ7-14Б	2004-08-26	Нет	Нет	\N	\N
805913940	Макеева Анастасия Сергеевна	+79771174186	https://vk.com/studentrkt	РКТ1-111	1999-11-09	Нет	Нет	\N	\N
437125909	Полубехина Анастасия Александровна	89250584058	https://vk.com/anastasiapolubehina	Ибм4-51б	2003-01-07	Нет	Нет	\N	\N
1647356828	Лебедев Ярослав Алексеевич	89370425274	vk.com/jaro.lebedev	ИУ4-11Б	2004-05-06	Нет	Нет	\N	\N
1259684778	Мирохина Дарья Максимовна	+79161586113	vk.com/id382707022	ИБМ6-34Б	2003-10-15	Нет	-	\N	\N
801669360	Конечно❄️	+79859292481	https://vk.com/rizhskayadd	МТ3-53	2002-04-30	Нет	Нет	\N	\N
929451791	Листов Александр Владимирович	+79175551817	https://vk.com/agentbonjovi	ИУ5-15Б	2004-06-23	Нет	Нет	\N	\N
906684372	Николаев Александр Алексеевич	+79775129649	vk.com/id136625872	СМ1-111	1997-07-24	Мона	Чигиряу пау пау	\N	\N
1021476857	Конечно❄️	+79251303260	vk.com/zakhar_zakharov2001	ФН11-73Б	2001-09-13	Нет	Нет	\N	\N
1076614283	Редкокашина Кристина Павловна	+79066769526	vk.com/krisredk	ИБМ3-11Б	2004-06-01	нет	-	\N	\N
716615282	Угаров Руслан Денисович	+79818557454	vk.com/irusy13	ИУ6-35Б	2003-10-02	-	-	\N	\N
1321774443	Рапота Мария Владимировна	+79029652557	vk.com/marella_1	ИУ9–11Б	2004-07-15	Нет	-	\N	\N
456803139	Петросян Артемий Робертович	+79258474708	vk.com/arpetrosian	ИБМ6-14Б	2001-10-14	Нет	Нет	\N	\N
706749173	Жиленков Илья Сергеевич	+79207122717	vk.com/zh_ilya	ИУ3-31Б	2003-08-05	Нет	Нет	\N	\N
863959890	Гапеева Олеся Ради	+79252000494	http://vk.com/ol.gapeeva	ИУ5-31Б	2003-10-29	Нет	Нет	\N	\N
961363062	Вопияшин Никита Ильич	+79013892330	vk.com/kittenxuwu	ИУ5-15Б	2005-01-04	Нет	Нет	\N	\N
935354086	Комаров Сергей Игоревич	+79222917407	vk.com/seryozhka_k	ИБМ5-33Б	2003-09-30	Нет	Нет	\N	\N
1084441896	Кустова Мария Игоревна	+79192529277	vk.com/mashkust	СМ1-111	1999-02-14	Нет	Нет	\N	\N
451322324	Аракелян Георгий Гарунович	+79680575704	https://vk.com/sherif_volk	ИУ4-32Б	2003-12-19	хочу	пока не знаю, поэтому ничо не дам	\N	\N
1496180766	Кириленко Ульяна Олеговна	+79162524304	vk.com/ki_uli	ИУ9-11Б	2004-02-02	Нет	Нет	\N	\N
1722478159	Бухарская Варвара Алексеевна	+79616123690	https://vk.com/waitingonyourphonecall	ИБМ4-12Б	2005-01-14	нет	нет	\N	\N
677874374	Кузнецов Егор Олегович	+79777954564	vk.com/fugmabalz	ИУ5-12Б	2004-08-08	Нет	Ок	yes	\N
1345661775	Донских Егор Андреевич	+79164553809	vk.com/stonegor	ИУ5-12Б	2004-08-17	Нет	Нет	yes	\N
1148516789	Кричфалуши Андрей Владимирович	+79680241494	vk.com/ahhaahahahah	ИБМ7-11Б	2005-03-01	Нет	Нет	yes	\N
5439904976	Бурак Эмилия Васильевна	+79013594629	vk.com/emides	ФН2-11Б	2005-09-28	не уверена	-	yes	\N
1062673371	Самохвалова Екатерина Алексеевна	+79245043323	http://vk.com/katya_samohvalova	БМТ1-11Б	2004-06-04	-	-	yes	\N
1155499940	Андреев Сергей Александрович	+79132762148	vk.com/andreev_sergeq	vk.com/andreev_sergeq	2002-11-10	К1-51Б	Нет	yes	\N
427894906	Фасхутдинов Азамат Рафисович	+79603922584	https://vk.com/azamatikbest	ИУ6-35Б	2004-02-01	да	-	\N	\N
860409660	Абрамов Андрей Вячеславович	+79651152469	https://vk.com/andrtop4ik	МТ7-31	2004-03-24	нет	ок	\N	\N
1851404250	Постникова Елизавета Игоревна	89167733575	vk.com/id337753922	ИУ4-11Б	2004-05-07	Нет	Нет	\N	\N
735244230	Кутильгереев Шахим Арсланович	+79996005076	https://vk.com/mathion	ИБМ5-33Б	2003-06-03	Смотря какой тип творчества	Хорошо	\N	\N
1257405520	Павленко Полина Сергеевна	+79628685534	vk.com/polyyyyyy	Э8-32Б	2003-04-17	Скорее всего да	-	\N	\N
1280048983	Леонтьева Александра Сергеевна	+79080665965	https://vk.com/nanimo_nanim0	ИБМ7-11Б	2004-08-22	да	хорошо	\N	\N
667566350	Старжевский Тимофей Евгеньевич	+79624440631	vk.com/ad_vokat	ИУ6-31Б	2003-09-21	-	Нет	\N	\N
467041559	Агафонова Валерия Николаевна	+79625066388	https://vk.com/lergrezz	Юр-32	2004-05-07	-	-	\N	\N
381049926	Новикова Екатерина Евгеньевна	+79671435371	vk.com/plushan	Э5-51	2002-11-04	Нет	Нет	\N	\N
452291050	Погиба Иван Олегович	+79994652789	vk.com/prooooogiba	ИУ6-34Б	2003-01-07	нет	-	\N	\N
180780663	Мелашенко Татьяна Евгеньевна	+79055073268	vk.com/tanyamelashenko	ИУ2-73	2001-01-25	Да	Нет	\N	\N
838785389	Саганова Сэсэгма Жамсоевна	+79834317200	https://vk.com/sseseg	ФН11-12Б	2005-12-13	Да	Нет	\N	\N
955496668	Кислова Анжелика Эдуардовна	89151716394	https://vk.com/lika.kislova	ИБМ1-12Б	2004-11-28	-	-	\N	\N
473593833	Пономаренко Анастасия Сергеевна	+79275500037	vk.com/speedy2288	ФН2-11Б	2002-01-04	Нет	🫡	\N	\N
970493103	Пермякова Дарья Николаевна	+79773386990	https://vk.com/dar__ya99	СМ13-32М	1999-05-15	Нет	Нет	\N	\N
1110970753	Анцупов Иван Сергеевич	89151603908	https://vk.com/antsupov2015	РКТ2-31	2003-04-12	Да	Нет	\N	\N
713189305	Адонин Андрей Андреевич	+79615202970	https://vk.com/a.adonin	РК5-11Б	2004-07-05	Да	Нет	\N	\N
691662321	Петухов Егор Денисович	+79646272714	https://vk.com/pacan4ikmolodoy	РК6-32Б	2003-03-09	нет	материалы не нужны	\N	\N
389873779	Никулина Анна Игоревна	+79609097540	vk.com/anchous_01	ФН2-11Б	2001-04-08	Нет	Хорошо	\N	\N
897364457	Степанов Роман Андреевич	+79854542553	https://vk.com/romkastepanov07	ИУ10-35	2003-12-07	Нет	Не нужно	\N	\N
544856579	Панова Полина Евгеньевна	+79299612670	https://vk.com/polinqq	Мт5-11	2004-08-27	-	-	\N	\N
715308887	Удовиченко Максим Артемович	+79147866105	vk.com/udovichenko_m	ФН11-32Б	2003-10-12	Да	Пока не могу сказать точно, что исполнять	\N	\N
827505116	Дмитриев Александр Алексеевич	+79031893151	https://vk.com/reveur_oublie	К4-33Б	2003-09-08	Конечно_	Нет	\N	\N
799745797	Журавлев Евгений Павлович	+79771742529	https://vk.com/poeshgovna1	РК6-32Б	2003-08-15	По ситуации	-	\N	\N
642353874	Тихомирова Анастасия Андреевна	+79997301807	vk.com/tkhmrv.aaaia	БМТ1-11Б	2004-07-18	Нет	-	\N	\N
293146770	Саиди Сина	+79777864217	vk.com/id708803708	МТ11И-12Б	2002-02-26	Да	-	\N	\N
447438681	Кирпа Данила Дмитриевич	+79990822806	https://vk.com/danilaa_03	РКТ2-31	2003-06-28	-	-	\N	\N
1498046290	Зайцева Людмила Дмитриевна	+79169761478	vk.com/l_zo0	ФН4-12Б	2003-05-02	Да	Нет	\N	\N
842183552	Катана Никита Романович	+79013314366	https://vk.com/hhhved	ИУ10-35	2003-10-10	нет	нет	\N	\N
721994607	Байда Анна Павловна	+79623690772	https://vk.com/baidaaa	СГН2-71Б	2001-09-25	нет	нет	\N	\N
654373595	Храменков Александр Владимирович	+79532092394	vk.com/alexsander_khramenkoff	ИУ3-13Б	2004-09-24	-	-	\N	\N
733287056	Таранов Валентин Денисович	+79644479948	vk.com/rams1723	ПС4-51	2001-01-17	Нет	Нет	\N	\N
126033708	Белов Александр Андреевич	+79179137835	https://vk.com/sanyablyatblin	ИУ8-12	2004-02-26	Нет	Нет	\N	\N
870757102	Анисимова Наталья Романовна	+79161844125	https://vk.com/nnataalii	ПС4-32	2003-09-20	да	ок	\N	\N
870710498	Павлова Тамара Евгеньевна	+79060424569	vk.com/laverkey	СГН2-71Б	2001-12-24	нет	нет	\N	\N
1184164609	Анисимова Ольвия Владимировна	+79689973929	vk.com/a_olvia	АК2-52	2001-08-27	Подумаю	Хорошо	\N	\N
329382895	Власов Дмитрий Алексеевич	+79036270507	нет	ФН2-72Б	2001-10-30	Если костюмы, то да	нет	\N	\N
664872678	Самойленко Николай Валерьевич	+79083222011	https://vk.com/id494395197	СМ12-11	2004-08-03	Нет	Нету	\N	\N
1798990001	Агауров Егор Сергеевич	+79645038484	vk.com/agaurov	СМ12-11	2004-07-27	Нет	Ок	\N	\N
5207007692	Година Светлана Владимировна	89886773063	vk.com/broken0813	Э9-34м	1999-11-08	Да	Пока не требуется	\N	\N
416098339	Столярова Анастасия Алексеевна	+79203215687	vk.com/kirayukimi	ЮР-51	2002-01-31	Нет	Нет	yes	\N
1017602482	Ершова Анастасия Сергеевна	+79063641487	vk.com/ersena	ИБМ7-11Б	2003-04-21	да	-	yes	\N
381428672	Гарипова Эмилия Радиковна	+79046676776	vk.com/baebaemon	Э9-31Б	2003-11-18	нет	нет	yes	\N
374851209	Заренкова Татьяна Сергеевна	+79858856264	vk.com/t.zarenkova	Э4-12Б	2004-11-26	Да	Нет	no	\N
462684837	Фрелих Максим Александрович	+79297867949	vk.com/frelikhmax	ИУ3-31Б	2003-11-06	-	-	yes	\N
576510216	Габелкина Валерия Алексеевна	+79531907538	vk.com/vale.ron.chill	РТ1-51	2002-07-28	Нет	Нет	yes	\N
757198500	Павлов Даниил Александрович	+79775977618	https://vk.com/nevermorererere	ЛТ9-11Б	2004-08-18	-	-	yes	\N
951379953	Головин Павел Андреевич	89017791805	https://vk.com/lal.luby	См1-111	1999-10-01	Да	Не	\N	\N
61591756	Ризаев Камал Эльдорович	+79850397766	https://vk.com/rizaev_kamal	СМ1-11Б	2004-07-09	Выступать мне не с чем, но посмотрел бы выступления других с удовольствием	-	\N	\N
982558609	Шестиперова Анжелика Андреевна	89530018590	vk.com/id219568753	ЮР-11	2004-03-15	Нет	Хорошо	\N	\N
459117691	Волков Александр Юрьевич	+79259068548	vk.com/idpipidon13	К3-13Б	2004-08-04	Нет	Нет	\N	\N
1173198322	Егорова Полина Руслановна	+79175851837	https://vk.com/id320332850	ФН4-11Б	2004-04-28	Нет	Не нужно, спасибо)	\N	\N
693742325	Борчашвили Тимур Джемалович	+79232599913	vk.com/manchesterrrrr	СГН2-72Б	2001-09-27	Нет	Нет	\N	\N
889093865	Вечканова Анна Дмитриевна	+79038254981	https://vk.com/abellkaa	Э4-71	2001-05-30	Да	Возьму флешку	\N	\N
764140784	Урянский Иван Александрович	+79155397556	vk.com/hiddencellardoor	РКТ2-31	2004-01-29	-	-	\N	\N
876041209	Будрина Полина Васильевна	+79661983323	https://vk.com/firstwwer	vk.com/firstwwer	2004-05-28	-	-	\N	\N
457024352	Глотова Марина Евгеньевна	89807329520	vk.com/marinaglotovaaa	ИУ2-52	2003-06-14	Нет	Нет	\N	\N
1694353902	Золотых Виктор Викторович	+79032411694	https://vk.com/victortopor	ИБМ5-33Б	2003-02-11	Нет	Нет	\N	\N
1546992859	Середа Павел Николаевич	+79969656054	vk.com/06r345n	РКТ2-31	2003-08-23	❌	❌	\N	\N
948918667	Марухина Анастасия Викторовна	+79850874291	https://vk.com/amarukhinaa	ЛТ9-71Б	2000-12-03	Нет	Нет	\N	\N
1782164229	Миневич Эрик Дмитриевич	+79100872288	https://vk.com/erichkrause_dlya_vas	ФН11-12Б	2005-01-05	Да	Упс)	\N	\N
923035892	Щетинина Дарья Сергеевна	+79002546783	vk.com/id.dashochka	ИУ3-12Б	2004-12-21	да	оки	\N	\N
518866305	Додонов Максим Михайлович	+79057119795	https://vk.com/id131981720	ИУ8-31М	2000-04-07	Нет	Нет	\N	\N
76712144	Панчехин Никита Игоревич	+79150512108	https://vk.com/fake75	ИУ8-31М	2000-02-20	Да	-	\N	\N
973002344	Вылуск Варвара Павловна	+79281488358	vk.com/luvlilpeep	МТ1-11Б	2004-12-14	да_	ок	\N	\N
1358972674	Пинаева Мария Витальевна	+79139081581	https://vk.com/pinaeva.maria	ЮР-11	2004-01-16	Нет	Нет	\N	\N
1081590829	Протасов Никита Игоревич	+79115843536	https://vk.com/1n1ksan1	МТ1-11Б	2004-12-08	да	ок	\N	\N
1092169368	Баркалова Ирина Владимировна	+79688213182	vk.com/badgirl_oh	ИУ5-73Б	2001-06-14	Да	Нет	\N	\N
254288081	Нгуен Александра Нгиевна	+79299319199	https://vk.com/alyangu	ИУ4-71Б	1999-10-01	Нет	Нет	\N	\N
1029675569	Калашников Артур	+79252752004	vk.com/illmaestrolli	МТ1-11Б	2004-01-04	Нет	Нет	\N	\N
909451257	Мазур Екатерина Алексеевна	+79823315920	http://vk.com/ekaterinamzr	ИУ7-76Б	2002-01-21	Нет	Ок	\N	\N
806294868	Сушилина Александра Николаевна	+79850579471	https://vk.com/flexandra	ИУ3-12Б	2004-04-10	Да	Нет	\N	\N
1084811773	Щепина София Денисовна	+79152264388	vk.com/schepasofi	К3-14Б	2003-12-25	Нет	Нет	\N	\N
280431440	Желтова Александра Алексеевна	+79651864734	https://vk.com/idbluedragon	ИУ5-14М	2001-03-14	Нет	Нет	\N	\N
328513908	Борисов Максим Андреевич	+79162499343	vk.com/maksimborisovv	ИУ7-76Б	2001-11-12	Нет	Нет	\N	\N
1018965117	Рудьков Артём Дмитриевич	+79151471535	vk.com/dmitreach	ИУ10-15	2004-08-05	Нет	Нет	\N	\N
696782765	Минин Вячеслав Максимович	+79232893116	https://vk.com/id184696702	ФН2-72Б	2002-04-21	Нет	Нет	\N	\N
1790994309	Миннегулов Данил Нафисович	+79874115954	vk.com/d.minnegulov	К3-11Б	2004-11-06	нет	нет	\N	\N
1117816063	Самойлов Савва Игоревич	+79191026825	https://vk.com/hdwiqipqpqpaxnxjowpqpqls	СГН2-72Б	2002-01-29	нет	ок	\N	\N
782058090	Лыжин Роман Денисович	+79090206479	vk.com/lyzh1n_r	ИУ6-35Б	2004-10-26	Нет	-	\N	\N
688165900	Быстрицкая Маргарита Семеновна	+79055010649	vk.com/id210309104	ИБМ6-71Б	1999-08-27	Нет	Не хочу выступать	\N	\N
508893221	Евстифеев Дмитрий Антонович	+79774575820	https://vk.com/runkas	РК6-32Б	2003-10-07	нет	нет	\N	\N
1180404828	Пучкова Екатерина Александровна	89148837394	https://vk.com/patya_kuchkova	ИУ6-11Б	2004-01-01	Нет	-	\N	\N
992385735	Идрисов Дмитрий Русланович	+79199625404	http://vk.com/potatomaniac	ИУ5-15Б	2004-12-27	нет	-	\N	\N
353947778	Гообенко Анастасия Владимировна	+79853192111	https://vk.com/anasg7	ИУ8-31М	1999-07-05	Нет	Нет	yes	\N
1979694463	Бабаян Владимир Феликсович	+79269144200	vk.com/id263364024	РК6-74Б	1999-03-07	Нет	Не нужны	yes	\N
5062054992	Семенов Павел Любомирович	+79667775933	https://vk.com/pavsemen	ЛТ4-31Б	2003-12-27	С радостью	доп. медиаматериалы не нужны	yes	\N
1957044674	Таганова Яна	+79629065115	vk.com/yanataganova	ФН4-12Б	2004-07-01	Нет	Нет	yes	\N
2046815429	Добров Евгений Алексеевич	+79936963868	https://vk.com/edobrov4	К3-34Б	2004-03-27	да, конечно	хорошо	yes	\N
688711520	Мирсков Максим Сергеевич	89954030204	vk.com/ogydfgqr	ЛТ4-31Б	2003-05-20	нет	нет	yes	\N
843358431	Боднарук Евгения Руслановна	+79957554100	https://vk.com/bodrueva	СГН2-71Б	2000-01-06	Нет	Нет	no	\N
450472525	Евдокимова Анастасия Андреевна	+79162684914	vk.com/epkoliptik	ИУ10-15	2003-07-31	Смотря что надо будет делать, но скорее всего да	.	yes	\N
1132373497	Гадалина Ангелина Андреевна	+79879608453	http://vk.com/geli0s	ИУ6-11Б	2005-02-24	+	-	yes	\N
482022211	Трофимов Сергей Андреевич	89165303382	нет	СМ3-11	2004-07-18	Нет	Нет	\N	\N
1589978264	Штенцов Никита Максимович	+79687363366	vk.com/perovvl	БМТ1-12Б	2005-04-03	Нет	❌	\N	\N
508351962	Уфимцев Кирилл Константинович	+79022723860	http://vk.com/id159811118	ЛТ8-32Б	2001-02-19	Да	-	\N	\N
696259571	Бирлидис Даниил Михайлович	+79266777491	https://vk.com/birlidis	ИБМ4-12Б	2005-02-07	да	нет	\N	\N
850275777	Мустафин Айрат Тимурович	+79196013618	https://vk.com/mustafin_airat	См3-11	2004-06-02	Нет	-	\N	\N
310554288	Конюхов Николай Олегович	+79099080841	https://vk.com/konyuhof	Лт2-51б	2001-12-19	Нет	Нет	\N	\N
442234537	Костиков Константин Олегович	+79152862356	https://vk.com/c9llm3bones	ИУ9-12Б	2004-03-14	да	https://drive.google.com/drive/folders/1KihWSZqkgwYKPK8zJMdXIdXytzqe1yaK_usp=sharing	\N	\N
806280498	Жембровский Владислав Антонович	89251543660	https://vk.com/vzhembr	РК6-32Б	2003-09-24	Да	Нет	\N	\N
999180114	Бочанов Максим Сергеевич	+79253782014	vk.com/blackplaydota	СГН2-71Б	2001-07-27	нет	Нет	\N	\N
955110881	Дегтярева Анна Александровна	89299273068	https://vk.com/deda__scher	СГН2-71Б	2001-10-11	Нет	Ок	\N	\N
273478772	Пантыкин Александр	+79154873087	https://vk.com/alehandro_ros	Э2-31М	1998-08-22	нет	ок	\N	\N
739922062	Ураксин Айнур Юлдашевич	+79871410237	https://vk.com/xx_hydra_xx	СМ2-11	2022-09-12	У меня нет творчества	-	\N	\N
513711570	Губаев Арсений Айратович	+79874033665	vk.com/sokolofff_arsen	СМ2-11	2004-05-02	Нет	Нет	\N	\N
620223642	Рыженков Александр Владимирович	+79107837585	vk.com/zeitn0ted	СМ2-11	2004-08-02	-	-	\N	\N
958204158	Камакин Григорий Максимович	+79111338447	https://vk.com/mstr_grishka	См2-11	2005-01-02	Нет	Нет	\N	\N
5196742665	Борисов Сергей Викторович	+79885668921	https://vk.com/sergey_12321	СМ2-11	2004-06-30	Нет	Нет	\N	\N
1015562103	Царёв Иван Андреевич	+79107681854	https://vk.com/ivitsatsa	К3-14Б	2004-03-09	Да	-	\N	\N
800843338	Витринский Валентин Геннадьевич	89852952650	https://vk.com/kiborganakonda	ИУ5Ц-31Б	2003-07-17	Да	Нет не нужно	\N	\N
741535314	Антипов Даниил Артёмович	+79999948572	https://vk.com/my_comrade	Э4-13б	2004-08-25	Да	Мне нужна только гитара	\N	\N
928655708	Габдулхаков Амир Айдарович	+89660814529	vk.com/amir167	РТ5-31	2003-07-23	Хочу.	Пока нет)(	\N	\N
801884969	Колбина Лада Валерьевна	89671066924	vk.com/id613301908	БМТ1-13Б	2005-02-25	-	-	\N	\N
1509173015	Яковлев Андрей Александрович	+79254431466	https://vk.com/andronit	СМ10-12	2004-06-07	Нет	Нет	\N	\N
750597226	Кочергина Виктория Владимировна	89093931111	Нет	ЮР-11	2004-05-02	Да	Нет	\N	\N
1174361128	Игорев Игорь Игоревич	+79992221100	нет	ИУ1-11Б	1999-01-01	Нет	Нет	\N	\N
903064821	Гогинов Георгий Владимирович	+79284963778	https://vk.com/i_would_kill_you_all	К3-13Б	2005-01-08	Незнаю	Нет	\N	\N
942804341	Стеблевская Оксана Станиславовна	+79176302242	https://vk.com/steblesk	ЛТ6-11Б	2003-12-01	Возможно	-	\N	\N
1011436409	Осипенко Анастасия александровна	+79010585244	https://vk.com/osi.penka	ИУ1-12Б	2005-01-15	нет	нет	\N	\N
641009197	Ленчин Роман Витальевич	+79260736362	vk.com/oldhevy	ИУ3-12Б	2004-05-25	Нет	Нет	\N	\N
692862433	Баженов Владимир Дмитриевич	+79771893136	vk.com/vladimirpidor	ИУ3-12Б	2004-08-07	нет	нет	\N	\N
841383402	Лебедева Виктория Ивановна	+79653615218	https://vk.com/krafliana	ЛТ7-11Б	2003-12-08	Нет	Нет	\N	\N
2032165872	Сафонов Максим Юрьевич	+79013566169	https://m.vk.com/max_bmstu	СМ6-12	2004-12-18	Ничего не умею(	Нет	\N	\N
1513613977	Шубочкина Софья Олеговна	+89859952475	‘vk.com/_sonyshu_’	ИБМ1-51Б	2002-01-17	Нет	Нет	\N	\N
387754891	Гаврилова Лада Андреевна	+79150187757	https://vk.com/lada.gavrilova	ИБМ1-51Б	2002-07-09	нет	-	\N	\N
462871900	Косян Карен Давидович	+79777768368	vk.com/kar99	ИБМ6-31М	1999-03-17	Нет	+	\N	\N
636795372	Давыдова Наталья Михайловна	+79266511234	http://vk.com/davydova1n	ИУ3-12Б	2003-03-03	Нет	Нет	\N	\N
1793696852	Сороколетова Ирина Александровна	+79773855614	vk.com/s.unshineoe	К3-11Б	2004-11-24	Нет	Не нужно	\N	\N
2075860734	Асташевский Михаил Станиславович	+79048979275	vk.com/specret	ЛТ4-32М	1999-01-08	нет	-	\N	\N
1686296761	Асташевская Алина Александровна	+79620849408	vk.com/lina_burich	ЛТ4-32М	1999-10-31	Нет	-	\N	\N
1903455117	Туна мете Халиль	+79653018778	https://vk.com/id632098592	ИУ7И-12Б	2001-01-11	Да	Окей	\N	\N
333128240	Ковалев Егор Евгеньевич	+79024810952	vk.com/yegorkovalev	РЛ2-72Б	2002-03-18	конечно	хорошо	\N	\N
2009938159	Чурюмов Роман Евгеньевич	+79093992199	https://vk.com/id207189328	МТ1-31Б	2003-08-08	Нет	Нету	\N	\N
636597353	Марченко Даниил Евгеньевич	+79175812788	vk.com/b_a_b_a__k_a_p_a	СГН2-71Б	2001-07-24	Нет	Ок	\N	\N
266668006	Яровицин Иван Сергеевич	+79258913103	нет	ИУ1-11Б	2003-11-08	нет	что	\N	\N
984245221	Аникина Арина Алексеевна	79124687710	https://vk.com/arclmr	СМ9-11	2004-10-27	-	-	\N	\N
1020772636	Василенко Алёна Олеговна	+79608360497	https://vk.com/allya_vasilenko	ЮР-31	2003-09-21	Нет	Ок	\N	\N
493012943	Щетинцев Владислав Алексеевич	79775124271	https://vk.com/vladoo0oos	ЮР-31	2003-02-28	неа	нету	\N	\N
630878103	Сосин Иван Денисович	+79917540269	https://m.vk.com/ch1lll_hero	СГН2-11Б	2004-04-11	Нет	.	\N	\N
1838056582	Пискунова Елизавета	+79017401277	Нет	БМТ2-71Б	2001-05-11	Может быть	Нет	yes	\N
1109845936	Мануйлова Надежда Михайловна	89165103793	https://vk.com/id238609434	РЛ1-13	2004-02-28	Нет	Нет	\N	\N
5906470784	Улыбин Леонид Вадимович	+79672630616	https://vk.com/id252182879	Э4-31Б	2003-12-10	нет	нет	\N	\N
392875761	павленко антон александрович	89678244577	vk.com/quasinp	РК6-75Б	2001-01-15	нет	нет	\N	yes
1365993198	Полякова Виктория Игоревна	+79605857955	vk.com/ccmmbbrr	ИУ2-54	2002-04-25	Нет	Нет	\N	\N
1052690617	Семушкин Алексей Викторович	+79017495904	Нет	ИСОТ2-13А	1998-02-13	Да, хочу, могу спеть песню	Достаточно гитары. Могу спеть Люмен - Гореть	\N	\N
723670459	Хижняк Светлана Витальевна	+79538142823	https://vk.com/id119913823	СМ11-31Б	2002-06-04	Нет	-	\N	\N
554194199	Степанова Юлия Сергеевна	+79688119218	https://vk.com/julisst	ПС2-11	2004-08-20	Нет	Не буду принимать участия	yes	\N
730591678	Пиджаков Константин Евгеньевич	89122487059	https://vk.com/ti_ne_punk	АК1-12	2004-05-11	Да	Нет	yes	\N
689193239	Гурбанова Ангелина Сабировна	+79266126515	https://vk.com/angel.gurr	ИБМ6-34Б	2003-03-03	Нет	Нет	yes	\N
953316405	Клиновенко Виктория Витальевна	+79858734315	https://vk.com/salmon_simon	ЮР-73	2001-06-16	Нет, буду внимательным созерцателем)	-	yes	\N
392280728	Чкареули Иракли Бесикович	89258285419	https://vk.com/mood_on_16	МТ6-71Б	2000-10-28	Нет	Нету	yes	\N
897452398	Тяпкин Сергей Сергееви	+79160932860	vk.com/tyapkin_s	РК6-72Б	2002-09-09	нет	нет	\N	\N
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

