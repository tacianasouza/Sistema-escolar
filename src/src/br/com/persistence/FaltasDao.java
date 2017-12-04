package src.br.com.persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

import src.br.com.model.Faltas;

public class FaltasDao implements IFaltas {

	private Connection con;

	public FaltasDao() throws ClassNotFoundException, SQLException {
		GenericDao gDao = new GenericDao();
		con = gDao.getConnection();
	}

	@Override
	public void adicionaFaltas(Faltas faltas) throws SQLException {
		String sqlProc = "{call sp_insere_faltas_alunos(?,?,?,?)}";
		try {
			CallableStatement cs = con.prepareCall(sqlProc);
			cs.setInt(1, faltas.getRa_aluno());
			cs.setInt(2, faltas.getCodigo_disciplina());
			cs.setString(3, faltas.getDataFalta());
			cs.setInt(4, faltas.getPresenca());
			cs.execute();
			cs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
