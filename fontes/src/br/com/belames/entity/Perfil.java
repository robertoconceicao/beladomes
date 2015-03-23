package br.com.belames.entity;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

public class Perfil {

	private Long cdPerfil;
	private String nmUsuario;
	private String urlPerfil;
	private String urlFoto;
	private String cidade;
	private int idade;
	private String genero;
	private byte[] foto;
	private int qtVoto;
	
	public Perfil() {
		
	}
	
	public Perfil(Long cdPerfil, String nmUsuario, String urlPerfil, String urlFoto, String cidade, int idade, String genero) {
		super();
		this.cdPerfil = cdPerfil;
		this.nmUsuario = nmUsuario;
		this.urlPerfil = urlPerfil;
		this.urlFoto = urlFoto;
		this.cidade = cidade;
		this.idade = idade;
		this.genero = genero;
	}

	public Long getCdPerfil() {
		return cdPerfil;
	}
	public void setCdPerfil(Long cdPerfil) {
		this.cdPerfil = cdPerfil;
	}
	public String getNmUsuario() {
		return nmUsuario;
	}
	public void setNmUsuario(String nmUsuario) {
		this.nmUsuario = nmUsuario;
	}
	public String getUrlPerfil() {
		return urlPerfil;
	}
	public void setUrlPerfil(String urlPerfil) {
		this.urlPerfil = urlPerfil;
	}
	public String getUrlFoto() {
		return urlFoto;
	}
	public void setUrlFoto(String urlFoto) {
		this.urlFoto = urlFoto;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public int getIdade() {
		return idade;
	}
	public void setIdade(int idade) {
		this.idade = idade;
	}
	public String getGenero() {
		return genero;
	}
	public void setGenero(String genero) {
		this.genero = genero;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
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
		Perfil other = (Perfil) obj;
		if (cdPerfil == null) {
			if (other.cdPerfil != null)
				return false;
		} else if (!cdPerfil.equals(other.cdPerfil))
			return false;
		return true;
	}
	
	public static Perfil preenchePerfilSQL(ResultSet rs) throws SQLException, IOException{
		Perfil perfil = new Perfil();
		perfil.setCdPerfil(rs.getLong("cdPerfil"));
		perfil.setNmUsuario(rs.getString("nmUsuario"));
		perfil.setUrlPerfil(rs.getString("urlPerfil"));
		
		
		perfil.setUrlFoto(rs.getString("urlFoto"));
		
		perfil.setCidade(rs.getString("cidade"));
		perfil.setIdade(rs.getInt("idade"));
		perfil.setGenero(rs.getString("genero"));

		/*
		 * byte[] source = ...;
		ByteArrayInputStream bis = new ByteArrayInputStream(source);
		// read bytes from bis ...
		
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		// write bytes to bos ...
		byte[] sink = bos.toByteArray();
		 */
		
		ByteArrayInputStream bis = (ByteArrayInputStream) rs.getBinaryStream("foto");
		if(bis != null){
			byte[] arrayBytes = new byte[bis.available()];  
			bis.read(arrayBytes);
			perfil.setFoto(arrayBytes);			
		}
		
		return perfil;
	}

	public byte[] getFoto() {
		return foto;
	}

	public void setFoto(byte[] foto) {
		this.foto = foto;
	}
	
	public String getByteArrayString(){
		 String encodedImage = Base64.encode(foto);
		return encodedImage;
	}

	public int getQtVoto() {
		return qtVoto;
	}

	public void setQtVoto(int qtVoto) {
		this.qtVoto = qtVoto;
	}
}