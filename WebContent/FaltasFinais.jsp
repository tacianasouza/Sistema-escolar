<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Faltas finais</title>
</head>
<body>
	<%
		/*IFinalNotasFaltas fndao = new FinalNotasFaltas();
		FaltaFinal ff = new FaltaFinal();
		int codigo_disciplina = Integer.parseInt(request.getParameter("codigo_disciplina"));
		int qtdAulasDia = Integer.parseInt(request.getParameter("qtdAulasDia"));
		List<FaltaFinal> lista = fndao.carregaFunctionFaltas(codigo_disciplina, qtdAulasDia);*/
	%>
	<div id="ListaFaltas" align="center">
		<table>
			<c:forEach var="ff" items="<%=//lista%>">>
				<tr>
					<td>${ff.ra_aluno}</td>
					<td>${ff.nome_aluno}</td>
					<td>${ff.data1}</td>
					<td>${ff.data2}</td>
					<td>${ff.data3}</td>
					<td>${ff.data4}</td>
					<td>${ff.data5}</td>
					<td>${ff.data6}</td>
					<td>${ff.data7}</td>
					<td>${ff.data8}</td>
					<td>${ff.data9}</td>
					<td>${ff.data10}</td>
					<td>${ff.data11}</td>
					<td>${ff.data12}</td>
					<td>${ff.data13}</td>
					<td>${ff.data14}</td>
					<td>${ff.data15}</td>
					<td>${ff.data16}</td>
					<td>${ff.data17}</td>
					<td>${ff.data18}</td>
					<td>${ff.data19}</td>
					<td>${ff.data20}</td>
					<td>${ff.data21}</td>
					<td>${ff.data22}</td>
					<td>${ff.totalFalta}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>