DELETE FROM entidade;
COPY entidade (codigo, descricao) FROM 'c:\MapX\scripts\entidades.csv' WITH CSV HEADER;