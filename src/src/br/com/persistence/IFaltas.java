package src.br.com.persistence;

import java.sql.SQLException;
import java.util.List;

import src.br.com.model.Faltas;
import src.br.com.model.FaltaFinal;

public interface IFaltas {

	void adicionaFaltas(Faltas falta) throws SQLException;
	
	public List<FaltaFinal> listaNotas(int codigo_disciplina, int qtdAulasDia) throws SQLException;
}
