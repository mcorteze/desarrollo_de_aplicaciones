DECLARE
    -- Variable tipo registro para la tabla DETALLE_DE_CLIENTES
    C_DETALLE DETALLE_DE_CLIENTES%ROWTYPE;
    
    -- Variables para el rango de IDs
    V_MINID NUMBER;
    V_MAXID NUMBER;
    
    -- Variables escalares y %TYPE
    V_RUT CLIENTE.NUMRUN_CLI%TYPE;
    V_RENTA CLIENTE.RENTA%TYPE;
    V_EDAD NUMBER;
    V_PUNTAJE NUMBER := 0;
    V_CORREO VARCHAR2(100);
    V_TIPO_CLI CLIENTE.ID_TIPO_CLI%TYPE;
    V_COMUNA CLIENTE.ID_COMUNA%TYPE;
    
    V_APPATERNO CLIENTE.APPATERNO_CLI%TYPE;
    V_APMATERNO CLIENTE.APMATERNO_CLI%TYPE;
    V_PNOMBRE CLIENTE.PNOMBRE_CLI%TYPE;
    
    V_FECHA_NAC CLIENTE.FECHA_NAC_CLI%TYPE;

    -- Variables adicionales
    V_TOTAL_CLIENTES NUMBER := 0;
    V_PROCESADOS NUMBER := 0;
    
    -- Variable para el mes actual
    V_MES_PROCESO VARCHAR2(2);
    V_ANIO_PROCESO VARCHAR2(4);
BEGIN
    DBMS_OUTPUT.PUT_LINE('Inicia el procesamiento de registros de clientes.');
    EXECUTE IMMEDIATE 'TRUNCATE TABLE DETALLE_DE_CLIENTES';
    
    -- Obtenemos el rango de IDs de los clientes
    SELECT MIN(ID_CLI), MAX(ID_CLI)
    INTO V_MINID, V_MAXID
    FROM CLIENTE;

    -- Obtener el total de clientes para validar después
    SELECT COUNT(*) INTO V_TOTAL_CLIENTES
    FROM CLIENTE;

    -- Empezamos el ciclo para recorrer los clientes
    WHILE V_MINID <= V_MAXID LOOP
        -- *********************************
        -- Obtener mes actual
        V_MES_PROCESO := TO_CHAR(SYSDATE, 'MM'); -- Detecta el mes actual
        V_ANIO_PROCESO := TO_CHAR(SYSDATE, 'YYYY');
        -- DBMS_OUTPUT.PUT_LINE('Mes de ejecución : ' || V_MES_PROCESO);
        
        -- Inicializamos variables que luego usaremos
        SELECT NUMRUN_CLI, APPATERNO_CLI, APMATERNO_CLI, PNOMBRE_CLI, FECHA_NAC_CLI, RENTA, ID_TIPO_CLI, ID_COMUNA, TRUNC(MONTHS_BETWEEN(SYSDATE, FECHA_NAC_CLI) / 12)
        INTO V_RUT, V_APPATERNO, V_APMATERNO, V_PNOMBRE, V_FECHA_NAC, V_RENTA, V_TIPO_CLI, V_COMUNA, V_EDAD
        FROM CLIENTE
        WHERE ID_CLI = V_MINID;
        
        V_PUNTAJE := 0;
        -- Regla (d)
        IF V_RENTA > 700000 AND V_COMUNA NOT IN (85, 80, 84) THEN 
            V_PUNTAJE := ROUND(V_RENTA * 0.03);
        ELSE
            -- Regla (e): Si no se cumple la regla anterior, puntaje basado en la edad
            IF (V_TIPO_CLI = 'B' OR V_TIPO_CLI = 'D') THEN
                V_PUNTAJE := 30 * V_EDAD;
            END IF;

            -- Regla (f): Si el puntaje sigue siendo 0, calcular según TRAMO_EDAD
            IF V_PUNTAJE = 0 THEN
                SELECT PORCENTAJE INTO V_PUNTAJE
                FROM TRAMO_EDAD
                WHERE TRAMO_INF <= V_EDAD AND TRAMO_SUP >= V_EDAD
                AND ANNO_VIG = 2025;
                V_PUNTAJE := ROUND(V_RENTA * V_PUNTAJE / 100);
            END IF;
        END IF;
        
        -- Construcción del correo electrónico
        V_CORREO := LOWER(V_APPATERNO) || 
        TRUNC(V_EDAD) || '*' || 
        SUBSTR(V_PNOMBRE, 1, 1) || 
        TO_CHAR(V_FECHA_NAC, 'DD') || 
        V_MES_PROCESO || '@LogiCarg.cl';

        -- *********************************
        
        DBMS_OUTPUT.PUT_LINE('Apellido: ' || V_APPATERNO || ', ' || 'Renta: ' || V_RENTA || ', Comuna: ' || V_COMUNA || ', Puntaje: ' || TRUNC(V_PUNTAJE));
        
        -- Asignación de valores al registro C_DETALLE
        C_DETALLE.IDC := V_MINID;
        C_DETALLE.RUT := V_RUT;
        C_DETALLE.CLIENTE := INITCAP(LOWER(V_APPATERNO || ' ' || V_APMATERNO || ' ' || V_PNOMBRE));
        C_DETALLE.EDAD := V_EDAD;
        C_DETALLE.PUNTAJE := TRUNC(V_PUNTAJE);
        C_DETALLE.CORREO_CORP := V_CORREO;
        C_DETALLE.PERIODO := V_MES_PROCESO || '/' || V_ANIO_PROCESO;
        
        -- Inserción del registro en la tabla DETALLE_DE_CLIENTES
        INSERT INTO DETALLE_DE_CLIENTES VALUES C_DETALLE;
        
        -- Aumentamos el contador de clientes procesados
        V_PROCESADOS := V_PROCESADOS + 1;

        -- Commit de la transacción después de cada inserción
        COMMIT;

        -- Aumentamos el valor de V_MINID 
        V_MINID := V_MINID + 5;
        
    END LOOP;

    -- Verificar si todos los clientes fueron procesados correctamente
    IF V_PROCESADOS = V_TOTAL_CLIENTES THEN
        DBMS_OUTPUT.PUT_LINE('Proceso exitoso: Listo! ' || V_PROCESADOS || ' clientes.');
        COMMIT;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Error: El proceso no recorrió todos los clientes. Se procesaron solo ' || V_PROCESADOS || ' clientes.');
        ROLLBACK;
    END IF;
    
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error en el proceso: ' || SQLERRM);
END;
/
