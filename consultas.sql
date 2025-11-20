USE oficina;

-- clientes e seus veiculos
SELECT CONCAT(c.Fname, ' ', c.Mname,' ', c.Lname) AS Nome, v.plate, v.model
	FROM clients AS c
		JOIN vehicle AS v ON c.idclients = v.idclient;
        
-- clientes, seus veiculos e a equipe responsavel
SELECT v.plate, v.model, c.Fname AS Nome, t.idteam AS Equipe_responsavel
	FROM vehicle AS v
		JOIN clients AS c ON c.idclients = v.idclient
			JOIN team AS t ON v.idteam = t.idteam;
            
-- consultar os servicos das ordens de servico
SELECT o.idos, s.name_service, os_service.quantity
	FROM os_service
		JOIN os AS o ON o.idos = os_service.idos_oss
        JOIN service AS s ON s.idservice = os_service.idservice_oss;
    
-- Ordem de servico por status
SELECT os_status, COUNT(*) AS Total_ordem_servico FROM os
	WHERE os_status
		GROUP BY os_status;
        
-- Ordem de servico atrasada
SELECT idos, idteam_os FROM os
	WHERE expected_date != CURDATE()
    AND os_status != 'CONCLUIDO';