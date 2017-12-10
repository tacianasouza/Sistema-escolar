<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@page import="src.br.com.model.FaltaFinal"%>

<%--
	Document: Notas e faltas
	Created on: 30/11/2017
	Author: Taciana Souza
 --%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Faltas finais</title>
</head>
<body>
	<%
		List<FaltaFinal> lista = (List<FaltaFinal>) request.getAttribute("lista");
	%>

	<div id="campoFaltas" align="center">
		<form action="insertfaltas" method="get">
			<table>
				<thead>
					<tr>
						<th colspan="2">Faltas Finais</th>
					</tr>
				</thead>

				<tbody>
					<tr>
						<td>Código da Disciplina:</td>
						<td><input type="text" name="codigo_disciplina"
							placeholder="codigo da disciplina" required></td>
					</tr>

					<tr>
						<td>Quantidade de presenca:</td>
						<td><input type="text" name="qtdAulasDia"
							placeholder="quantidade de presencas" required></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

	<div id="button" align="center">
		<input type="submit" name="listar faltas" value="listar faltas">
	</div>

	<br><div id="ListaFaltas" align="center"></br>
		<table border="1">
			<th>RA do Aluno</th>
			<th>Nome do Aluno</th>
			<th>Data1</th>
			<th>Data2</th>
			<th>Data3</th>
			<th>Data4</th>
			<th>Data5</th>
			<th>Data6</th>
			<th>Data7</th>
			<th>Data8</th>
			<th>Data9</th>
			<th>Data10</th>
			<th>Data11</th>
			<th>Data12</th>
			<th>Data13</th>
			<th>Data14</th>
			<th>Data15</th>
			<th>Data16</th>
			<th>Data17</th>
			<th>Data18</th>
			<th>Data19</th>
			<th>Data20</th>
			<th>Data21</th>
			<th>Data22</th>
			<th>Total das faltas</th>

			<c:forEach var="ff" items="<%=lista%>">
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