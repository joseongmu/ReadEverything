package net.sourceforge.tess4j;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class WebTess4j
 */
@WebServlet("/WebTess4j")
public class WebTess4j extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public WebTess4j() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String result="";
		File imageFile = new File("C:/capstone/ReadEverything/eurotext.tif");
		Tesseract instance = Tesseract.getInstance(); // JNA Interface Mapping
		
		try {
			result = instance.doOCR(imageFile);
		} catch (TesseractException e) {
			System.err.println(e.getMessage());
		}

        out.println("<html><body>"); 

        out.println("<h1>"+result+"</h1>"); 

        out.println("</body></html>"); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
