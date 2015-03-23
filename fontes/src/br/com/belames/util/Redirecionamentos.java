package br.com.belames.util;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Redirecionamentos {

	public static void chamaJSP(HttpServletRequest request,
			HttpServletResponse response, String page) throws ServletException, IOException {

		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}

	public static void setMensagem(HttpServletRequest request, String mensagem,
			String tpMensagem) throws ServletException, IOException {

		request.setAttribute("tpmensagem", tpMensagem);
		request.setAttribute("mensagem", mensagem);
	}
}
