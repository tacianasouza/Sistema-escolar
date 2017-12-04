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
		/*IFinalNotasFaltas fndao = new FinalNotasFaltas();
		NotaFinal nf = new NotaFinal();
		int codigo_disciplina =  4203020;//Integer.parseInt(request.getParameter("codigo_disciplina"));
		List<NotaFinal> lista = fndao.carregaFunctionNotas(codigo_disciplina);*/
	%>
	<div id="notas" align="center">
		<table>
			<c:forEach var="nf" items="<%=//lista%>">
				<tr>
					<td>${nf.ra_aluno}</td>
					<td>${nf.nome_aluno}</td>
					<td>${nf.n1}</td>
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