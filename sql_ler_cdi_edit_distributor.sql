SELECT cdi.distributor,entidade.entidade 
     FROM cdi 
     LEFT JOIN entidade ON  cdi.distributor = entidade.id 
     WHERE cdi.id=???;