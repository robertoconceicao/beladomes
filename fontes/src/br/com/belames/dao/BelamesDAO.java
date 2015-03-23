package br.com.belames.dao;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.belames.entity.Perfil;
import br.com.belames.entity.Voto;

/**
 * Foi criado apenas um dao pq o sistema é muito pequeno, caso venha a ficar
 * grande criaremos novos daos
 * 
 * @author roberto.conceicao
 *
 */
public class BelamesDAO {

	
	/**
	 * Metodo utilizado para montar o paredao
	 * @return
	 */
	public Perfil[] findPerfilsParedaoAleatorio(){
		Perfil p1 = null;
		Perfil p2 = null;
		Perfil [] perfisParedao = new Perfil[2];
		
		p1 = findPerfilAleatorio();
		p2 = findPerfilAleatorio();
		
		if(p1.equals(p2)){
			p2 = findPerfilAleatorio();			
		}
		
		perfisParedao[0] = p1;
		perfisParedao[1] = p2;
		
		return perfisParedao;
	}
	
	private Perfil findPerfilAleatorio(){
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Perfil perfil = null;		
		try {
			conn = DAOFactory.getConnection();
			StringBuilder sb = new StringBuilder();
			
			sb.append(" SELECT  ");
			sb.append(" cdPerfil, ");
			sb.append(" nmUsuario, ");
			sb.append(" urlPerfil, ");
			sb.append(" urlFoto, ");
			sb.append(" cidade, ");
			sb.append(" idade, ");
			sb.append(" genero, ");			
			sb.append(" foto ");			
			sb.append(" FROM perfil ORDER BY RAND() LIMIT 1 ");
			stmt = conn.prepareStatement(sb.toString());
			
			rs = stmt.executeQuery();
			
			if(rs.next()){
				perfil = Perfil.preenchePerfilSQL(rs);
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return perfil;
	}
	
	public void salvarPerfil(Perfil perfil){
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = DAOFactory.getConnection();
			StringBuilder sb = new StringBuilder();
			
			sb.append(" INSERT INTO perfil (  ");
				sb.append(" cdPerfil, ");
				sb.append(" nmUsuario, ");
				sb.append(" urlPerfil, ");
				sb.append(" urlFoto, ");
				sb.append(" cidade, ");
				sb.append(" idade, ");
				sb.append(" genero, ");			
				sb.append(" foto ");			
			sb.append(" ) ");
			
			sb.append(" VALUES ( ?, ?, ?, ?, ?, ?, ?, ? ) ");
				
			
			stmt = conn.prepareStatement(sb.toString());
			
			stmt.setLong(1, perfil.getCdPerfil());
			stmt.setString(2, perfil.getNmUsuario());
			stmt.setString(3, perfil.getUrlPerfil());
			stmt.setString(4, perfil.getUrlFoto());
			stmt.setString(5, perfil.getCidade());
			stmt.setInt(6, perfil.getIdade());
			stmt.setString(7, perfil.getGenero());
			/*
			 * byte[] source = ...;
			ByteArrayInputStream bis = new ByteArrayInputStream(source);
			// read bytes from bis ...
			
			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			// write bytes to bos ...
			byte[] sink = bos.toByteArray();
			 */
			ByteArrayInputStream bis = new ByteArrayInputStream(perfil.getFoto());			
			stmt.setBinaryStream(8, bis);
			
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Perfil findByPrimaryKey(Long cdPerfil){
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Perfil perfil = null;
		try {
			conn = DAOFactory.getConnection();
			StringBuilder sb = new StringBuilder();
			
			sb.append(" SELECT  ");
			sb.append(" cdPerfil, ");
			sb.append(" nmUsuario, ");
			sb.append(" urlPerfil, ");
			sb.append(" urlFoto, ");
			sb.append(" cidade, ");
			sb.append(" idade, ");
			sb.append(" genero, ");			
			sb.append(" foto ");			
			sb.append(" FROM perfil ");
			sb.append(" WHERE ");
			sb.append(" cdPerfil = ? ");
			
			stmt = conn.prepareStatement(sb.toString());
			stmt.setLong(1, cdPerfil);
			
			rs = stmt.executeQuery();
			
			if(rs.next()){				
				perfil = Perfil.preenchePerfilSQL(rs);				
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return perfil;
	}
	public List<Perfil> findAllPerfil(){
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Perfil> perfis = new ArrayList<Perfil>();
		try {
			conn = DAOFactory.getConnection();
			StringBuilder sb = new StringBuilder();
			
			sb.append(" SELECT  ");
			sb.append(" cdPerfil, ");
			sb.append(" nmUsuario, ");
			sb.append(" urlPerfil, ");
			sb.append(" urlFoto, ");
			sb.append(" cidade, ");
			sb.append(" idade, ");
			sb.append(" genero, ");			
			sb.append(" foto ");			
			sb.append(" FROM perfil ");
			stmt = conn.prepareStatement(sb.toString());
			
			rs = stmt.executeQuery();
			
			
			Perfil perfil = null;		
			while(rs.next()){				
				perfil = Perfil.preenchePerfilSQL(rs);
				perfis.add(perfil);
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return perfis;
	}
	
	public int getQtVoto(int cdConcurso, Long cdPerfil){
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;		
		int qtVoto = 0;					
		try {
			conn = DAOFactory.getConnection();
			StringBuilder sb = new StringBuilder();
			
			sb.append(" SELECT qtvoto ");						
			sb.append(" FROM voto ");
			sb.append(" where ");
			sb.append(" cdConcurso = ? ");
			sb.append(" and cdPerfil = ? ");
			
			stmt = conn.prepareStatement(sb.toString());
			stmt.setInt(1, cdConcurso);
			stmt.setLong(2, cdPerfil);
			
			rs = stmt.executeQuery();
			if(rs.next()){				
				qtVoto = rs.getInt("qtvoto");				
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return qtVoto;
	}
	
	
	public void votar(Voto voto){
		Connection conn = null;
		PreparedStatement stmt = null;
		int qtVoto = 0;					
		try {
			qtVoto = getQtVoto(voto.getCdConcurso(), voto.getCdPerfil());
			
			conn = DAOFactory.getConnection();
			StringBuilder sql = new StringBuilder();
			//Insert
			if(qtVoto == 0){				
				sql.append(" INSERT INTO voto ( cdConcurso, cdPerfil, qtvoto) ");						
				sql.append(" VALUES ( ?, ?, ? )");				
			} else {
				sql.append(" UPDATE voto SET qtvoto = ? ");						
				sql.append(" WHERE cdConcurso = ? and cdPerfil = ? ");				
				
			}
			
			stmt = conn.prepareStatement(sql.toString());
			
			if(qtVoto == 0){
				stmt.setInt(1, voto.getCdConcurso());
				stmt.setLong(2, voto.getCdPerfil());
				stmt.setInt(3, 1);				
			} else {
				stmt.setInt(1, qtVoto+1);
				stmt.setInt(2, voto.getCdConcurso());
				stmt.setLong(3, voto.getCdPerfil());
			}
			
			stmt.executeUpdate();			 
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
	
	public List<Perfil> findTop20(){
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		List<Perfil> perfis = new ArrayList<Perfil>();
		try {
			conn = DAOFactory.getConnection();
			StringBuilder sb = new StringBuilder();
			
			sb.append(" SELECT ");
			sb.append(" p.cdPerfil, ");
			sb.append(" p.nmUsuario, ");
			sb.append(" p.urlPerfil, ");
			sb.append(" p.urlFoto, ");
			sb.append(" p.cidade, ");
			sb.append(" p.idade, ");
			sb.append(" p.genero, ");			
			sb.append(" p.foto, ");	
			sb.append(" v.qtVoto ");	
			sb.append(" FROM Perfil p");
			sb.append(" join Voto v on");
			sb.append(" v.cdPerfil = p.cdPerfil");
			sb.append(" and v.cdConcurso = ?");
			sb.append(" ORDER BY v.qtVoto desc LIMIT 0,20 ");
			
			stmt = conn.prepareStatement(sb.toString());
			
			stmt.setInt(1, 1);
			
			rs = stmt.executeQuery();
			
			Perfil perfil = null;
			
			while(rs.next()){
				perfil = Perfil.preenchePerfilSQL(rs);
				perfil.setQtVoto(rs.getInt("qtVoto"));				
				perfis.add(perfil);
			}			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return perfis;
	}
	
	public void updateFotoPerfil(Perfil perfil){
		Connection conn = null;
		PreparedStatement stmt = null;							
		try {
			conn = DAOFactory.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append(" UPDATE perfil SET foto = ? ");						
			sql.append(" WHERE cdPerfil = ? ");				
				
			stmt = conn.prepareStatement(sql.toString());
			
			ByteArrayInputStream bis = new ByteArrayInputStream(perfil.getFoto());			
			stmt.setBinaryStream(1, bis);			
			stmt.setLong(2, perfil.getCdPerfil());
			
			stmt.executeUpdate();			 
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
}
