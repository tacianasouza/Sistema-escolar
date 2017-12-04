package src.br.com.model;


public class Faltas {
	private int ra_aluno;
	private int codigo_disciplina;
	private String dataFalta;
	private int presenca;

	public int getRa_aluno() {
		return ra_aluno;
	}

	public void setRa_aluno(int ra_aluno) {
		this.ra_aluno = ra_aluno;
	}

	public int getCodigo_disciplina() {
		return codigo_disciplina;
	}

	public void setCodigo_disciplina(int codigo_disciplina) {
		this.codigo_disciplina = codigo_disciplina;
	}

	public String getDataFalta() {
		return dataFalta;
	}

	public void setDataFalta(String dataFalta) {
		this.dataFalta = dataFalta;
	}

	public int getPresenca() {
		return presenca;
	}

	public void setPresenca(int presenca) {
		this.presenca = presenca;
	}

}
