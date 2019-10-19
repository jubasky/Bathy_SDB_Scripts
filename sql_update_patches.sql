update patches set geom=geometry(patches.pa) where cdi=-99;
update patches set prof=PC_PatchAvg(pa, 'z') where cdi=-99;

