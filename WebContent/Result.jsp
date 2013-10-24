<%@ page import="java.util.*, java.sql.*, java.io.*" %>
<%@include file="./Common.jsp"%>
<%@page import="net.sourceforge.tess4j.Tesseract"%>
<%@page import="net.sourceforge.tess4j.TesseractException"%>
<!DOCTYPE html>
<html>
<head>
<title>Image Cropper</title>
<body>
<%
  String input = null;

  try {
	conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
    pstmt = conn.prepareStatement("SELECT * FROM crop ORDER BY id DESC LIMIT 1");
    rs = pstmt.executeQuery();
    if (rs.next()) {
    	String result="";
		File imageFile = new File("C:/capstone/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/ReadEverything/image/"+rs.getString("file"));
		Tesseract instance = Tesseract.getInstance(); // JNA Interface Mapping
		
		try {
			result = instance.doOCR(imageFile);
		} catch (TesseractException e) {
			System.err.println(e.getMessage());
		}

      	%>
      	<%=rs.getString("file") %><br/>
      	<%=result %><br/>
      	<img src="image/<%=rs.getString("file") %>"/>
      	<%
    }
  } catch(Exception e) {
    out.print(e);
  } finally {
    try {if (rs != null) rs.close();} catch (Exception ex) {}
    try {if (pstmt != null) pstmt.close();} catch (Exception ex) {}
    try {if (conn != null) conn.close();} catch (Exception ex) {}
  }
%>
</body>
</html>
