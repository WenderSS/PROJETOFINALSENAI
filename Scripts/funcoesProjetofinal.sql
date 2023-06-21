DELIMITER //
CREATE FUNCTION fn_valida_texto( texto VARCHAR(255), parametro INT)
RETURNS BOOLEAN
READS SQL DATA 
BEGIN
    DECLARE valor BOOLEAN;
		IF 
			(LENGTH(TRIM(texto))) < parametro THEN
            SET valor = 0;
            RETURN valor;
		ELSE
			SET valor = 1;
			RETURN valor;
		END IF;
END //
DELIMITER ;

DELIMITER //
CREATE FUNCTION fn_minuscula2(texto VARCHAR(255))
RETURNS VARCHAR (255)
DETERMINISTIC 
BEGIN
DECLARE resultado VARCHAR (255);
set resultado = lower (texto);
RETURN resultado ;
END//
DELIMITER ;