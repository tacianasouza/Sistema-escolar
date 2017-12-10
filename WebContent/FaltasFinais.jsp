<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@page import="src.br.com.model.FaltaFinal"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Faltas finais</title>
</head>
<body>
	<%
		List<FaltaFinal> lista = (List<FaltaFinal>) request.getAttribute("lista");
	%>
	<form action="insertfaltas" method="get">
		<label for="codigo_disciplina">Código da Disciplina:</label><br>
		<label for="codigo_disciplina">Quantidade de presenca:</label><br>
		<input type="text" name="codigo_disciplina" required>  
		<input type="text" name="qtdAulasDia" required> 
		<input type="submit" value="carregar">
	</form>
	<div id="ListaFaltas" align="center">
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