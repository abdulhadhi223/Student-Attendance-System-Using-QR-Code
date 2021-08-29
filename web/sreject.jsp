<%-- 
    Document   : du_signin
    Created on : 13 Jan, 2021, 11:42:02 AM
    Author     : JAVA-JP
--%>

<%@page import="Networks.Mail"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("id");

    Connection con = null;
    Statement st = null;
    Statement st1 = null;
    Connection conn = SQLconnection.getconnection();
    Statement sto = conn.createStatement();
    st = conn.createStatement();

    try {
        int i = sto.executeUpdate("update student_reg set status='Rejected' where id='" + id + "' ");
        System.out.println("test print==" + id);
        if (i != 0) {
            ResultSet rs = st.executeQuery(" SELECT * from student_reg where id = '" + id + "' ");
            if (rs.next()) {
                String mail = rs.getString("email");
                String name = rs.getString("name");
                String imagePath = "D:\\Authentication\\" + name + ".png";
                String msggg = "Hi, " + name + " Your Student Registration is Rejected";
                Mail ma = new Mail();
                ma.secretMail(msggg, "Rejected", mail);
                System.out.println("success");
                response.sendRedirect("student_details.jsp?Rejected");
            } else {

                System.out.println("failed");
                response.sendRedirect("student_details.jsp?Failed");
            }
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
