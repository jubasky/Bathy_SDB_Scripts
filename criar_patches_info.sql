INSERT INTO patches_info 
 SELECT v_patches.cdi,
    sum(v_patches.num) AS n,
    avg(v_patches.prof) as prof,
    st_concavehull(st_collect(v_patches.geom), 0.97::double precision) AS geom 
   FROM v_patches WHERE v_patches.cdi = 1
  GROUP BY v_patches.cdi;


