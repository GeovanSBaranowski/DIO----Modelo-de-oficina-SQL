USE oficina;

INSERT INTO professional (Fname, Mname, Lname, zip, street, district, city, speciality)
VALUES 
('Carlos', 'A', 'Souza', '12345678', 'Rua Alfa', 'Centro', 'São Paulo', 'Mecânico Geral'),
('Marcos', 'B', 'Lima', '98765432', 'Av Beta', 'Jardins', 'São Paulo', 'Eletricista'),
('Julia', 'C', 'Mendes', '45678912', 'Rua Gamma', 'Moema', 'São Paulo', 'Funilaria'),
('Rafael', 'D', 'Pereira', '85236974', 'Rua Delta', 'Centro', 'São Paulo', 'Mecânico Geral');


INSERT INTO team (idleader)
VALUES 
(1), -- Equipe 1 liderada por Carlos
(2); -- Equipe 2 liderada por Marcos

INSERT INTO professional_team (idprofessional_team, idteam_team, roles)
VALUES
(1, 1, 'LEADER'),
(4, 1, 'MEMBER'),
(2, 2, 'LEADER'),
(3, 2, 'MEMBER');

INSERT INTO clients (Fname, Mname, Lname, zip, street, district, city, phone)
VALUES
('Ana', 'P', 'Silva', '11223344', 'Rua Flores', 'Centro', 'São Paulo', '11987654321'),
('Bruno', 'R', 'Oliveira', '22334455', 'Av Palmeiras', 'Vila Nova', 'São Paulo', '11988776655'),
('Carla', 'T', 'Souza', '33445566', 'Rua Rosa', 'Jardim Luz', 'São Paulo', '11999887766');


INSERT INTO vehicle (idclient, idteam, plate, model)
VALUES 
(1, 1, 'ABC1D23', 'Honda Civic'),
(2, 2, 'EFG4H56', 'Toyota Corolla'),
(3, 1, 'JKL7M89', 'Fiat Argo');


INSERT INTO service (name_service, category, description_service, price_service)
VALUES
('Troca de óleo', 'REVISAO', 'Troca completa de óleo e filtros', 150.00),
('Alinhamento e Balanceamento', 'REVISAO', 'Serviço completo de alinhamento', 120.00),
('Troca de Pastilha de Freio', 'CONSERTO', 'Substituição das pastilhas dianteiras', 300.00),
('Diagnóstico Elétrico', 'CONSERTO', 'Teste completo de parte elétrica', 200.00);


INSERT INTO parts (name_parts, description_parts, price_parts)
VALUES
('Óleo 5W30', 'Lubrificante sintético automotivo', 45.00),
('Filtro de Óleo', 'Filtro padrão', 25.00),
('Pastilha de Freio', 'Jogo de pastilhas dianteiras', 180.00),
('Cabo de Vela', 'Conjunto de cabos', 90.00);


INSERT INTO service_parts (idservice_sp, idparts_sp)
VALUES
(1, 1), -- Troca de óleo usa óleo
(1, 2), -- Troca de óleo usa filtro
(3, 3), -- Troca de pastilhas usa pastilhas
(4, 4); -- Diagnóstico elétrico usa cabo de vela


INSERT INTO os (idteam_os, idvehicle_os, date_emission, os_value, os_status, expected_date)
VALUES
(1, 1, '2025-01-10', 270.00, 'EM ANDAMENTO', '2025-01-12'),
(2, 2, '2025-01-11', 300.00, 'CONCLUIDO', '2025-01-11'),
(1, 3, '2025-01-15', 180.00, 'EM ANDAMENTO', '2025-01-17');


INSERT INTO os_service (idos_oss, idservice_oss, quantity, service_unit_price)
VALUES
(1, 1, 1, 150.00), -- OS 1: Troca de óleo
(1, 2, 1, 120.00), -- OS 1: Alinhamento
(2, 3, 1, 300.00), -- OS 2: Pastilha de freio
(3, 4, 1, 200.00); -- OS 3: Diagnóstico elétrico


INSERT INTO os_parts (idos, idparts, quantity, part_unit_price)
VALUES
(1, 1, 1, 45.00),
(1, 2, 1, 25.00),
(2, 3, 1, 180.00),
(3, 4, 1, 90.00);
