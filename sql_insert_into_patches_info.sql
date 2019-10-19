INSERT INTO patches_info (id, codigo, n, prof, prof_max, prof_min, geom)
 SELECT patches.cdi,
    -88,
    sum(PC_NumPoints(pa)) as n,
    avg(PC_PatchAvg(pa, 'z' )) as prof,
    min(PC_PatchMin(pa, 'z')) as prof_max, 
    max(PC_PatchMax(pa, 'z')) as prof_min, 
    st_concavehull(st_collect(geometry(patches.pa)), 0.97::double precision) AS geom 
   FROM patches WHERE patches.cdi = -99  
	group by patches.cdi;