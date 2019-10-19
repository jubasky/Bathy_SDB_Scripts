SELECT cdi.originator AS id, entidade.entidade from cdi 
LEFT JOIN entidade 
ON cdi.originator = entidade.id 
where cdi.id = ???;
