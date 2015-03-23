package br.com.belames.servlet;

import java.io.IOException;
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

/**
 * Servlet implementation class Top20Servlet
 */
@WebServlet("/top20")
public class Top20Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Top20Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ESTANCIA DO DAO
		BelamesDAO dao = new BelamesDAO();		
		
		List<Perfil> perfis = dao.findTop20();
		request.setAttribute("listaPerfil", perfis);
		
		Redirecionamentos.chamaJSP(request, response, Constantes.JSP_TOP20);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
