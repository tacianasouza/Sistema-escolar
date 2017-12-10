<%@page import="src.br.com.model.NotaFinal"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>

<%--
	Document: Notas e faltas
	Created on: 30/11/2017
	Author: Taciana Souza
 --%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Notas Finais</title>
</head>
<body>
	<%
		List<NotaFinal> lista = (List<NotaFinal>) request.getAttribute("lista");
	%>
	<div id="campoNotas" align="center">
		<form action="insertnotas" method="get">
			<table>
				<thead>
					<tr>
						<th colspan="2">Notas Finais</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td>Código da Disciplina:</td>
						<td><input type="text" name="codigo_disciplina"
							placeholder="codigo da disciplina" required></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

	<div id="button" align="center">
		<input type="submit" name="listar notas" value="Listar notas">
	</div>

	<br><div id="ListaNotas" align="center"></br>
		<table border="1" bordercolor="green">
			<th>RA do Aluno</th>
			<th>Nome do Aluno</th>
			<th>N1</th>
			<th>N2</th>
			<th>Trabalho</th>
			<th>Pre Exame</th>
			<th>Exame</th>
			<th>Media Final</th>
			<th>Situacao</th>

			<c:forEach var="nf" items="<%=lista%>">
				<tr>
					<td>${nf.ra_aluno}</td>
					<td>${nf.nome_aluno}</td>
					<td>${nf.n1}</td>
					<td>${nf.n2}</td>
					<td>${nf.trabalho}</td>
					<td>${nf.pre_exame}</td>
					<td>${nf.exame}</td>
					<td>${nf.mediaFinal}</td>
					<td>${nf.situacao}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>