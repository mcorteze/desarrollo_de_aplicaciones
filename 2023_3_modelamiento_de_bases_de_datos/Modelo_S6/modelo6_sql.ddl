-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-09-16 22:43:34 CLST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE cliente (
    rut       VARCHAR2(10 BYTE) NOT NULL,
    nombres   VARCHAR2(50 BYTE),
    apellidos VARCHAR2(50 BYTE),
    telefono  VARCHAR2(9 BYTE),
    email     VARCHAR2(50 BYTE)
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( rut );

CREATE TABLE orden (
    cod_orden      VARCHAR2(6 BYTE) NOT NULL,
    f_creacion     DATE,
    estado_general VARCHAR2(50 BYTE),
    cliente_rut    VARCHAR2(10 BYTE) NOT NULL
);

ALTER TABLE orden ADD CONSTRAINT orden_pk PRIMARY KEY ( cod_orden );

CREATE TABLE orden_seguimiento (
    orden_cod_orden             VARCHAR2(6 BYTE) NOT NULL,
    seguimiento_cod_seguimiento VARCHAR2(10 BYTE) NOT NULL
);

CREATE TABLE orden_servicio (
    orden_cod_orden       VARCHAR2(6 BYTE) NOT NULL,
    servicio_cod_servicio VARCHAR2(6 BYTE) NOT NULL
);

CREATE TABLE repuesto (
    cod_repuesto VARCHAR2(50 BYTE) NOT NULL,
    nombre       VARCHAR2(50 BYTE),
    descripcion  VARCHAR2(100 BYTE),
    precio       INTEGER
);

ALTER TABLE repuesto ADD CONSTRAINT repuesto_pk PRIMARY KEY ( cod_repuesto );

CREATE TABLE seguimiento (
    cod_seguimiento   VARCHAR2(10 BYTE) NOT NULL,
    estado_especifico VARCHAR2(50 BYTE),
    f_actualizacion   DATE
);

ALTER TABLE seguimiento ADD CONSTRAINT seguimiento_pk PRIMARY KEY ( cod_seguimiento );

CREATE TABLE servicio (
    cod_servicio VARCHAR2(6 BYTE) NOT NULL,
    nombre       VARCHAR2(50 BYTE),
    descripcion  VARCHAR2(100 BYTE),
    costo        INTEGER
);

ALTER TABLE servicio ADD CONSTRAINT servicio_pk PRIMARY KEY ( cod_servicio );

CREATE TABLE servicio_repuesto (
    servicio_cod_servicio VARCHAR2(6 BYTE) NOT NULL,
    repuesto_cod_repuesto VARCHAR2(50 BYTE) NOT NULL
);

ALTER TABLE servicio_repuesto ADD CONSTRAINT servicio_repuesto_pk PRIMARY KEY ( repuesto_cod_repuesto );

CREATE TABLE vehiculo (
    patente     VARCHAR2(50 BYTE) NOT NULL,
    marca       VARCHAR2(50 BYTE),
    anio        INTEGER,
    color       VARCHAR2(50 BYTE),
    cliente_rut VARCHAR2(10 BYTE) NOT NULL
);

ALTER TABLE vehiculo ADD CONSTRAINT vehiculo_pk PRIMARY KEY ( patente );

ALTER TABLE orden
    ADD CONSTRAINT orden_cliente_fk FOREIGN KEY ( cliente_rut )
        REFERENCES cliente ( rut );

ALTER TABLE orden_servicio
    ADD CONSTRAINT os_orden_fk FOREIGN KEY ( orden_cod_orden )
        REFERENCES orden ( cod_orden );

ALTER TABLE orden_servicio
    ADD CONSTRAINT os_servicio_fk FOREIGN KEY ( servicio_cod_servicio )
        REFERENCES servicio ( cod_servicio );

ALTER TABLE orden_seguimiento
    ADD CONSTRAINT ose_orden_fk FOREIGN KEY ( orden_cod_orden )
        REFERENCES orden ( cod_orden );

ALTER TABLE orden_seguimiento
    ADD CONSTRAINT ose_seguimiento_fk FOREIGN KEY ( seguimiento_cod_seguimiento )
        REFERENCES seguimiento ( cod_seguimiento );

ALTER TABLE servicio_repuesto
    ADD CONSTRAINT sr_repuesto_fk FOREIGN KEY ( repuesto_cod_repuesto )
        REFERENCES repuesto ( cod_repuesto );

ALTER TABLE servicio_repuesto
    ADD CONSTRAINT sr_servicio_fk FOREIGN KEY ( servicio_cod_servicio )
        REFERENCES servicio ( cod_servicio );

ALTER TABLE vehiculo
    ADD CONSTRAINT vehiculo_cliente_fk FOREIGN KEY ( cliente_rut )
        REFERENCES cliente ( rut );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             9
-- CREATE INDEX                             0
-- ALTER TABLE                             15
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
-- ERRORS                                   0
-- WARNINGS                                 0
