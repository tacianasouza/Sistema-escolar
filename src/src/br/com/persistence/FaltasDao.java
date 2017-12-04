package src.br.com.persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import src.br.com.model.FaltaFinal;
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

	@Override
	public List<FaltaFinal> listaNotas(int codigo_disciplina, int qtdAulasDia)
			throws SQLException {
		List<FaltaFinal> listaFaltas = new ArrayList<FaltaFinal>();
		String sqlFn = "SELECT * FROM fn_presencas(?,?)";
		PreparedStatement ps = con.prepareStatement(sqlFn);
		ps.setInt(1, codigo_disciplina);
		ps.setInt(2, qtdAulasDia);
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			FaltaFinal ff = new FaltaFinal();
			ff.setRa_aluno(rs.getInt("ra_aluno"));
			ff.setData1(rs.getInt("data1"));
			ff.setData2(rs.getInt("data2"));
			ff.setData3(rs.getInt("data3"));
			ff.setData4(rs.getInt("data4"));
			ff.setData5(rs.getInt("data5"));
			ff.setData6(rs.getInt("data6"));
			ff.setData7(rs.getInt("data7"));
			ff.setData8(rs.getInt("data8"));
			ff.setData9(rs.getInt("data9"));
			ff.setData10(rs.getInt("data10"));
			ff.setData11(rs.getInt("data11"));
			ff.setData12(rs.getInt("data12"));
			ff.setData13(rs.getInt("data13"));
			ff.setData14(rs.getInt("data14"));
			ff.setData15(rs.getInt("data15"));
			ff.setData16(rs.getInt("data16"));
			ff.setData17(rs.getInt("data17"));
			ff.setData18(rs.getInt("data18"));
			ff.setData19(rs.getInt("data19"));
			ff.setData20(rs.getInt("data10"));
			ff.setData21(rs.getInt("data21"));
			ff.setData22(rs.getInt("data22"));
			ff.setTotalFalta(rs.getInt("totalFaltas"));

			listaFaltas.add(ff);
		}

		return listaFaltas;
	}

}
