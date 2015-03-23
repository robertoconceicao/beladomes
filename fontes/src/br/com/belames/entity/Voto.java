package br.com.belames.entity;

public class Voto {

	private int cdConcurso;
	private long cdPerfil;
	private int qtVoto;

	public Voto() {
	}

	public Voto(int cdConcurso, long cdPerfil, int qtVoto) {
		super();
		this.cdConcurso = cdConcurso;
		this.cdPerfil = cdPerfil;
		this.qtVoto = qtVoto;
	}

	public int getCdConcurso() {
		return cdConcurso;
	}

	public void setCdConcurso(int cdConcurso) {
		this.cdConcurso = cdConcurso;
	}

	public long getCdPerfil() {
		return cdPerfil;
	}

	public void setCdPerfil(long cdPerfil) {
		this.cdPerfil = cdPerfil;
	}

	public int getQtVoto() {
		return qtVoto;
	}

	public void setQtVoto(int qtVoto) {
		this.qtVoto = qtVoto;
	}

	@Override
	public String toString() {
		return "Voto [cdConcurso=" + cdConcurso + ", cdPerfil=" + cdPerfil
				+ ", qtVoto=" + qtVoto + "]";
	}

	/*@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((cdConcurso == null) ? 0 : cdConcurso.hashCode());
		result = prime * result + ((cdPerfil == null) ? 0 : cdPerfil.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Voto other = (Voto) obj;
		if (cdConcurso == null) {
			if (other.cdConcurso != null)
				return false;
		} else if (!cdConcurso.equals(other.cdConcurso))
			return false;
		if (cdPerfil == null) {
			if (other.cdPerfil != null)
				return false;
		} else if (!cdPerfil.equals(other.cdPerfil))
			return false;
		return true;
	}*/
}