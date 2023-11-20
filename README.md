TALLER 5 – MODELO RELACIONAL Y BASE DE DATOS


Trabajo escrito presentado al profesor
FRAY LEÓN OSORIO RIVERA
En el curso técnicas de programación y laboratorio

Integrante:
ANDRÉS FELIPE SALAZAR RAMOS

 



UNIVERSIDAD DE ANTIOQUIA
PROGRAMA DE INGENIERÍA DE SISTEMAS VIRTUAL
SEMESTRE AGOSTO-DICIEMBRE 2023





1.	TRABAJO EN CASA
Considere el siguiente modelo relacional:
 
Figura 1. Modelo relacional inicial del ejercicio de países

Basado en el modelo relacional de división política mundial anterior, se desea realizar los siguientes cambios en el modelo relacional inicial (sin pérdida de la información existente): 

 
Se debe escribir por tanto un script que haga lo siguiente: 
•	Desnormalización en la tabla País de la información de la Moneda 
•	Agregar campos para imágenes del Mapa y la Bandera del País 






2.	DISEÑO DE LA SOLUCIÓN

Para realizar este ejercicio se procederá con los siguientes pasos:
•	En el archivo DDL
1.	Creación de la Base de Datos “Paises”
2.	Creación de las tablas:
a.	Continente
b.	TipoRegion
c.	Pais
d.	Región
e.	Ciudad
•	En el archivo DML
3.	Insertar los datos acorde a la estructura definida por las tablas
Posteriormente y para dar respuesta a lo solicitado en el ejercicio se debe proceder con lo siguiente:
•	En el archivo DDL
4.	Creación de la tabla Moneda
5.	Agregar el campo IdMoneda desnormalizando la información del país
6.	En la tabla país agregar campos para almacenar imágenes del mapa y la bandera del país
3.	EJECUCIÓN DE LA SOLUCIÓN

3.1 Creación de la Base de Datos “Paises”

A continuación, se relaciona el script para crear la base de datos “Países”
>  CREATE DATABASE paises;
 
Figura 2. Creación de la base de datos países
En amarillo se resalta el resultado del script.

3.2	Creación de las tablas

 Se procede a crear las tablas Continente, TipoRegion, Pais, Region, Ciudad del modelo inicial
 
Figura 3. Creación de la tabla Continente con sus campos según modelo e índice
En query tool de postgres se procede a crear la tabla Continente junto con un índice relacionando el nombre como se ve en la figura anterior.

 
Figura 4. Creación de la tabla TipoRegion con sus campos según modelo e índice
Como muestra la figura anterior se crea la tabla TipoRegion junto con un índice que está relacionado al campo TipoRegion
 
Figura 5. Creación de la tabla Pais con sus campos según modelo e índice
La figura anterior muestra la creación de la tabla País, ahora hay 3 tablas en la base de datos (continente, país, tiporegion), se tienen los campos respectivos según el diagrama y para los campos IdContinente e IdTipoRegion se definen claves foráneas que hacen referencia a sus respectivos Id.
 
Figura 6. Creación de la tabla Region con sus campos según modelo e índice
Como se ve en la figura 5 ahora la base de datos considera 4 tablas, en este caso al crear la tabla región se crea con los campos considerados en el modelo y se define el IdPais como una clave foránea que hace referencia a la tabla país. Todas las definiciones enmarcadas en el recuadro verde quedan como campos de la tabla región.




 
Figura 7. Creación de la tabla Ciudad con sus campos según modelo e índice
Como se ve en la figura anterior, se crea la tabla ciudad con los campos solicitaos en el modelo y con la clave foránea IdRegion. Por otro lado se define como indice de la tabla, la combinación del campo nombre con IdRegion.

Recordemos lo solicitado en el ejercicio:
a.	Desnormalización en la tabla País de la información de la Moneda 
b.	Agregar campos para imágenes del Mapa y la Bandera del País 

Respuesta a: “Desnormalización en la tabla País de la información de la Moneda”.
Previo a la realización de este paso debemos añadir la tabla Moneda a la base de datos con los siguientes campos:
 
 
Figura 8. Creación de la tabla Moneda con sus campos según el nuevo modelo e índice
En la figura 8 se muestra el script de la tabla moneda con los campos Id que es su clave primaria, Moneda donde se guardara el nombre de la moneda, la siga, y el campo de Imagen que se define como bytea para almacenar una futura imagen con mucha información que desagregaría cada byte y pixel de una imagen para ser almacenado en la base de datos.
Para desnormalizar la información de la Moneda en la tabla Pais creamos el campo IdMoneda como un INTEGER y además le definimos una restricción para que sea la clave foránea y relacionar la tabla Moneda creada anteriormente.
Como la tabla Pais ya está creada, procederemos a alterar la tabla considerando la nueva restricción para hacer la relación al Id de la tabla Moneda.
 
Figura 9. Desnormalización de la información de Moneda en la tabla País
La figura 9 muestra que el alter table para la tabla país agrega una nueva clave foránea que hace referencia al Id de la tabla Moneda.

Respuesta b “Agregar campos para imágenes del Mapa y la Bandera del País“

 
Para este punto es necesario modificar la tabla Pais y agregar con el uso de ALTER TABLE los dos campos solicitados definiéndolos como bytea para que guarden referencia a las imágenes que se desean almacenar. Se agregan los campos Mapa y Bandera según lo solicitado.
 
