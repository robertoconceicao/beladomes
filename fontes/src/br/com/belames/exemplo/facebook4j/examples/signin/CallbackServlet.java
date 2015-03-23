package br.com.belames.exemplo.facebook4j.examples.signin;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.URL;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

import br.com.belames.dao.BelamesDAO;
import br.com.belames.dao.DAOFactory;
import br.com.belames.entity.Perfil;
import facebook4j.Facebook;
import facebook4j.FacebookException;

public class CallbackServlet extends HttpServlet {
    private static final long serialVersionUID = 6305643034487441839L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Facebook facebook = (Facebook) request.getSession().getAttribute("facebook");
        String oauthCode = request.getParameter("code");
        try {
            facebook.getOAuthAccessToken(oauthCode);
            
    		/*
    		 * Nome: ${facebook.me.name} <br>
  Id: ${facebook.me.id} <br>
  FirstName: ${facebook.me.firstName} <br>  
  MiddleName: ${facebook.me.middleName} <br>
  LastName: ${facebook.me.lastName} <br>
  Gender: ${facebook.me.gender} <br>
  Locale: ${facebook.me.locale} <br>
  Link: ${facebook.me.link} <br>
  Username: ${facebook.me.username} <br>
  ThirdPartyId: ${facebook.me.thirdPartyId} <br>
  Birthday: ${facebook.me.birthday} <br>
  Email: ${facebook.me.email} <br>
  Picture: <img src="${facebook.pictureURL}" /> <br>
  RelationshipStatus: ${facebook.me.relationshipStatus} <br>
  Religion: ${facebook.me.religion} <br>
    		 */
            
    		Perfil perfil = new Perfil();
    		perfil.setCdPerfil(Long.valueOf(facebook.getMe().getId()));
    		perfil.setNmUsuario(facebook.getMe().getName());
    		perfil.setCidade("Teste");
    		perfil.setIdade(20);
    		perfil.setUrlFoto(facebook.getPictureURL().getPath());
    		perfil.setGenero(facebook.getMe().getGender());
    		perfil.setUrlPerfil(facebook.getMe().getLink().getPath());
    		
    		
            try { 
            	/*
            	 * BufferedImage image = ImageIO.read(new File("icon.png"));
				      ByteArrayOutputStream baos = new ByteArrayOutputStream();
				      ImageIO.write(image, "png", baos);
				     byte[] res=baos.toByteArray();
				      String encodedImage = Base64.encode(baos.toByteArray());
				
				
				Read more: http://mrbool.com/how-to-convert-image-to-byte-array-and-byte-array-to-image-in-java/25136#ixzz3UbVzRbh8

            	 */
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
        		BufferedImage img = ImageIO.read(facebook.getPictureURL());
        		ImageIO.write(img, "png", baos);
        		baos.flush();
        		
        		perfil.setFoto(baos.toByteArray());
        		
        		//perfil.setUrlFoto(Base64.encode(baos.toByteArray()));
        		
        		baos.close();
         
        		
        		/*
        		BufferedImage imag=ImageIO.read(new ByteArrayInputStream(bytearray));
        		ImageIO.write(imag, "jpg", new File(dirName,"snap.jpg"));
				*/
            } catch (IOException e) {
            	e.printStackTrace();
            }

            BelamesDAO dao = new BelamesDAO();
            dao.salvarPerfil(perfil);
    		
        } catch (FacebookException e) {
            throw new ServletException(e);
        }
        response.sendRedirect(request.getContextPath() + "/");
    }
}
