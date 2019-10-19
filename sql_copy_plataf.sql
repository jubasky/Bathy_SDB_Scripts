DELETE FROM plataforma;
COPY plataforma (codigo, descricao) FROM 'C:\MapX\scripts\platform_categ_SDN_L06_13.csv' WITH CSV HEADER;