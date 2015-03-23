package br.com.belames.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.belames.dao.BelamesDAO;
import br.com.belames.entity.Voto;

@WebServlet("/voto")
public class VotoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public VotoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Voto voto = new Voto();
		voto.setCdConcurso(1);
		
//		if(request.getParameter("action").equals("0")){
//			voto.setCdPerfil(Long.parseLong(request.getParameter("cdPerfil0")));
//			
//		}else if(request.getParameter("action").equals("1")){
//			voto.setCdPerfil(Long.parseLong(request.getParameter("cdPerfil1")));
//		}
		
		voto.setCdPerfil(Long.parseLong(request.getParameter("cdPerfil")));
		
		BelamesDAO dao = new BelamesDAO();
		dao.votar(voto);
		
		System.out.println("Voto recebido com sucesso: "+voto.toString());
		//response.sendRedirect("/bela-mes/paredao");
	}
}
