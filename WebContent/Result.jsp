<%@ page import="java.util.*, java.sql.*, java.io.*" %>
<%@include file="./Common.jsp"%>
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
      %>
      <%=rs.getString("file") %><br/>
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
