<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="src.br.com.model.Faltas"%>
<%@page import="src.br.com.persistence.IFaltas"%>
<%@page import="src.br.com.persistence.FaltasDao"%>
<%@page import="java.util.List"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adicionar Faltas</title>
</head>
<body>
	<div id="insertfaltas" align="center">
		<form action="insertfaltas" method="post">
			<table>
				<thead>
					<tr>
						<th colspan="2">Faltas dos Alunos</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Ra do Aluno</td>
						<td><input type="text" name="ra_aluno" required></td>
					</tr>
					<tr>
						<td>Codigo da disciplina</td>
						<td><input type="text" name="codigo_disciplina" required></td>
					</tr>
					<tr>
						<td>Data da Falta</td>
						<td><input type="text" name="dataFalta" required></td>
					</tr>
					<tr>
						<td>Quantidade de Presencas</td>
						<td><input type="text" name="presenca" required></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" name="inserir"
							value="Inserir"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>