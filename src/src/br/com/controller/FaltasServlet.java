package src.br.com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import src.br.com.model.FaltaFinal;
import src.br.com.model.Faltas;
import src.br.com.model.NotaFinal;
import src.br.com.persistence.FaltasDao;
import src.br.com.persistence.IFaltas;
import src.br.com.persistence.INotas;
import src.br.com.persistence.NotasDao;

@WebServlet("/insertfaltas")
public class FaltasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FaltasServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			IFaltas fdao = new FaltasDao();
			List<FaltaFinal> lista = fdao.listaFaltas(Integer.parseInt(request.getParameter("codigo_disciplina")), Integer.parseInt(request.getParameter("qtdAulasDia")));
			request.setAttribute("lista", lista);
			request.getRequestDispatcher("FaltasFinais.jsp").forward(request, response);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String erro = "";
		Faltas f = new Faltas();
		f.setRa_aluno(Integer.parseInt(request.getParameter("ra_aluno")));
		f.setCodigo_disciplina(Integer.parseInt(request
				.getParameter("codigo_disciplina")));
		f.setDataFalta((request.getParameter("dataFalta")));
		f.setPresenca(Integer.parseInt(request.getParameter("presenca")));

		IFaltas fDao = null;
		try {
			fDao = new FaltasDao();
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		try {
			fDao.adicionaFaltas(f);
		} catch (SQLException e) {
			erro = e.getMessage();
		} finally {
			request.setAttribute("erro", erro);
			request.setAttribute("notas", f);
			request.getRequestDispatcher("Faltas.jsp").forward(request,
					response);
		}
	}
}
