package src.br.com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/relatorioFalta")
public class RelatorioFaltaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RelatorioFaltaServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		geraRelatorioFalta(request, response);
	}

	private void geraRelatorioFalta(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("RelatorioFalta.jsp").forward(request, response);
	}

}
