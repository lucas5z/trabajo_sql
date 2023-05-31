DROP DATABASE IF EXISTS instituto;

CREATE DATABASE instituto;

USE instituto;


CREATE Table Especialidad(
    Esp_alumno INT UNSIGNED PRIMARY KEY,
    Descripcion VARCHAR(60)
    
);

CREATE Table Alumno(
    Codigo INT UNSIGNED PRIMARY KEY,
    Especialidad INT UNSIGNED,

    Apellido VARCHAR(50) NOT NULL,
    Nombre VARCHAR(40) NOT NULL,
    Sexo BIT NOT NULL,
    Fecha_nac TIME NOT NULL,
    Direccion VARCHAR(60) NOT NULL,
    Telefono INT NOT NULL,

    FOREIGN KEY (Especialidad) REFERENCES Especialidad(Esp_alumno)
        ON UPDATE CASCADE
        ON DELETE CASCADE


);


CREATE Table Profesor(
    codigo VARCHAR(6) PRIMARY KEY,

    Apellido VARCHAR(50) NOT NULL,
    Nombre VARCHAR(40) NOT NULL,
    Sexo BIT NOT NULL,
    Fecha_nac DATE NOT NULL,
    Grado_Titulo INT UNSIGNED NOT NULL,
    Direccion VARCHAR(50) NOT NULL,
    Telefono INT NOT NULL

);

CREATE Table Curso(
    Codigo INT UNSIGNED PRIMARY KEY,

    Nombre VARCHAR(60) NOT NULL,
    Horas INT UNSIGNED NOT NULL,
    Precio DECIMAL(4,2) NOT NULL,
    Prerrequisitos INT UNSIGNED

);

CREATE Table Clase(
    Num_clase INT UNSIGNED PRIMARY KEY,
    Cod_curso INT UNSIGNED,
    Cod_profesor VARCHAR(6),

    Horario VARCHAR(60) NOT NULL,
    Aula VARCHAR(6) NOT NULL,
    Vacantes INT UNSIGNED NOT NULL,
    Matriculados INT UNSIGNED NOT NULL,

    FOREIGN KEY (Cod_curso) REFERENCES Curso(Codigo)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    
    FOREIGN KEY (Cod_profesor) REFERENCES Profesor(Codigo)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE Table Sesion_clase(
    Num_clase INT UNSIGNED,

    Fecha DATE NOT NULL,
    Hora VARCHAR(5) NOT NULL,
    Matriculados INT UNSIGNED NOT NULL,
    
    FOREIGN KEY (Num_clase) REFERENCES Clase(Num_clase)
        ON UPDATE CASCADE
        ON DELETE CASCADE

);

/* CREATE Alumno_Clase(
    Cod_alumno INT UNSIGNED,
    Num_clase INT UNSIGNED,

    Evaluacion DECIMAL(5,2),
    Pago DECIMAL(4,2),

    FOREIGN KEY (Cod_alumno) REFERENCES Alumno(Codigo)
        ON UPDATE CASCADE
        ON DELETE CASCADE, 

    FOREIGN KEY (Num_clase) REFERENCES Clase(Num_clase)
        ON UPDATE CASCADE
        ON DELETE CASCADE   

);

CREATE Alumno_Sesion_Clase(
    Cod_alumno INT UNSIGNED,
    Num_clase INT UNSIGNED,

    Asistencia BIT NOT NULL,
    Fecha DATE NOT NULL,
    Hora VARCHAR(6) NOT NULL,

    FOREIGN KEY (Cod_alumno) REFERENCES Sesion_clase(Num_clase)
        ON UPDATE CASCADE
        ON DELETE CASCADE, 

    FOREIGN KEY (Num_clase) REFERENCES Alumno(Codigo)
        ON UPDATE CASCADE
        ON DELETE CASCADE
); */


CREATE TABLE Alumno_Clase (

    Cod_alumno INT UNSIGNED,
    Num_clase INT UNSIGNED,
    Evaluacion DECIMAL(5,2),
    Pago DECIMAL(4,2),
    
    FOREIGN KEY (Cod_alumno) REFERENCES Alumno(Codigo) 
        ON UPDATE CASCADE 
        ON DELETE CASCADE,
    FOREIGN KEY (Num_clase) REFERENCES Clase(Num_clase) 
        ON UPDATE CASCADE 
        ON DELETE CASCADE
);

CREATE TABLE Alumno_Sesion_Clase (

    Cod_alumno INT UNSIGNED,
    Num_clase INT UNSIGNED,
    Asistencia BIT NOT NULL,
    Fecha DATE NOT NULL,
    Hora VARCHAR(6) NOT NULL,

    FOREIGN KEY (Cod_alumno) REFERENCES Alumno(Codigo) 
        ON UPDATE CASCADE 
        ON DELETE CASCADE,
    FOREIGN KEY (Num_clase) REFERENCES Sesion_clase(Num_clase) 
        ON UPDATE CASCADE 
        ON DELETE CASCADE
);
