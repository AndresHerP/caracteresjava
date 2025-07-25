-- Tabla: ADMINISTRADOR
CREATE TABLE ADMINISTRADOR (
    ID_ADMIN         NUMBER PRIMARY KEY,
    NOMBRE           VARCHAR2(100),
    USUARIO          VARCHAR2(50) UNIQUE NOT NULL,
    CONTRASENA       VARCHAR2(100) NOT NULL
);

-- Tabla: EMPLEADO (Incluye recepcionista y médico)
CREATE TABLE EMPLEADO (
    ID_EMPLEADO      NUMBER PRIMARY KEY,
    NOMBRE           VARCHAR2(100),
    ROL              VARCHAR2(20) CHECK (ROL IN ('Recepcionista', 'Medico')),
    ESPECIALIDAD     VARCHAR2(100), -- Opcional, solo aplica a médicos
    USUARIO          VARCHAR2(50) UNIQUE NOT NULL,
    CONTRASENA       VARCHAR2(100) NOT NULL,
    ID_ADMIN         NUMBER,
    FOREIGN KEY (ID_ADMIN) REFERENCES ADMINISTRADOR(ID_ADMIN)
);

-- Tabla: PACIENTE (Estudiante)
CREATE TABLE PACIENTE (
    ID_PACIENTE      NUMBER PRIMARY KEY,
    NOMBRE           VARCHAR2(100),
    MATRICULA        VARCHAR2(20) UNIQUE NOT NULL,
    CARRERA          VARCHAR2(100),
    CORREO           VARCHAR2(100),
    TELEFONO         VARCHAR2(15)
);

-- Tabla: CITA
CREATE TABLE CITA (
    ID_CITA          NUMBER PRIMARY KEY,
    FECHA            DATE NOT NULL,
    HORA             VARCHAR2(5) NOT NULL, -- HH:MM formato
    MOTIVO           VARCHAR2(200),
    ESTADO           VARCHAR2(20) CHECK (ESTADO IN ('Pendiente', 'Atendida', 'Cancelada')),
    ID_PACIENTE      NUMBER NOT NULL,
    ID_MEDICO        NUMBER NOT NULL,
    ID_RECEPCIONISTA NUMBER NOT NULL,
    FOREIGN KEY (ID_PACIENTE) REFERENCES PACIENTE(ID_PACIENTE),
    FOREIGN KEY (ID_MEDICO) REFERENCES EMPLEADO(ID_EMPLEADO),
    FOREIGN KEY (ID_RECEPCIONISTA) REFERENCES EMPLEADO(ID_EMPLEADO)
);
