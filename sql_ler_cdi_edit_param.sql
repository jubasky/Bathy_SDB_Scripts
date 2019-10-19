SELECT cdi_param.param_id,parametro.parametro  
     FROM cdi_param
     LEFT JOIN parametro ON  cdi_param.param_id  = parametro.id 
     WHERE cdi_param.cdi=???;