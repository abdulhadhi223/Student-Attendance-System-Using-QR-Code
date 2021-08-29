<%-- 
    Document   : index
    Created on : 21 May, 2021, 12:31:31 PM
    Author     : JAVA-JP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Student Attendance System</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="css/animate.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="css/templatemo-style.css">
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.singlePageNav.min.js"></script>
        <script src="js/typed.js"></script>
        <script src="js/wow.min.js"></script>
        <script src="js/custom.js"></script>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>  
        <script src="table2excel.js" type="text/javascript"></script>    

    </head>
    <style>
        div.ex1 {
            width: auto;
            height: auto;
            overflow: scroll;
        }
    </style>
    <style>

        .customers {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            font-size: 20px;
            border-collapse: collapse;
            width: 100%;
        }

        .customers td, .customers th {
            border: 2px solid black;
            align:"center";  cellpadding:"0"; cellspacing:"2";
            padding: 15px;
            color: white;
        }


        .customers th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #3399ff;
            color: black;
        }
    </style>
    <body id="top">

        <!-- start preloader -->
        <div class="preloader">
            <div class="sk-spinner sk-spinner-wave">
                <div class="sk-rect1"></div>
                <div class="sk-rect2"></div>
                <div class="sk-rect3"></div>
                <div class="sk-rect4"></div>
                <div class="sk-rect5"></div>
            </div>
        </div>
        <!-- end preloader -->

        <!-- start header -->
        <header>
            <div class="container">
                <div class="row">
                </div>
            </div>
        </header>
        <script>
            $(document).ready(function () {
                $("#bs-example-navbar-collapse-1").find("a:not(.dropdown-toggle)").off("click").off("mousedown");
            });
        </script>
        <!-- end header -->

        <!-- start navigation -->
        <nav class="navbar navbar-default templatemo-nav" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon icon-bar"></span>
                        <span class="icon icon-bar"></span>
                        <span class="icon icon-bar"></span>
                    </button>
                    <a href="#" class="navbar-brand"><i class="fa fa-bars fa-2x"></i></a>
                </div>
                <div class="collapse navbar-collapse" id='bs-example-navbar-collapse-1'>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="Staff_Home.jsp">Home</a></li>
                        <li><a href="student_details.jsp">Students</a></li>
                        <li class="active"><a href="attendance_details.jsp">Attendance</a></li>
                        <li><a href="index.jsp">Logout</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- end navigation -->

        <!-- start home -->
        <section id="home">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1 class="wow fadeIn" data-wow-offset="50" data-wow-delay="0.9s">
                            <span>Student Attendance System Using QR-Code</span></h1>
                    </div>
                </div>
            </div>
        </section>
        <!-- end home -->

        <!-- start about -->
        <section id="about">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h2 class="wow bounceIn" data-wow-offset="50">Attendance Details</h2>
                    </div>
                    <div class="col-md-12">
                        <div class="row">
                            <form action="attendance_details1.jsp" method="post">
                                <div class="col-md-3">
                                    <label>ATTENDANCE DATE</label>
                                    <input type="date" name="adate" class="form-control" required="">
                                </div>
                                <div class="col-md-3"><br>
                                    <button type="submit" class="btn btn-success btn-lg">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-xs-12 wow fadeInLeft" data-wow-offset="50" ><br><br><br> 
                        <button class="btn btn-primary"  id="btnExporttoExcel">Export To Excel</button>  
                        <div class="ex1">
                            <br>
                            <table class="customers" id="tblEmployee">
                                <thead>
                                    <tr>                
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Department</th>
                                        <th>Year</th>
                                        <th>Attendance Time</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        Connection con = SQLconnection.getconnection();
                                        Statement st = con.createStatement();
                                        try {
                                            ResultSet rs = st.executeQuery("SELECT * FROM attendance ");
                                            while (rs.next()) {
                                    %>
                                    <tr>
                                        <td><%=rs.getString("sid")%></td>
                                        <td><%=rs.getString("name")%></td>
                                        <td><%=rs.getString("email")%></td>
                                        <td><%=rs.getString("dept")%></td>
                                        <td><%=rs.getString("year")%></td>
                                        <td><%=rs.getString("time")%></td>
                                        <%                                        }
                                            } catch (Exception ex) {
                                                ex.printStackTrace();
                                            }

                                        %>
                                    </tr>
                                </tbody>
                            </table>   
                            <script>
                                $("#yourHtmTable").table2excel({
                                    exclude: ".excludeThisClass",
                                    name: "Worksheet Name",
                                    filename: "SomeFile"
                                });
                            </script>
                            <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>  
                            <script src="table2excel.js" type="text/javascript"></script>  
                            <script type="text/javascript">
                                $(function () {
                                    $("#btnExporttoExcel").click(function () {
                                        $("#tblEmployee").table2excel({
                                            filename: "AttendanceDetails.xls"
                                        });
                                    });
                                });
                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- end about -->

        <!-- end contact -->

        <!-- start copyright -->
        <footer id="copyright">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <p class="wow bounceIn" data-wow-offset="50" data-wow-delay="0.3s">
                            &copy; 2021</p>
                    </div>
                </div>
            </div>
        </footer>
        <!-- end copyright -->

        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>  
        <script src="js/table2excel.js" type="text/javascript"></script>  

        <script  src="Table/script.js"></script>
    </body>
</html>
