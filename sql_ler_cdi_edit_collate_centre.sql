SELECT cdi.collate_centre,entidade.entidade 
     FROM cdi 
     LEFT JOIN entidade ON  cdi.collate_centre = entidade.id 
     WHERE cdi.id=???;