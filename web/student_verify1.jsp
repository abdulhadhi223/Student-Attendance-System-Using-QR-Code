<%-- 
    Document   : du_signin
    Created on : 13 Jan, 2021, 11:42:02 AM
    Author     : JAVA-JP
--%>

<%@page import="Action.QRCodeExtract"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
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
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try {
        String setvall;
        String status = null;
        final String filepath = "D:/Authentication/";
        MultipartRequest m = new MultipartRequest(request, filepath);
        String id = m.getParameter("id");
        File file = m.getFile("file");
        String path = file.toString();
        String filename = file.getName().toLowerCase();
        Connection con = SQLconnection.getconnection();
        Statement st = con.createStatement();
        Statement st1 = con.createStatement();
        Statement sto = con.createStatement();
        System.out.println("Check User ID : " + id);
        System.out.println("Check path : " + path);

        QRCodeExtract qrread = new QRCodeExtract();
        qrread.QRCodeReader(path);
        setvall = QRCodeExtract.getvall;

        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();
        String time = dateFormat.format(date);
        System.out.println("Date and Time : " + time);

        DateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
        Date date1 = new Date();
        System.out.println(dateFormat1.format(date1));
        String indate = dateFormat1.format(date1);
        //
        DateFormat TimeFormat = new SimpleDateFormat("HH:mm:ss");
        Date CurrentTime = new Date();
        System.out.println(TimeFormat.format(CurrentTime));
        String ctime = TimeFormat.format(CurrentTime);

        System.out.println("Check details : " + setvall);
        ResultSet rs = sto.executeQuery("SELECT * FROM student_reg where details ='" + setvall + "' AND id ='" + id + "' ");
        if (rs.next()) {
            String name = rs.getString("name");
            String email = rs.getString("email");
            String dept = rs.getString("dept");
            String year = rs.getString("year");
            int i = st1.executeUpdate("insert into attendance (sid, name, email, time , details, dept, year, date, ctime)values('" + id + "','" + name + "','" + email + "','" + time + "','" + setvall + "','" + dept + "','" + year + "','" + indate + "','" + ctime + "')");
            response.sendRedirect("Student_Home.jsp?Success");
        } else {
            response.sendRedirect("Student_login.jsp?Msg=Incorrect_QR-code");

        }

    } catch (Exception ex) {
        ex.printStackTrace();
        response.sendRedirect("Student_login.jsp?Msg=Incorrect_QR-code");
    }
%>