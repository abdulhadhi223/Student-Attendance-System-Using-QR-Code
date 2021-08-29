<%-- 
    Document   : index
    Created on : 21 May, 2021, 12:31:31 PM
    Author     : JAVA-JP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    </head>
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
                        <li class="active"><a href="index.jsp">Home</a></li>
                        <li><a href="Student_login.jsp">Student</a></li>
                        <li><a href="Staff_login.jsp">Staff</a></li>
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
                        <h2 class="wow bounceIn" data-wow-offset="50">Student Attendance System</h2>
                    </div>
                    <div class="col-xs-12 wow fadeInLeft" data-wow-offset="50" >
                            <img src="images/main.jpg" width="1100" height="500" />
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

    </body>
</html>
