<%@page import="src.br.com.model.NotaFinal"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Notas Finais</title>
</head>
<body>
	<%
		List<NotaFinal> lista = (List<NotaFinal>) request.getAttribute("lista");
	%>
	<form action="insertnotas" method="get">
		<label for="codigo_disciplina">Código da Disciplina:</label><br>
		<input type="text" name="codigo_disciplina" required> <input
			type="submit" value="carregar">
	</form>
	<div id="ListaNotas" align="center">
		<table border="1">
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