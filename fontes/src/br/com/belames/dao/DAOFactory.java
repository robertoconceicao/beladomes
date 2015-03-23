package br.com.belames.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DAOFactory { 

	private static Connection conexao = null;
	
	public static Connection getConnection() throws SQLException {
		if(conexao != null){
			return conexao;
		}
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conexao = DriverManager.getConnection("jdbc:mysql://localhost/belames","root","12345");			
			System.out.println("Conectado!");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return conexao;
	}
}