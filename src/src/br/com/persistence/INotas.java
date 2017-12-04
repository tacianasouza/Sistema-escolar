package src.br.com.persistence;

import java.sql.SQLException;
import java.util.List;

import src.br.com.model.NotaFinal;
import src.br.com.model.Notas;

public interface INotas {
	public void adicionaNotas(Notas notas) throws SQLException;
	
	public List<NotaFinal> listaNotas(int codigo_disciplina) throws SQLException;

}
