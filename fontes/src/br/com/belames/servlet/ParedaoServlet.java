package br.com.belames.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.belames.dao.BelamesDAO;
import br.com.belames.entity.Perfil;
import br.com.belames.util.Constantes;
import br.com.belames.util.Redirecionamentos;

@WebServlet("/paredao")
public class ParedaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ParedaoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ESTANCIA DO DAO
		BelamesDAO dao = new BelamesDAO();
		
//		List<Perfil> perfis = dao.findTop20();
//		request.setAttribute("listaPerfil", perfis);
		
		Perfil [] perfisParedao = dao.findPerfilsParedaoAleatorio();
		
		Perfil perfil0;
		perfil0 = perfisParedao[0];
		
		Perfil perfil1;
		perfil1 = perfisParedao[1];
		
		request.setAttribute("perfil0", perfil0);
		request.setAttribute("perfil1", perfil1);
		
		Redirecionamentos.chamaJSP(request, response, Constantes.JSP_PAREDAO);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}
