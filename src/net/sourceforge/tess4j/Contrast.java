package net.sourceforge.tess4j;

import java.awt.image.BufferedImage;
import java.awt.image.RescaleOp;
import java.io.File;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

/**
 *
 * @author gihan
 */
public class Contrast extends JFrame{
	private static final long serialVersionUID = 1L;
		//globel variables
        BufferedImage bufferedImage;
        String path="/home/gihan/Pictures/nfs_bmw.jpg";// image file path     
        float scaleFactor=3.6f;//change scaleFactor to change contrast        
        /*keep the value scaleFactor = 1.0f; as for a normal image*/
        RescaleOp rescale;
        ImageIcon icon;
        JLabel picLabel=new JLabel();

     public Contrast() {

         JFrame jf=new JFrame();
         JPanel jp=new JPanel();        

         jf.add(jp);
         jp.add(picLabel);

            jf.setVisible(true);
            jf.setSize(740, 487);
            jf.setLocation(200,100);
            jf.setTitle("Gihan¡¯s Image Processing Test Area.. ");
            jf.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

            File file = new File(path);

        try {           
            bufferedImage = ImageIO.read(file); // create a buffered image
        } catch (IOException ex) {
            Logger.getLogger(Contrast.class.getName()).log(Level.SEVERE, null, ex);
        }

         contrastChange();   
         icon = new ImageIcon(bufferedImage);          
         picLabel.setIcon(icon);       

    }

     private void contrastChange(){

         rescale();
         icon = new ImageIcon(bufferedImage);          
         picLabel.setIcon(icon); 
         System.out.println("scaleFactor : "+scaleFactor  );

    }//contrastChange()

     public void rescale() {

        rescale = new RescaleOp(scaleFactor,20.0f, null);
        bufferedImage=rescale.filter(bufferedImage,null);//(sourse,destination)

       }//end rescale

}//end class contrast