package src.br.com.model;

public class Disciplinas {
	private int codigo;
	private String nome;
	private String sigla;
	private String turno;
	private int num_aulas;

	public int getCodigo() {
		return codigo;
	}

	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getSigla() {
		return sigla;
	}

	public void setSigla(String sigla) {
		this.sigla = sigla;
	}

	public String getTurno() {
		return turno;
	}

	public void setTurno(String turno) {
		this.turno = turno;
	}

	public int getNum_aulas() {
		return num_aulas;
	}

	public void setNum_aulas(int num_aulas) {
		this.num_aulas = num_aulas;
	}

}
