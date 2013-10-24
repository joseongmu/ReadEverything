<%@ page import="java.awt.image.BufferedImage"%>
<%@ page import="java.io.File"%>
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
	String fileName = new Date().getTime()+"";

	try {
		//String absolutePath = "C:/ImageCrop/hello/WebContent/image/";
		String absolutePath = "C:/capstone/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/ReadEverything/image/";
		
		BufferedImage originalImgage = ImageIO.read(new File(absolutePath+ "pool.jpg"));
		BufferedImage SubImgage = originalImgage.getSubimage(x, y, w, h);
		File outputfile = new File(absolutePath + fileName + ".jpg");
		ImageIO.write(SubImgage, "jpg", outputfile);
		
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
