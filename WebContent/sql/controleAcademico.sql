CREATE DATABASE controleAcademico
GO 
USE controleAcademico

CREATE TABLE alunos(
ra INT NOT NULL,
nome VARCHAR (200) NOT NULL,
primary key(ra)
)

INSERT INTO alunos VALUES (1520814, 'Taciana Tamyis Alves de Souza')
INSERT INTO alunos VALUES (1555215, 'Thiago Fernando da Silva Santos')
INSERT INTO alunos VALUES (1547854, 'Lucas Farias')
INSERT INTO alunos VALUES (1248795, 'Claudio Martine')
INSERT INTO alunos VALUES (1548957, 'Renan de Andrade Silva')
INSERT INTO alunos VALUES (1545698, 'Elton Bezerra')
INSERT INTO alunos VALUES (1356968, 'José Francisco')
INSERT INTO alunos VALUES (1478957, 'Antonio Felipe Cardozo')
INSERT INTO alunos VALUES (1352647, 'Felipe Rodrigues dos Santos')
INSERT INTO alunos VALUES (1548963, 'Elcio Araujo')

CREATE TABLE avaliacao (
codigo INT IDENTITY (1,1) NOT NULL,
tipo VARCHAR (50) NOT NULL,
PRIMARY KEY(codigo)
)

INSERT INTO avaliacao VALUES('P1')
INSERT INTO avaliacao VALUES('P2')
INSERT INTO avaliacao VALUES('P3')
INSERT INTO avaliacao VALUES('Pre Exame')
INSERT INTO avaliacao VALUES('Exame Final')
INSERT INTO avaliacao VALUES('Monografia Completa')
INSERT INTO avaliacao VALUES('Monografia Resumida')
INSERT INTO avaliacao VALUES('Trabalho')

CREATE TABLE disciplinas(
codigo INT NOT NULL,
nome VARCHAR(300) NOT NULL,
sigla VARCHAR(50) NOT NULL,
turno VARCHAR(50) NOT NULL,
num_aulas INT NOT NULL,
primary key(codigo)
)

INSERT INTO disciplinas VALUES(4203010, 'Arquitetura e Organizacao de Computadores','AOC', 'T', 4)
INSERT INTO disciplinas VALUES(4203020, 'Arquitetura e Organizacao de Computadores','AOC', 'N', 4)
INSERT INTO disciplinas VALUES(4208010, 'Laboratório de Hardware','LAB HW', 'T', 2)
INSERT INTO disciplinas VALUES(4226004, 'Banco de Dados','BD', 'T', 4)
INSERT INTO disciplinas VALUES(4213003, 'Sistemas Operacionais I','SO I', 'T', 4) 
INSERT INTO disciplinas VALUES(4213013, 'Sistemas Operacionais I','SO I', 'N', 4)
INSERT INTO disciplinas VALUES(4233005, 'Laboratorio de Banco de Dados','LAB BD', 'T', 4)
INSERT INTO disciplinas VALUES(5005220, 'Metodos para Producao de Conhecimento','METPRODC', 'T', 4)



CREATE TABLE faltas(
ra_aluno INT NOT NULL,
codigo_disciplina INT NOT NULL,
dataFalta DATE NOT NULL,
presenca INT
FOREIGN KEY (ra_aluno) REFERENCES alunos (ra),
FOREIGN KEY (codigo_disciplina) REFERENCES disciplinas (codigo),
)


CREATE TABLE notas(
ra_aluno INT NOT NULL,
codigo_disciplina INT NOT NULL,
codigo_avaliacao INT NOT NULL,
nota DECIMAL(7,2)
FOREIGN KEY (ra_aluno) REFERENCES alunos (ra),
FOREIGN KEY (codigo_disciplina) REFERENCES disciplinas (codigo),
FOREIGN KEY (codigo_avaliacao) REFERENCES avaliacao (codigo)
)

SELECT ra as RA, nome as Nome FROM alunos 
SELECT codigo, nome as disciplinas, sigla, turno, num_aulas as quantidade_aulas FROM disciplinas
SELECT * FROM avaliacao

-- 1) procedure para inserir notas dos alunos
ALTER PROCEDURE sp_insere_notas_alunos(@ra_aluno INT, @codigo_disciplina INT, 
				@codigo_avaliacao INT, @nota DECIMAL(7,2))
AS
	INSERT INTO notas VALUES 
	(@ra_aluno, @codigo_disciplina, @codigo_avaliacao, @nota)

--ra_aluno, codigo_disciplina, codigo_avaliacao, nota
EXEC sp_insere_notas_alunos 1555215,4203010,1,8.3
SELECT * FROM notas

-- 2) procedure para inserir faltas dos alunos
CREATE PROCEDURE sp_insere_faltas_alunos(@ra_aluno INT, 
				@codigo_disciplina INT, @data DATE, @presenca INT)
AS
	INSERT INTO faltas VALUES 
	(@ra_aluno, @codigo_disciplina, @data, @presenca)

--ra_aluno, codigo_disciplina, data, presenca
EXEC sp_insere_faltas_alunos 1555215,4203010,'15/05/2017',1
SELECT * FROM faltas 

/* 3) UDF para as notas nas disciplinas apresentando
(RA_Aluno, Nome_Aluno, Nota1, Nota2, ..., Média_Final, Situação(Aprovado ou Reprovado))*/
CREATE FUNCTION fn_notas(@codDisciplina int)
RETURNS @tabela TABLE (
	ra_aluno int,
	nome_aluno VARCHAR(100),
	N1 DECIMAL (7,2) DEFAULT 0,
	N2 DECIMAL (7,2) DEFAULT 0,
	Trabalho DECIMAL (7,2) DEFAULT 0,
	Pre_Exame DECIMAL (7,2) DEFAULT 0,
	Exame DECIMAL (7,2) DEFAULT 0,
	mediaFinal DECIMAL (7,2),
	situacao VARCHAR (30)
)
AS
BEGIN
	DECLARE @ra_aluno INT,
			@codigo_disciplina INT,
			@codigo_avaliacao INT,
			@nota DECIMAL (7,2)
	
	INSERT @tabela(ra_aluno, nome_aluno)
		SELECT DISTINCT nt.ra_aluno , al.nome
		FROM notas nt
		INNER JOIN alunos al
		ON nt.ra_aluno = al.ra
		WHERE nt.codigo_disciplina = @codDisciplina

	DECLARE cursor_nota CURSOR FOR
		SELECT ra_aluno, codigo_disciplina, codigo_avaliacao, nota
		FROM notas
		WHERE codigo_disciplina = @codDisciplina

	OPEN cursor_nota
	FETCH NEXT FROM cursor_nota INTO @ra_aluno, @codigo_disciplina, @codigo_avaliacao, @nota
	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @codigo_avaliacao = 1
		BEGIN
			UPDATE @tabela
			SET N1 = @nota
			WHERE ra_aluno = @ra_aluno 
		END

		IF @codigo_avaliacao = 2 
		BEGIN
			UPDATE @tabela
			SET N2 = @nota
			WHERE ra_aluno = @ra_aluno 
		END

		IF @codigo_avaliacao = 8 
		BEGIN
			UPDATE @tabela
			SET Trabalho = @nota
			WHERE ra_aluno = @ra_aluno 
		END

		IF @codigo_avaliacao = 4 
		BEGIN
			UPDATE @tabela
			SET Pre_Exame = @nota
			WHERE ra_aluno = @ra_aluno 
		END
		
		IF @codigo_avaliacao = 5 
		BEGIN
			UPDATE @tabela
			SET Exame = @nota
			WHERE ra_aluno = @ra_aluno 
		END

		FETCH NEXT FROM cursor_nota INTO @ra_aluno, @codigo_disciplina, @codigo_avaliacao, @nota
	END

	CLOSE cursor_nota
	DEALLOCATE cursor_nota

	-- lab de BD
	IF (@codDisciplina = 4233005)
	BEGIN
		UPDATE @tabela
		SET mediaFinal = ((N1*0.333) + (N2 * 0.333) + (Trabalho * 0.333)) 
	END
	-- SO I
	ELSE IF (@codDisciplina = 4213003 OR @codDisciplina = 4213013)
	BEGIN
		UPDATE @tabela
	SET mediaFinal = ((N1*0.35) + (N2 * 0.35) + (Trabalho * 0.3)) 
	END
	--Metodologia
	ELSE IF (@codDisciplina = 5005220)
	BEGIN
		UPDATE @tabela
		SET mediaFinal = ((N1*0.8) + (N2 * 0.2))
	END
	-- LAB HW, AOC e BD
	ELSE

	BEGIN	
		UPDATE @tabela
		SET mediaFinal = ((N1*0.3) + (N2 * 0.5) + (Trabalho * 0.2)) 
	END

	UPDATE @tabela
	SET situacao = 'Aprovado'
	WHERE mediaFinal >= 6

	-- lab BD
	IF (@codDisciplina = 4233005)
	BEGIN
		UPDATE @tabela
		SET mediaFinal = (((N1*0.333) + (N2 * 0.333) + (Trabalho * 0.333)) + Exame ) / 2
		WHERE mediaFinal <= 6 AND mediaFinal >=3 AND situacao IS NULL
	END
	-- SO I
	ELSE IF (@codDisciplina = 4213003 OR @codDisciplina = 4213013)
	BEGIN
		UPDATE @tabela
		SET mediaFinal = (((N1*0.35) + (N2 * 0.35) + (Trabalho * 0.3)) + Exame) /2
		WHERE mediaFinal <= 6 AND mediaFinal >=3 AND situacao IS NULL
	END
	--Metodologia
	ELSE IF(@codDisciplina = 5005220)
	BEGIN
		UPDATE @tabela
		SET mediaFinal = (((N1*0.8) + (N2 * 0.8)) + Exame ) / 2
		WHERE mediaFinal <= 6 AND mediaFinal >=3 AND situacao IS NULL
	END
	--LAB HW, AOC e BD
	ELSE 
	BEGIN
		UPDATE @tabela
		SET mediaFinal = (((N1*0.3) + (N2 * 0.5) + (Trabalho * 0.2)) + Exame ) / 2
		WHERE mediaFinal <= 6 AND mediaFinal >=3 AND situacao IS NULL

	END

	UPDATE @tabela
	SET situacao = 'Aprovado'
	WHERE mediaFinal >= 6

	UPDATE @tabela
	SET situacao = 'Reprovado'
	WHERE mediaFinal < 6

	RETURN
END

/*4) UDF para as faltas nas disciplinas apresentando*/
CREATE FUNCTION fn_presencas(@codDisciplina INT, @qtdAulasDia INT)
RETURNS @tabela TABLE (
	ra_aluno int,
	nome_aluno VARCHAR(100),
	data1 INT DEFAULT 0,
	data2 INT DEFAULT 0,
	data3 INT DEFAULT 0,
	data4 INT DEFAULT 0,
	data5 INT DEFAULT 0,
	data6 INT DEFAULT 0,
	data7 INT DEFAULT 0,
	data8 INT DEFAULT 0,
	data9 INT DEFAULT 0,
	data10 INT DEFAULT 0,
	data11 INT DEFAULT 0,
	data12 INT DEFAULT 0,
	data13 INT DEFAULT 0,
	data14 INT DEFAULT 0,
	data15 INT DEFAULT 0,
	data16 INT DEFAULT 0,
	data17 INT DEFAULT 0,
	data18 INT DEFAULT 0,
	data19 INT DEFAULT 0,
	data20 INT DEFAULT 0,
	data21 INT DEFAULT 0,
	data22 INT  DEFAULT 0,
	totalFaltas INT DEFAULT 0
)
AS
BEGIN

	DECLARE @ra_aluno INT,
			@codigo_disciplina INT,
			@dataFalta VARCHAR(100),
			@presenca INT
	 		
	DECLARE @datasAulas TABLE (cod INT IDENTITY(1,1), Datas date) 

	INSERT @datasAulas (Datas)	
		SELECT DISTINCT dataFalta FROM faltas ORDER BY dataFalta
		

	INSERT @tabela(ra_aluno, nome_aluno)
		SELECT DISTINCT ft.ra_aluno , al.nome
		FROM faltas ft
		INNER JOIN alunos al
		ON ft.ra_aluno = al.ra
		WHERE ft.codigo_disciplina = @codDisciplina
		

		DECLARE cursor_presenca CURSOR FOR
		SELECT ra_aluno, codigo_disciplina, dataFalta , presenca
		FROM faltas 
		WHERE codigo_disciplina = @codDisciplina

	-- Quantidade de aulas juntando disciplinas de 4h e 2h = 22 aulas
	OPEN cursor_presenca
	FETCH NEXT FROM cursor_presenca INTO @ra_aluno,@codigo_disciplina,@dataFalta,@presenca
	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @dataFalta = (SELECT Datas FROM @datasAulas WHERE cod = 1)
		BEGIN
			UPDATE @tabela
			SET data1 = @presenca, totalFaltas = totalFaltas + @presenca
			WHERE ra_aluno = @ra_aluno 
		END

		IF @dataFalta = (SELECT Datas FROM @datasAulas WHERE cod = 2)
		BEGIN
			UPDATE @tabela
			SET data2 = @presenca, totalFaltas = totalFaltas + @presenca
			WHERE ra_aluno = @ra_aluno 
		END

		IF @dataFalta = (SELECT Datas FROM @datasAulas WHERE cod = 3)
		BEGIN
			UPDATE @tabela
			SET data3 = @presenca, totalFaltas = totalFaltas + @presenca
			WHERE ra_aluno = @ra_aluno 
		END

		IF @dataFalta = (SELECT Datas FROM @datasAulas WHERE cod = 4)
		BEGIN
			UPDATE @tabela
			SET data4 = @presenca, totalFaltas = totalFaltas + @presenca
			WHERE ra_aluno = @ra_aluno 
		END

		IF @dataFalta = (SELECT Datas FROM @datasAulas WHERE cod = 5)
		BEGIN
			UPDATE @tabela
			SET data5 = @presenca, totalFaltas = totalFaltas + @presenca
			WHERE ra_aluno = @ra_aluno 
		END

		IF @dataFalta = (SELECT Datas FROM @datasAulas WHERE cod = 6)
		BEGIN
			UPDATE @tabela
			SET data6 = @presenca, totalFaltas = totalFaltas + @presenca
			WHERE ra_aluno = @ra_aluno 
		END

		IF @dataFalta = (SELECT Datas FROM @datasAulas WHERE cod = 7)
		BEGIN
			UPDATE @tabela
			SET data7 = @presenca, totalFaltas = totalFaltas + @presenca
			WHERE ra_aluno = @ra_aluno 
		END

		IF @dataFalta = (SELECT Datas FROM @datasAulas WHERE cod = 8)
		BEGIN
			UPDATE @tabela
			SET data8 = @presenca, totalFaltas = totalFaltas + @presenca
			WHERE ra_aluno = @ra_aluno 
		END

		IF @dataFalta = (SELECT Datas FROM @datasAulas WHERE cod = 9)
		BEGIN
			UPDATE @tabela
			SET data9 = @presenca, totalFaltas = totalFaltas + @presenca
			WHERE ra_aluno = @ra_aluno 
		END
		
		IF @dataFalta = (SELECT Datas FROM @datasAulas WHERE cod = 10)
		BEGIN
			UPDATE @tabela
			SET data10 = @presenca, totalFaltas = totalFaltas + @presenca
			WHERE ra_aluno = @ra_aluno 
		END

		IF @dataFalta = (SELECT Datas FROM @datasAulas WHERE cod = 11)
		BEGIN
			UPDATE @tabela
			SET data11 = @presenca, totalFaltas = totalFaltas + @presenca
			WHERE ra_aluno = @ra_aluno 
		END

		IF @dataFalta = (SELECT Datas FROM @datasAulas WHERE cod = 12)
		BEGIN
			UPDATE @tabela
			SET data12 = @presenca, totalFaltas = totalFaltas + @presenca
			WHERE ra_aluno = @ra_aluno 
		END

		IF @dataFalta = (SELECT Datas FROM @datasAulas WHERE cod = 13)
		BEGIN
			UPDATE @tabela
			SET data13 = @presenca, totalFaltas = totalFaltas + @presenca
			WHERE ra_aluno = @ra_aluno 
		END
		
		IF @dataFalta = (SELECT Datas FROM @datasAulas WHERE cod = 14)
		BEGIN
			UPDATE @tabela
			SET data14 = @presenca, totalFaltas = totalFaltas + @presenca
			WHERE ra_aluno = @ra_aluno 
		END

		IF @dataFalta = (SELECT Datas FROM @datasAulas WHERE cod = 15)
		BEGIN
			UPDATE @tabela
			SET data15 = @presenca, totalFaltas = totalFaltas + @presenca
			WHERE ra_aluno = @ra_aluno 
		END

		IF @dataFalta = (SELECT Datas FROM @datasAulas WHERE cod = 16)
		BEGIN
			UPDATE @tabela
			SET data16 = @presenca, totalFaltas = totalFaltas + @presenca
			WHERE ra_aluno = @ra_aluno 
		END

		IF @dataFalta = (SELECT Datas FROM @datasAulas WHERE cod = 17)
		BEGIN
			UPDATE @tabela
			SET data17 = @presenca, totalFaltas = totalFaltas + @presenca
			WHERE ra_aluno = @ra_aluno 
		END

		IF @dataFalta = (SELECT Datas FROM @datasAulas WHERE cod = 18)
		BEGIN
			UPDATE @tabela
			SET data18 = @presenca, totalFaltas = totalFaltas + @presenca
			WHERE ra_aluno = @ra_aluno 
		END

		IF @dataFalta = (SELECT Datas FROM @datasAulas WHERE cod = 19)
		BEGIN
			UPDATE @tabela
			SET data19 = @presenca, totalFaltas = totalFaltas + @presenca
			WHERE ra_aluno = @ra_aluno 
		END

		IF @dataFalta = (SELECT Datas FROM @datasAulas WHERE cod = 20)
		BEGIN
			UPDATE @tabela
			SET data20 = @presenca, totalFaltas = totalFaltas + @presenca
			WHERE ra_aluno = @ra_aluno 
		END

		IF @dataFalta = (SELECT Datas FROM @datasAulas WHERE cod = 21)
		BEGIN
			UPDATE @tabela
			SET data21 = @presenca, totalFaltas = totalFaltas + @presenca
			WHERE ra_aluno = @ra_aluno 
		END

		IF @dataFalta = (SELECT Datas FROM @datasAulas WHERE cod = 22)
		BEGIN
			UPDATE @tabela
			SET data22 = @presenca, totalFaltas = totalFaltas + @presenca
			WHERE ra_aluno = @ra_aluno 
		END

		FETCH NEXT FROM cursor_presenca INTO @ra_aluno,@codigo_disciplina,@dataFalta,@presenca
	END
	CLOSE cursor_presenca
	DEALLOCATE cursor_presenca

	-- quantidade de aulas 4h * 2h = 8h + 80 aulas = 88 total 
	IF @qtdAulasDia = 4
	BEGIN
		UPDATE @tabela 
		SET totalFaltas = 88 - totalFaltas
	END

	-- quantidade de aulas 2h é a metade das aulas 80/semestre = 44 total 
	IF @qtdAulasDia = 2
	BEGIN
		UPDATE @tabela 
		SET totalFaltas = 44 - totalFaltas
	END
		RETURN
END

--Codigo da disciplina, qtd de aulas/dia
SELECT * FROM fn_presencas(4203010, 4)

--datas das disciplinas
SELECT DISTINCT dataFalta FROM faltas WHERE codigo_disciplina = 4203010 ORDER BY dataFalta