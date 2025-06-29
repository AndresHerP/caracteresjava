-- Generado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   en:        2025-06-29 14:39:49 CST
--   sitio:      Oracle Database 21c
--   tipo:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE CITA 
    ( 
     ID_CITA          NUMBER  NOT NULL , 
     ID_PACIENTE      NUMBER , 
     ID_MEDICO        NUMBER , 
     ID_RECEPCIONISTA NUMBER , 
     FECHA            DATE , 
     HORA             VARCHAR2 (10) , 
     MOTIVO           VARCHAR2 (255) , 
     ESTADO           VARCHAR2 (20) 
    ) 
    LOGGING 
;

ALTER TABLE CITA 
    ADD CONSTRAINT CITA_PK PRIMARY KEY ( ID_CITA ) ;

CREATE TABLE CUENTA 
    ( 
     ID_CUENTA  NUMBER  NOT NULL , 
     USUARIO    VARCHAR2 (50) , 
     CONTRASENA VARCHAR2 (100) , 
     ROL        VARCHAR2 (20) , 
     ESTADO     VARCHAR2 (20) 
    ) 
    LOGGING 
;

ALTER TABLE CUENTA 
    ADD CONSTRAINT CUENTA_PK PRIMARY KEY ( ID_CUENTA ) ;

ALTER TABLE CUENTA 
    ADD CONSTRAINT INDEX_1 UNIQUE ( USUARIO ) ;

CREATE TABLE EMPLEADO 
    ( 
     ID_EMPLEADO  NUMBER  NOT NULL , 
     NOMBRE       VARCHAR2 (100) , 
     ROL          VARCHAR2 (50) , 
     USUARIO      VARCHAR2 (50) , 
     CONTRASENA   VARCHAR2 (100) , 
     CORREO       VARCHAR2 (100) , 
     CONSULTORIO  VARCHAR2 (50) , 
     TIPO_AREA    VARCHAR2 (100) , 
     ESPECIALIDAD VARCHAR2 (100) , 
     ESTADO       VARCHAR2 (20) DEFAULT 'ACTIVO' 
    ) 
    LOGGING 
;

ALTER TABLE EMPLEADO 
    ADD CONSTRAINT EMPLEADO_PK PRIMARY KEY ( ID_EMPLEADO ) ;

ALTER TABLE EMPLEADO 
    ADD CONSTRAINT INDEX_1 UNIQUE ( USUARIO ) ;

CREATE TABLE PACIENTE 
    ( 
     ID_PACIENTE NUMBER  NOT NULL , 
     NOMBRE      VARCHAR2 (100) , 
     MATRICULA   VARCHAR2 (50) , 
     CORREO      VARCHAR2 (100) , 
     ESTADO      VARCHAR2 (20) DEFAULT 'ACTIVO' , 
     ID_CUENTA   NUMBER (1)  NOT NULL 
    ) 
    LOGGING 
;

ALTER TABLE PACIENTE 
    ADD CONSTRAINT PACIENTE_PK PRIMARY KEY ( ID_PACIENTE ) ;

ALTER TABLE PACIENTE 
    ADD CONSTRAINT INDEX_1 UNIQUE ( MATRICULA ) ;

-- Error - Unique Constraint PACIENTE.INDEX_2 doesn't have columns

CREATE TABLE RECUPERACION_CONTRASENA 
    ( 
     ID_RECUPERACION NUMBER  NOT NULL , 
     ID_CUENTA       NUMBER , 
     TOKEN           VARCHAR2 (100) , 
     FECHA_SOLICITUD DATE , 
     USADO           NUMBER (1) 
    ) 
    LOGGING 
;

ALTER TABLE RECUPERACION_CONTRASENA 
    ADD CONSTRAINT RECUPERACION_CONTRASENA_PK PRIMARY KEY ( ID_RECUPERACION ) ;

CREATE TABLE REPORTE_MEDICO 
    ( 
     ID_REPORTE     NUMBER  NOT NULL , 
     ID_CITA        NUMBER , 
     DIAGNOSTICO    VARCHAR2 (500) , 
     INDICACIONES   VARCHAR2 (500) , 
     FECHA_REGISTRO DATE DEFAULT SYSDATE 
    ) 
    LOGGING 
;

ALTER TABLE REPORTE_MEDICO 
    ADD CONSTRAINT REPORTE_MEDICO_PK PRIMARY KEY ( ID_REPORTE ) ;

ALTER TABLE CITA 
    ADD CONSTRAINT CITA_EMPLEADO_FK FOREIGN KEY 
    ( 
     ID_MEDICO
    ) 
    REFERENCES EMPLEADO 
    ( 
     ID_EMPLEADO
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE CITA 
    ADD CONSTRAINT CITA_EMPLEADO_FKv1 FOREIGN KEY 
    ( 
     ID_RECEPCIONISTA
    ) 
    REFERENCES EMPLEADO 
    ( 
     ID_EMPLEADO
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE CITA 
    ADD CONSTRAINT CITA_PACIENTE_FK FOREIGN KEY 
    ( 
     ID_PACIENTE
    ) 
    REFERENCES PACIENTE 
    ( 
     ID_PACIENTE
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE RECUPERACION_CONTRASENA 
    ADD CONSTRAINT RECUPERACION_CONTRASENA_CUENTA_FK FOREIGN KEY 
    ( 
     ID_CUENTA
    ) 
    REFERENCES CUENTA 
    ( 
     ID_CUENTA
    ) 
    NOT DEFERRABLE 
;

ALTER TABLE REPORTE_MEDICO 
    ADD CONSTRAINT REPORTE_MEDICO_CITA_FK FOREIGN KEY 
    ( 
     ID_CITA
    ) 
    REFERENCES CITA 
    ( 
     ID_CITA
    ) 
    NOT DEFERRABLE 
;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             14
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   1
-- WARNINGS                                 0
