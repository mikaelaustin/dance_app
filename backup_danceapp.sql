--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Dancers; Type: TABLE; Schema: public; Owner: mikaelaustin
--

CREATE TABLE "Dancers" (
    id integer NOT NULL,
    dancer character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);


ALTER TABLE "Dancers" OWNER TO mikaelaustin;

--
-- Name: Dancers_id_seq; Type: SEQUENCE; Schema: public; Owner: mikaelaustin
--

CREATE SEQUENCE "Dancers_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Dancers_id_seq" OWNER TO mikaelaustin;

--
-- Name: Dancers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikaelaustin
--

ALTER SEQUENCE "Dancers_id_seq" OWNED BY "Dancers".id;


--
-- Name: Masterlists; Type: TABLE; Schema: public; Owner: mikaelaustin
--

CREATE TABLE "Masterlists" (
    id integer NOT NULL,
    "time" time without time zone,
    song character varying(255),
    studio character varying(255),
    dancers text,
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);


ALTER TABLE "Masterlists" OWNER TO mikaelaustin;

--
-- Name: Masterlists_id_seq; Type: SEQUENCE; Schema: public; Owner: mikaelaustin
--

CREATE SEQUENCE "Masterlists_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Masterlists_id_seq" OWNER TO mikaelaustin;

--
-- Name: Masterlists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikaelaustin
--

ALTER SEQUENCE "Masterlists_id_seq" OWNED BY "Masterlists".id;


--
-- Name: Sessions; Type: TABLE; Schema: public; Owner: mikaelaustin
--

CREATE TABLE "Sessions" (
    sid character varying(32) NOT NULL,
    expires timestamp with time zone,
    data text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE "Sessions" OWNER TO mikaelaustin;

--
-- Name: Users; Type: TABLE; Schema: public; Owner: mikaelaustin
--

CREATE TABLE "Users" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(10) NOT NULL,
    username character varying(255),
    salt character varying(255),
    password_hash character varying(255) NOT NULL,
    location character varying(255) NOT NULL,
    studio character varying(255),
    dancers text[],
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE "Users" OWNER TO mikaelaustin;

--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: mikaelaustin
--

CREATE SEQUENCE "Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Users_id_seq" OWNER TO mikaelaustin;

--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mikaelaustin
--

ALTER SEQUENCE "Users_id_seq" OWNED BY "Users".id;


--
-- Name: Dancers id; Type: DEFAULT; Schema: public; Owner: mikaelaustin
--

ALTER TABLE ONLY "Dancers" ALTER COLUMN id SET DEFAULT nextval('"Dancers_id_seq"'::regclass);


--
-- Name: Masterlists id; Type: DEFAULT; Schema: public; Owner: mikaelaustin
--

ALTER TABLE ONLY "Masterlists" ALTER COLUMN id SET DEFAULT nextval('"Masterlists_id_seq"'::regclass);


--
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: mikaelaustin
--

ALTER TABLE ONLY "Users" ALTER COLUMN id SET DEFAULT nextval('"Users_id_seq"'::regclass);


--
-- Data for Name: Dancers; Type: TABLE DATA; Schema: public; Owner: mikaelaustin
--

COPY "Dancers" (id, dancer, "createdAt", "updatedAt") FROM stdin;
1	Kelsey Austin	\N	\N
2	Emily Trinkler	\N	\N
3	Shauntle Barley	\N	\N
4	Alana Harris	\N	\N
5	Dana Greene	\N	\N
6	Olivia Wittels	\N	\N
7	Nicole Park	\N	\N
8	Laura Ardila	\N	\N
9	Monica Kuroki	\N	\N
10	Cayley Schafer	\N	\N
11	Alison Nathanson	\N	\N
12	Rachel Price	\N	\N
13	Jasmine Bensky	\N	\N
14	Dana Krause	\N	\N
15	Rachel Chinman	\N	\N
16	Lindsay Altman	\N	\N
17	Elyse Leff	\N	\N
18	Lexi Werner	\N	\N
19	Brittany Rose	\N	\N
20	Jill Gittleman	\N	\N
21	Max Gold	\N	\N
22	Michael Buzin	\N	\N
23	Daniel DeChiara	\N	\N
24	CJ Fears	\N	\N
25	Audry Otey  	\N	\N
26	Whitney White	\N	\N
27	Emerson Lohman 	\N	\N
28	Alli Gottwalt	\N	\N
29	Jake Freed	\N	\N
30	Tristan Lowe	\N	\N
31	Alberto Wexler 	\N	\N
32	Chandler Bolog	\N	\N
33	Alexa Gambuti	\N	\N
34	Josie Brito	\N	\N
35	Julie Kaufman	\N	\N
36	August Garriott  	\N	\N
37	Leon Prado 	\N	\N
38	Angla Blythe  	\N	\N
39	Violet North  	\N	\N
40	Leia Stilts	\N	\N
41	Lili Pomerleau 	\N	\N
42	Joni Riley  	\N	\N
43	Jonnie Clink 	\N	\N
44	Jill Gittleman	\N	\N
45	Dana Greene	\N	\N
46	Cayley Schafer	\N	\N
47	Andy Diep	\N	\N
48	Stephania Gean  	\N	\N
49	Alix Sadowski	\N	\N
50	Gillian DeRario	\N	\N
51	Rebecca Mass	\N	\N
52	Tess Ortiz	\N	\N
53	Grace Carcamo	\N	\N
54	Anastasia Patten	\N	\N
55	Ella McAllister	\N	\N
56	Sammie Hayes	\N	\N
57	Shane Carrol	\N	\N
58	Freddie Black	\N	\N
59	Cindie Morgan	\N	\N
60	Mitchell Dubay  	\N	\N
61	Carolin Creswell	\N	\N
62	Seth Hisey	\N	\N
63	Nicole Boulton	\N	\N
64	Anne Gottwalt	\N	\N
65	Andy Prado	\N	\N
66	Misty Copeland	\N	\N
67	Katie Boren	\N	\N
68	Evelin Twine	\N	\N
69	Clifton Danielsen	\N	\N
70	Mikael Austin	\N	\N
71	Savanna Heavner	\N	\N
72	Yuriko Sanborn	\N	\N
73	Joey Herman	\N	\N
74	Anna Knox	\N	\N
75	Shaun Reiss	\N	\N
76	Romeo Aviles	\N	\N
77	Rea Wiron	\N	\N
78	Jalisa Ruppe	\N	\N
79	Andrew Kleeman	\N	\N
80	Vivian Flax	\N	\N
81	Phoebe Cho	\N	\N
82	Bobbie Richier	\N	\N
83	Laila Hadfield 	\N	\N
84	Josh Blank	\N	\N
85	Nina Long	\N	\N
86	Selena Wright	\N	\N
87	Jasper Harrington	\N	\N
88	Jamie Voss 	\N	\N
89	Mercedes Ruiz	\N	\N
90	Chrystal Lotell	\N	\N
91	Bobbie Ryder	\N	\N
92	Reiko Lutz	\N	\N
93	Jessi Mayer	\N	\N
94	Michele Pinder	\N	\N
95	Anthone Newport	\N	\N
96	Iliana Rower	\N	\N
97	Janine Babbot	\N	\N
98	Keith Langer	\N	\N
99	Gemma Storner	\N	\N
100	Natashia Botson	\N	\N
101	Mckenzie Odell	\N	\N
102	Leora Whorley	\N	\N
103	Grant Roberts	\N	\N
104	Anna Hughes	\N	\N
105	Brett Riley	\N	\N
106	Kennedy Hughes	\N	\N
107	Jason Langston	\N	\N
108	Valentina Hernandez	\N	\N
109	Quentin Pak	\N	\N
110	Michaela Grayson	\N	\N
111	Nora Lavery	\N	\N
112	Nadine Chacott	\N	\N
113	Caroline Wess	\N	\N
114	Valerie Jacobs	\N	\N
115	Lilly Chang	\N	\N
116	Kelly Sheehan	\N	\N
117	Jess Bloom	\N	\N
118	Kelly Wood	\N	\N
119	Jamie Bell	\N	\N
120	Jenna Voyer	\N	\N
121	Deirdre Shaw	\N	\N
122	Kayla Wolfson	\N	\N
123	Fake Kulek	\N	\N
124	Harah Locke 	\N	\N
125	Matt Herald	\N	\N
126	Jenna Matthews	\N	\N
127	Stacey Keeney	\N	\N
128	Dale Evans	\N	\N
129	Claire Edwards	\N	\N
130	Skylar Gurken	\N	\N
131	Cleo Shawman	\N	\N
132	Maya Gold 	\N	\N
133	Jessica Lang	\N	\N
134	Brooke Emerson	\N	\N
135	Maxwell Greany	\N	\N
136	Will Wright	\N	\N
137	Graham Westwood	\N	\N
138	Jason Hestin	\N	\N
139	Vince Grayson	\N	\N
140	Kim Johannes	\N	\N
141	Hannah Storie	\N	\N
142	Claudia Shiffon	\N	\N
143	Casey Blake	\N	\N
144	Dara Wheaton	\N	\N
145	Cobie Dolman	\N	\N
146	Spencer Stevens	\N	\N
147	Avery Loh	\N	\N
148	Ava Buford	\N	\N
149	Reid Pascarelli	\N	\N
150	Gabrielle Lewis	\N	\N
151	Dakota Boden	\N	\N
152	Gina Capson	\N	\N
153	Amanda Drake	\N	\N
154	Dana Sander	\N	\N
155	Lauren Golden	\N	\N
156	Paige Cashmir	\N	\N
157	Evan Babson	\N	\N
158	Wilson Brown	\N	\N
159	Zoe Stevenson	\N	\N
160	Giana DeFara	\N	\N
161	Paige Samuels	\N	\N
162	Alana Shaw	\N	\N
163	Stewerd Leland	\N	\N
164	Bruttany Burnett	\N	\N
165	Violet Smith	\N	\N
166	Courtney Jones	\N	\N
167	Danielle Koon	\N	\N
168	Hayley Quinn	\N	\N
169	Bradley Farr	\N	\N
170	Frank Lowe	\N	\N
171	Sarah Woodland	\N	\N
172	Hannah Livingston	\N	\N
173	Leni Gale	\N	\N
174	Rachel DeMayo	\N	\N
175	Ashley Booler	\N	\N
176	Clare Edwards	\N	\N
177	Hara Williams	\N	\N
178	Brent Bloom	\N	\N
179	Andy Smith	\N	\N
180	Cara Smith	\N	\N
181	Mellissa Pozo	\N	\N
182	Carmen Yang	\N	\N
183	Drew Falb	\N	\N
184	Christine Long	\N	\N
185	Peyton Faherty	\N	\N
186	Faye Parnes	\N	\N
187	Tara Reinhold	\N	\N
188	Vivienne Jenkins	\N	\N
189	Dana Radding	\N	\N
190	Tanner Seitz	\N	\N
191	Reed Flaherty	\N	\N
192	Travis Paulson	\N	\N
193	Joseph Westwood	\N	\N
194	Cameron Shankman	\N	\N
195	Dan Coulis	\N	\N
196	Thomas Harding	\N	\N
197	Allie Jameson	\N	\N
198	Kelly Gearheart	\N	\N
199	Kara Burglass	\N	\N
200	Rob Rolston	\N	\N
201	Mario DeMayo	\N	\N
202	Simone White	\N	\N
203	Jamie Hatter	\N	\N
204	Brady Borum	\N	\N
205	Ella McGowen	\N	\N
206	Melisa Paskall	\N	\N
207	Leanne Murphy	\N	\N
208	Bryan Clemson	\N	\N
209	Blake Appleson	\N	\N
210	Rose Trenton	\N	\N
211	Valerie Jones	\N	\N
212	Colby Woodleigh	\N	\N
213	Hayden Freeman	\N	\N
214	Paul Wilson	\N	\N
215	Anna Tilsbury	\N	\N
216	Greg Meyers	\N	\N
217	Samantha Shedler	\N	\N
218	Fern Greyer	\N	\N
219	Max Farr	\N	\N
220	Nadia Whitely	\N	\N
221	Paris Atlas	\N	\N
222	Aria Benson	\N	\N
223	Stella Hurley	\N	\N
224	Chase Milone	\N	\N
225	Camille Soto	\N	\N
226	Sofia Solas	\N	\N
227	Kara Rolston	\N	\N
228	Zoe Royce	\N	\N
229	Jennie Cho	\N	\N
230	Claire Shrader	\N	\N
231	Chris Simmons	\N	\N
232	Brokke Farrow	\N	\N
233	Rachel Cottman	\N	\N
234	Madison Brown	\N	\N
235	Alexandra Ballinger	\N	\N
236	Brittany Reiss	\N	\N
237	Weston Prince	\N	\N
238	Terri Valter	\N	\N
239	Sam Hayes	\N	\N
240	Jaye Setter	\N	\N
241	Quinn Long	\N	\N
242	Alton Denson	\N	\N
243	Maddie Gilbert	\N	\N
244	Danielle Goodall	\N	\N
245	Paige Covell	\N	\N
246	Tucker Mehr	\N	\N
247	Lucas Atlas	\N	\N
248	Brendan Folkes	\N	\N
249	Harley Kipp	\N	\N
250	Logal Bogle	\N	\N
251	Lindsay Pierson	\N	\N
252	Sam Stetson	\N	\N
253	Liam Zenz	\N	\N
254	Chloe Cho	\N	\N
255	Gayle Woolston	\N	\N
256	Zoe Hawke	\N	\N
257	Jade Silver	\N	\N
258	Bryce Gordon	\N	\N
259	Alexis Wilkerson	\N	\N
260	Hunter Sheen	\N	\N
261	Brittany Gramm	\N	\N
262	Maple McGraw	\N	\N
263	Courtney Cleary	\N	\N
264	Casey Fontaine	\N	\N
265	Jessi Fernandez	\N	\N
266	Marie Wagner	\N	\N
267	Jess Moulder	\N	\N
268	Hallie Westwick	\N	\N
269	Marley Fox	\N	\N
270	Ciara Sumner	\N	\N
271	Jennier Clear	\N	\N
272	Shelby Preyer	\N	\N
273	Jane Willis	\N	\N
274	Sumiko Senger	\N	\N
275	Lara Ganey	\N	\N
276	Skyler Zinn	\N	\N
277	Laura Phillips	\N	\N
278	Micaela Dwight	\N	\N
279	Ryan Sawyer	\N	\N
280	Blair Barnett	\N	\N
281	Tina Plotnik	\N	\N
282	Alfonso Badilla	\N	\N
283	Eliana Ebeling	\N	\N
284	Jordan Law	\N	\N
285	Paige Wilson	\N	\N
286	Chloe White	\N	\N
287	Dylan Badley	\N	\N
288	Tristan Dean	\N	\N
289	Michelle Ramirez	\N	\N
290	Lara Cheng	\N	\N
291	Julian Garrison	\N	\N
292	Casey Fagan	\N	\N
293	Erin Kessel	\N	\N
294	Sara Ross	\N	\N
295	Anna Garmon	\N	\N
296	Rachel Patridge	\N	\N
297	Paige Harlow	\N	\N
298	Haley Lindberg	\N	\N
299	Claire Ferrara	\N	\N
300	Brittany Churchill	\N	\N
301	Nora Kantor	\N	\N
302	Ella Browning	\N	\N
303	Talia Highland	\N	\N
304	Kendall Evans	\N	\N
305	Lauren Edwards	\N	\N
306	Valerie Grant	\N	\N
307	Sandra Wright	\N	\N
308	Jackie Shank	\N	\N
309	Billy Dunn	\N	\N
310	Maggie Wilson	\N	\N
311	Lara Higgins	\N	\N
312	Garret Jones	\N	\N
313	Jillian Quigley	\N	\N
314	Rachel Fryer	\N	\N
315	Dylan Coots	\N	\N
316	Brad Waters	\N	\N
317	Blake Gansit	\N	\N
318	Chloe Shiffrin	\N	\N
319	Trent Gurock	\N	\N
320	Benjamin White	\N	\N
321	Troy Gibbons	\N	\N
322	Clark Kimbler	\N	\N
323	Tyrell Prescott	\N	\N
324	Elliott Riske	\N	\N
325	Jared Denberg	\N	\N
326	Jonathan Halbert	\N	\N
327	Thomas Jarvie	\N	\N
328	Yuko Cummings	\N	\N
329	Joanna Steller	\N	\N
330	Damien Munez	\N	\N
331	Maggie Leopold	\N	\N
332	Bella Erling	\N	\N
333	Jackie Flynn	\N	\N
334	Enzo Armeni	\N	\N
335	Lilly Cade	\N	\N
336	Eva Lear	\N	\N
337	Mariela Rubia	\N	\N
338	Nicole Angle	\N	\N
339	Shana Shreet	\N	\N
340	Annie Loh	\N	\N
341	Lauren Rhymes	\N	\N
342	Elena Kropf	\N	\N
343	Paige Brown	\N	\N
344	Maya Oney	\N	\N
345	Amanda Orelia	\N	\N
346	Chelsea Simmons	\N	\N
347	Dylan Black	\N	\N
348	Samantha Hartwell	\N	\N
349	Mason Griffin	\N	\N
350	Blake Griffin	\N	\N
351	Kenton Loch	\N	\N
352	Brad Atkins	\N	\N
353	Joseph Benett	\N	\N
354	Vince Hudgens	\N	\N
355	Michael Moller	\N	\N
356	Greg Fink	\N	\N
357	Billy Greenwell	\N	\N
358	Liam Jenson	\N	\N
359	Bryan Smith	\N	\N
360	Eddie Walker	\N	\N
361	Brittany Bell	\N	\N
362	Bari Frankel	\N	\N
363	Jessa Sharp	\N	\N
364	Mia Martinez	\N	\N
365	Jade Summers	\N	\N
366	Bryce Fox	\N	\N
367	Jason Dalara	\N	\N
368	Nina Seiber	\N	\N
369	Harley Lockett	\N	\N
370	Michael Fink	\N	\N
371	Abby Kettner	\N	\N
372	Sara Elswick	\N	\N
373	Jordan Tippler	\N	\N
374	Eliana Chappel	\N	\N
375	Blair Black	\N	\N
376	Ashley Agosta	\N	\N
377	Hannah Frank	\N	\N
378	Danielle Plott	\N	\N
379	Chelsea Gramm	\N	\N
380	Alex Winston	\N	\N
381	Violetta Lee	\N	\N
382	Jess Tilling	\N	\N
383	Stephanie Gomez	\N	\N
384	Roberto Lopez	\N	\N
385	Hannah Jenson	\N	\N
386	Gina Klein	\N	\N
387	Zoe Pratt	\N	\N
388	Emerson Lohman 	\N	\N
389	Nick Fontine	\N	\N
390	Kurtis Lang	\N	\N
391	Grant Ross	\N	\N
392	Bobby Alan	\N	\N
393	Weston Harding	\N	\N
394	Michael Witts	\N	\N
395	Frank Simmons	\N	\N
396	Alex Peck	\N	\N
397	Charlotte Kimball	\N	\N
398	Kendall Meyer	\N	\N
399	Alexa Lopez	\N	\N
400	Casey Fenton	\N	\N
401	Jenna Black	\N	\N
402	Louis Palmer	\N	\N
403	Gemma Anderson	\N	\N
404	Jason Denning	\N	\N
405	Will Gomez	\N	\N
406	Sam Wolling	\N	\N
407	Bryan Lyle	\N	\N
408	Oliver Bing	\N	\N
409	Weston Ballard	\N	\N
410	Dave Castiglia	\N	\N
411	Kyle Stroupe	\N	\N
412	Corey Zieger	\N	\N
413	Kevin Holcombe	\N	\N
414	Curtis Capps	\N	\N
415	Joey Levron	\N	\N
416	Elizabeth Denly	\N	\N
417	Cooper James	\N	\N
418	Chase Wright	\N	\N
419	Mason Green	\N	\N
420	Allison Renson	\N	\N
421	Lauren Shaw	\N	\N
422	Wendy Lopezz	\N	\N
423	Katie Jones	\N	\N
424	Liana Cho	\N	\N
425	Ryan Shelling	\N	\N
426	Andrew Williams	\N	\N
427	Quinn Larson	\N	\N
428	James Jones	\N	\N
429	Blair Koch	\N	\N
430	Leigh Ginsberg	\N	\N
431	Liz Brown	\N	\N
432	Allie Evans	\N	\N
433	Maddie Covell	\N	\N
434	Catrina Camilo	\N	\N
435	Jana Halley	\N	\N
436	Skye Hayes	\N	\N
437	Blake Herrin	\N	\N
438	Mandy Paulson	\N	\N
439	Claire McFadden	\N	\N
440	Logan Ericson	\N	\N
441	Ellie Shuster	\N	\N
442	Samantha Fowler	\N	\N
443	Leigh Dougherty	\N	\N
444	William Jacobs	\N	\N
445	Pam Traps	\N	\N
446	Felix Otterson	\N	\N
447	Olivia Parker	\N	\N
448	Carmen Potter	\N	\N
449	Rachel Waters	\N	\N
450	Camille Beller	\N	\N
451	Marie Roberts	\N	\N
452	Rebecca Yoo	\N	\N
453	Jenna Spade	\N	\N
454	Brett Garnett	\N	\N
455	Winnie Grayson	\N	\N
456	Maddie Odell	\N	\N
457	Winnie Thoreaux	\N	\N
458	James Danzig	\N	\N
459	Brenton Gaines	\N	\N
460	Dani Chang	\N	\N
461	Mia Freeman	\N	\N
462	Leanne Danes	\N	\N
463	Phill Langston	\N	\N
464	Jessie Williams	\N	\N
465	Alison Weltz	\N	\N
466	Yadeira Koonis	\N	\N
467	Angela Lowry	\N	\N
468	Amber Vince	\N	\N
469	Jessia Allens	\N	\N
470	Alison Renson	\N	\N
471	Grant James	\N	\N
472	Taylor Law	\N	\N
473	Jessica Wallace	\N	\N
474	Arielle Burnal	\N	\N
475	Teddie Dubrev	\N	\N
476	Alison Sweeney	\N	\N
477	Claire Forrester	\N	\N
478	Jamie Metheson	\N	\N
\.


--
-- Data for Name: Masterlists; Type: TABLE DATA; Schema: public; Owner: mikaelaustin
--

COPY "Masterlists" (id, "time", song, studio, dancers, "createdAt", "updatedAt") FROM stdin;
1	\N	A Thousand Years	Starz Dance Company	Kelsey Austin	\N	\N
2	\N	Roar	Starz Dance Company	Emily Trinkler	\N	\N
3	\N	Gravity	Broadway Dancers	Shauntle Barley	\N	\N
4	\N	Ava Maria	Broadway Dancers	Alana Harris	\N	\N
5	\N	Titanium	Starz Dance Company	Dana Greene	\N	\N
6	\N	The Bomb	Dance Perceptions	Olivia Wittels	\N	\N
7	\N	Bad Things	Art In Motion	Nicole Park	\N	\N
8	\N	Gimme More	Art In Motion	Laura Ardila	\N	\N
9	\N	Upgrade You	Art In Motion	Monica Kuroki	\N	\N
10	\N	Feeling Good	Broadway Dancers	Cayley Schafer	\N	\N
11	\N	Salute	Xtreme Dance Force	Alison Nathanson	\N	\N
12	\N	Worth It 	Art In Motion	Rachel Price	\N	\N
13	\N	Hey Mama	DanceTown	Jasmine Bensky	\N	\N
14	\N	A Million Miles Away	Shining Stars	Dana Krause	\N	\N
15	\N	Come Home 	Starz Dance Company	Rachel Chinman	\N	\N
16	\N	Heartless	Premiere Dance Academy	Lindsay Altman	\N	\N
17	\N	Breathe me	Premiere Dance Academy	Elyse Leff	\N	\N
18	\N	Magic	Premiere Dance Academy	Lexi Werner	\N	\N
19	\N	Catch Me	Premiere Dance Academy	Brittany Rose	\N	\N
20	\N	Collide	Premiere Dance Academy	Jill Gittleman	\N	\N
21	\N	Sing Sing Sing 	The Dance Zone	Max Gold	\N	\N
22	\N	Sorry Not Sorry	The Dance Zone	Michael Buzin	\N	\N
23	\N	Waka Waka	Studio L	Daniel DeChiara	\N	\N
24	\N	Shape Of You 	Starz Dance Company	CJ Fears	\N	\N
25	\N	Arabian Nights	Broadway Dancers	Audry Otey  	\N	\N
26	\N	Billie Jean	Premiere Dance Academy	Whitney White	\N	\N
27	\N	Arms	Shining Stars	Emerson Lohman 	\N	\N
28	\N	Closer	Xtreme Dance Force	Alli Gottwalt	\N	\N
29	\N	Slow Me Down	Dance Dimensions	Jake Freed	\N	\N
30	\N	Bad Romance	Dance Dimensions	Tristan Lowe	\N	\N
31	\N	Superhuman	Dancers Edge	Alberto Wexler 	\N	\N
32	\N	Love Myself	Broadway Dancers	Chandler Bolog	\N	\N
33	\N	Diva	Starz Dance Company	Alexa Gambuti	\N	\N
34	\N	WTF	Prestige Arts Company	Josie Brito	\N	\N
35	\N	Beautiful People	Prestige Arts Company	Julie Kaufman	\N	\N
36	\N	Rehab	Broadway Dancers	August Garriott  	\N	\N
37	\N	Like A Prayer	Starz Dance Company	Leon Prado 	\N	\N
38	\N	I Will Always Love You	Dancers Edge	Angla Blythe  	\N	\N
39	\N	Stone Cold	Dance Dimensions	Violet North  	\N	\N
40	\N	Gold Digger	Broadway Dancers	Leia Stilts	\N	\N
41	\N	Fighter	Dance Dimensions	Lili Pomerleau 	\N	\N
42	\N	Say My Name	Broadway Dancers	Joni Riley  	\N	\N
43	\N	Lose Yourself	Broadway Dancers	Jonnie Clink 	\N	\N
44	\N	Hot In Here	Premiere Dance Academy	Jill Gittleman	\N	\N
45	\N	Chasing Cars	Starz Dance Company	Dana Greene	\N	\N
46	\N	Heaven	Prestige Arts Company	Cayley Schafer	\N	\N
47	\N	Proud Mary	Innovation Dance	Andy Diep	\N	\N
48	\N	Man In The Mirror	Dancers Edge	Stephania Gean  	\N	\N
49	\N	Fly	Starz Dance Company	Alix Sadowski	\N	\N
50	\N	Reflection	Starz Dance Company	Gillian DeRario	\N	\N
51	\N	Falling Slowly 	Starz Dance Company	Rebecca Mass	\N	\N
52	\N	Reminding Me	Innovation Dance	Tess Ortiz	\N	\N
53	\N	Dancing On My Own	Broadway Dancers	Grace Carcamo	\N	\N
54	\N	By Your Side	Art In Motion	Anastasia Patten	\N	\N
55	\N	Jar Of Hearts	Dancers Edge	Ella McAllister	\N	\N
56	\N	Dead Man's Arms	Innovation Dance	Sammie Hayes	\N	\N
57	\N	Unstoppable	Dancers Edge	Shane Carrol	\N	\N
58	\N	To Find You	Art In Motion	Freddie Black	\N	\N
59	\N	Fame	Starz Dance Company	Kelsey Austin, Emily Trinkler	\N	\N
60	\N	Erase Me	Shining Stars	Cindie Morgan, Mitchell Dubay  	\N	\N
61	\N	Pon De Floor	Premiere Dance Academy	Jill Gittleman, Lindsay Altman	\N	\N
62	\N	Pause	The Dance Zone	Nicole Boulton, Seth Hisey, Carolin Creswell   	\N	\N
63	\N	Check On It	Starz Dance Company	Dana Greene, CJ Fears	\N	\N
64	\N	Promise	Xtreme Dance Force	Alli Gottwalt, Anne Gottwalt	\N	\N
65	\N	Bad Girl	Premiere Dance Academy	Violet North, Andy Prado  	\N	\N
66	\N	Jump	Art In Motion	Nicole Park, Laura Ardila, Monica Kuroki	\N	\N
67	\N	Work	Broadway Dancers	Misty Copeland, Katie Boren	\N	\N
68	\N	Revolution	Xtreme Dance Force	Evelin Twine, Clifton Danielsen 	\N	\N
69	\N	Tribute	Starz Dance Company	Kelsey Austin, Alexa Gambuti	\N	\N
70	\N	Animals	Prestige Arts Company	Josie Brito, Julie Kaufman	\N	\N
71	\N	My Chick Bad	Studio L	Mikael Austin, Daniel DeChiara	\N	\N
72	\N	Hallelujah	Premiere Dance Academy	Savanna Heavner, Yuriko Sanborn 	\N	\N
73	\N	Free Me	The Dance Zone	Michael Buzin, Max Gold, Joey Herman	\N	\N
74	\N	The Edge Of Glory	Broadway Dancers	Shauntle Barley, Alana Harris	\N	\N
75	\N	Surrender	Broadway Dancers	Joni Riley, Jonnie Clink, Leia Stilts 	\N	\N
76	\N	Love And Memories	Shining Stars	Anna Knox, Shaun Reiss	\N	\N
77	\N	To Where You Are	Dancers Edge	Romeo Aviles, Rea Wiron, Jalisa Ruppe	\N	\N
78	\N	Lionheart	DanceTown	Jasmine Bensky, Andrew Kleeman	\N	\N
79	\N	All Of Me	Premiere Dance Academy	Vivian Flax, Phoebe Cho, Whitney White	\N	\N
80	\N	Battlefield	Dancers Edge	Ella McAllister, Shane Carrol	\N	\N
81	\N	Bleeding Love	Starz Dance Company	Alix Sadowski, Gillian DeRario	\N	\N
82	\N	Crave You	Broadway Dancers	August Garriott, Leia Stilts  	\N	\N
83	\N	Formation	The Dance Zone	Anastasia Patten, Bobbie Richier	\N	\N
84	\N	Ojos Asi	Innovation Dance	Laila Hadfield, Josh Blank	\N	\N
85	\N	Take It Easy	Dancers Edge	Nina Long, Selena Wright, Jasper Harrington	\N	\N
86	\N	These Roses	Center Stage	Jamie Voss, Mercedez Ruiz, Chrystal Lotell	\N	\N
87	\N	Whatever You Like	Shining Stars	Bobbie Ryder, Reiko Lutz	\N	\N
88	\N	Cheap Thrills	Broadway Dancers	Jessi Mayer, Michele Pinder	\N	\N
89	\N	Extra Terrestrial	On Pointe	Anthone Newport, Iliana Rower	\N	\N
90	\N	Aladdin	Art In Motion	Janine Babbot, Keith Langer	\N	\N
91	\N	Tiny Dancer	Premiere Dance Academy	Gemma Storner, Natashia Dotson, Mckenzie Odell	\N	\N
92	\N	Dirrty	Dance Perceptions	Leora Whorley, Grant Roberts	\N	\N
93	\N	Get Me Bodied	Prestige Arts Company	Anna Hughes, Brett Riley	\N	\N
94	\N	Walk This Way	DanceTown	Kennedy Hughes, Jason Langston	\N	\N
95	\N	The Kiss	Art In Motion	Valentina Hernandez, Quentin Pak, Michaela Grayson	\N	\N
96	\N	For Love	Dancers Edge	Alberto Wexler, Nora Lavery 	\N	\N
97	\N	No Man	Dance Perceptions	Nadine Chacott, Caroline Wess	\N	\N
98	\N	Forever	On Pointe	Valerie Jacobs, Lilly Chang	\N	\N
99	\N	Let It Rock	Shining Stars	Anna Knox, Shaun Reiss, Dana Krause, Cindie Morgan, Mitchell Dubay  	\N	\N
100	\N	Thriller	Broadway Dancers	Alana Harris, Shauntle Barley, Joni Riley, Jonnie Clink, Leia Stilts  	\N	\N
101	\N	Beauty And The Beast	Premiere Dance Academy	Brittany Rose, Lexi Werner, Jill Gittleman, Elyse Leff, Lindsay Altman	\N	\N
102	\N	Poker Face	Dancers Edge	Angla Blythe, Stephania Gean, Alberto Wexler, Ella McAllister, Shane Carrol	\N	\N
103	\N	Hotel California	Dancers Edge	Chrystal Lotell, Nina Long, Selena Wright, Jasper Harrington	\N	\N
104	\N	How It Ends	Starz Dance Company	Alix Sadowski, Gillian DeRario, Kristin Schmidt, Rebecca Mass, Kelly Sheehan	\N	\N
105	\N	That's Not My Name	Dance Dimensions	Violet North, Andy Prado, Grant Roberts, Jess Bloom  	\N	\N
106	\N	Use Somebody	Center Stage	Kelly Wood, Jamie Bell, Jenna Voyer, Deirdre Shaw, Kayla Wolfson, Faye Kulek	\N	\N
107	\N	If It Kills Me	Innovation Dance	Sammie Hayes, Andy Diep, Tess Ortiz, Laila Hadfield, Josh Blank	\N	\N
108	\N	Lost Love	The Dance Zone	Anastasia Patten, Bobbie Richier, Harah Locke, Matt Herald, Jenna Matthews	\N	\N
109	\N	The One	DanceTown	Stacey Keeney, Dale Evans, Claire Edwards, Skylar Gurken, Cleo Shawman, Maya Gold	\N	\N
110	\N	You and Me	Dancers Edge	Romeo Aviles, Rea Wiron, Jalisa Ruppe, Jessica Lang, Brooke Emerson	\N	\N
111	\N	Perfect	Premiere Dance Academy	Savanna Heavner, Yuriko Sanborn, Violet North, Andy Prado  	\N	\N
112	\N	Fever	Studio L	Maxwell Greany, Will Wright, Graham Westwood, Jason Hestin	\N	\N
113	\N	Cabaret	Starz Dance Company	Kelsey Austin, Emily Trinkler, Alexa Gambuti, Vince Grayson	\N	\N
114	\N	Dynamite	Studio L	Kim Johannes, Hannah Storie, Claudia Shiffon, Casey Blake, Dara Wheaton	\N	\N
115	\N	Mine	DanceTown	Cobie Dolman, Spencer Stevens, Avery Loh, Ava Buford, Reid Pascarelli, Gabrielle Lewis, Dakota Boden	\N	\N
116	\N	Angel	On Pointe	Anthone Newport, Iliana Rower, Valerie Jacobs, Lilly Chang	\N	\N
117	\N	Fix You	Broadway Dancers	Jessi Mayer, Michele Pinder, Chandler Bolog, August Garriott, Audry Otey, Cayley Schafer	\N	\N
118	\N	IDGAF	Innovation Dance	Gina Capson, Amanda Drake, Dana Sander, Lauren Golden, Paige Cashmir, Evan Babson, Wilson Brown, Zoe Stevenson	\N	\N
119	\N	Wallflower	Center Stage	Giana DeFara, Jenna, Voyer, Kayla Wolfson, Faye Kulek, Paige Samuels	\N	\N
120	\N	Beast	The Dance Zone	Alana Shaw, Steward Leland, Brittany Burnett, Violet Smith, Courney Jones	\N	\N
121	\N	Just So	Dance Dimensions	Tristan Lowe, Jake Freed, Danielle Koon, Lili Pomerleau, Hayley Quinn	\N	\N
122	\N	Once	Dance Perceptions	Olivia Wittels, Nadine Chacott, Caroline Wess, Bradley Farr, Frank Lowe, Sarah Woodland, Hannah Livingston	\N	\N
123	\N	Yonce	Center Stage	Leni Gale, Rachel DeMayo, Ashley Booler, Clare Edwards, Hara Williams, Brent Bloom	\N	\N
124	\N	Birds	On Pointe	Andy Smith, Cara Smith, Mellissa Pozo, Carmen Yang	\N	\N
125	\N	Fools In Love	Art In Motion	Drew Falb, Nicole Park, Laura Ardila, Monica Kuroki	\N	\N
126	\N	Sweet Charity	Prestige Arts Company	Josie Brito, Julie Kaufman, Cayley Schafer, Anna Hughes, Brett Riley	\N	\N
127	\N	The Doctor Is In	Studio L	Chrstine Long, Peyton Faherty, Faye Parnes, Tara Reinhold, Vivienne Jenkins	\N	\N
128	\N	Bolero	Shining Stars	Emerson Lohman, Anna Knox, Shaun Reiss, Bobbie Ryder, Reiko Lutz	\N	\N
129	\N	Unconditionally	Center Stage	Dane Radding, Tanner Seitz, Reed Flaherty, Travis Paulson, Joseph Westwood	\N	\N
130	\N	Missing You	Premiere Dance Academy	Gemma Storner, Natashia Dotson, Mckenzie Odell, Savanna Heavner, Yuriko Sanborn, Violet North, Andy Prado, Brittany Rose, Lexi Werner, Jill Gittleman, Elyse Leff, Lindsay Altman	\N	\N
131	\N	Radioactive	Innovation Dance	Cameron Shankman, Dan Coulis, Thomas Harding, Allie Jameson, Kelly Gearheart, Kara Burglass, Rob Rolston, Mario DeMayo, Simone White, Jamie Hatter, Brady Borum, Ella McGowen, Melisa Paskall	\N	\N
132	\N	Chandelier	Art In Motion	Leanne Murphy, Bryan Clemson, Janine Babbot, Keith Langer, Freddie Black, Rachel Price, Anastasia Patten, Valentina Hernandez, Quentin Pak, Michaela Grayson	\N	\N
133	\N	Love Game	Broadway Dancers	Shauntle Barley, Alana Harris, Cayley Schafer, Misty Copeland, Katie Boren	\N	\N
134	\N	Bang My Head	On Pointe	Andy Smith, Cara Smith, Mellissa Pozo, Carmen Yang, Anthone Newport, Iliana Rower, Valerie Jacobs, Lilly Chang, Blake Appleson, Rose Trenton, Valerie Jones, Colby Woodleigh, Hayden Freeman, Paul Wilson, Anna Tilsbury	\N	\N
135	\N	Don't Let Me Down	Center Stage	Kelly Wood, Jamie Bell, Jenna Voyer, Deirdre Shaw, Kayla Wolfson, Faye Kulek, Giana DeFara, Paige Samuels, Greg Meyers, Samantha Shedler, Fern Greyer, Max Farr, Nadia Whitely	\N	\N
136	\N	Panda	DanceTown	Stacey Keeney, Dale Evans, Claire Edwards, Skylar Gurken, Cleo Shawman, Maya Gold, Cobie Dolman, Spencer Stevens, Avery Loh, Ava Buford, Reid Pascarelli, Gabrielle Lewis, Dakota Boden	\N	\N
137	\N	The Nutcracker	Dancers Edge	Angla Blythe, Stephania Gean, Alberto Wexler, Ella McAllister, Shane Carrol, Nina Long, Selena Wright, Jasper Harrington, Romeo Aviles, Rea Wiron, Jalisa Ruppe	\N	\N
138	\N	Again	Studio L	Mikael Austin, Daniel DeChiara, Maxwell Greany, Will Wright, Graham Westwood, Jason Hestin, Paris Atlas, Aria Benson, Stella Hurley, Chase Milone, Camille Soto	\N	\N
139	\N	Fade	On Pointe	Sofia Solas, Kara Rolston, Zoe Royce, Jennie Cho, Claire Shrader, Chris Simmons, Brooke Farrow, Rachel Cottman, Madison Brown, Alexandra Ballinger	\N	\N
140	\N	Reminder	Art In Motion	Brittany Reiss, Weston Prince, Terri Valter, Sam Hayes, Jaye Setter, Quinn Long, Alton Denson, Nicole Park, Laura Ardila, Monica Kuroki, Janine Babbot, Keith Langer	\N	\N
141	\N	Starboy	Dance Dimensions	Tristan Lowe, Jake Freed, Danielle Koon, Lili Pomerleau, Hayley Quinn, Violet North, Andy Prado, Grant Roberts, Jess Bloom, Jessa Long  	\N	\N
142	\N	Bet On It	Dance Perceptions	Olivia Wittels, Nadine Chacott, Caroline Wess, Bradley Farr, Frank Lowe, Sarah Woodland, Hannah Livingston, Leora Whorley, Grant Roberts, Maddie Gilbert, Danielle Goodall, Paige Covell	\N	\N
143	\N	Attention	DanceTown	Tucker Mehr, Lucas Atlas, Brendan Folkes, Harley Kipp, Logan Bogle, Lindsay Pierson, Sam Stetson, Liam Zenz, Chloe Cho, Gayle Woolston, Zoe Hawke, Jade Silver, Bryce Gordon, Alexis Wilkerson, Hunter Sheen	\N	\N
144	\N	All Stars	Innovation Dance	Gina Capson, Amanda Drake, Dana Sander, Lauren Golden, Paige Cashmir, Evan Babson, Wilson Brown, Zoe Stevenson, Sammie Hayes, Andy Diep, Tess Ortiz, Laila Hadfield, Josh Blank	\N	\N
145	\N	Protocol	Center Stage	Kelly Wood, Jamie Bell, Jamie Voss, Mercedez Ruiz, Chrystall Lotell, Dane Radding, Tanner Seitz, Reed Flaherty, Travis Paulson, Joseph Westwood	\N	\N
146	\N	Home	Broadway Dancers	Shauntle Barley, Alana Harris, Cayley Schafer, Misty Copeland, Katie Boren, Jessie Mayer, August Garriott, Grace Carcamo, Brittany Gramm, Maple McGraw, Courtney Clleary	\N	\N
147	\N	This Time	Shining Stars	Reiko Lutz, Emerson Lohman, Casey Fointaine, Jessi Fernandez, Marie Wagner, Anna Knox, Shaun Reiss, Dana Krause, Cindie Morgan, Mitchell Dubay  	\N	\N
148	\N	Swish Swish	Studio L	Chrstine Long, Peyton Faherty, Faye Parnes, Tara Reinhold, Vivienne Jenkins, Kim Johannes, Hannah Storie, Claudia Shiffon, Casey Blake, Dara Wheaton	\N	\N
149	\N	I See Fire	On Pointe	Jess Moulder, Hallie Westwick, Marley Fox, Andy Smith, Cara Smith, Mellissa Pozo, Carmen Yang, Anthone Newport, Iliana Rower, Valerie Jacobs, Lilly Chang, Blake Appleson, Rose Trenton, Valerie Jones, Colby Woodleigh, Hayden Freeman, Paul Wilson, Anna Tilsbury	\N	\N
150	\N	Love Potion	Dance Dimensions	Ciara Sumner, Jennifer Clear, Shelby Preyer, Jane Willis, Sumiko Senger, Lara Ganey, Skyler Zinn, Laura Phillips, Micaela Dwight, Ryan Sawyer, Blair Barnett, Tina Plotnik	\N	\N
151	\N	You Down Own Me	Starz Dance Company	Alfonso Badilla, Eliana Ebeling, Jordan Law, Paige Wilson, Chloe White, Dylan Badley, Tristan Dean, Michelle Ramirez, Lara Cheng, Julian Garrison, Casey Fagan, Erin Kessel	\N	\N
152	\N	Breathe	Premiere Dance Academy	Gemma Storner, Natashia Dotson, Mckenzie Odell, Savanna Heavner, Yuriko Sanborn, Violet North, Andy Prado, Brittany Rose, Lexi Werner, Jill Gittleman, Elyse Leff, Lindsay Altman, Vivian Flax, Phoebe Cho, Whitney White	\N	\N
153	\N	Tilted	Prestige Arts Company	Sara Ross, Anna Garmon, Leah Witte, Rachel Patridge, Paige Harlow, Hailey Lindberg, Claire Ferarra, Brittany Churchill, Nora Kantor, Ella Browning, Talia Highland	\N	\N
154	\N	Smooth Criminal	Art In Motion	Brittany Reiss, Weston Prince, Terri Valter, Sam Hayes, Jaye Setter, Quinn Long, Alton Denson, Nicole Park, Laura Ardila, Monica Kuroki, Janine Babbot, Keith Langer	\N	\N
155	\N	Respect	Dance Perceptions	Kendall Evans, Lauren Edwards, Valerie Grant, Sandra Wright, Jackie Shank, Billy Dunn, Maggie Wilson, Lara Higgins, Garret Jones, Jillian Quigley, Rachel Fryer, Dylan Coots	\N	\N
156	\N	Funky Town	Dancers Edge	Brad Waters, Blake Gansit, Chloe Shiffrin, Trent Gurock, Benjamin White, Troy Gibbons, Clark Kimbler, Tyrell Prescott, Elliott Riske, Jared Denberg, Jonathan Halbert, Thomas Jarvie	\N	\N
157	\N	Sleep Talk	Broadway Dancers	Audry Otey, Chandler Bolog, Joni Riley, Jonnie Clink, Grace Carcamo, Leia Stilts, Misty Copeland, Yuko Cummings, Joanna Steller, Damien Munez, Maggie Leopold, Bella Erling  	\N	\N
158	\N	Gypsy	Center Stage	Travis Paulson, Kelly Wood, Jamie Bell, Jenna Voyer, Deirdre Shaw, Kayla Wolfson, Faye Kulek, Giana DeFara, Paige Samuels, Greg Meyers, Samantha Shedler, Fern Greyer, Max Farr, Nadia Whitely	\N	\N
159	\N	Knock On Wood	Studio L	Mikael Austin, Daniel DeChiara, Maxwell Greany, Will Wright, Graham Westwood, Jason Hestin, Paris Atlas, Aria Benson, Stella Hurley, Chase Milone, Camille Soto, Jackie Flynn, Enzo Armeni	\N	\N
160	\N	Rockstars	DanceTown	Lilly Cade, Eva Lear, Mariela Rubia, Nicole Angle, Shana Threet, Annie Loh, Lauren Rhymes, Elena Kropf, Paige Brown, Maya Oney, Amanda Orelia, Chelsea Simmons, Dylan Black, Samantha Hartwell	\N	\N
161	\N	Me Too	Dance Dimensions	Tristan Lowe, Jake Freed, Danielle Koon, Lili Pomerleau, Hayley Quinn, Violet North, Andy Prado, Grant Roberts, Jess Bloom, Jessa Long  	\N	\N
162	\N	The Mirror	Starz Dance Company	Kelsey Austin, Emily Trinkler, Alexa Gambuti, Vince Grayson, Dana Greene, CJ Fears, Leon Prado, Alix Sadowski, Gillian DeRario, Kristin Schmidt, Rebecca Mass, Kelly Sheehan	\N	\N
163	\N	Wolf	Shining Stars	Mason Griffin, Blake Griffin, Kenton Loch, Brad Atkins, Joseph Benett, Vince Hudgens, Michael Moller, Greg Fink, Billy Greenwell, Liam Jenson, Bryan Smith	\N	\N
164	\N	I'm Going Down	Center Stage	Eddie Walker, Brittany Bell, Jamie Bell, Leni Gale, Rachel DeMayo, Ashley Booler, Clare Edwards, Hara Williams, Brent Bloom	\N	\N
165	\N	Walk Like An Egyptian	Premiere Dance Academy	Bari Frankel, Jessa Sharp, Mia Martinez, Jade Summers, Bryce Fox, Jason Delara, Nina Seiber, Harley Lockett, Michael Fink, Abby Kettner, Sara Elswick, Jordan Tippler, Eliana Chappel, Jessica Allens, Blair Black, Ashley Agosta	\N	\N
166	\N	Hold Up	Innovation Dance	Cameron Shankman, Dan Coulis, Thomas Harding, Allie Jameson, Kelly Gearheart, Kara Burglass, Rob Rolston, Mario DeMayo, Simone White, Jamie Hatter, Brady Borum, Ella McGowen, Melisa Paskall, Cameron Shankman, Dan Coulis, Thomas Harding, Allie Jameson, Kelly Gearheart, Kara Burglass, Rob Rolston, Mario DeMayo, Simone White, Jamie Hatter, Brady Borum, Ella McGowen, Melisa Paskall	\N	\N
167	\N	Cut It	Art In Motion	Valentina Hernandez, Quentin Pak, Michaela Grayson, Rachel Price, Jaye Setter, Monica Kuroki, Grace Kuroki, Freddie Black, Rose Jenkins, Hannah Frank, Danielle Plott, Chelsea Gramm, Alex Winston, Violetta Lee	\N	\N
168	\N	Impossible	Broadway Dancers	August Garriott, Jess Tilling, Stephanie Gomez, Roberto Lopez, Hannah Jenson, Gina Klein, Joni Riley, Jonnie Clink, Shauntle Barley, Alana Harris, Cayley Schafer, Misty Copeland, Katie Boren	\N	\N
169	\N	Next To You	On Pointe	Anthone Newport, Iliana Rower, Sofia Solas, Kara Rolston, Zoe Royce, Jennie Cho, Claire Shrader, Chris Simmons, Brooke Farrow, Rachel Cottman, Madison Brown, Alexandra Ballinger	\N	\N
170	\N	Moves Like Jagger	Shining Stars	Reiko Lutz, Emerson Lohman, Casey Fointaine, Jessi Fernandez, Marie Wagner, Anna Knox, Shaun Reiss, Dana Krause, Cindie Morgan, Mitchell Dubay, Zoe Pratt, Emerson Lohman, Nick Fontine	\N	\N
171	\N	Talk Dirty	Prestige Arts Company	Kurtis Lang, Grant Ross, Bobby Alan, Weston Harding, Michael Witts, Frank Simmons, Alex Peck, Charlotte Kimball, Kendall Meyer, Alexa Lopez, Casey Fenton	\N	\N
172	\N	Greatest Show	Broadway Dancers	Shauntle Barley, Alana Harris, Cayley Schafer, Misty Copeland, Katie Boren, Jessie Mayer, August Garriott, Grace Carcamo, Brittany Gramm, Maple McGraw, Courtney Cleary, Stephanie Gomez, Hannah Jenson, Jenna Blake, Louis Palmer, Gemma Anderson	\N	\N
173	\N	Pray For Me	On Pointe	Jess Moulder, Hallie Westwick, Marley Fox, Andy Smith, Cara Smith, Mellissa Pozo, Carmen Yang, Anthone Newport, Iliana Rower, Valerie Jacobs, Lilly Chang, Blake Appleson, Rose Trenton, Valerie Jones, Colby Woodleigh, Hayden Freeman, Paul Wilson, Anna Tilsbury	\N	\N
174	\N	Alone	DanceTown	Jason Denning, Will Gomez, Sam Wolling, Bryan Lyle, Oliver Bing, Weston Ballard, Dave Castiglia, Kyle Stroupe, Corey Zieger, Kevin Holcombe, Curtis Capps, Joey Levron	\N	\N
175	\N	Us	Dancers Edge	Angla Blythe, Stephania Gean, Alberto Wexler, Ella McAllister, Shane Carrol, Nina Long, Selena Wright, Jasper Harrington, Romeo Aviles, Rea Wiron, Jalisa Ruppe, Brad Waters, Blake Gansit, Chloe Shiffrin, Trent Gurock, Benjamin White, Troy Gibbons, Clark Kimbler, Tyrell Prescott, Elliott Riske, Jared Denberg, Jonathan Halbert, Thomas Jarvie	\N	\N
176	\N	Filthy	The Dance Zone	Anastasia Patten, Bobbie Richier, Harah Locke, Matt Herald, Jenna Matthews, Alana Shaw, Steward Leland, Brittany Burnett, Violet Smith, Courney Jones, Nicole Boulton, Seth Hisey, Carolin Creswell, Michael Buzin, Max Gold, Joey Herman, Alyssa Harriott, Shannon Kroes, Rick HIlyard, Carlos Gaudi, Randi Ruffino, Parker Holdman, Oliver Lawrence   	\N	\N
177	\N	Bailamos	Center Stage	Faye Kulek, Paige Samuels, Samantha Shedler, Kelly Wood, Jamie Bell, Jamie Voss, Mercedez Ruiz, Chrystall Lotell, Dane Radding, Tanner Seitz, Reed Flaherty, Travis Paulson, Joseph Westwood, Elizabeth Denly, Cooper James, Chase Wright, Mason Green, Allison Renson, Lauren Shaw, Wendy Lopez, Katie Jones, Liana Cho	\N	\N
178	\N	One Foot	Studio L	Mikael Austin, Daniel DeChiara, Maxwell Greany, Will Wright, Graham Westwood, Jason Hestin, Paris Atlas, Aria Benson, Stella Hurley, Chase Milone, Camille Soto, Jackie Flynn, Enzo Armeni, Chrstine Long, Peyton Faherty, Faye Parnes, Tara Reinhold, Vivienne Jenkins, Kim Johannes, Hannah Storie, Claudia Shiffon, Casey Blake, Dara Wheaton	\N	\N
179	\N	O Fortuna	DanceTown	Tucker Mehr, Lucas Atlas, Brendan Folkes, Harley Kipp, Logan Bogle, Lindsay Pierson, Sam Stetson, Liam Zenz, Chloe Cho, Gayle Woolston, Zoe Hawke, Jade Silver, Bryce Gordon, Alexis Wilkerson, Hunter Sheen, Stacey Keeney, Dale Evans, Claire Edwards, Skylar Gurken, Cleo Shawman, Maya Gold, Cobie Dolman, Spencer Stevens, Avery Loh, Ava Buford, Reid Pascarelli, Gabrielle Lewis, Dakota Boden	\N	\N
180	\N	Bumblebees	Premiere Dance Academy	Bari Frankel, Jessa Sharp, Mia Martinez, Jade Summers, Bryce Fox, Jason Delara, Nina Seiber, Harley Lockett, Michael Fink, Abby Kettner, Sara Elswick, Jordan Tippler, Eliana Chappel, Jessica Allens, Blair Black, Ashley Agosta, Ryan Shelling, Andrew Williams, Quinn Larson	\N	\N
181	\N	DMX	Dance Perceptions	Olivia Wittels, Nadine Chacott, Caroline Wess, Bradley Farr, Frank Lowe, Sarah Woodland, Hannah Livingston, Leora Whorley, Grant Roberts, Maddie Gilbert, Danielle Goodall, Paige Covell, Kendall Evans, Lauren Edwards, Valerie Grant, Sandra Wright, Jackie Shank, Billy Dunn, Maggie Wilson, Lara Higgins, Garret Jones, Jillian Quigley, Rachel Fryer, Dylan Coots	\N	\N
182	\N	Mama	Center Stage	Eddie Walker, Brittany Bell, Jamie Bell, Leni Gale, Rachel DeMayo, Ashley Booler, Clare Edwards, Hara Williams, Brent Bloom, James Jones, Blair Koch, Leigh Ginsberg, Lauren Edwards, Liz Brown, Allie Evans, Maddie Covell, Catrina Camilo, Jana Halley, Skye Hayes, Reed Flaherty, Paige Samuels	\N	\N
183	\N	Eraser	Art In Motion	Valentina Hernandez, Quentin Pak, Michaela Grayson, Rachel Price, Jaye Setter, Monica Kuroki, Grace Kuroki, Freddie Black, Rose Jenkins, Hannah Frank, Danielle Plott, Chelsea Gramm, Alex Winston, Violetta Lee, Nicole Park, Laura Ardila, Blake Herrin, Mandy Paulson, Claire McFadden, Logan Ericson, Ellie Shuster, Samantha Fowler, Leigh Dougherty	\N	\N
184	\N	Despacito	Innovation Dance	Cameron Shankman, Dan Coulis, Thomas Harding, Allie Jameson, Kelly Gearheart, Kara Burglass, Rob Rolston, Mario DeMayo, Simone White, Jamie Hatter, Brady Borum, Ella McGowen, Melisa Paskall,  Gina Capson, Amanda Drake, Dana Sander, Lauren Golden, Paige Cashmir, Evan Babson, Wilson Brown, Zoe Stevenson, Sammie Hayes, Andy Diep, Tess Ortiz, Laila Hadfield, Josh Blank	\N	\N
185	\N	Fuego	On Pointe	Jess Moulder, Hallie Westwick, Marley Fox, Andy Smith, Cara Smith, Mellissa Pozo, Carmen Yang, Anthone Newport, Iliana Rower, Valerie Jacobs, Lilly Chang, Blake Appleson, Rose Trenton, Valerie Jones, Colby Woodleigh, Hayden Freeman, Paul Wilson, Anna Tilsbury, Kara Rolston, Zoe Royce, Jennie Cho, Chris Shrader, Chris Simmons, Brooke Farrow	\N	\N
186	\N	Broken Heart	Broadway Dancers	Shauntle Barley, Alana Harris, Cayley Schafer, Misty Copeland, Katie Boren, Jessie Mayer, August Garriott, Grace Carcamo, Brittany Gramm, Maple McGraw, Courtney Cleary, Stephanie Gomez, Hannah Jenson, Jenna Blake, Louis Palmer, Gemma Anderson, Yuko Cummings, Joanna Steller, Damien Munez, William Jacobs, Pam Traps, Felix Otterson, Olivia Parker, Carmen Potter, Rachel Waters, Camille Beller, Marie Roberts	\N	\N
187	\N	The Garden	Studio L	Mikael Austin, Daniel DeChiara, Maxwell Greany, Will Wright, Graham Westwood, Jason Hestin, Paris Atlas, Aria Benson, Stella Hurley, Chase Milone, Camille Soto, Jackie Flynn, Enzo Armeni, Chrstine Long, Peyton Faherty, Faye Parnes, Tara Reinhold, Vivienne Jenkins, Kim Johannes, Hannah Storie, Claudia Shiffon, Casey Blake, Dara Wheaton	\N	\N
188	\N	Are You The One?	Starz Dance Company	Alfonso Badilla, Eliana Ebeling, Jordan Law, Paige Wilson, Chloe White, Dylan Badley, Tristan Dean, Michelle Ramirez, Lara Cheng, Julian Garrison, Casey Fagan, Erin Kessel, Kelsey Austin, Emily Trinkler, Alexa Gambuti, Vince Grayson, Dana Greene, CJ Fears, Leon Prado, Alix Sadowski, Gillian DeRario, Kristin Schmidt, Rebecca Mass, Kelly Sheehan	\N	\N
189	\N	Time	Premiere Dance Academy	Gemma Storner, Natashia Dotson, Mckenzie Odell, Savanna Heavner, Yuriko Sanborn, Violet North, Andy Prado, Brittany Rose, Lexi Werner, Jill Gittleman, Elyse Leff, Lindsay Altman, Vivian Flax, Phoebe Cho, Whitney White, Rebecca Yoo, Jenna Spade, Brett Garnett, Winnie Grayson, Maddie Odell	\N	\N
190	\N	Bang Bang	Prestige Arts Company	Kurtis Lang, Grant Ross, Bobby Alan, Weston Harding, Michael Witts, Frank Simmons, Alex Peck, Charlotte Kimball, Kendall Meyer, Alexa Lopez, Casey Fenton, Sara Ross, Anna Garmon, Leah Witte, Rachel Patridge, Paige Harlow, Hailey Lindberg, Claire Ferarra, Brittany Churchill, Nora Kantor, Ella Browning, Talia Highland	\N	\N
191	\N	Sweet Dreams	DanceTown	Jason Denning, Will Gomez, Sam Wolling, Bryan Lyle, Oliver Bing, Weston Ballard, Dave Castiglia, Kyle Stroupe, Corey Zieger, Kevin Holcombe, Curtis Capps, Joey Levron, Lilly Cade, Eva Lear, Mariela Rubia, Nicole Angle, Shana Threet, Annie Loh, Lauren Rhymes, Elena Kropf, Paige Brown, Maya Oney, Amanda Orelia, Chelsea Simmons, Dylan Black, Samantha Hartwell	\N	\N
192	\N	Ramalama	Dancers Edge	Angla Blythe, Stephania Gean, Alberto Wexler, Ella McAllister, Shane Carrol, Nina Long, Selena Wright, Jasper Harrington, Romeo Aviles, Rea Wiron, Jalisa Ruppe, Brad Waters, Blake Gansit, Chloe Shiffrin, Trent Gurock, Benjamin White, Troy Gibbons, Clark Kimbler, Tyrell Prescott, Elliott Riske, Jared Denberg, Jonathan Halbert, Thomas Jarvie, Winnie Thoreaux, James Danzig, Brenton Gaines, Dani Chang, Mia Freeman	\N	\N
193	\N	Outta Your Mind	Art In Motion	Leanne Murphy, Bryan Clemson, Janine Babbot, Keith Langer, Freddie Black, Rachel Price, Anastasia Patten, Valentina Hernandez, Quentin Pak, Michaela Grayson, Nicole Park, Laura Ardila, Monica Kuroki, Grace Kuroki, Jaye Setter, Leanne Danes, Phill Langston, Jessie Williams, Alison Weltz, Yadeira Koonis, Angela Lowry, Amber Vince	\N	\N
194	\N	Calling You	Premiere Dance Academy	Gemma Storner, Natashia Dotson, Mckenzie Odell, Savanna Heavner, Yuriko Sanborn, Violet North, Andy Prado, Brittany Rose, Lexi Werner, Jill Gittleman, Elyse Leff, Lindsay Altman, Vivian Flax, Phoebe Cho, Whitney White, Rebecca Yoo, Jenna Spade, Brett Garnett, Winnie Grayson, Maddie Odell, Bari Frankel, Jessa Sharp, Mia Martinez, Jade Summers, Bryce Fox, Jason Delara, Nina Seiber, Harley Lockett, Michael Fink, Abby Kettner, Sara Elswick, Jordan Tippler, Eliana Chappel, Jessica Allens, Blair Black, Ashley Agosta, Ryan Shelling, Andrew Williams, Quinn Larson	\N	\N
195	\N	Wicked Game	Prestige Arts Company	Kurtis Lang, Grant Ross, Bobby Alan, Weston Harding, Michael Witts, Frank Simmons, Alex Peck, Charlotte Kimball, Kendall Meyer, Alexa Lopez, Casey Fenton, Sara Ross, Anna Garmon, Leah Witte, Rachel Patridge, Paige Harlow, Hailey Lindberg, Claire Ferarra, Brittany Churchill, Nora Kantor, Ella Browning, Talia Highland, Josie Brito, Julie Kaufman, Cayley Schafer, Anna Hughes, Brett Riley	\N	\N
196	\N	Turn to Stone	Center Stage	Faye Kulek, Paige Samuels, Samantha Shedler, Kelly Wood, Jamie Bell, Jamie Voss, Mercedez Ruiz, Chrystall Lotell, Dane Radding, Tanner Seitz, Reed Flaherty, Travis Paulson, Joseph Westwood, Elizabeth Denly, Cooper James, Chase Wright, Mason Green, Allison Renson, Lauren Shaw, Wendy Lopez, Katie Jones, Clare Edwards, Joseph Westwood, Hara Williams	\N	\N
197	\N	My Love	DanceTown	Jasmine Bensky, Andrew Kleeman, Kennedy Hughes, Jason Langston, Stacey Keeney, Dale Evans, Claire Edwards, Skylar Gurken, Cleo Shawman, Maya Gold, Jason Denning, Will Gomez, Sam Wolling, Bryan Lyle, Oliver Bing, Weston Ballard, Dave Castiglia, Kyle Stroupe, Corey Zieger, Kevin Holcombe, Curtis Capps, Joey Levron, Lilly Cade, Eva Lear, Mariela Rubia, Nicole Angle, Shana Threet, Annie Loh, Lauren Rhymes, Elena Kropf, Paige Brown, Maya Oney, Amanda Orelia, Chelsea Simmons, Dylan Black, Samantha Hartwell	\N	\N
198	\N	Stay	Center Stage	Faye Kulek, Paige Samuels, Samantha Shedler, Kelly Wood, Jamie Bell, Jamie Voss, Mercedez Ruiz, Chrystall Lotell, Dane Radding, Tanner Seitz, Reed Flaherty, Travis Paulson, Joseph Westwood, Elizabeth Denly, Cooper James, Chase Wright, Mason Green, Allison Renson, Lauren Shaw, Wendy Lopez, Katie Jones, Liana Cho, Kayla Wolfson, Jenna Voyer, Taylor Law, Grant James, Jessica Wallace	\N	\N
199	\N	Circus	Shining Stars	Mason Griffin, Blake Griffin, Kenton Loch, Brad Atkins, Joseph Benett, Vince Hudgens, Michael Moller, Greg Fink, Billy Greenwell, Liam Jenson, Bryan Smith, Reiko Lutz, Emerson Lohman, Casey Fointaine, Jessi Fernandez, Marie Wagner, Anna Knox, Shaun Reiss, Dana Krause, Cindie Morgan, Mitchell Dubay, Zoe Pratt, Emerson Lohman, Nick Fontine	\N	\N
200	\N	Love On Top	Studio L	Mikael Austin, Daniel DeChiara, Maxwell Greany, Will Wright, Graham Westwood, Jason Hestin, Paris Atlas, Aria Benson, Stella Hurley, Chase Milone, Camille Soto, Jackie Flynn, Enzo Armeni, Chrstine Long, Peyton Faherty, Faye Parnes, Tara Reinhold, Vivienne Jenkins, Kim Johannes, Hannah Storie, Claudia Shiffon, Casey Blake, Dara Wheaton, Arielle Burnal, Teddie Dubrev, Alison Sweeney, Claire Forrester, Jamie Matheson	\N	\N
\.


--
-- Data for Name: Sessions; Type: TABLE DATA; Schema: public; Owner: mikaelaustin
--

COPY "Sessions" (sid, expires, data, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: mikaelaustin
--

COPY "Users" (id, name, email, phone, username, salt, password_hash, location, studio, dancers, "createdAt", "updatedAt") FROM stdin;
1	a	a@a.com	732999999	a	$2a$10$ZuFYnu5Q24z9624H1lhqIu	$2a$10$ZuFYnu5Q24z9624H1lhqIufr8mso.BJ.v/ynUiMFptODkRjNOag62	Santa Clara CA	Dance Dimensions	{"Kelsey Austin"}	2018-02-25 11:38:33.59-05	2018-02-25 11:38:33.59-05
3	b	b@b.com	66666	hello	$2a$10$c4ZkwG/ud6IEBNmOAnYl8.	$2a$10$c4ZkwG/ud6IEBNmOAnYl8.lZnNO6xhKOtyRgLLhrgS0M.TzYNBigi	Dallas TX	Dancers Edge	{"Bobby Alan"}	2018-02-25 11:43:11.886-05	2018-02-25 11:43:11.886-05
4	c	c@c.com	33333333	c	$2a$10$RALTcy/wOQQRJIheW4V2wO	$2a$10$RALTcy/wOQQRJIheW4V2wOb.1n8mxGmYyuTk2aUE321ghv2SMEg6y	Buffalo NY	Dancers Edge	{"Kim Johannes"}	2018-02-25 12:41:33.839-05	2018-02-25 12:41:33.839-05
5	hi	hi@me.com	1231233333	hi	$2a$10$Pe5vmjDXvhr3K3EFx3upUu	$2a$10$Pe5vmjDXvhr3K3EFx3upUuwFhDPIFvDW4cIX.YaBH4lwjcgG0tS.y	Santa Clara CA	Dance Dimensions	{"Misty Copeland"}	2018-02-26 21:23:55.277-05	2018-02-26 21:23:55.277-05
8	ciao	ciao@me.com	2222222222	ciao	$2a$10$6yoSU3/t6maxI5Oy88SD3e	$2a$10$6yoSU3/t6maxI5Oy88SD3eQ/9PpOy.VCzMH1q2LsdJNHEBHG7WClC	Dallas TX	Premiere Dance Academy	{"Jasmine Bensky","Brittany Rose"}	2018-03-01 20:36:25.407-05	2018-03-01 20:36:25.407-05
10	daniel timothy	danny@g.mail	2016940052	danny	$2a$10$5UauUQb.HJCZdsM7XIxc4.	$2a$10$5UauUQb.HJCZdsM7XIxc4.VPyX4o7UrTRseGDvt5ZAg5gY32xv.vO	Philadelphia PA	Studio L	{"Mikael Austin","Daniel DeChiara"}	2018-03-03 13:46:48.181-05	2018-03-03 13:46:48.181-05
9	lindsay altman	lindsay@me.com	2233344343	lindsay	$2a$10$P1u/B5qyMZM7yZRrGCzTee	$2a$10$P1u/B5qyMZM7yZRrGCzTeeayuF7KDYrhVW.0Ta1sAX/7ZMpo/45xa	Greenville NC	Premiere Dance Academy	{"Lindsay Altman","Jill Gittleman","Jasmine Bensky"}	2018-03-01 20:38:07.227-05	2018-03-08 20:42:22.685-05
11	bob bobson	bob@bob.com	3444995898	bob	$2a$10$ikIGq6qt/z8XBYe8jtP6Lu	$2a$10$ikIGq6qt/z8XBYe8jtP6Lu4ylh4ETyNPl7DXbO/ocFaOTmNq/TWLK	Santa Clara CA	Center Stage	{"Kelly Wood","Jamie Bell"}	2018-03-08 20:51:44.944-05	2018-03-08 20:51:44.944-05
12					$2a$10$oM7ofBEIi43AvHDQgvZyPe	$2a$10$oM7ofBEIi43AvHDQgvZyPeIF4Ihi16B0OuXHMBJquFk9EiZ8y6s9C	Choose Location	Select Studio	{}	2018-03-11 14:49:50.254-04	2018-03-11 14:49:50.254-04
\.


--
-- Name: Dancers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikaelaustin
--

SELECT pg_catalog.setval('"Dancers_id_seq"', 1, true);


--
-- Name: Masterlists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikaelaustin
--

SELECT pg_catalog.setval('"Masterlists_id_seq"', 1, false);


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mikaelaustin
--

SELECT pg_catalog.setval('"Users_id_seq"', 12, true);


--
-- Name: Dancers Dancers_pkey; Type: CONSTRAINT; Schema: public; Owner: mikaelaustin
--

ALTER TABLE ONLY "Dancers"
    ADD CONSTRAINT "Dancers_pkey" PRIMARY KEY (id);


--
-- Name: Masterlists Masterlists_pkey; Type: CONSTRAINT; Schema: public; Owner: mikaelaustin
--

ALTER TABLE ONLY "Masterlists"
    ADD CONSTRAINT "Masterlists_pkey" PRIMARY KEY (id);


--
-- Name: Sessions Sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: mikaelaustin
--

ALTER TABLE ONLY "Sessions"
    ADD CONSTRAINT "Sessions_pkey" PRIMARY KEY (sid);


--
-- Name: Users Users_email_key; Type: CONSTRAINT; Schema: public; Owner: mikaelaustin
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: mikaelaustin
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: Users Users_username_key; Type: CONSTRAINT; Schema: public; Owner: mikaelaustin
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_username_key" UNIQUE (username);


--
-- PostgreSQL database dump complete
--

