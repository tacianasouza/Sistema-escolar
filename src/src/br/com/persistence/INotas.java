package src.br.com.persistence;

import java.sql.SQLException;

import src.br.com.model.Notas;

public interface INotas {
	public void adicionaNotas(Notas notas) throws SQLException;

}
