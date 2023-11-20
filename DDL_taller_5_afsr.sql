

CREATE DATABASE paises;

-- Crear tabla CONTINENTE
CREATE TABLE Continente( 
	Id SERIAL PRIMARY KEY,
	Nombre VARCHAR(50) NOT NULL
);

-- Crear indice para CONTINENTE	ordenado por NOMBRE
CREATE UNIQUE INDEX ixContinente_Nombre
	ON Continente(Nombre);
	
	
	
	
-- Crear tabla TIPOREGION
CREATE TABLE TipoRegion( 
	Id SERIAL PRIMARY KEY,
	TipoRegion VARCHAR(50) NOT NULL
);

-- Crear indice para TIPOREGION	ordenado por NOMBRE
CREATE UNIQUE INDEX ixTipoRegion_TipoRegion
	ON TipoRegion(TipoRegion);
	
	

-- Crear tabla PAIS 
CREATE TABLE Pais( 
	Id SERIAL PRIMARY KEY,
	Nombre VARCHAR(50) NOT NULL, 
	IdContinente INTEGER NOT NULL, 
	CONSTRAINT fkPais_IdContinente FOREIGN KEY (IdContinente)
		REFERENCES Continente(Id),
	IdTipoRegion INTEGER NOT NULL,
	CONSTRAINT fkPais_IdTipoRegion FOREIGN KEY (IdTipoRegion)
		REFERENCES TipoRegion(Id),
	Moneda VARCHAR(30) NULL
	
);

-- Crear indice para PAIS ordenado por NOMBRE
CREATE UNIQUE INDEX ixPais_Nombre
	ON Pais(Nombre);
	
	
	

-- Crear tabla REGION
CREATE TABLE Region( 
	Id SERIAL PRIMARY KEY,
	Nombre VARCHAR(50) NOT NULL, 
	IdPais INTEGER NOT NULL, 
	CONSTRAINT fkRegion_IdPais FOREIGN KEY (IdPais)
		REFERENCES Pais(Id),
	Area FLOAT NULL, 
	Poblacion INTEGER NULL
);

-- Crear indice para REGION	ordenado por PAIS y NOMBRE
CREATE UNIQUE INDEX ixRegion_IdPais_Nombre
	ON Region(IdPais,Nombre);


-- Crear tabla CIUDAD
CREATE TABLE Ciudad( 
	Id SERIAL PRIMARY KEY,
	Nombre VARCHAR(50) NOT NULL, 
	IdRegion INTEGER NOT NULL, 
	CONSTRAINT fkCiudad_IdRegion FOREIGN KEY (IdRegion)
		REFERENCES Region(Id),
	Area FLOAT NULL, 
	Poblacion INTEGER NULL,
	CapitalPais BOOLEAN DEFAULT false NOT NULL,
	CapitalRegion BOOLEAN DEFAULT false NOT NULL,
	AreaMetropolitana BOOLEAN DEFAULT false NOT NULL
);

-- Crear indice para CIUDAD	ordenado por REGION y NOMBRE 
CREATE UNIQUE INDEX ixCiudad_IdRegion_Nombre
	ON Ciudad(IdRegion,Nombre);
	



-- Crear tabla MONEDA 
CREATE TABLE Moneda( 
	Id SERIAL PRIMARY KEY,
	Moneda VARCHAR(50) NOT NULL, 
	Sigla VARCHAR(50) NOT NULL, 
	Imagen bytea NULL
	
);

-- Crear indice para MONEDA ordenado por el nombre de la moneda
CREATE UNIQUE INDEX ixMoneda_Moneda
	ON Moneda(Moneda);
	
--Modificar la tabla Pais para agregar el id de la moneda
ALTER TABLE Pais 
    ADD CONSTRAINT fk_Pais_IdMoneda FOREIGN KEY (Id) REFERENCES Moneda (Id);
	
	
--Modificar la tabla Pais para agregar campos
--para imagenes del mapa y la bandera del pais 
ALTER TABLE Pais 
    ADD CONSTRAINT fk_Pais_IdMoneda FOREIGN KEY (Id) REFERENCES Moneda (Id);

--Agregar el campo mapa con tipo de dato bytea que puede ser null a la tabla pais
ALTER TABLE Pais
	ADD COLUMN Mapa bytea NULL;

--Agregar el campo Bandera con tipo de dato bytea que puede ser null a  la tabla pais
ALTER TABLE Pais
	ADD COLUMN Bandera bytea NULL;
	
	
	
	
	
	
	
	