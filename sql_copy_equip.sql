DELETE FROM equip;
COPY equip (codigo, descricao) FROM 'C:\MapX\scripts\equipamentos_SDN_L05_55.csv' WITH CSV HEADER;