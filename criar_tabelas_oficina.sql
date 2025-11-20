CREATE DATABASE oficina;
USE oficina;

CREATE TABLE professional (
	idprofessional INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(45),
    Mname VARCHAR(45),
    Lname VARCHAR(45),
    zip CHAR(8),
    street VARCHAR(100),
    district VARCHAR(100),
    city VARCHAR(45),
    speciality VARCHAR(100)
);

CREATE TABLE team (
	idteam INT AUTO_INCREMENT PRIMARY KEY,
    idleader INT,
    CONSTRAINT fk_team_leader FOREIGN KEY(idleader) REFERENCES professional(idprofessional)
);

CREATE TABLE clients (
	idclients INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(45),
    Mname VARCHAR(45),
    Lname VARCHAR(45),
    zip CHAR(8),
    street VARCHAR(100),
    district VARCHAR(100),
    city VARCHAR(45),
    phone CHAR(11)
);

CREATE TABLE vehicle (
	idvehicle INT AUTO_INCREMENT PRIMARY KEY,
    idclient INT,
    idteam INT,
    plate CHAR(7) NOT NULL,
    model VARCHAR(45),
    CONSTRAINT fk_vehicle_clients FOREIGN KEY(idclient) REFERENCES clients(idclients),
    CONSTRAINT fk_vehicle_team FOREIGN KEY(idteam) REFERENCES team(idteam)
);

CREATE TABLE service (
	idservice INT AUTO_INCREMENT PRIMARY KEY,
    name_service VARCHAR(200),
    category ENUM('REVISAO', 'CONSERTO'),
    description_service VARCHAR(200),
    price_service DECIMAL(10,2)
);

CREATE TABLE parts (
	idparts INT AUTO_INCREMENT PRIMARY KEY,
    name_parts VARCHAR(100),
    description_parts VARCHAR(2000),
    price_parts DECIMAL(10,2)
);

CREATE TABLE os (
	idos INT AUTO_INCREMENT PRIMARY KEY,
    idteam_os INT,
    idvehicle_os INT,
    date_emission DATE,
    os_value DECIMAL(5,2),
    os_status ENUM('EM ANDAMENTO', 'CONCLUIDO', 'CANCELADO'),
    expected_date DATE,
    CONSTRAINT fk_os_team FOREIGN KEY(idteam_os) REFERENCES team(idteam),
    CONSTRAINT fk_os_vehicle FOREIGN KEY(idvehicle_os) REFERENCES vehicle(idvehicle)
);

CREATE TABLE professional_team (
	idprofessional_team INT,
    idteam_team INT,
    roles ENUM('MEMBER', 'LEADER'),
    PRIMARY KEY(idprofessional_team, idteam_team),
    CONSTRAINT fk_pt_professional FOREIGN KEY(idprofessional_team) REFERENCES professional(idprofessional),
    CONSTRAINT fk_pt_team FOREIGN KEY(idteam_team) REFERENCES team(idteam)
);

CREATE TABLE os_service (
	idos_oss INT,
    idservice_oss INT,
    quantity INT NOT NULL,
    service_unit_price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (idos_oss, idservice_oss),
    CONSTRAINT fk_oss_idos FOREIGN KEY(idos_oss) REFERENCES os(idos),
    CONSTRAINT fk_oss_service FOREIGN KEY(idservice_oss) REFERENCES service(idservice)
);

CREATE TABLE os_parts (
    idos INT NOT NULL,
    idparts INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    part_unit_price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (idos, idparts),
    CONSTRAINT fk_osp_os FOREIGN KEY (idos) REFERENCES os(idos),
    CONSTRAINT fk_osp_parts FOREIGN KEY (idparts) REFERENCES parts(idparts)
);

CREATE TABLE service_parts (
	idservice_sp INT,
    idparts_sp INT,
    CONSTRAINT fk_sp_service FOREIGN KEY(idservice_sp) REFERENCES service(idservice),
    CONSTRAINT fk_sp_parts FOREIGN KEY(idparts_sp) REFERENCES parts(idparts)
);