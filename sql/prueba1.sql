--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: aud_users_func(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION aud_users_func() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	begin
		IF TG_OP = 'DELETE' THEN
			INSERT INTO aud_users (usr, pwd, nombre, mail, num_id, estado, operacion, usuario)
			VALUES (OLD.usr, OLD.pwd, OLD.nombre, OLD.mail, OLD.num_id, OLD.estado, TG_OP, current_user);
		END IF; 
		IF (TG_OP = 'INSERT' OR  TG_OP = 'UPDATE') THEN
			INSERT INTO aud_users (usr, pwd, nombre, mail, num_id, estado, operacion, usuario)
			VALUES (NEW.usr, NEW.pwd, NEW.nombre, NEW.mail,  NEW.num_id, NEW.estado, TG_OP, current_user);
		END IF;	
	return null;
end; $$;


ALTER FUNCTION public.aud_users_func() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: a; Type: TABLE; Schema: public; Owner: jbossuser; Tablespace: 
--

CREATE TABLE a (
    a integer,
    b integer
);


ALTER TABLE public.a OWNER TO jbossuser;

--
-- Name: archivo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE archivo (
    nombre character varying(100) NOT NULL,
    nombre_archivo character varying(2000) NOT NULL,
    nombre_jasper character varying(1000) NOT NULL,
    id_tipo_archivo integer NOT NULL,
    id_reporte integer
);


ALTER TABLE public.archivo OWNER TO postgres;

--
-- Name: aud_mail; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE aud_mail (
    id bigint NOT NULL,
    destinatario character varying(1000) NOT NULL,
    asunto character varying(1000) NOT NULL,
    mensaje text NOT NULL,
    fecha_hora timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.aud_mail OWNER TO postgres;

--
-- Name: aud_mail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE aud_mail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aud_mail_id_seq OWNER TO postgres;

--
-- Name: aud_mail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE aud_mail_id_seq OWNED BY aud_mail.id;


--
-- Name: aud_sesion; Type: TABLE; Schema: public; Owner: jbossuser; Tablespace: 
--

CREATE TABLE aud_sesion (
    id bigint NOT NULL,
    usr character varying(300) NOT NULL,
    operacion character varying(10) NOT NULL,
    fecha_hora timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.aud_sesion OWNER TO jbossuser;

--
-- Name: aud_sesion_id_seq; Type: SEQUENCE; Schema: public; Owner: jbossuser
--

CREATE SEQUENCE aud_sesion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aud_sesion_id_seq OWNER TO jbossuser;

--
-- Name: aud_sesion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jbossuser
--

ALTER SEQUENCE aud_sesion_id_seq OWNED BY aud_sesion.id;


--
-- Name: aud_users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE aud_users (
    id bigint NOT NULL,
    usr character varying(300),
    pwd character varying(250),
    nombre character varying(1500),
    mail character varying(1500),
    estado integer,
    fecha_hora timestamp without time zone DEFAULT now() NOT NULL,
    operacion character varying(1500),
    usuario character varying(1500),
    num_id character varying(25)
);


ALTER TABLE public.aud_users OWNER TO postgres;

--
-- Name: aud_users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE aud_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aud_users_id_seq OWNER TO postgres;

--
-- Name: aud_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE aud_users_id_seq OWNED BY aud_users.id;


--
-- Name: b; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE b (
    a integer,
    b integer
);


ALTER TABLE public.b OWNER TO postgres;

--
-- Name: campos_formulario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE campos_formulario (
    id integer NOT NULL,
    id_formulario integer NOT NULL
);


ALTER TABLE public.campos_formulario OWNER TO postgres;

--
-- Name: campos_formulario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE campos_formulario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.campos_formulario_id_seq OWNER TO postgres;

--
-- Name: campos_formulario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE campos_formulario_id_seq OWNED BY campos_formulario.id;


--
-- Name: campos_validacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE campos_validacion (
    id integer NOT NULL,
    id_campo integer,
    id_validacion integer
);


ALTER TABLE public.campos_validacion OWNER TO postgres;

--
-- Name: campos_validacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE campos_validacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.campos_validacion_id_seq OWNER TO postgres;

--
-- Name: campos_validacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE campos_validacion_id_seq OWNED BY campos_validacion.id;


--
-- Name: data; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE data (
    nombre character varying(100) NOT NULL,
    descripcion character varying(1000),
    id integer NOT NULL
);


ALTER TABLE public.data OWNER TO postgres;

--
-- Name: festivos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE festivos (
    fecha date NOT NULL
);


ALTER TABLE public.festivos OWNER TO postgres;

--
-- Name: formulario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE formulario (
    id integer NOT NULL,
    nombre character varying(250) NOT NULL,
    descripcion text NOT NULL
);


ALTER TABLE public.formulario OWNER TO postgres;

--
-- Name: formulario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE formulario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.formulario_id_seq OWNER TO postgres;

--
-- Name: formulario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE formulario_id_seq OWNED BY formulario.id;


--
-- Name: group_rol; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE group_rol (
    id integer NOT NULL,
    id_rol bigint NOT NULL,
    id_group bigint NOT NULL
);


ALTER TABLE public.group_rol OWNER TO postgres;

--
-- Name: group_rol_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE group_rol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_rol_id_seq OWNER TO postgres;

--
-- Name: group_rol_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE group_rol_id_seq OWNED BY group_rol.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE groups (
    id bigint NOT NULL,
    codigo character varying(100) NOT NULL,
    descripcion character varying(300)
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


--
-- Name: idiomas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE idiomas (
    id character varying(2) NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.idiomas OWNER TO postgres;

--
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE menu (
    id bigint NOT NULL,
    nombre character varying(2000) NOT NULL,
    id_menu bigint,
    idioma character varying(2),
    descripcion character varying(2000)
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- Name: menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_id_seq OWNER TO postgres;

--
-- Name: menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE menu_id_seq OWNED BY menu.id;


--
-- Name: parametro; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE parametro (
    id bigint NOT NULL,
    nombre character varying(50) NOT NULL,
    valor text NOT NULL,
    tipo character varying(20)
);


ALTER TABLE public.parametro OWNER TO postgres;

--
-- Name: parametro_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE parametro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parametro_id_seq OWNER TO postgres;

--
-- Name: parametro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE parametro_id_seq OWNED BY parametro.id;


--
-- Name: parametros_reporte; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE parametros_reporte (
    nombre character varying(100) NOT NULL,
    etiqueta character varying(1000) NOT NULL,
    id_tipo integer NOT NULL,
    id integer NOT NULL,
    id_data integer,
    id_reporte integer
);


ALTER TABLE public.parametros_reporte OWNER TO postgres;

--
-- Name: reporte; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reporte (
    nombre character varying(100) NOT NULL,
    roles text DEFAULT 'ALL'::text NOT NULL,
    id_proceso integer,
    id integer NOT NULL
);


ALTER TABLE public.reporte OWNER TO postgres;

--
-- Name: resource; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE resource (
    id bigint NOT NULL,
    nombre character varying(2000) NOT NULL,
    descripcion character varying(300),
    id_menu bigint NOT NULL,
    url character varying(500) NOT NULL,
    idioma character varying(2)
);


ALTER TABLE public.resource OWNER TO postgres;

--
-- Name: resource_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE resource_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resource_id_seq OWNER TO postgres;

--
-- Name: resource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE resource_id_seq OWNED BY resource.id;


--
-- Name: rol; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rol (
    id bigint NOT NULL,
    codigo character varying(100) NOT NULL,
    descripcion character varying(2000)
);


ALTER TABLE public.rol OWNER TO postgres;

--
-- Name: rol_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rol_id_seq OWNER TO postgres;

--
-- Name: rol_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rol_id_seq OWNED BY rol.id;


--
-- Name: rol_resource; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rol_resource (
    id bigint NOT NULL,
    id_resource bigint NOT NULL,
    id_rol bigint
);


ALTER TABLE public.rol_resource OWNER TO postgres;

--
-- Name: rol_resource_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rol_resource_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rol_resource_id_seq OWNER TO postgres;

--
-- Name: rol_resource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rol_resource_id_seq OWNED BY rol_resource.id;


--
-- Name: tipo_archivo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_archivo (
    id integer NOT NULL,
    tipo character varying(100)
);


ALTER TABLE public.tipo_archivo OWNER TO postgres;

--
-- Name: tipo_id; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_id (
    id integer NOT NULL,
    codigo character varying(100)
);


ALTER TABLE public.tipo_id OWNER TO postgres;

--
-- Name: tipo_parametro_reporte; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_parametro_reporte (
    tipo character varying(100) NOT NULL,
    id integer NOT NULL,
    descripcion character varying(1000)
);


ALTER TABLE public.tipo_parametro_reporte OWNER TO postgres;

--
-- Name: tipo_proceso_reporte; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_proceso_reporte (
    id integer NOT NULL,
    nombre character varying(1000)
);


ALTER TABLE public.tipo_proceso_reporte OWNER TO postgres;

--
-- Name: user_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE user_group (
    id integer NOT NULL,
    id_user bigint NOT NULL,
    id_group bigint NOT NULL
);


ALTER TABLE public.user_group OWNER TO postgres;

--
-- Name: user_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_group_id_seq OWNER TO postgres;

--
-- Name: user_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_group_id_seq OWNED BY user_group.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id bigint NOT NULL,
    usr character varying(300) NOT NULL,
    pwd character varying(250) NOT NULL,
    nombre character varying(1500),
    mail character varying(1500),
    estado integer NOT NULL,
    cod_restauracion character varying(255),
    clave character varying(255),
    nro_usuario character varying(25),
    num_id character varying(25)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: validaciones_formulario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE validaciones_formulario (
    id integer NOT NULL,
    id_campo_formulario integer NOT NULL
);


ALTER TABLE public.validaciones_formulario OWNER TO postgres;

--
-- Name: validaciones_formulario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE validaciones_formulario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.validaciones_formulario_id_seq OWNER TO postgres;

--
-- Name: validaciones_formulario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE validaciones_formulario_id_seq OWNED BY validaciones_formulario.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aud_mail ALTER COLUMN id SET DEFAULT nextval('aud_mail_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jbossuser
--

ALTER TABLE ONLY aud_sesion ALTER COLUMN id SET DEFAULT nextval('aud_sesion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aud_users ALTER COLUMN id SET DEFAULT nextval('aud_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY campos_formulario ALTER COLUMN id SET DEFAULT nextval('campos_formulario_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY campos_validacion ALTER COLUMN id SET DEFAULT nextval('campos_validacion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY formulario ALTER COLUMN id SET DEFAULT nextval('formulario_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY group_rol ALTER COLUMN id SET DEFAULT nextval('group_rol_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menu ALTER COLUMN id SET DEFAULT nextval('menu_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY parametro ALTER COLUMN id SET DEFAULT nextval('parametro_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource ALTER COLUMN id SET DEFAULT nextval('resource_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rol ALTER COLUMN id SET DEFAULT nextval('rol_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rol_resource ALTER COLUMN id SET DEFAULT nextval('rol_resource_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_group ALTER COLUMN id SET DEFAULT nextval('user_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY validaciones_formulario ALTER COLUMN id SET DEFAULT nextval('validaciones_formulario_id_seq'::regclass);


--
-- Data for Name: a; Type: TABLE DATA; Schema: public; Owner: jbossuser
--

COPY a (a, b) FROM stdin;
\.


--
-- Data for Name: archivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY archivo (nombre, nombre_archivo, nombre_jasper, id_tipo_archivo, id_reporte) FROM stdin;
A1	P{fechaIni}.replaceAll("(\\d{4})-(\\d{2})-(\\d{2})", "$1$2$3");P{fechaFin}.replaceAll("(\\d{4})-(\\d{2})-(\\d{2})","$1$2$3");.PDF	rep1.jasper	2	1
\.


--
-- Data for Name: aud_mail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY aud_mail (id, destinatario, asunto, mensaje, fecha_hora) FROM stdin;
2	jerviver@hotmail.com	Prueba plantilla mail 2	Hola	2013-05-05 11:45:29.119
3	jerviver@hotmail.com	Prueba plantilla mail 3	a	2013-05-05 11:53:07.887
4	jerviver@hotmail.com	Prueba plantilla mail 4	4	2013-05-05 11:58:47.633
5	jerviver21@hotmail.com	p	p	2013-05-05 12:05:23.888
6	jerviver21@hotmail.com	p1	p1	2013-05-05 12:06:14.835
7	bejar.gabriela@gmail.com	Love you!	Hola mi amor!\r\nComo va tu dia? te estoy enviando un mensaje desde mi sistema es para probar el sistema y de paso decirte que te amo!!!\r\n\r\nBye,\r\n\r\nPd: estudia, y recuerda que tu eres el pilar de la familia, si tu no trabajas, nos quebramos!	2013-05-05 12:14:57.639
8	jerviver21@hotmail.com	Restauracion Clave Medical History System!	Ingrese a la Dirección : \n http://localhost:8080/template/restaura_clave.xhtml/usuarios/restaura_clave.xhtml \n\n Utilice el siguiente código para restaurar su clave:1231349684	2013-06-10 10:14:21.917
9	jerviver21@gmail.com	Activacion Usuario Sistema	Ingrese a la Dirección : \n http://localhost:8080/template/registro/activacion.xhtml \n\n Active el siguiente Nro de Usuario:131400000018\n( Copie el nro de licencia en el campo y presione el boton activar) \n\n\n Paideia Software. (Hacemos el mejor software!) \n\n Correo Automático por favor no responda a este correo.	2013-08-28 16:51:15.073
10	jerviver21@hotmail.com	Prueba	Hola Jerson	2013-09-04 12:27:46.054
11	jerviver21@gmail.com	Restauracion Clave Medical History System!	Ingrese a la Dirección : \n http://localhost:8080/usuarios/restaura_clave.xhtml \n\n Utilice el siguiente código para restaurar su clave:1057053783	2013-09-04 13:02:43.582
\.


--
-- Name: aud_mail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('aud_mail_id_seq', 11, true);


--
-- Data for Name: aud_sesion; Type: TABLE DATA; Schema: public; Owner: jbossuser
--

COPY aud_sesion (id, usr, operacion, fecha_hora) FROM stdin;
1	admin	INICIO	2013-05-01 11:40:58.516758
2	admin	FIN	2013-05-01 11:41:01.772712
3	admin	INICIO	2013-05-01 11:41:06.964551
4	admin	FIN	2013-05-01 11:55:15.598568
5	admin	INICIO	2013-05-01 11:57:36.398194
6	admin	FIN	2013-05-01 11:59:37.501201
7	guest	INICIO	2013-05-01 11:59:44.156003
8	guest	FIN	2013-05-01 12:11:25.950903
9	admin	INICIO	2013-05-01 12:16:35.825788
10	admin	FIN	2013-05-01 12:16:38.420371
11	admin	INICIO	2013-05-01 12:23:09.929701
12	admin	FIN	2013-05-01 12:46:41.911251
13	admin	INICIO	2013-05-02 13:59:22.917047
14	admin	FIN	2013-05-02 13:59:27.479591
15	admin	INICIO	2013-05-02 14:06:32.10003
16	admin	FIN	2013-05-02 14:06:35.444274
17	admin	INICIO	2013-05-02 14:06:48.391156
18	admin	FIN	2013-05-02 14:06:50.925313
19	admin	INICIO	2013-05-02 14:09:31.899986
20	admin	FIN	2013-05-02 14:09:34.764718
21	admin	INICIO	2013-05-02 14:09:43.804069
22	admin	FIN	2013-05-02 14:09:45.49509
23	admin	INICIO	2013-05-02 14:15:16.764485
24	admin	FIN	2013-05-02 14:15:18.936831
25	admin	INICIO	2013-05-05 11:38:01.196265
26	admin	FIN	2013-05-05 11:40:42.718661
27	admin	INICIO	2013-05-05 11:41:53.313036
28	admin	FIN	2013-05-05 11:44:48.829704
29	admin	INICIO	2013-05-05 11:45:11.494272
30	admin	FIN	2013-05-05 11:52:21.418058
31	admin	INICIO	2013-05-05 11:52:43.924485
32	admin	FIN	2013-05-05 11:57:43.466615
33	admin	INICIO	2013-05-05 11:58:22.87885
34	admin	FIN	2013-05-05 12:04:22.136113
35	admin	INICIO	2013-05-05 12:04:44.9116
36	admin	FIN	2013-05-05 12:45:29.304933
37	admin	INICIO	2013-06-07 19:47:13.227082
38	admin	FIN	2013-06-07 19:47:46.254612
39	admin	INICIO	2013-06-07 19:47:57.447855
40	admin	FIN	2013-06-07 19:48:41.476452
41	jerviver21@hotmail.com	INICIO	2013-06-10 09:55:40.851577
42	jerviver21@hotmail.com	FIN	2013-06-10 09:55:45.214902
43	admin	INICIO	2013-06-10 10:13:51.894898
44	admin	FIN	2013-06-10 10:13:58.225589
45	jerviver21@hotmail.com	INICIO	2013-06-10 10:15:47.677358
46	jerviver21@hotmail.com	FIN	2013-06-10 10:15:50.285204
47	admin	INICIO	2013-06-10 10:27:03.612191
48	admin	FIN	2013-06-10 10:57:37.253994
49	jerviver21@gmail.com	INICIO	2013-08-28 16:53:01.233795
50	jerviver21@gmail.com	FIN	2013-08-28 16:54:09.054768
51	jerviver21@gmail.com	INICIO	2013-08-28 16:54:39.546717
52	jerviver21@gmail.com	FIN	2013-08-28 16:57:26.368327
53	jerviver21@gmail.com	INICIO	2013-08-28 16:57:51.299916
54	jerviver21@gmail.com	FIN	2013-08-28 16:58:04.556731
55	admin	INICIO	2013-08-28 16:58:13.560799
56	admin	FIN	2013-08-28 17:00:18.288063
57	admin	INICIO	2013-08-28 17:00:45.983824
58	admin	FIN	2013-08-28 17:03:20.082541
59	admin	INICIO	2013-08-28 17:03:40.763277
60	admin	FIN	2013-08-28 17:03:57.106195
61	admin	INICIO	2013-08-28 17:05:16.145525
62	admin	FIN	2013-08-28 17:35:31.144414
63	admin	INICIO	2013-08-28 18:50:55.279012
64	admin	FIN	2013-08-28 18:54:50.747171
65	admin	INICIO	2013-08-28 18:55:19.576601
66	admin	FIN	2013-08-28 19:26:01.251138
67	admin	INICIO	2013-09-04 12:27:02.669066
68	admin	INICIO	2013-09-04 12:29:01.638307
69	admin	FIN	2013-09-04 12:29:30.107744
70	admin	FIN	2013-09-04 12:39:50.381647
71	jerviver21@gmail.com	INICIO	2013-09-04 13:05:11.418183
72	jerviver21@gmail.com	FIN	2013-09-04 13:05:18.481773
73	admin	INICIO	2013-09-04 18:35:39.140658
\.


--
-- Name: aud_sesion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jbossuser
--

SELECT pg_catalog.setval('aud_sesion_id_seq', 73, true);


--
-- Data for Name: aud_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY aud_users (id, usr, pwd, nombre, mail, estado, fecha_hora, operacion, usuario, num_id) FROM stdin;
\.


--
-- Name: aud_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('aud_users_id_seq', 1, false);


--
-- Data for Name: b; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY b (a, b) FROM stdin;
\.


--
-- Data for Name: campos_formulario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY campos_formulario (id, id_formulario) FROM stdin;
\.


--
-- Name: campos_formulario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('campos_formulario_id_seq', 1, false);


--
-- Data for Name: campos_validacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY campos_validacion (id, id_campo, id_validacion) FROM stdin;
\.


--
-- Name: campos_validacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('campos_validacion_id_seq', 1, false);


--
-- Data for Name: data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY data (nombre, descripcion, id) FROM stdin;
TIPOS_ID	Representa los tipos de identificación que puede tener una persona	1
\.


--
-- Data for Name: festivos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY festivos (fecha) FROM stdin;
\.


--
-- Data for Name: formulario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY formulario (id, nombre, descripcion) FROM stdin;
\.


--
-- Name: formulario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('formulario_id_seq', 1, false);


--
-- Data for Name: group_rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY group_rol (id, id_rol, id_group) FROM stdin;
3	1	1
4	2	1
7	2	2
\.


--
-- Name: group_rol_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('group_rol_id_seq', 7, true);


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY groups (id, codigo, descripcion) FROM stdin;
1	MASTER	
2	USUARIOS	
\.


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('groups_id_seq', 2, true);


--
-- Data for Name: idiomas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY idiomas (id, nombre) FROM stdin;
es	ESPAÑOL
en	INGLES
\.


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY menu (id, nombre, id_menu, idioma, descripcion) FROM stdin;
1	RAIZ	\N	es	\N
405	Generals	1	en	\N
406	Reports	1	en	\N
407	Adm. Users	1	en	\N
408	General	1	es	\N
409	Reportes	1	es	\N
410	Admin Usuarios	1	es	\N
\.


--
-- Name: menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('menu_id_seq', 410, true);


--
-- Data for Name: parametro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY parametro (id, nombre, valor, tipo) FROM stdin;
1	rolMaster	MASTER	AU
2	rutaLog	OPENSHIFT_TMP_DIR/log	LOG1
3	rutaDescarga	OPENSHIFT_TMP_DIR/descargas	FILE
4	rutaReporte	OPENSHIFT_DATA_DIR/reportes	FILE
6	smtp_host	smtp.gmail.com	MAIL
7	smtp_port	587	MAIL
8	smtp_user	jerviver21@gmail.com	MAIL
9	smtp_clave	T8SbPS8aD9j8JJLC4DnLZg==	MAIL
14	url	http://localhost:8080	APP
\.


--
-- Name: parametro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('parametro_id_seq', 14, true);


--
-- Data for Name: parametros_reporte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY parametros_reporte (nombre, etiqueta, id_tipo, id, id_data, id_reporte) FROM stdin;
fechaIni	P1	3	1	\N	1
fechaFin	P2	3	2	\N	1
\.


--
-- Data for Name: reporte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reporte (nombre, roles, id_proceso, id) FROM stdin;
R1	ROLE_ADMIN, ROLE_USER	1	1
\.


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY resource (id, nombre, descripcion, id_menu, url, idioma) FROM stdin;
1677	Params	\N	405	/general/parametros.xhtml	en
1678	Log	\N	405	/general/log.xhtml	en
1679	DB	\N	405	/general/adminBD.xhtml	en
1680	Reports	\N	405	/reportes/reportes.xhtml	en
1681	Users	\N	407	/usuarios/usuarios.xhtml	en
1682	Menus	\N	407	/usuarios/menus.xhtml	en
1683	Groups	\N	407	/usuarios/grupos.xhtml	en
1684	Roles	\N	407	/usuarios/roles.xhtml	en
1685	Resources	\N	407	/usuarios/recursos.xhtml	en
1686	Look and Feel	\N	405	/general/lookandfeel.xhtml	en
1687	Change password	\N	1	/general/change_password.xhtml	en
1688	Change Language	\N	1	/general/cambiar_idioma.xhtml	en
1689	Recursos	\N	410	/usuarios/recursos.xhtml	es
1690	Enviar Mail	\N	405	/general/mail.xhtml	en
1691	Presentación	\N	408	/general/lookandfeel.xhtml	es
1692	Enviar Mail	\N	408	/general/mail.xhtml	es
1693	Parametros	\N	408	/general/parametros.xhtml	es
1694	Log	\N	408	/general/log.xhtml	es
1695	BD	\N	408	/general/adminBD.xhtml	es
1696	Reportes	\N	408	/reportes/reportes.xhtml	es
1697	Usuarios	\N	410	/usuarios/usuarios.xhtml	es
1698	Menus	\N	410	/usuarios/menus.xhtml	es
1699	Grupos	\N	410	/usuarios/grupos.xhtml	es
1700	Roles	\N	410	/usuarios/roles.xhtml	es
1701	Cambiar Clave	\N	1	/general/cambiar_clave.xhtml	es
1702	Cambiar Idioma	\N	1	/general/cambiar_idioma.xhtml	es
\.


--
-- Name: resource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('resource_id_seq', 1702, true);


--
-- Data for Name: rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rol (id, codigo, descripcion) FROM stdin;
1	MASTER	
2	ROLE_USER	
\.


--
-- Name: rol_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rol_id_seq', 2, true);


--
-- Data for Name: rol_resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rol_resource (id, id_resource, id_rol) FROM stdin;
1940	1677	1
1941	1678	1
1942	1679	1
1943	1680	1
1944	1681	1
1945	1682	1
1946	1683	1
1947	1684	1
1948	1685	1
1949	1686	1
1950	1687	1
1951	1687	2
1952	1688	1
1953	1688	2
1954	1689	1
1955	1690	1
1956	1691	1
1957	1692	1
1958	1693	1
1959	1694	1
1960	1695	1
1961	1696	1
1962	1697	1
1963	1698	1
1964	1699	1
1965	1700	1
1966	1701	1
1967	1701	2
1968	1702	1
1969	1702	2
\.


--
-- Name: rol_resource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rol_resource_id_seq', 1969, true);


--
-- Data for Name: tipo_archivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_archivo (id, tipo) FROM stdin;
1	XLS
2	PDF
3	TXT
\.


--
-- Data for Name: tipo_id; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_id (id, codigo) FROM stdin;
1	CC
2	NIT
3	CE
\.


--
-- Data for Name: tipo_parametro_reporte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_parametro_reporte (tipo, id, descripcion) FROM stdin;
NUMERIC	1	Representa valores numéricos: int, long, double, float
TEXT	2	Representa cadenas de texto
DATE	3	Representa Fechas
TIME	4	Representa Horas
DATA	5	Representa tablas multivaluadas, como municipios, tipos de id, etc; DEBE EXISTIR UNA TABLA que las represente
\.


--
-- Data for Name: tipo_proceso_reporte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_proceso_reporte (id, nombre) FROM stdin;
1	REPORTES
2	ARCHIVOS
\.


--
-- Data for Name: user_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_group (id, id_user, id_group) FROM stdin;
1	1	1
2	16	2
3	17	2
4	18	2
\.


--
-- Name: user_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_group_id_seq', 4, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, usr, pwd, nombre, mail, estado, cod_restauracion, clave, nro_usuario, num_id) FROM stdin;
1	admin	d033e22ae348aeb5660fc2140aec35850c4da997	JERSON VIVEROS AGUIRRE	jerviver21@gmail.com	1	\N	\N	\N	\N
16	guest	35675e68f4b5af7b995d9205ad0fc43842f16450			1	\N	\N	\N	\N
17	jerviver21@hotmail.com	8095ee69d09e2787c443560959455804afc24d72	JERSON VIVEROS	jerviver21@hotmail.com	1	\N	gHveiA64t/rnzyZkhK7/vQ==	\N	\N
18	jerviver21@gmail.com	8095ee69d09e2787c443560959455804afc24d72	JERSON VIVEROS	jerviver21@gmail.com	1	\N	gHveiA64t/rnzyZkhK7/vQ==	131400000018	16942249
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 18, true);


--
-- Data for Name: validaciones_formulario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY validaciones_formulario (id, id_campo_formulario) FROM stdin;
\.


--
-- Name: validaciones_formulario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('validaciones_formulario_id_seq', 1, false);


--
-- Name: archivo_fk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY archivo
    ADD CONSTRAINT archivo_fk PRIMARY KEY (nombre);


--
-- Name: aud_mail_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY aud_mail
    ADD CONSTRAINT aud_mail_pk PRIMARY KEY (id);


--
-- Name: aud_sesion_pk; Type: CONSTRAINT; Schema: public; Owner: jbossuser; Tablespace: 
--

ALTER TABLE ONLY aud_sesion
    ADD CONSTRAINT aud_sesion_pk PRIMARY KEY (id);


--
-- Name: aud_users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY aud_users
    ADD CONSTRAINT aud_users_pk PRIMARY KEY (id);


--
-- Name: campos_formulario_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY campos_formulario
    ADD CONSTRAINT campos_formulario_pk PRIMARY KEY (id);


--
-- Name: campos_validaciones_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY campos_validacion
    ADD CONSTRAINT campos_validaciones_pk PRIMARY KEY (id);


--
-- Name: data_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY data
    ADD CONSTRAINT data_pk PRIMARY KEY (id);


--
-- Name: festivos_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY festivos
    ADD CONSTRAINT festivos_pk PRIMARY KEY (fecha);


--
-- Name: formularios_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY formulario
    ADD CONSTRAINT formularios_pk PRIMARY KEY (id);


--
-- Name: group_rol_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY group_rol
    ADD CONSTRAINT group_rol_pk PRIMARY KEY (id);


--
-- Name: idiomas_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY idiomas
    ADD CONSTRAINT idiomas_pk PRIMARY KEY (id);


--
-- Name: menu_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_pk PRIMARY KEY (id);


--
-- Name: parametro_reporte_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY parametros_reporte
    ADD CONSTRAINT parametro_reporte_pk PRIMARY KEY (id);


--
-- Name: parametros_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY parametro
    ADD CONSTRAINT parametros_pk PRIMARY KEY (id);


--
-- Name: perfil_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rol
    ADD CONSTRAINT perfil_pk PRIMARY KEY (id);


--
-- Name: perfil_recurso_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rol_resource
    ADD CONSTRAINT perfil_recurso_pk PRIMARY KEY (id);


--
-- Name: procesos_reportes_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_proceso_reporte
    ADD CONSTRAINT procesos_reportes_pk PRIMARY KEY (id);


--
-- Name: recurso_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT recurso_pk PRIMARY KEY (id);


--
-- Name: reporte_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reporte
    ADD CONSTRAINT reporte_pk PRIMARY KEY (id);


--
-- Name: rol_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT rol_pk PRIMARY KEY (id);


--
-- Name: tipo_archivo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_archivo
    ADD CONSTRAINT tipo_archivo_pk PRIMARY KEY (id);


--
-- Name: tipo_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_id
    ADD CONSTRAINT tipo_id_pk PRIMARY KEY (id);


--
-- Name: tipo_parametro_reporte_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_parametro_reporte
    ADD CONSTRAINT tipo_parametro_reporte_pk PRIMARY KEY (id);


--
-- Name: user_group_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY user_group
    ADD CONSTRAINT user_group_pk PRIMARY KEY (id);


--
-- Name: usuario_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT usuario_pk PRIMARY KEY (id);


--
-- Name: validaciones_formulario_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY validaciones_formulario
    ADD CONSTRAINT validaciones_formulario_pk PRIMARY KEY (id);


--
-- Name: campos_validaciones_ui1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX campos_validaciones_ui1 ON campos_validacion USING btree (id_campo, id_validacion);


--
-- Name: menu_ui1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX menu_ui1 ON menu USING btree (nombre);


--
-- Name: parametros_ui1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX parametros_ui1 ON parametro USING btree (nombre, tipo);


--
-- Name: perfil_ui1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX perfil_ui1 ON rol USING btree (codigo);


--
-- Name: recurso_ui1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX recurso_ui1 ON resource USING btree (nombre, id_menu);


--
-- Name: rol_ui1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX rol_ui1 ON groups USING btree (codigo);


--
-- Name: usuario_ui1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX usuario_ui1 ON users USING btree (usr);


--
-- Name: trg_aud_users; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_aud_users AFTER INSERT OR DELETE OR UPDATE ON users FOR EACH ROW EXECUTE PROCEDURE aud_users_func();


--
-- Name: arch_tipo_arch_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY archivo
    ADD CONSTRAINT arch_tipo_arch_fk FOREIGN KEY (id_tipo_archivo) REFERENCES tipo_archivo(id);


--
-- Name: archivo_reporte_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY archivo
    ADD CONSTRAINT archivo_reporte_fk FOREIGN KEY (id_reporte) REFERENCES reporte(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: data_param_rep_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY parametros_reporte
    ADD CONSTRAINT data_param_rep_fk FOREIGN KEY (id_data) REFERENCES data(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: group_group_rol_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY group_rol
    ADD CONSTRAINT group_group_rol_fk FOREIGN KEY (id_group) REFERENCES groups(id);


--
-- Name: group_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_group
    ADD CONSTRAINT group_user_fk FOREIGN KEY (id_group) REFERENCES groups(id);


--
-- Name: menu_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_fk FOREIGN KEY (id_menu) REFERENCES menu(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: param_rep_reporte_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY parametros_reporte
    ADD CONSTRAINT param_rep_reporte_fk FOREIGN KEY (id_reporte) REFERENCES reporte(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: param_tipo_param_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY parametros_reporte
    ADD CONSTRAINT param_tipo_param_fk FOREIGN KEY (id_tipo) REFERENCES tipo_parametro_reporte(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: recurso_menu_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT recurso_menu_fk FOREIGN KEY (id_menu) REFERENCES menu(id);


--
-- Name: reporte_proceso_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporte
    ADD CONSTRAINT reporte_proceso_fk FOREIGN KEY (id_proceso) REFERENCES tipo_proceso_reporte(id);


--
-- Name: resource_rol_res_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rol_resource
    ADD CONSTRAINT resource_rol_res_fk FOREIGN KEY (id_resource) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: rol_group_rol_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY group_rol
    ADD CONSTRAINT rol_group_rol_fk FOREIGN KEY (id_rol) REFERENCES rol(id);


--
-- Name: rol_rol_res_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rol_resource
    ADD CONSTRAINT rol_rol_res_fk FOREIGN KEY (id_rol) REFERENCES rol(id);


--
-- Name: user_group_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_group
    ADD CONSTRAINT user_group_fk FOREIGN KEY (id_user) REFERENCES users(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: aud_users_func(); Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON FUNCTION aud_users_func() FROM PUBLIC;
REVOKE ALL ON FUNCTION aud_users_func() FROM postgres;
GRANT ALL ON FUNCTION aud_users_func() TO postgres;
GRANT ALL ON FUNCTION aud_users_func() TO PUBLIC;
GRANT ALL ON FUNCTION aud_users_func() TO jbossuser;


--
-- Name: a; Type: ACL; Schema: public; Owner: jbossuser
--

REVOKE ALL ON TABLE a FROM PUBLIC;
REVOKE ALL ON TABLE a FROM jbossuser;
GRANT ALL ON TABLE a TO jbossuser;


--
-- Name: archivo; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE archivo FROM PUBLIC;
REVOKE ALL ON TABLE archivo FROM postgres;
GRANT ALL ON TABLE archivo TO postgres;
GRANT ALL ON TABLE archivo TO jbossuser;


--
-- Name: b; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE b FROM PUBLIC;
REVOKE ALL ON TABLE b FROM postgres;
GRANT ALL ON TABLE b TO postgres;
GRANT ALL ON TABLE b TO jbossuser;


--
-- Name: campos_formulario; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE campos_formulario FROM PUBLIC;
REVOKE ALL ON TABLE campos_formulario FROM postgres;
GRANT ALL ON TABLE campos_formulario TO postgres;
GRANT ALL ON TABLE campos_formulario TO jbossuser;


--
-- Name: campos_formulario_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE campos_formulario_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE campos_formulario_id_seq FROM postgres;
GRANT ALL ON SEQUENCE campos_formulario_id_seq TO postgres;
GRANT ALL ON SEQUENCE campos_formulario_id_seq TO jbossuser;


--
-- Name: campos_validacion; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE campos_validacion FROM PUBLIC;
REVOKE ALL ON TABLE campos_validacion FROM postgres;
GRANT ALL ON TABLE campos_validacion TO postgres;
GRANT ALL ON TABLE campos_validacion TO jbossuser;


--
-- Name: campos_validacion_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE campos_validacion_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE campos_validacion_id_seq FROM postgres;
GRANT ALL ON SEQUENCE campos_validacion_id_seq TO postgres;
GRANT ALL ON SEQUENCE campos_validacion_id_seq TO jbossuser;


--
-- Name: data; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE data FROM PUBLIC;
REVOKE ALL ON TABLE data FROM postgres;
GRANT ALL ON TABLE data TO postgres;
GRANT ALL ON TABLE data TO jbossuser;


--
-- Name: formulario; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE formulario FROM PUBLIC;
REVOKE ALL ON TABLE formulario FROM postgres;
GRANT ALL ON TABLE formulario TO postgres;
GRANT ALL ON TABLE formulario TO jbossuser;


--
-- Name: formulario_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE formulario_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE formulario_id_seq FROM postgres;
GRANT ALL ON SEQUENCE formulario_id_seq TO postgres;
GRANT ALL ON SEQUENCE formulario_id_seq TO jbossuser;


--
-- Name: group_rol; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE group_rol FROM PUBLIC;
REVOKE ALL ON TABLE group_rol FROM postgres;
GRANT ALL ON TABLE group_rol TO postgres;
GRANT ALL ON TABLE group_rol TO jbossuser;


--
-- Name: group_rol_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE group_rol_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE group_rol_id_seq FROM postgres;
GRANT ALL ON SEQUENCE group_rol_id_seq TO postgres;
GRANT ALL ON SEQUENCE group_rol_id_seq TO jbossuser;


--
-- Name: groups; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE groups FROM PUBLIC;
REVOKE ALL ON TABLE groups FROM postgres;
GRANT ALL ON TABLE groups TO postgres;
GRANT ALL ON TABLE groups TO jbossuser;


--
-- Name: groups_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE groups_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE groups_id_seq FROM postgres;
GRANT ALL ON SEQUENCE groups_id_seq TO postgres;
GRANT ALL ON SEQUENCE groups_id_seq TO jbossuser;


--
-- Name: idiomas; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE idiomas FROM PUBLIC;
REVOKE ALL ON TABLE idiomas FROM postgres;
GRANT ALL ON TABLE idiomas TO postgres;
GRANT ALL ON TABLE idiomas TO jbossuser;


--
-- Name: menu; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE menu FROM PUBLIC;
REVOKE ALL ON TABLE menu FROM postgres;
GRANT ALL ON TABLE menu TO postgres;
GRANT ALL ON TABLE menu TO jbossuser;


--
-- Name: menu_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE menu_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE menu_id_seq FROM postgres;
GRANT ALL ON SEQUENCE menu_id_seq TO postgres;
GRANT ALL ON SEQUENCE menu_id_seq TO jbossuser;


--
-- Name: parametro; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE parametro FROM PUBLIC;
REVOKE ALL ON TABLE parametro FROM postgres;
GRANT ALL ON TABLE parametro TO postgres;
GRANT ALL ON TABLE parametro TO jbossuser;


--
-- Name: parametro_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE parametro_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE parametro_id_seq FROM postgres;
GRANT ALL ON SEQUENCE parametro_id_seq TO postgres;
GRANT ALL ON SEQUENCE parametro_id_seq TO jbossuser;


--
-- Name: parametros_reporte; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE parametros_reporte FROM PUBLIC;
REVOKE ALL ON TABLE parametros_reporte FROM postgres;
GRANT ALL ON TABLE parametros_reporte TO postgres;
GRANT ALL ON TABLE parametros_reporte TO jbossuser;


--
-- Name: reporte; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE reporte FROM PUBLIC;
REVOKE ALL ON TABLE reporte FROM postgres;
GRANT ALL ON TABLE reporte TO postgres;
GRANT ALL ON TABLE reporte TO jbossuser;


--
-- Name: resource; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE resource FROM PUBLIC;
REVOKE ALL ON TABLE resource FROM postgres;
GRANT ALL ON TABLE resource TO postgres;
GRANT ALL ON TABLE resource TO jbossuser;


--
-- Name: resource_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE resource_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE resource_id_seq FROM postgres;
GRANT ALL ON SEQUENCE resource_id_seq TO postgres;
GRANT ALL ON SEQUENCE resource_id_seq TO jbossuser;


--
-- Name: rol; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE rol FROM PUBLIC;
REVOKE ALL ON TABLE rol FROM postgres;
GRANT ALL ON TABLE rol TO postgres;
GRANT ALL ON TABLE rol TO jbossuser;


--
-- Name: rol_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE rol_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE rol_id_seq FROM postgres;
GRANT ALL ON SEQUENCE rol_id_seq TO postgres;
GRANT ALL ON SEQUENCE rol_id_seq TO jbossuser;


--
-- Name: rol_resource; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE rol_resource FROM PUBLIC;
REVOKE ALL ON TABLE rol_resource FROM postgres;
GRANT ALL ON TABLE rol_resource TO postgres;
GRANT ALL ON TABLE rol_resource TO jbossuser;


--
-- Name: rol_resource_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE rol_resource_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE rol_resource_id_seq FROM postgres;
GRANT ALL ON SEQUENCE rol_resource_id_seq TO postgres;
GRANT ALL ON SEQUENCE rol_resource_id_seq TO jbossuser;


--
-- Name: tipo_archivo; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE tipo_archivo FROM PUBLIC;
REVOKE ALL ON TABLE tipo_archivo FROM postgres;
GRANT ALL ON TABLE tipo_archivo TO postgres;
GRANT ALL ON TABLE tipo_archivo TO jbossuser;


--
-- Name: tipo_id; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE tipo_id FROM PUBLIC;
REVOKE ALL ON TABLE tipo_id FROM postgres;
GRANT ALL ON TABLE tipo_id TO postgres;
GRANT ALL ON TABLE tipo_id TO jbossuser;


--
-- Name: tipo_parametro_reporte; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE tipo_parametro_reporte FROM PUBLIC;
REVOKE ALL ON TABLE tipo_parametro_reporte FROM postgres;
GRANT ALL ON TABLE tipo_parametro_reporte TO postgres;
GRANT ALL ON TABLE tipo_parametro_reporte TO jbossuser;


--
-- Name: tipo_proceso_reporte; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE tipo_proceso_reporte FROM PUBLIC;
REVOKE ALL ON TABLE tipo_proceso_reporte FROM postgres;
GRANT ALL ON TABLE tipo_proceso_reporte TO postgres;
GRANT ALL ON TABLE tipo_proceso_reporte TO jbossuser;


--
-- Name: user_group; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE user_group FROM PUBLIC;
REVOKE ALL ON TABLE user_group FROM postgres;
GRANT ALL ON TABLE user_group TO postgres;
GRANT ALL ON TABLE user_group TO jbossuser;


--
-- Name: user_group_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE user_group_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE user_group_id_seq FROM postgres;
GRANT ALL ON SEQUENCE user_group_id_seq TO postgres;
GRANT ALL ON SEQUENCE user_group_id_seq TO jbossuser;


--
-- Name: users; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM postgres;
GRANT ALL ON TABLE users TO postgres;
GRANT ALL ON TABLE users TO jbossuser;


--
-- Name: users_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE users_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE users_id_seq FROM postgres;
GRANT ALL ON SEQUENCE users_id_seq TO postgres;
GRANT ALL ON SEQUENCE users_id_seq TO jbossuser;


--
-- Name: validaciones_formulario; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE validaciones_formulario FROM PUBLIC;
REVOKE ALL ON TABLE validaciones_formulario FROM postgres;
GRANT ALL ON TABLE validaciones_formulario TO postgres;
GRANT ALL ON TABLE validaciones_formulario TO jbossuser;


--
-- Name: validaciones_formulario_id_seq; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON SEQUENCE validaciones_formulario_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE validaciones_formulario_id_seq FROM postgres;
GRANT ALL ON SEQUENCE validaciones_formulario_id_seq TO postgres;
GRANT ALL ON SEQUENCE validaciones_formulario_id_seq TO jbossuser;


--
-- PostgreSQL database dump complete
--

