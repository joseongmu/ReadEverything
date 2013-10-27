<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"  import="java.sql.*"%>
    <%
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String dbUrl = "jdbc:mysql://localhost:3306/imagecrop?useUnicode=true&characterEncoding=UTF-8";
	String dbUser = "root";
	String dbPassword = "1q2w3e4r!";
	int id = 0;
	String name = null;
	String errorMsgs = null;
	String driverName = "com.mysql.jdbc.Driver";
	request.setCharacterEncoding("utf-8");
	String realFolder = "";
	String imagename = "";
	int maxSize = 1024 * 1024 * 5;
	String encType = "UTF-8";
	String saveFolder = "image/";
    %>
