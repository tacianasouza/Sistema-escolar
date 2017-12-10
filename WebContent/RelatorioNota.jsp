<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Relatorio Notas</title>
</head>
<body>
	<div id="relatorioNotas" align="center">
		<form action="relatorio" method="post" target="_ blank">
			<table>
				<thead>
					<tr>
						<th colspan="2">Relatorio de Notas dos Alunos</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Codigo da disciplina</td>
						<td><input type="text" name="codigo_disciplina"
							placeholder="codigo da disciplina" required></td>
					</tr>
					<tr>
						<td><input type="submit" value="Gerar Relatorio"></td>
					</tr>
			</table>
		</form>
	</div>
</body>
</html>