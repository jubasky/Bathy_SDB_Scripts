SELECT cdi.id, cdi.codigo, cdi.datum_h, cdi.datum_v, cdi.min_depth, 
     cdi.max_depth, cdi.start_date, cdi.end_date, cdi.unid_tempo, 
     cdi.abstract, cdi.platform_class, cdi.holding_centre, cdi.originator, cdi.distributor,
     cdi.collate_centre, cdi.data_size, cdi.data_access, cdi.cruise_name, 
     cdi.cruise_id, cdi.qc_desc, cdi.qc_date, cdi.qc_comment, cdi.qc_status, 
     cdi.revision_date, cdi.long_w, cdi.long_e, cdi.lat_n, cdi.lat_s , entidade.entidade,
     datum_h.datum_h, datum_v.datum_v, plataforma.platform_class, acesso.acesso 
     FROM cdi 
     LEFT JOIN entidade ON  cdi.originator = entidade.id 
     LEFT JOIN datum_h ON  cdi.datum_h = datum_h.id 
     LEFT JOIN datum_v ON  cdi.datum_v = datum_v.id 
     LEFT JOIN plataforma ON cdi.platform_class = plataforma.id 
     LEFT JOIN acesso ON cdi.data_access = acesso.id 
     WHERE cdi.id=???;