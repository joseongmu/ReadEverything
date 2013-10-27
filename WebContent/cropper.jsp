<%@page import="java.awt.image.ConvolveOp"%>
<%@page import="java.awt.image.Kernel"%>
<%@ page import="java.awt.image.BufferedImage"%>
<%@ page import="java.io.File"%>
<%@ page import="java.awt.image.RescaleOp"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.io.IOException"%>
<%@ page import="javax.imageio.ImageIO"%>
<%@ page import="java.util.Date"%>
<%@include file="./Common.jsp"%>
<%
	int x = Integer.parseInt(request.getParameter("x"));
	int y = Integer.parseInt(request.getParameter("y"));
	int w = Integer.parseInt(request.getParameter("w"));
	int h = Integer.parseInt(request.getParameter("h"));
	imagename = request.getParameter("imagename");
	float scaleFactor=3.0f;
	float[] elements = { 
			0.0f, -1.0f, 0.0f,
			-1.0f,  5.0f, -1.0f,
			0.0f, -1.0f,  0.0f}; 
	String fileName = new Date().getTime()+"";

	try {
		String absolutePath = "C:/capstone/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/ReadEverything/image/";
		
		BufferedImage originalImgage = ImageIO.read(new File(absolutePath+imagename));
		BufferedImage SubImage = originalImgage.getSubimage(x, y, w, h);
		
		RescaleOp rescale = new RescaleOp(scaleFactor,-100.0f, null);
		SubImage=rescale.filter(SubImage, SubImage);//(sourse,destination)
		
		Kernel kernel = new Kernel(3,3,elements); 
		ConvolveOp cop = new ConvolveOp(kernel, ConvolveOp.EDGE_NO_OP, null); 
		cop.filter(SubImage, null); 
		
		File outputfile = new File(absolutePath + fileName + ".jpg");
		ImageIO.write(SubImage, "jpg", outputfile);
		
		Class.forName(driverName);
		conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

		pstmt = conn.prepareStatement("insert into crop (name, file) VALUES (?, ?)");
		pstmt.setString(1, "hell");
		pstmt.setString(2, ""+outputfile.getName());
		pstmt.executeUpdate();
		response.sendRedirect("Result.jsp");
	} catch (SQLException e) {
		e.getMessage();
	} finally {
		if (pstmt != null)try {pstmt.close();	} catch (SQLException e) {}
		if (stmt != null)	try {pstmt.close();} catch (SQLException e) {}
		if (conn != null)try {conn.close();} catch (SQLException e) {}
	}
%>
