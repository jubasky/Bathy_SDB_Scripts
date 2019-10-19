INSERT INTO pc_points (pt) 
SELECT PC_MakePoint(3, ARRAY[a,b,c,intensity,r,g,b]) 
FROM (SELECT x as a, y as b, z as c, 10 AS intensity, rr as r, gg as g, bb as b FROM pontos_temp) AS values;