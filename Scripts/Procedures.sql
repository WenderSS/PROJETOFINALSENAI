DELIMITER //
CREATE PROCEDURE sp_insert_classificacao(idade_valor INT, descricao_texto VARCHAR(255))
	BEGIN
    IF 
		(descricao_texto IS NULL ) OR (fn_valida_texto(descricao_texto, 50)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descrição inválida';
    ELSE
		INSERT INTO tb_classificacao
        (idade, descricao)
        VALUES
        (idade_valor,  LOWER(descricao_texto));
	END IF;
    END // 
DELIMITER ; 

CALL sp_insert_classificacao('10', 'Não indicado para menores de 14 anos,pois possui violência, drogas, sexo e rock''n''roll');
CALL sp_insert_classificacao('12', ' Não indicado para menores de 12 anos, apresenta conteúdo de violência extrema, assassinato e incentivo ao uso de entorpecentes ');
CALL sp_insert_classificacao('14', ' contraindicado para pessoas que sofrem de algum distúrbio mental ou comportamento agressivo e que seja facilmente influenciada por decisões erradas');
CALL sp_insert_classificacao('16', ' não recomendado para menores de 16 anos, devido a presença de conteúdo adulto, violência doméstica e incitação ao nazismo');
CALL sp_insert_classificacao('18', 'não recomendado para menores de 18 anos, uma vez que esta obra traz diversos aspectos políticos, filosoficos e religiosos que podem facilmente corromper a mente das pessoas');

select * from tb_classificacao;


-- Procedure UPDATE tb_classificacao_indicativa
-- DROP PROCEDURE sp_update_classificacao_indicativa;
DELIMITER //
CREATE PROCEDURE sp_update_classificacao(valor_id INT, idade_valor INT, descricao_texto VARCHAR(255))
	BEGIN
		IF NOT EXISTS
			(SELECT id_classificacao FROM tb_classificacao WHERE id_classificacao = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID inválido';
		ELSEIF
			(descricao_texto IS NULL ) OR (fn_valida_texto(descricao_texto, 50)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descrição inválida';
		ELSE
			UPDATE tb_classificacao SET idade = idade_valor, descricao = LOWER(descricao_texto)
			WHERE id_classificacao = valor_id;
		END IF;
    END //
DELIMITER ;

-- SELECT * FROM tb_classificacao_indicativa;
-- CALL sp_update_classificacao_indicativa(1, 'livre','O programa é considerado apropriado para todas as faixas etárias. Não há conteúdo que seja prejudicial ou ofensivo para crianças.'); 

-- Procedure DELETE tb_classificacao_indicativa
DELIMITER //
CREATE PROCEDURE sp_delete_classificacao (valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_classificacao FROM tb_classificacao WHERE id_classificacao = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_classificacao
		WHERE id_classificacao = valor_id;
	END IF;
END //
DELIMITER ;

-- DESCRIBE tb_classificacao_indicativa;
-- SELECT * FROM tb_classificacao_indicativa;
-- CALL sp_delete_classificacao_indicativa(9);


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 2
-- Porcedure INSERT tb_categoria
-- DROP PROCEDURE sp_insert_categoria
DELIMITER //
CREATE PROCEDURE sp_insert_categoria(nome_categoria VARCHAR(45))
	BEGIN
    IF 
		(nome_categoria IS NULL ) OR (fn_valida_texto(descricao_TEXTO, 3)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao invalida';
    ELSE
		INSERT INTO tb_categoria
        (nome, dt_atualizacao)
        VALUES
        (LOWER(nome_categoria), CURDATE());
	END IF;
    END // 
DELIMITER ;

-- DESCRIBE tb_categoria;

CALL sp_insert_categoria('suspense');
CALL sp_insert_categoria('terror');
CALL sp_insert_categoria('drama');


-- SELECT * FROM tb_categoria;


-- Procedure UPDATE tb_categoria
DROP PROCEDURE sp_update_categoria;
DELIMITER //
CREATE PROCEDURE sp_update_categoria(valor_id INT, nome_valor VARCHAR(45))
	BEGIN
		IF NOT EXISTS
			(SELECT id_categoria FROM tb_categoria WHERE id_categoria = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 3)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao invalida';
		ELSE
			UPDATE tb_categoria SET nome = LOWER(nome_valor), dt_atualizacao = CURDATE()
			WHERE id_categoria = valor_id;
		END IF;
    END //
DELIMITER ;

-- DESCRIBE tb_categoria;
-- SELECT * FROM tb_categoria;

-- CALL sp_update_categoria(4, 'suspense' );


-- Procedure DELETE tb_categoria
-- DROP PROCEDURE sp_delete_categoria;
DELIMITER //
CREATE PROCEDURE sp_delete_categoria (valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_categoria FROM tb_categoria WHERE id_categoria = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_categoria
		WHERE id_categoria = valor_id;
	END IF;
END //
DELIMITER ;


-- DESCRIBE tb_categoria;
-- SELECT * FROM tb_categoria;
-- CALL sp_delete_categoria(6);




-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 3
-- Procedure INSERT tb_idioma
-- DROP PROCEDURE sp_insert_idioma;
DELIMITER //
CREATE PROCEDURE sp_insert_idioma(nome_idioma VARCHAR(45))
	BEGIN
    IF 
		(nome_idioma IS NULL ) OR (fn_valida_texto(nome_idioma, 4)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao invalida';
    ELSE
		INSERT INTO tb_idioma
        (nome, dt_atualizacao)
        VALUES
        (LOWER(nome_idioma), CURDATE());
	END IF;
    END // 
DELIMITER ;

-- DESCRIBE tb_idioma;
-- SELECT * FROM tb_idioma;

CALL sp_insert_idioma('português');
CALL sp_insert_idioma('inglês');
CALL sp_insert_idioma('espanhol');
CALL sp_insert_idioma('coreano');




-- Procedure UPDATE tb_idioma
-- DROP PROCEDURE sp_update_idioma;
DELIMITER //
CREATE PROCEDURE sp_update_idioma(valor_id INT, nome_valor VARCHAR(45))
	BEGIN
		IF NOT EXISTS
			(SELECT id_idioma FROM tb_idioma WHERE id_idioma = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 4)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao invalida';
		ELSE
			UPDATE tb_idioma SET nome = LOWER(nome_valor), dt_atualizacao = CURDATE()
			WHERE id_idioma = valor_id;
		END IF;
    END //
DELIMITER ;

-- DESCRIBE tb_idioma;
-- SELECT * FROM tb_idioma;

-- CALL sp_update_idioma(1, 'po');


-- Procedure DELETE tb_idioma
-- DROP PROCEDURE sp_delete_idioma;
DELIMITER //
CREATE PROCEDURE sp_delete_idioma (valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_idioma FROM tb_idioma WHERE id_idioma = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_idioma
		WHERE id_idioma = valor_id;
	END IF;
END //
DELIMITER ;

-- SELECT * FROM tb_idioma;
-- CALL sp_delete_idioma(5);




-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 4
-- Procedure INSERT tb_tipo_pagamento
-- DROP PROCEDURE sp_insert_tipo_pagamento;
DELIMITER //
CREATE PROCEDURE sp_insert_tipo_pagamento(nome_valor VARCHAR(30))
	BEGIN
    IF 
		(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 4)) < 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao invalida';
    ELSE
		INSERT INTO tb_tipo_pagamento
        (categoria, dt_atualizacao)
        VALUES
        (LOWER(nome_valor), CURDATE());
	END IF;
    END // 
DELIMITER ;

-- DESCRIBE tb_tipo_pagamento;
-- SELECT * FROM tb_tipo_pagamento;

CALL sp_insert_tipo_pagamento('cartão');
CALL sp_insert_tipo_pagamento('pix');
CALL sp_insert_tipo_pagamento('boleto');
CALL sp_insert_tipo_pagamento('deposito bancario');


-- Procedure UPDATE tb_tipo_pagamento
-- DROP PROCEDURE sp_update_tipo_pagamento;
DELIMITER //
CREATE PROCEDURE sp_update_tipo_pagamento(valor_id INT, nome_valor VARCHAR(30))
	BEGIN
		IF NOT EXISTS
			(SELECT id_tipo_pagamento FROM tb_tipo_pagamento WHERE id_tipo_pagamento = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_valor IS NULL ) OR (fn_valida_texto(nome_valor, 4)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao invalida';
		ELSE
			UPDATE tb_tipo_pagamento SET categoria = LOWER(nome_valor), dt_atualizacao = CURDATE()
			WHERE id_tipo_pagamento = valor_id;
		END IF;
    END //
DELIMITER ;

-- DESCRIBE tb_tipo_pagamento;
-- SELECT * FROM tb_tipo_pagamento;
-- CALL sp_update_tipo_pagamento(1,'cartão');



-- Procedure DELETE tb_tipo_pagamento
-- DROP PROCEDURE sp_delete_tipo_pagamento;
DELIMITER //
CREATE PROCEDURE sp_delete_tipo_pagamento(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_tipo_pagamento FROM tb_tipo_pagamento WHERE id_tipo_pagamento = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_tipo_pagamento
		WHERE id_tipo_pagamento = valor_id;
	END IF;
END //
DELIMITER ;



-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 5
-- Procedure INSERT tb_país
-- DROP PROCEDURE sp_insert_pais;
DELIMITER //
CREATE PROCEDURE sp_insert_pais(nome_pais VARCHAR(45), cod_pais CHAR(3))
	BEGIN
	IF
		(cod_pais IS NULL ) OR (fn_valida_texto(cod_pais, 3) = 0) OR (LENGTH(cod_pais) >3) THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'quantidade de caractere invalida';
	ELSEIF
		(nome_pais IS NULL ) OR (fn_valida_texto(nome_pais, 4)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao invalida';
    ELSE
		INSERT INTO tb_pais
        (nome, codigo)
        VALUES
        (LOWER(nome_pais), LOWER(cod_pais));
	END IF;
    END // 
DELIMITER ;

-- DESCRIBE tb_pais;
-- SELECT * FROM tb_pais;

CALL sp_insert_pais('brasil', 'bra');
CALL sp_insert_pais('estados unidos', 'eua');
CALL sp_insert_pais('espanha', 'esp');
CALL sp_insert_pais('coreia do sul', 'kor');


-- Procedure UPDATE tb_país
-- DROP PROCEDURE sp_update_pais;
DELIMITER //
CREATE PROCEDURE sp_update_pais(valor_id INT, nome_pais VARCHAR(45), cod_pais CHAR(3))
	BEGIN
		IF NOT EXISTS
			(SELECT id_pais FROM tb_pais WHERE id_pais = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_pais IS NULL ) OR (fn_valida_texto(nome_pais, 4)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome_pais invalido';
		ELSEIF
			(nome_pais IS NULL ) OR (fn_valida_texto(cod_pais, 3) = 0) OR (LENGTH(cod_pais) > 3 ) THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'quantidade de caractere (id_pais) invalida';
		ELSE
			UPDATE tb_pais SET nome = LOWER(nome_pais), codigo = cod_pais
			WHERE id_pais = valor_id;
		END IF;
    END //
DELIMITER ;

-- DESCRIBE tb_pais;
-- SELECT * FROM tb_pais;
-- CALL sp_update_pais(1,'BRASÍL', 'BRA');

-- Procedure DELETE tb_tipo_pagamento
-- DROP PROCEDURE sp_delete_pais;
DELIMITER //
CREATE PROCEDURE sp_delete_pais(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_pais FROM tb_pais WHERE id_pais = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_pais
		WHERE id_pais = valor_id;
	END IF;
END //
DELIMITER ;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 6
-- Procedure INSERT tb_plano
-- DROP PROCEDURE sp_insert_plano;
DELIMITER //
CREATE PROCEDURE sp_insert_plano(nome_plano VARCHAR(45), valor_plano FLOAT, descricao_plano VARCHAR(255))
	BEGIN
	IF
		(descricao_plano IS NULL ) OR (fn_valida_texto(nome_valor, 4 )) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome invalido';
	ELSEIF
		(valor_plano IS NULL ) OR (valor_plano NOT BETWEEN 20.00 AND 100.00) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'valor fora de parametro';
	ELSEIF
		(descricao_plano IS NULL ) OR (fn_valida_texto(descricao_plano, 100)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao muito curta';
    ELSE
		INSERT INTO tb_plano
        (nome, valor, descricao)
        VALUES
        (LOWER(nome_plano), valor_plano, LOWER(descricao_plano));
	END IF;
    END // 
DELIMITER ;

-- DESCRIBE tb_plano;
-- SELECT * FROM tb_plano;
CALL sp_insert_plano('basico', 25.90 ,'resolução (HD), livre de anúncios, proporciona acesso ao catálogo 
completo e permite que você faça downloads em dispositivos para assistir offline.');
CALL sp_insert_plano('padrão', 39.99 , 'duas telas simultâneas, (Full HD). Ideal para compartilhar o acesso com outra pessoa em uma mesma residência. Além disso, é livre de anúncios, 
permite fazer o download dos conteúdos para assistir offline');
CALL sp_insert_plano('premium', 55.99 , 'Resolução Ultra HD 4K, HDR, Dolby Vision e Dolby Audio. Além disso, é possível assistir ao streaming em até quatro telas simultâneas — ideal para famílias numerosas que compartilham a mesma residência.');






-- Procedure UPDATE tb_plano
-- DROP PROCEDURE sp_update_plano;
DELIMITER //
CREATE PROCEDURE sp_update_plano(valor_id INT, nome_plano VARCHAR(45), valor FLOAT, descricao_plano  VARCHAR(255))
	BEGIN
		IF NOT EXISTS
			(SELECT id_plano FROM tb_plano WHERE id_plano = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_plano IS NULL ) OR (fn_valida_texto(nome_valor, 4)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome invalido';
        ELSEIF
			(valor IS NULL ) OR (valor NOT BETWEEN 20.00 AND 100.00) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'valor fora de parametro';
		ELSEIF
			(descricao_plano IS NULL ) OR (fn_valida_texto(descricao_plano, 100 )) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao muito curta';
		ELSE
			UPDATE tb_plano SET nome = LOWER(nome_plano), valor = preco, descricao = LOWER(descricao_plano) 
			WHERE id_plano = valor_id;
		END IF;
    END //
DELIMITER ;

-- DESCRIBE tb_plano;
-- SELECT * FROM tb_plano;

-- CALL sp_update_plano(3 , 'premium', 55.99 , 'Resolução Ultra HD 4K, HDR, Dolby Vision e Dolby Audio. Além disso, é possível assistir ao streaming em até quatro telas simultâneas — ideal para famílias numerosas que compartilham a mesma residência.');






-- Procedure DELETE tb_plano
-- DROP PROCEDURE sp_delete_plano;
DELIMITER //
CREATE PROCEDURE sp_delete_plano(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_plano FROM tb_plano WHERE id_plano = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_plano
		WHERE id_plano = valor_id;
	END IF;
END //
DELIMITER ;


-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 7
-- Procedure INSERT tb_ator
-- DROP PROCEDURE sp_insert_ator;
DELIMITER //
CREATE PROCEDURE sp_insert_ator(nome_ator VARCHAR(45), sobrenome_ator VARCHAR(45), nascimento DATE, foto_ator VARCHAR(255))
	BEGIN
	IF
		(nome_ator IS NULL ) OR (fn_valida_texto(nome_ator, 3)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome invalido';
	ELSEIF
		(sobrenome_ator IS NULL ) OR (fn_valida_texto(sobrenome_ator, 2)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'sobrenome invalido';
	ELSEIF
		(nascimento IS NULL) OR (nascimento = '0000-00-00') THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'idade fora de parametro';
    ELSEIF
		(foto_ator IS NULL ) OR (fn_valida_texto(foto_ator, 10)) = 0 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'link da foto invalido';
	ELSE
		INSERT INTO tb_ator
        (nome, sobrenome, dt_nascimento, foto)
        VALUES
        (LOWER(nome_ator), LOWER(sobrenome_ator), nascimento, foto_ator);
	END IF;
    END // 
DELIMITER ; 


-- DESCRIBE tb_ator;
-- SELECT * FROM tb_ator;
-- CALL sp_insert_ator('george','clooney', '1961-05-06', 'https');

DELIMITER //
CREATE PROCEDURE sp_delete_ator(valor_id INT)
BEGIN
	IF NOT EXISTS
		(SELECT id_ator FROM tb_ator WHERE id_ator = valor_id) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
    ELSE
		DELETE FROM  tb_ator
		WHERE id_ator = valor_id;
	END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_update_ator(valor_id INT, nome_ator VARCHAR(45), sobrenome_ator  VARCHAR(255), data_nascimento_ator VARCHAR(255), FOTO_ATOR VARCHAR(255))
	BEGIN
		IF NOT EXISTS
			(SELECT id_ator FROM tb_ator WHERE id_ator = valor_id) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'ID invalido';
		ELSEIF
			(nome_ator IS NULL ) OR (fn_valida_texto(nome_ator, 4)) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'nome invalido';
		ELSEIF
			(sobrenome_ator IS NULL ) OR (fn_valida_texto(sobrenome_autor, 130 )) = 0 THEN 
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =  'descricao muito curta';
		ELSE
			UPDATE tb_ator SET nome = LOWER(nome_ator), sobrenome = LOWER(sobrenome_ator) 
			WHERE id_plano = valor_id;
		END IF;
    END //
DELIMITER ;
