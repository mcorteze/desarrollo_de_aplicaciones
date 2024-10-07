-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-10-06 22:05:55 CLST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE academia (
    id_academia            INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    nombre                 VARCHAR2(100 CHAR) NOT NULL,
    tipo                   VARCHAR2(50 BYTE),
    direccion              VARCHAR2(255 BYTE),
    rut                    VARCHAR2(15 BYTE) NOT NULL,
    telefono               VARCHAR2(15 BYTE),
    correo                 VARCHAR2(100 BYTE),
    municipio_id_municipio INTEGER NOT NULL
);

ALTER TABLE academia ADD CONSTRAINT academia_pk PRIMARY KEY ( id_academia );

CREATE TABLE formulario (
    id_formulario          INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    fecha_postulacion      DATE,
    cuenta_bancaria        VARCHAR2(20 BYTE) NOT NULL,
    titular                VARCHAR2(100 BYTE) NOT NULL,
    banco                  VARCHAR2(100 BYTE) NOT NULL,
    academia_id_academia   INTEGER NOT NULL,
    municipio_id_municipio INTEGER NOT NULL
);

ALTER TABLE formulario ADD CONSTRAINT formulario_pk PRIMARY KEY ( id_formulario,
                                                                  municipio_id_municipio );

CREATE TABLE municipio (
    id_municipio INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    nombre       VARCHAR2(100 BYTE) NOT NULL,
    direccion    VARCHAR2(255 BYTE)
);

ALTER TABLE municipio ADD CONSTRAINT municipio_pk PRIMARY KEY ( id_municipio );

CREATE TABLE profesor (
    id_profesor      INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    nombre           VARCHAR2(100) NOT NULL,
    tipocontratacion VARCHAR2(50 BYTE),
    sueldo           NUMBER(10, 2)
);

ALTER TABLE profesor ADD CONSTRAINT profesor_pk PRIMARY KEY ( id_profesor );

CREATE TABLE relation_1 (
    academia_id_academia INTEGER NOT NULL,
    profesor_id_profesor INTEGER NOT NULL
);

ALTER TABLE relation_1 ADD CONSTRAINT relation_1_pk PRIMARY KEY ( academia_id_academia,
                                                                  profesor_id_profesor );

CREATE TABLE relation_6 (
    profesor_id_profesor       INTEGER NOT NULL,
    turno_academia_id_academia INTEGER NOT NULL,
    turno_id_turno             INTEGER NOT NULL
);

ALTER TABLE relation_6
    ADD CONSTRAINT relation_6_pk PRIMARY KEY ( profesor_id_profesor,
                                               turno_academia_id_academia,
                                               turno_id_turno );

CREATE TABLE turno (
    id_turno             INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
    horario              VARCHAR2(50),
    academia_id_academia INTEGER NOT NULL
);

ALTER TABLE turno ADD CONSTRAINT turno_pk PRIMARY KEY ( academia_id_academia,
                                                        id_turno );

ALTER TABLE academia
    ADD CONSTRAINT academia_municipio_fk FOREIGN KEY ( municipio_id_municipio )
        REFERENCES municipio ( id_municipio );

ALTER TABLE formulario
    ADD CONSTRAINT formulario_academia_fk FOREIGN KEY ( academia_id_academia )
        REFERENCES academia ( id_academia );

ALTER TABLE formulario
    ADD CONSTRAINT formulario_municipio_fk FOREIGN KEY ( municipio_id_municipio )
        REFERENCES municipio ( id_municipio );

ALTER TABLE relation_1
    ADD CONSTRAINT relation_1_academia_fk FOREIGN KEY ( academia_id_academia )
        REFERENCES academia ( id_academia );

ALTER TABLE relation_1
    ADD CONSTRAINT relation_1_profesor_fk FOREIGN KEY ( profesor_id_profesor )
        REFERENCES profesor ( id_profesor );

ALTER TABLE relation_6
    ADD CONSTRAINT relation_6_profesor_fk FOREIGN KEY ( profesor_id_profesor )
        REFERENCES profesor ( id_profesor );

ALTER TABLE relation_6
    ADD CONSTRAINT relation_6_turno_fk FOREIGN KEY ( turno_academia_id_academia,
                                                     turno_id_turno )
        REFERENCES turno ( academia_id_academia,
                           id_turno );

ALTER TABLE turno
    ADD CONSTRAINT turno_academia_fk FOREIGN KEY ( academia_id_academia )
        REFERENCES academia ( id_academia );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             7
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
