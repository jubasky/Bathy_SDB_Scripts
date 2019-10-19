DELETE FROM coordinate_system;
COPY coordinate_system (id, descricao, ordem) FROM 'C:\MapX\scripts\coordinate_SDN_L10_3.csv' WITH CSV HEADER;