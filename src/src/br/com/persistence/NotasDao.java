package src.br.com.persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import src.br.com.model.NotaFinal;
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

	@Override
	public List<NotaFinal> listaNotas(int codigo_disciplina)
			throws SQLException {
		List<NotaFinal> listaNotas = new ArrayList<NotaFinal>();
		String sqlFn = "SELECT * FROM fn_notas(?)";
		PreparedStatement ps = con.prepareStatement(sqlFn);
		ps.setInt(1, codigo_disciplina);
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			NotaFinal nf = new NotaFinal();
			nf.setRa_aluno(rs.getInt("ra_aluno"));
			nf.setNome_aluno(rs.getString("nome_aluno"));
			nf.setN1(rs.getDouble("N1"));
			nf.setN2(rs.getDouble("N2"));
			nf.setTrabalho(rs.getDouble("Trabalho"));
			nf.setPre_exame(rs.getDouble("Pre_Exame"));
			nf.setExame(rs.getDouble("Exame"));
			nf.setMediaFinal(rs.getDouble("mediaFinal"));
			nf.setSituacao(rs.getString("situacao"));

			listaNotas.add(nf);
		}

		return listaNotas;
	}

}
