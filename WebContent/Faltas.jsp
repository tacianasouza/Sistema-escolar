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
						<td><input type="text" name="ra_aluno" required
							placeholder="ra do aluno"></td>
					</tr>
					<tr>
						<td>Codigo da disciplina</td>
						<td><input type="text" name="codigo_disciplina" required
							placeholder="codigo da disciplina"></td>
					</tr>
					<tr>
						<td>Data da Falta</td>
						<td><input type="text" name="dataFalta" required
							placeholder="data da falta"></td>
					</tr>
					<tr>
						<td>Quantidade de Presencas</td>
						<td><input type="text" name="presenca" required
							placeholder="quantidade presencas"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

	<div id="button" align="center">
		<input type="submit" name="inserir faltas" value="Inserir faltas">
	</div>
</body>
</html>