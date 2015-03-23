package br.com.belames.util;

public interface Constantes {

	//Utilizado para definir a situacao do consurso
	public static final int ST_EM_ANDAMENTO = 1;
	public static final int ST_FINALIZADO 	= 2;
	
		
	//Utilizado para definir o tipo do consurso
	public static final int TP_MENSAL 		= 1;
	public static final int TP_ANUAL 		= 2;
	
	// Diretorios
	public static final String DIR_TMP 		= "tmp";
	
	//JSP's
	public static final String JSP_INDEX	= "index.jsp";
	public static final String JSP_PAREDAO 	= "paredao.jsp";
	public static final String JSP_TOP20 	= "top20.jsp";
	
	
	public static enum MES {
		JANEIRO,
		FEVEREIRO,
		MARCO,
		ABRIL,
		MAIO,
		JUNHO,
		JULHO,
		AGOSTO,
		SETEMBRO,
		OUTUBRO,
		NOVEMBRO,
		DEZEMBRO
	};
	
}