Create Database App_Medica;
use App_Medica;
Create table LOGIN(
	CORREO	Char(40) Primary key,
    Nombre_Apellido Char(50) , 
    Contraseña Char(50),
    Celular	int(20),
    Rol Char(20)
);
Create table AUXILIAR(
	ID_AUXILIAR Int Primary Key,
	Nombre_Apellido Char(50),
    Correo char(40),
    Celular Int(20),
	CONSTRAINT AUXILIAR_LOGIN_FK  foreign key AUXILIAR(Correo) REFERENCES LOGIN(CORREO)   
); 
Create table PERSONAL_SALUD(
	ID_PERSONAL Int Primary Key,
	Nombre_Apellido Char(50),
	Cargo Char(20),
    Especialidad char(40),
    Correo char(40),
    Celular Int(20),
    CONSTRAINT PERSONAL_LOGIN_FK  foreign key PERSONAL_SALUD(Correo) REFERENCES LOGIN(CORREO)
);
Create table PACIENTE(
	ID_PACIENTE Int Primary Key,
	Nombre_Apellido Char(50),
	Id_Personal int,
    Correo char(40),
    Direccion Char(40),
    Ciudad Char(40),
    Fecha_Nacimiento Date,
    Celular Int(20),
    CONSTRAINT PACIENTE_LOGIN_FK  foreign key PACIENTE(Correo) REFERENCES LOGIN(CORREO),
    CONSTRAINT PACIENTE_PERSONAL_FK  foreign key PACIENTE(Id_Personal) REFERENCES PERSONAL_SALUD(ID_PERSONAL)
);
Create table FAMILIAR_DESIGNADO(
	ID_FAMILIAR Int Primary Key,
	Nombre_Apellido Char(50),
	Parentesco Char(15),
	Celular Int(20),
    Correo char(40),
	Id_Paciente int,
    CONSTRAINT FAMILIAR_LOGIN_FK  foreign key FAMILIAR_DESIGNADO(Correo) REFERENCES LOGIN(CORREO),
    CONSTRAINT FAMILIAR_PACIENTE_FK  foreign key FAMILIAR_PACIENTE(Id_Paciente) REFERENCES PACIENTE(ID_PACIENTE)
);
Create Table SIGNOS_VITALES(
	ID_REGISTRO Int primary key,
    Id_Paciente int,
    Id_Personal int,
    Osimetria char (10),
    Frecuencia_Respiratoria char(15),
    Frecuencia_Cardiaca char(15),
    Temperatura char(15),
    Presion_Arterial char(15),
    Glicemias char(15),
    FechaHora_Registro Datetime,
    CONSTRAINT SIGNOS_PACIENTE_FK  foreign key SIGNOS_VITALES(Id_Paciente) REFERENCES PACIENTE(ID_PACIENTE),
    CONSTRAINT SIGNOS_PERSONAL_FK  foreign key SIGNOS_VITALES(Id_Personal) REFERENCES PERSONAL_SALUD(ID_PERSONAL)
);
Create Table HISTORIA_CLINICA(
	ID_HISTORIA Int primary key,
    Id_Paciente Int,
    Descripcion text,
    Medicamentos Char,
    CONSTRAINT HISTORIA_PACIENTE_FK  foreign key HISTORIA_CLINICA(Id_Paciente) REFERENCES PACIENTE(ID_PACIENTE)
)
