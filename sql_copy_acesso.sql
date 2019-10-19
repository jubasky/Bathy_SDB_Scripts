DELETE FROM acesso;
COPY acesso (id, descricao) FROM 'C:\MapX\scripts\access_SDN_L08_3.csv' WITH CSV HEADER;