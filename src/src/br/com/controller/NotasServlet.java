package src.br.com.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import src.br.com.model.Notas;
import src.br.com.persistence.INotas;
import src.br.com.persistence.NotasDao;

@WebServlet("/insertnotas")
public class NotasServlet  extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public NotasServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String erro = "";
		Notas n = new Notas();
		n.setRa_aluno(Integer.parseInt(request.getParameter("ra_aluno")));
		n.setCodigo_disciplina(Integer.parseInt(request.getParameter("codigo_disciplina")));
		n.setCodigo_avaliacao(Integer.parseInt(request.getParameter("codigo_avaliacao")));
		n.setNota(Double.parseDouble(request.getParameter("nota")));

		INotas nDao = null;
		try {
			nDao = new NotasDao();
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		try {
			nDao.adicionaNotas(n);
		} catch (SQLException e) {
			erro = e.getMessage();
		} finally {
			request.setAttribute("erro", erro);
			request.setAttribute("notas", n);
			request.getRequestDispatcher("Notas.jsp").forward(request, response);
		}
		//listar as notas dos alunos
		request.getRequestDispatcher("Notas.jsp").forward(request, response);
		System.out.println("doPost");
	}

}
