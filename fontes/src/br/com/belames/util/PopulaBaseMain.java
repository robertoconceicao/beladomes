package br.com.belames.util;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;

import br.com.belames.dao.BelamesDAO;
import br.com.belames.entity.Perfil;

public class PopulaBaseMain {

	public static void main(String[] args) throws IOException {
		//ESTANCIA DO DAO
		BelamesDAO dao = new BelamesDAO();
		List<Perfil> lista =  dao.findAllPerfil();
		
		System.out.println("########## Init ##########");
		int j = 1;
		for(int i=0; i<lista.size();i++){
			if(j++ == 3){
				j = 1;
			} 
			BufferedImage image = ImageIO.read(new File("C://bela-mes-fotos//foto"+j+".jpg"));			
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ImageIO.write(image, "png", baos);
			byte[] res=baos.toByteArray();
			Perfil perfil = lista.get(i);
			perfil.setFoto(res);
			
			dao.updateFotoPerfil(perfil);		
			
			System.out.println("go");
		}
		System.out.println("########## Over ##########");
	}

}
