SELECT cdi.holding_centre,entidade.entidade 
     FROM cdi 
     LEFT JOIN entidade ON  cdi.holding_centre = entidade.id 
     WHERE cdi.id=???;