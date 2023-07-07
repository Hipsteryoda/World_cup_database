--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    round character varying(50) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
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
    name character varying(50) NOT NULL
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

INSERT INTO public.games VALUES (60, 2018, 'Final', 175, 176, 4, 2);
INSERT INTO public.games VALUES (61, 2018, 'Third Place', 177, 178, 2, 0);
INSERT INTO public.games VALUES (62, 2018, 'Semi-Final', 176, 178, 2, 1);
INSERT INTO public.games VALUES (63, 2018, 'Semi-Final', 175, 177, 1, 0);
INSERT INTO public.games VALUES (64, 2018, 'Quarter-Final', 176, 179, 3, 2);
INSERT INTO public.games VALUES (65, 2018, 'Quarter-Final', 178, 180, 2, 0);
INSERT INTO public.games VALUES (66, 2018, 'Quarter-Final', 177, 181, 2, 1);
INSERT INTO public.games VALUES (67, 2018, 'Quarter-Final', 175, 182, 2, 0);
INSERT INTO public.games VALUES (68, 2018, 'Eighth-Final', 178, 183, 2, 1);
INSERT INTO public.games VALUES (69, 2018, 'Eighth-Final', 180, 184, 1, 0);
INSERT INTO public.games VALUES (70, 2018, 'Eighth-Final', 177, 185, 3, 2);
INSERT INTO public.games VALUES (71, 2018, 'Eighth-Final', 181, 186, 2, 0);
INSERT INTO public.games VALUES (72, 2018, 'Eighth-Final', 176, 187, 2, 1);
INSERT INTO public.games VALUES (73, 2018, 'Eighth-Final', 179, 188, 2, 1);
INSERT INTO public.games VALUES (74, 2018, 'Eighth-Final', 182, 189, 2, 1);
INSERT INTO public.games VALUES (75, 2018, 'Eighth-Final', 175, 190, 4, 3);
INSERT INTO public.games VALUES (76, 2014, 'Final', 191, 190, 1, 0);
INSERT INTO public.games VALUES (77, 2014, 'Third Place', 192, 181, 3, 0);
INSERT INTO public.games VALUES (78, 2014, 'Semi-Final', 190, 192, 1, 0);
INSERT INTO public.games VALUES (79, 2014, 'Semi-Final', 191, 181, 7, 1);
INSERT INTO public.games VALUES (80, 2014, 'Quarter-Final', 192, 193, 1, 0);
INSERT INTO public.games VALUES (81, 2014, 'Quarter-Final', 190, 177, 1, 0);
INSERT INTO public.games VALUES (82, 2014, 'Quarter-Final', 181, 183, 2, 1);
INSERT INTO public.games VALUES (83, 2014, 'Quarter-Final', 191, 175, 1, 0);
INSERT INTO public.games VALUES (84, 2014, 'Eighth-Final', 181, 194, 2, 1);
INSERT INTO public.games VALUES (85, 2014, 'Eighth-Final', 183, 182, 2, 0);
INSERT INTO public.games VALUES (86, 2014, 'Eighth-Final', 175, 195, 2, 0);
INSERT INTO public.games VALUES (87, 2014, 'Eighth-Final', 191, 196, 2, 1);
INSERT INTO public.games VALUES (88, 2014, 'Eighth-Final', 192, 186, 2, 1);
INSERT INTO public.games VALUES (89, 2014, 'Eighth-Final', 193, 197, 2, 1);
INSERT INTO public.games VALUES (90, 2014, 'Eighth-Final', 190, 184, 1, 0);
INSERT INTO public.games VALUES (91, 2014, 'Eighth-Final', 177, 198, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (175, 'France');
INSERT INTO public.teams VALUES (176, 'Croatia');
INSERT INTO public.teams VALUES (177, 'Belgium');
INSERT INTO public.teams VALUES (178, 'England');
INSERT INTO public.teams VALUES (179, 'Russia');
INSERT INTO public.teams VALUES (180, 'Sweden');
INSERT INTO public.teams VALUES (181, 'Brazil');
INSERT INTO public.teams VALUES (182, 'Uruguay');
INSERT INTO public.teams VALUES (183, 'Colombia');
INSERT INTO public.teams VALUES (184, 'Switzerland');
INSERT INTO public.teams VALUES (185, 'Japan');
INSERT INTO public.teams VALUES (186, 'Mexico');
INSERT INTO public.teams VALUES (187, 'Denmark');
INSERT INTO public.teams VALUES (188, 'Spain');
INSERT INTO public.teams VALUES (189, 'Portugal');
INSERT INTO public.teams VALUES (190, 'Argentina');
INSERT INTO public.teams VALUES (191, 'Germany');
INSERT INTO public.teams VALUES (192, 'Netherlands');
INSERT INTO public.teams VALUES (193, 'Costa Rica');
INSERT INTO public.teams VALUES (194, 'Chile');
INSERT INTO public.teams VALUES (195, 'Nigeria');
INSERT INTO public.teams VALUES (196, 'Algeria');
INSERT INTO public.teams VALUES (197, 'Greece');
INSERT INTO public.teams VALUES (198, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 91, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 198, true);


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

