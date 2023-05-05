-- - La primera almacena a los usuarios de la aplicación (id_usuario, nombre, apellido,
-- contraseña, zona horaria (por defecto UTC-3), género y teléfono de contacto).

CREATE TABLE usuarios_aplicacion ( 
-- > CREATE TABLE nos permite crear una tabla en este caso con usarios_aplicacion
id_usuario INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 -- > Int permite ingresar numeros, en este caso el id del usuario,
 -- > Primary keye mi identificador unico de la tabla, lo que me permite relacionarla para otras tablas 
 -- > Not null me indica que el dato no puede estar vacio 
 -- > AUTO_INCREMENT El valor se incrementa de forma automatica 
nombre VARCHAR(50) NOT NULL,
-- > VARCHAR permite ingresar un texto con maximo de 50 caracteres, en este caso nombre
-- > not null me indica que el dato no puede estar vacio 
apellido VARCHAR(50) NOT NULL,
-- > VARCHAR permite ingresar un texto con maximo de 50 caracteres, en este caso apellido 
-- > not null me indica que el dato no puede estar vacio 
contrasena VARCHAR(50) NOT NULL,
-- > VARCHAR permite ingresar un texto con maximo de 50 caracteres, en este caso contrasema
-- > not null me indica que el dato no puede estar vacio 
zona_horaria VARCHAR(10) DEFAULT 'UTC-3',
-- > VARCHAR 10 En este caso permite ingresar 10 caracteres 
-- >  DEFAUL automaticamicamente
genero VARCHAR(20) NOT NULL,
-- > VARCHAR 20 En este caso permite ingresar 20 caracteres  
-- >  DEFAUL automaticamicamente
telefono_contacto VARCHAR(20) NOT NULL
-- > VARCHAR 20 En este caso permite ingresar 20 caracteres  
-- >  DEFAUL automaticamicamente
);


-- 
-- La segunda tabla almacena información relacionada a la fecha-hora de ingreso de los
-- usuarios a la plataforma (id_ingreso, id_usuario y la fecha-hora de ingreso (por defecto la
-- fecha-hora actual)).
CREATE TABLE ingreso_usuarios (
-- > CREATE TABLE nos permite crear una tabla en este caso con ingreso_usarios
id_ingreso INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
-- > Int permite ingresar numeros, en este caso el id del,
 -- > Primary keye mi identificador unico de la tabla, lo que me permite relacionarla para otras tablas 
 -- > Not null me indica que el dato no puede estar vacio 
 -- > AUTO_INCREMENT El valor se incrementa de forma automatica 
id_usuario INT NOT NULL,
   -- > Int permite ingresar numeros, en este caso el id del usuario,
   -- > Not null me indica que el dato no puede estar vacio 
fecha_hora_ingreso DATETIME DEFAULT CURRENT_TIMESTAMP
 -- > DATETIME DEFAULT CURRENT_TIMESTAMP   tipo de dato en formato fecha  y hora el cua lpor defecto tendra la hora al momento de ingresar
);

-- 
-- Parte 3: Modificación de la tabla
--  Modifique el UTC por defecto.Desde UTC-3 a UTC-2.

ALTER TABLE usuarios_aplicacion MODIFY zona_horaria VARCHAR(10) DEFAULT 'UTC-2';
-- ALTER TABLE modifoco tabla usarios aplicacion modificando la zona horaria con VARCHAR de 10 carcteres maximo
-- DEFAULT dejando permanentente el valor de UTC-2 en vez de UTC-3


-- 
-- Parte 4: Creación de registros.
-- Para cada tabla crea 8 registros.
INSERT INTO usuarios_aplicacion (nombre, apellido, contrasena, genero, telefono_contacto)  -- > INSERT INTO permite ingresar los datos a mi tabla 
VALUES
  ('Juan', 'Martínez', 'Qwerty123', 'Masculino', '+56912345678'),
  ('María', 'González', 'Abcde123', 'Femenino', '+56923456789'),
  ('Pedro', 'Pérez', 'holamundo1', 'Masculino', '+56934567890'),
  ('Catalina', 'Rojas', '12345a', 'Femenino', '+56945678901'),
  ('Francisco', 'Álvarez', 'marepoto1', 'Masculino', '+56956789012'),
  ('Camila', 'Fernández', 'ytrewq321', 'Femenino', '+56967890123'),
  ('Diego', 'Silva', 'asdfre3', 'Masculino', '+56978901234'),
  ('Valentina', 'Muñoz', 'nhytr43', 'Femenino', '+56989012345')
  ;

-- 

INSERT INTO ingreso_usuarios (id_usuario)
VALUES
  ('1'),
  ('2'),
  ('3'),
  ('4'),
  ('5'),
  ('6'),
  ('7'),
  ('8')
  ;
  
  -- 
-- Parte 6: Creen una nueva tabla llamada Contactos (id_contacto, id_usuario, numero de telefono,
-- correo electronico).  
  CREATE TABLE Contactos ( 
  -- > CREATE TABLE nos permite crear una tabla en este caso con Contactos
  id_contacto INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
 -- > Int permite ingresar numeros, en este caso el id del contacto 
 -- > Primary keye mi identificador unico de la tabla, lo que me permite relacionarla para otras tablas 
 -- > Not null me indica que el dato no puede estar vacio 
 -- > AUTO_INCREMENT El valor se incrementa de forma automatica 
  id_usuario INT NOT NULL,
 -- > Int permite ingresar numeros, en este caso el id del usuario,
 -- > Not null me indica que el dato no puede estar vacio 
  numero_telefono VARCHAR(20) NOT NULL,
-- > VARCHAR 10 En este caso permite ingresar 20 caracteres  
-- > Not null me indica que el dato no puede estar vacio 
  correo_electronico VARCHAR(50) NOT NULL
-- > VARCHAR 50 En este caso permite ingresar 50 caracteres  
-- > Not null me indica que el dato no puede estar vacio   
);

--  

-- Parte 7: Modifique la columna teléfono de contacto, para crear un vínculo entre la tabla Usuarios y la
-- tabla Contactos.
ALTER TABLE usuarios_aplicacion
-- > ALTER TABLE modifica la tabla usuarios_aplicacion
ADD COLUMN id_contacto INT,
-- > ADD COLUMN se añadio columna id_contacto del tipo int para generar la relacion con la tabla contactos 
ADD FOREIGN KEY (id_contacto) REFERENCES Contactos(id_contacto);
-- > ADD FOREIGN KEY Agrega llave foranea a la columna recientemente agregada con REFERENCES a la llave primaria de la tabla id_contacto