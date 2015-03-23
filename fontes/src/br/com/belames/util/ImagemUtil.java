package br.com.belames.util;

public class ImagemUtil {
	
	protected Arquivos arquivos = new Arquivos(Constantes.DIR_TMP, "");	
	
	
	public String createImage(byte[] bs) {
		String imgLink = arquivos.criaImagem(bs);		
		return imgLink;
	}
}