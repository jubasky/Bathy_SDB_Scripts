CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;
CREATE EXTENSION pointcloud;
CREATE EXTENSION pointcloud_postgis;
INSERT INTO pointcloud_formats (pcid, srid, schema) VALUES (3, 4326, '<?xml version="1.0" encoding="UTF-8"?>
<pc:PointCloudSchema xmlns:pc="http://pointcloud.org/schemas/PC/1.1"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <pc:dimension>
    <pc:position>1</pc:position>
    <pc:size>4</pc:size>
    <pc:description>X : Longitude wgs84 como inteiro de 4 bytes, com escala de 10^(-7)</pc:description>
    <pc:name>X</pc:name>
    <pc:interpretation>int32_t</pc:interpretation>
    <pc:scale>0.0000001</pc:scale>
  </pc:dimension>
  <pc:dimension>
    <pc:position>2</pc:position>
    <pc:size>4</pc:size>
    <pc:description>Y : Latitude wgs84 como inteiro de 4 bytes, com escala de 10^(-7). </pc:description>
    <pc:name>Y</pc:name>
    <pc:interpretation>int32_t</pc:interpretation>
    <pc:scale>0.0000001</pc:scale>
  </pc:dimension>
  <pc:dimension>
    <pc:position>3</pc:position>
    <pc:size>4</pc:size>
    <pc:description>Z: profundidade como inteiro de 4 bytes, com escala de 10^(-4).</pc:description>
    <pc:name>Z</pc:name>
    <pc:interpretation>int32_t</pc:interpretation>
    <pc:scale>0.0001</pc:scale>
  </pc:dimension>
  <pc:dimension>
    <pc:position>4</pc:position>
    <pc:size>2</pc:size>
    <pc:description>Reflectividade</pc:description>
    <pc:name>Ref</pc:name>
    <pc:interpretation>uint16_t</pc:interpretation>
    <pc:scale>1</pc:scale>
 </pc:dimension>
  <pc:dimension>
    <pc:position>5</pc:position>
    <pc:size>1</pc:size>
    <pc:description>Red.</pc:description>
    <pc:name>R</pc:name>
    <pc:interpretation>uint8_t</pc:interpretation>
    <pc:scale>1</pc:scale>
  </pc:dimension>
<pc:dimension>
    <pc:position>6</pc:position>
    <pc:size>1</pc:size>
    <pc:description>Green.</pc:description>
    <pc:name>G</pc:name>
    <pc:interpretation>uint8_t</pc:interpretation>
    <pc:scale>1</pc:scale>
  </pc:dimension>
<pc:dimension>
    <pc:position>7</pc:position>
    <pc:size>1</pc:size>
    <pc:description>Blue.</pc:description>
    <pc:name>B</pc:name>
    <pc:interpretation>uint8_t</pc:interpretation>
    <pc:scale>1</pc:scale>
  </pc:dimension>
  <pc:metadata>
    <Metadata name="compression">dimensional</Metadata>
  </pc:metadata>
</pc:PointCloudSchema>');

CREATE SEQUENCE public.cdi_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.cdi_id_seq
  OWNER TO postgres;

CREATE TABLE public.cdi
(
  id integer NOT NULL DEFAULT nextval('cdi_id_seq'::regclass),
  codigo text,
  datum_h integer,
  datum_v text,
  min_depth real,
  max_depth real,
  area_type text,
  start_date timestamp with time zone,
  end_date timestamp with time zone,
  unid_tempo text,
  abstract text,
  platform_class text,
  holding_centre text,
  originator text,
  distributor text,
  collate_centre text,
  data_size integer,
  data_access text,
  cruise_name text,
  cruise_id text,
  qc_desc text,
  qc_date timestamp with time zone,
  qc_comment text,
  qc_status boolean,
  revision_date timestamp with time zone,
  long_w real,
  long_e real,
  lat_n real,
  lat_s real,
  CONSTRAINT pkey_cdi PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.cdi
  OWNER TO postgres;



CREATE TABLE public.formato
(
  id text NOT NULL,
  formato text,
  CONSTRAINT pkey_formato PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.formato
  OWNER TO postgres;
   
CREATE TABLE public.unid_tempo
(
  id text NOT NULL,
  unid_tempo text,
  CONSTRAINT pkey_unid_tempo PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.unid_tempo
  OWNER TO postgres;
  
CREATE TABLE public.parametro
(
  id text NOT NULL,
  parametro text,
  CONSTRAINT pkey_parametro PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.parametro
  OWNER TO postgres;

  
CREATE TABLE public.cdi_param
(
  cdi integer NOT NULL,
  param_id text NOT NULL
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.cdi_param
  OWNER TO postgres;
  
  
CREATE TABLE public.datum_h
(
  id integer NOT NULL ,
  datum_h text,
  ordem integer,
  CONSTRAINT datum_h_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.datum_h
  OWNER TO postgres;
COMMENT ON COLUMN public.datum_h.id IS 'Codigo numerico EDMO';
COMMENT ON COLUMN public.datum_h.datum_h IS 'Descricao do sistema coord.';


CREATE TABLE public.datum_v
(
  id text NOT NULL,
  datum_v text,
  ordem integer,
  CONSTRAINT datum_v_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.datum_v
  OWNER TO postgres;

CREATE TABLE public.acesso
(  
  id text NOT NULL,
  acesso text,
  CONSTRAINT acesso_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.acesso
  OWNER TO postgres;
COMMENT ON COLUMN public.acesso.id IS 'Codigo alfa numerico EDMO';
COMMENT ON COLUMN public.acesso.acesso IS 'Descricao do acesso';

CREATE TABLE public.plataforma
(
  id text NOT NULL,
  platform_class text,
  CONSTRAINT plataforma_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.plataforma
  OWNER TO postgres;
COMMENT ON COLUMN public.plataforma.id IS 'Codigo alfa numerico EDMO';
COMMENT ON COLUMN public.plataforma.platform_class IS 'Descricao da plataforma';

CREATE TABLE public.equipamento
(
  id text NOT NULL,
  equipamento text,
  CONSTRAINT equip_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.equipamento
  OWNER TO postgres;
COMMENT ON COLUMN public.equipamento.id IS 'Codigo alfa numerico EDMO';
COMMENT ON COLUMN public.equipamento.equipamento IS 'Descricao do equipamento';

CREATE TABLE public.cdi_equip
(
  cdi integer NOT NULL,
  equip_id text NOT NULL
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.cdi_equip
  OWNER TO postgres;


CREATE TABLE public.entidade
(
  id text NOT NULL,
  entidade text,
  
  CONSTRAINT entidade_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.entidade
  OWNER TO postgres;
COMMENT ON COLUMN public.entidade.id IS 'Codigo EDMO';
COMMENT ON COLUMN public.entidade.entidade IS 'Descricao da entidade';

CREATE TABLE public.pontos_temp
(
  x double precision,
  y double precision,
  z double precision,
  i integer,
  r smallint,
  g smallint,
  b smallint
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.pontos_temp
  OWNER TO postgres;

CREATE SEQUENCE public.pontos_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.pontos_id_seq
  OWNER TO postgres;
  
CREATE TABLE public.pontos
(
  n integer NOT NULL DEFAULT nextval('pontos_id_seq'::regclass),
  z double precision,
  id integer,
  cdi integer,
  geom geometry(Point,4326),
  CONSTRAINT pontos_pkey PRIMARY KEY (n)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.pontos 
  OWNER TO postgres;

CREATE SEQUENCE public.pc_points_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.pc_points_id_seq
  OWNER TO postgres;

CREATE TABLE public.pc_points
(
  id integer NOT NULL DEFAULT nextval('pc_points_id_seq'::regclass),
  pt pcpoint(3),
  CONSTRAINT pc_points_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.pc_points
  OWNER TO postgres;
GRANT ALL ON TABLE public.pc_points TO public;
GRANT ALL ON TABLE public.pc_points TO postgres;

CREATE SEQUENCE public.patches_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.patches_id_seq
  OWNER TO postgres;
  
CREATE TABLE public.patches
(
  id integer NOT NULL DEFAULT nextval('patches_id_seq'::regclass),
  cdi integer,
  pa pcpatch(3),
  CONSTRAINT patches_pkey PRIMARY KEY (id),
  CONSTRAINT fkey_cdi FOREIGN KEY (cdi)
      REFERENCES public.cdi (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.patches
  OWNER TO postgres;
GRANT ALL ON TABLE public.patches TO postgres;
GRANT ALL ON TABLE public.patches TO public;
ALTER TABLE public.patches ALTER COLUMN pa SET STORAGE MAIN;

CREATE INDEX fki_fkey_cdi
  ON public.patches
  USING btree
  (cdi);

CREATE INDEX indxgeom_patches
  ON public.patches
  USING gist
  (geometry(pa));

CREATE TABLE public.patches_sel
(
  id integer,
  cdi integer,
  pa pcpatch(3)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.patches_sel
  OWNER TO postgres;

CREATE INDEX indxgeom_patches_sel
  ON public.patches_sel
  USING gist
  (geometry(pa));

CREATE TABLE public.grid (
  id integer NOT NULL,
  geom geometry(Polygon,4326),
  CONSTRAINT grid_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.grid
  OWNER TO postgres;
  
CREATE TABLE public.patches_info
(
  id integer NOT NULL,
  codigo text,
  n bigint,
  prof real,
  geom geometry,
  prof_max double precision,
  prof_min double precision,
  CONSTRAINT pkey PRIMARY KEY (id),
  CONSTRAINT fkey_cdi FOREIGN KEY (id)
      REFERENCES public.cdi (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.patches_info
  OWNER TO postgres;
  
  
CREATE TABLE public.poligono
(
  id integer NOT NULL,
  geom geometry,
  CONSTRAINT pkey_polig PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.poligono
  OWNER TO postgres;


CREATE OR REPLACE VIEW public.v_patches AS 
 SELECT patches.id,
    patches.cdi,
    geometry(patches.pa) AS geom,
    st_centroid(geometry(patches.pa)) AS pp,
    pc_patchavg(patches.pa, 'z'::text)::double precision AS prof,
    pc_numpoints(patches.pa) AS n
   FROM patches;

ALTER TABLE public.v_patches
  OWNER TO postgres;


CREATE OR REPLACE VIEW public.vv_patches AS 
 SELECT patches.cdi,
    patches.id,
    patches_info.codigo,
    geometry(patches.pa) AS geom,
    st_centroid(geometry(patches.pa)) AS pp,
    pc_patchavg(patches.pa, 'z'::text) AS prof,
    pc_numpoints(patches.pa) AS n
   FROM patches
     LEFT JOIN patches_info ON patches.cdi = patches_info.id;

ALTER TABLE public.vv_patches
  OWNER TO postgres;
  
CREATE OR REPLACE VIEW public.vv_patches_sel AS 
 SELECT patches_sel.cdi,
    patches_sel.id,
    cdi.codigo,
    geometry(patches_sel.pa) AS geom,
    st_centroid(geometry(patches_sel.pa)) AS pp,
    pc_patchavg(patches_sel.pa, 'z'::text) AS prof,
    pc_numpoints(patches_sel.pa) AS n
   FROM patches_sel
     LEFT JOIN cdi ON patches_sel.cdi = cdi.id;

ALTER TABLE public.vv_patches_sel
  OWNER TO postgres;


CREATE OR REPLACE VIEW public.v_cdi AS 
 SELECT DISTINCT patches.cdi
   FROM patches;

ALTER TABLE public.v_cdi
  OWNER TO postgres;
  

CREATE OR REPLACE VIEW public.v_n_pat AS 
 SELECT v_patches.cdi,
    max(v_patches.n) AS max
   FROM v_patches
  GROUP BY v_patches.cdi;

ALTER TABLE public.v_n_pat
  OWNER TO postgres;

 CREATE OR REPLACE VIEW public.v_polig_intersect AS 
 SELECT p.id,
        CASE
            WHEN st_coveredby(p.geom, n.geom) THEN p.geom
            ELSE st_multi(st_intersection(p.geom, n.geom))
        END AS geom
   FROM patches_info p
     JOIN poligono n ON st_intersects(p.geom, n.geom) AND NOT st_touches(p.geom, n.geom);

ALTER TABLE public.v_polig_intersect
  OWNER TO postgres;

  
CREATE OR REPLACE FUNCTION public.f_pontos(IN parm1 integer, IN parm2 integer)
  RETURNS TABLE(n bigint, id integer, cdi integer, pt geometry, z numeric) AS
$BODY$
  SELECT  row_number() over() as n, temp.id,
    temp.cdi,
    st_makepoint(temp.x::double precision, temp.y::double precision) AS geom,
    temp.z AS prof
   FROM ( SELECT patches.id,
            patches.cdi,
            pc_get(pc_explode(patches.pa), 'x'::text) AS x,
            pc_get(pc_explode(patches.pa), 'y'::text) AS y,
            pc_get(pc_explode(patches.pa), 'z'::text) AS z
           FROM patches
          WHERE patches.cdi = $1 And id = $2)  temp;

$BODY$
  LANGUAGE sql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.f_pontos(integer, integer)
  OWNER TO postgres;

CREATE OR REPLACE FUNCTION public.f_pontoscdi(IN parm1 integer)
  RETURNS TABLE(n bigint, id integer, cdi integer, pt geometry, z numeric) AS
$BODY$
  SELECT  row_number() over() as n, temp.id,
    temp.cdi,
    st_SetSrid(st_makepoint(temp.x::double precision, temp.y::double precision), 4326) AS geom,
    temp.z AS prof
   FROM ( SELECT patches.id,
            patches.cdi,
            pc_get(pc_explode(patches.pa), 'x'::text) AS x,
            pc_get(pc_explode(patches.pa), 'y'::text) AS y,
            pc_get(pc_explode(patches.pa), 'z'::text) AS z
           FROM patches
          WHERE patches.cdi = $1)  temp;

$BODY$
  LANGUAGE sql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.f_pontoscdi(integer)
  OWNER TO postgres;

CREATE OR REPLACE FUNCTION public.f_xyz_pontoscdi(IN parm1 integer)
  RETURNS TABLE(n bigint, id integer, cdi integer, x real,y real, z numeric) AS
$BODY$   SELECT  row_number() over() as n, temp.id,     temp.cdi,     temp.x::real, temp.y::real,     temp.z AS prof    FROM ( SELECT patches.id,             patches.cdi,             pc_get(pc_explode(patches.pa), 'x'::text) AS x,             pc_get(pc_explode(patches.pa), 'y'::text) AS y,             pc_get(pc_explode(patches.pa), 'z'::text) AS z 
         FROM patches WHERE patches.cdi = $1)  temp;  $BODY$
  LANGUAGE sql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.f_xyz_pontoscdi(integer)
  OWNER TO postgres;
  
 