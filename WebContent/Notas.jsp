<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="src.br.com.model.Notas"%>
<%@page import="src.br.com.persistence.INotas"%>
<%@page import="src.br.com.persistence.NotasDao"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adicionar notas</title>
</head>
<body>
	<div id="insertnotas" align="center">
		<form action="insertnotas" method="post">
			<table>
				<thead>
					<tr>
						<th colspan="2">Notas dos Alunos</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Ra do Aluno</td>
						<td><input type="text" name="ra_aluno"
							placeholder="ra do aluno" required></td>
					</tr>
					<tr>
						<td>Codigo da disciplina</td>
						<td><input type="text" name="codigo_disciplina"
							placeholder="codigo da disciplina" required></td>
					</tr>
					<tr>
						<td>Codigo da Avaliacao</td>
						<td><input type="text" name="codigo_avaliacao"
							placeholder="codigo da avaliacao" required></td>
					</tr>
					<tr>
						<td>Nota</td>
						<td><input type="text" name="nota"
							placeholder="nota do aluno" required></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

	<div id="button" align="center">
		<input type="submit" name="inserir notas" value="Inserir notas">
	</div>

</body>
</html>