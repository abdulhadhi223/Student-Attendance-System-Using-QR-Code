/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Action;

import DBconnection.SQLconnection;
import Networks.Mail;
import Networks.QRMail;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author JAVA-JP
 */
@MultipartConfig(maxFileSize = 16177215)
public class Student_register extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("username");
            String mail = request.getParameter("email");
            String dob = request.getParameter("dob");
            String gender = request.getParameter("gender");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            String pass = request.getParameter("pass");
            String dept = request.getParameter("dept");
            String year = request.getParameter("year");
            InputStream inputStream = null;
            Part filePart = request.getPart("photo");
            if (filePart != null) {
                System.out.println(filePart.getName());
                System.out.println(filePart.getSize());
                System.out.println(filePart.getContentType());
                inputStream = filePart.getInputStream();
            }

            String details = "Name :" + name + "Email :" + mail + "Phone No :" + phone + "Address :" + address;

            System.out.println("name:" + name + "password:" + pass + "address:" + address + "mail:" + mail + "dob:" + dob + "cell:" + phone);

            Connection conn = SQLconnection.getconnection();
            String message = null;

            try {
                Statement st = conn.createStatement();
                Statement st1 = conn.createStatement();

                ResultSet rs1 = st1.executeQuery("Select * from student_reg where name ='" + name + "'");
                if (rs1.next()) {

                    response.sendRedirect("Student_login.jsp?msg=Name_Already_Exists");
                } else {
                    ResultSet rs = st.executeQuery("Select * from student_reg where email ='" + mail + "'");
                    if (rs.next()) {

                        response.sendRedirect("Student_login.jsp?msg=Mail_Id_Exists");
                    } else {
                        QR_codeGen qr = new QR_codeGen();
                        qr.QR_code(details, name);

                        String sql = "insert into student_reg(name, dob, email, gender, phone, address, password, details, dept, year, photo) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                        PreparedStatement statement = conn.prepareStatement(sql);
                        statement.setString(1, name);
                        statement.setString(2, dob);
                        statement.setString(3, mail);
                        statement.setString(4, gender);
                        statement.setString(5, phone);
                        statement.setString(6, address);
                        statement.setString(7, pass);
                        statement.setString(8, details);
                        statement.setString(9, dept);
                        statement.setString(10, year);
                        if (inputStream != null) {
                            statement.setBlob(11, inputStream);
                        }

                        int row = statement.executeUpdate();
                        if (row > 0) {

                            response.sendRedirect("Student_login.jsp?Register_Success");
                        } else {
                            response.sendRedirect("Student_login.jsp?Failed");
                        }
                    }
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
