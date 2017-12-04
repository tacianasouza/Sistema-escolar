package src.br.com.persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import src.br.com.model.Notas;

public class NotasDao implements INotas {
	private Connection con;

	public NotasDao() throws ClassNotFoundException, SQLException {
		GenericDao gDao = new GenericDao();
		con = gDao.getConnection();
	}

	@Override
	public void adicionaNotas(Notas notas) {
		String sqlProc = "{call sp_insere_notas_alunos(?,?,?,?)}";
		try {
			CallableStatement cs = con.prepareCall(sqlProc);
			cs.setInt(1, notas.getRa_aluno());
			cs.setInt(2, notas.getCodigo_disciplina());
			cs.setInt(3, notas.getCodigo_avaliacao());
			cs.setDouble(4, notas.getNota());
			cs.execute();
			cs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
