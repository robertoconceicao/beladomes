package br.com.belames.entity;


public class Concurso {

	private int cdConcurso;
	private String nmConcurso;
	private int mesDoConcurso;
	private int ano;
	private int situacao;
	private int tipoConcurso;
	
	public Concurso() {
		super();
	}

	public Concurso(int cdConcurso, String nmConcurso, int mesDoConcurso, int ano, int situacao, int tipoConcurso) {
		super();
		this.cdConcurso = cdConcurso;
		this.nmConcurso = nmConcurso;
		this.mesDoConcurso = mesDoConcurso;
		this.ano = ano;
		this.situacao = situacao;
		this.tipoConcurso = tipoConcurso;
	}
	
	public int getCdConcurso() {
		return cdConcurso;
	}
	public void setCdConcurso(int cdConcurso) {
		this.cdConcurso = cdConcurso;
	}
	public String getNmConcurso() {
		return nmConcurso;
	}
	public void setNmConcurso(String nmConcurso) {
		this.nmConcurso = nmConcurso;
	}
	public int getMesDoConcurso() {
		return mesDoConcurso;
	}
	public void setMesDoConcurso(int mesDoConcurso) {
		this.mesDoConcurso = mesDoConcurso;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public int getSituacao() {
		return situacao;
	}
	public void setSituacao(int situacao) {
		this.situacao = situacao;
	}
	public int getTipoConcurso() {
		return tipoConcurso;
	}
	public void setTipoConcurso(int tipoConcurso) {
		this.tipoConcurso = tipoConcurso;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + cdConcurso;
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
		Concurso other = (Concurso) obj;
		if (cdConcurso != other.cdConcurso)
			return false;
		return true;
	}
}