package src.br.com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import src.br.com.model.NotaFinal;
import src.br.com.persistence.INotas;
import src.br.com.persistence.NotasDao;

/**
 * Servlet implementation class ListaNotas
 */
@WebServlet("/ListaNotas")
public class ListaNotas extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListaNotas() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response, int codigo_disciplina)
			throws ServletException, IOException, ClassNotFoundException,
			SQLException {
		// TODO Auto-generated method stub
		doPost(request, response, codigo_disciplina);
	}

	/**
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response, int codigo_disciplina)
			throws ServletException, IOException, ClassNotFoundException,
			SQLException {
		// TODO Auto-generated method stub
		String erro = "";
		INotas nf = new NotasDao();

		try {
			List<NotaFinal> lista = nf
					.listaNotas(codigo_disciplina);
			request.setAttribute("listaNotas", lista);
			request.getRequestDispatcher("NotasFinais.jsp").forward(request,
					response);
		} catch (SQLException e) {
			erro = e.getMessage();
		} finally {
			request.setAttribute("erro", erro);
			request.setAttribute("codigo_disciplina", codigo_disciplina);
			request.getRequestDispatcher("NotasFinais.jsp").forward(request,
					response);
		}

	}

}
