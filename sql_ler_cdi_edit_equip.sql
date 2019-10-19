SELECT cdi_equip.equip_id,equipamento.equipamento  
     FROM cdi_equip  
     LEFT JOIN equipamento ON  cdi_equip.equip_id = equipamento.id 
     WHERE cdi_equip.cdi=???;