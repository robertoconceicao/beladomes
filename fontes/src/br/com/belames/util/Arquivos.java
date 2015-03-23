package br.com.belames.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

public class Arquivos {

	public static final String temp = "";
	
//	contador para evitar conflito nos nomes dos arquivos
	private static Long count = 0L; 
	
//	sufixo do arquivo temporario criado
	public static final String arq = "arqTemp";
	

	private String dir;
	private String link;
	private List<String> imagens;
	
	public Arquivos(String dir, String link) {
		this.dir = dir;
		this.link = link;
		this.imagens = new ArrayList<String>();	
	}
	
	public String criaImagem(byte[] bs) {
		String nome = System.currentTimeMillis() + ".gif";
		String path = dir + nome;

		try {
			File file = new File(path);
			boolean create = file.createNewFile();
			
			if (create) {
				FileOutputStream fos = new FileOutputStream(file);
				fos.write(bs);
				fos.flush();
				fos.close();
				imagens.add(path);
			} else {
				nome = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			nome = null;
		}
		
		return link + nome;
	}
	
	public String criaHtml(String html) {
		String nome = dir + geraNomeArquivo() + ".html";

		try {
			File file = new File(nome);
			boolean create = file.createNewFile();
			
			if (create) {
				PrintWriter pw = new PrintWriter(file);
				pw.write(html);
				pw.flush();
				pw.close();
			} else {
				nome = null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			nome = null;
		}
		
		return nome;
	}
	
	public synchronized static String geraNomeArquivo() {
		return arq + "_" + count++;
	}
	
	private void limpaDiretorio(String dir) {
		File f = new File(dir);
		if (f.exists() && f.isDirectory()) {
			File[] files = f.listFiles();
			for (File arquivo : files) {
				apagaArquivo(arquivo);
			}
		}
	}
	
	@SuppressWarnings("unused")
	private void limpaDiretorio() {
		limpaDiretorio(dir);
	}
	
	public void apagaArquivo(String file) {
		apagaArquivo(new File(file));
	}
	
	public void apagaArquivo(File file) {
		if (file.exists() && file.isFile()) {
			file.delete();
		}
	}
	
	protected void apagaImagens() {
		for (String img : imagens) {
			apagaArquivo(img);
		}
	}

	public String getDir() {
		return dir;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}
	
	public void addImage(String img) {
		imagens.add(img);
	}
}