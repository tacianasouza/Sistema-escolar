package src.br.com.persistence;

import java.sql.SQLException;

import src.br.com.model.Faltas;

public interface IFaltas {

	void adicionaFaltas(Faltas falta) throws SQLException;
}
