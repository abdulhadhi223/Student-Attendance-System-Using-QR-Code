<%-- 
    Document   : du_signin
    Created on : 13 Jan, 2021, 11:42:02 AM
    Author     : JAVA-JP
--%>

<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@page import="Networks.Mail"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String mail = request.getParameter("email");
    String pass = request.getParameter("pass");
    String status = null;
    System.out.println("Check User name And Password : " + mail + pass);
    Connection con = SQLconnection.getconnection();
    Statement st = con.createStatement();
    Statement sto = con.createStatement();
    try {
        ResultSet rs = st.executeQuery("SELECT * FROM student_reg where email='" + mail + "' AND password='" + pass + "' AND status='Approved' ");
        if (rs.next()) {

            session.setAttribute("uname", rs.getString("name"));
            session.setAttribute("umail", rs.getString("email"));
            session.setAttribute("uid", rs.getString("id"));
            
            response.sendRedirect("student_verify.jsp?Success");
        } else {
            response.sendRedirect("Student_login.jsp?Failed");
        }

    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>