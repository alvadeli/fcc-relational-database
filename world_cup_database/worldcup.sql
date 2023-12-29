--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)

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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(60) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    opponent_goals integer NOT NULL,
    winner_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(60) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (129, 2018, 'Final', 653, 654, 2, 4);
INSERT INTO public.games VALUES (130, 2018, 'Third Place', 655, 656, 0, 2);
INSERT INTO public.games VALUES (131, 2018, 'Semi-Final', 654, 656, 1, 2);
INSERT INTO public.games VALUES (132, 2018, 'Semi-Final', 653, 655, 0, 1);
INSERT INTO public.games VALUES (133, 2018, 'Quarter-Final', 654, 657, 2, 3);
INSERT INTO public.games VALUES (134, 2018, 'Quarter-Final', 656, 658, 0, 2);
INSERT INTO public.games VALUES (135, 2018, 'Quarter-Final', 655, 659, 1, 2);
INSERT INTO public.games VALUES (136, 2018, 'Quarter-Final', 653, 660, 0, 2);
INSERT INTO public.games VALUES (137, 2018, 'Eighth-Final', 656, 661, 1, 2);
INSERT INTO public.games VALUES (138, 2018, 'Eighth-Final', 658, 662, 0, 1);
INSERT INTO public.games VALUES (139, 2018, 'Eighth-Final', 655, 663, 2, 3);
INSERT INTO public.games VALUES (140, 2018, 'Eighth-Final', 659, 664, 0, 2);
INSERT INTO public.games VALUES (141, 2018, 'Eighth-Final', 654, 665, 1, 2);
INSERT INTO public.games VALUES (142, 2018, 'Eighth-Final', 657, 666, 1, 2);
INSERT INTO public.games VALUES (143, 2018, 'Eighth-Final', 660, 667, 1, 2);
INSERT INTO public.games VALUES (144, 2018, 'Eighth-Final', 653, 668, 3, 4);
INSERT INTO public.games VALUES (145, 2014, 'Final', 669, 668, 0, 1);
INSERT INTO public.games VALUES (146, 2014, 'Third Place', 670, 659, 0, 3);
INSERT INTO public.games VALUES (147, 2014, 'Semi-Final', 668, 670, 0, 1);
INSERT INTO public.games VALUES (148, 2014, 'Semi-Final', 669, 659, 1, 7);
INSERT INTO public.games VALUES (149, 2014, 'Quarter-Final', 670, 671, 0, 1);
INSERT INTO public.games VALUES (150, 2014, 'Quarter-Final', 668, 655, 0, 1);
INSERT INTO public.games VALUES (151, 2014, 'Quarter-Final', 659, 661, 1, 2);
INSERT INTO public.games VALUES (152, 2014, 'Quarter-Final', 669, 653, 0, 1);
INSERT INTO public.games VALUES (153, 2014, 'Eighth-Final', 659, 672, 1, 2);
INSERT INTO public.games VALUES (154, 2014, 'Eighth-Final', 661, 660, 0, 2);
INSERT INTO public.games VALUES (155, 2014, 'Eighth-Final', 653, 673, 0, 2);
INSERT INTO public.games VALUES (156, 2014, 'Eighth-Final', 669, 674, 1, 2);
INSERT INTO public.games VALUES (157, 2014, 'Eighth-Final', 670, 664, 1, 2);
INSERT INTO public.games VALUES (158, 2014, 'Eighth-Final', 671, 675, 1, 2);
INSERT INTO public.games VALUES (159, 2014, 'Eighth-Final', 668, 662, 0, 1);
INSERT INTO public.games VALUES (160, 2014, 'Eighth-Final', 655, 676, 1, 2);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (653, 'France');
INSERT INTO public.teams VALUES (654, 'Croatia');
INSERT INTO public.teams VALUES (655, 'Belgium');
INSERT INTO public.teams VALUES (656, 'England');
INSERT INTO public.teams VALUES (657, 'Russia');
INSERT INTO public.teams VALUES (658, 'Sweden');
INSERT INTO public.teams VALUES (659, 'Brazil');
INSERT INTO public.teams VALUES (660, 'Uruguay');
INSERT INTO public.teams VALUES (661, 'Colombia');
INSERT INTO public.teams VALUES (662, 'Switzerland');
INSERT INTO public.teams VALUES (663, 'Japan');
INSERT INTO public.teams VALUES (664, 'Mexico');
INSERT INTO public.teams VALUES (665, 'Denmark');
INSERT INTO public.teams VALUES (666, 'Spain');
INSERT INTO public.teams VALUES (667, 'Portugal');
INSERT INTO public.teams VALUES (668, 'Argentina');
INSERT INTO public.teams VALUES (669, 'Germany');
INSERT INTO public.teams VALUES (670, 'Netherlands');
INSERT INTO public.teams VALUES (671, 'Costa Rica');
INSERT INTO public.teams VALUES (672, 'Chile');
INSERT INTO public.teams VALUES (673, 'Nigeria');
INSERT INTO public.teams VALUES (674, 'Algeria');
INSERT INTO public.teams VALUES (675, 'Greece');
INSERT INTO public.teams VALUES (676, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 160, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 676, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

