<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>GMT</title>
    <link rel="stylesheet" type="text/css" href="/css/firstpage.css">
</head>
<body>
    <%@include file="/views/Navbar.jsp"%>
     <div class="BackSvg"></div>
     <section class="firstSection" >
        
            <h2 style="align-self: center;">Welcome to Game Tournament Management</h2>
            <hr>
            <div class="containerTop" style="width:100%;display:inline-flex;">
            <div class="container" style="width:100%;display:inline-flex;" >
                <div class="LeftText" style="width:50%">
                <p>Simplify the complexity of Creating and Managing Tournaments with 
                <span style="font-weight: bold;">GMT</span><br><br> 
                The Easiest Way To Organise <br><span class="TypewritterP" data-typewriter="Cricket Tournament!,DOTA Tournament!,Valorant Tournament!,Football Tournament!,and more..."></span> </p>
                    <a href="/user/createTournament" class="btn">Create Your Own Tournament</a>
                </div>
                <div class="RightImage" >
                <img class="heroImg" src="https://cdn.bleacherreport.net/images_root/slides/photos/000/595/808/102809752_original.jpg?1293506368" alt="" alt="Esport" >
                </div>
        </div>
        </div>
     </section>
     <section>
       
    <div class="card-container">
        <div class="card">
            <h3>Login and Signup</h3>
            <p>Login or Create your account to Save Tournaments.</p>
            <a href="/login" class="btn">Login / Sign Up</a>
        </div>
        <div class="card">
            <h3>Create Tournament</h3>
            <p>Create your own tournament and save participants.</p>
            <a href="/user/createTournament" class="btn">Create Tournament</a>
        </div>
        <div class="card">
            <div class="card-avatar"><h3>Manage Tournament</h3></div>
            <div class="card-title"><p>View, Manage or Update existing tournaments.</p></div>
            <div clas="card-desc"><a href="/user/viewTournament" class="btn">Manage Tournament</a></div>
        </div>
    </div>
    </section>
     <section>
        <div class="container">
            <h2>Why Choose Us?</h2>
            <div class="features">
                <div class="feature">
                    <i class="icon-trophy"></i>
                    <h3>Easy to Use</h3>
                    <p>Our platform is designed to be user-friendly and easy to use for everyone.</p>
                </div>
                <div class="feature">
                    <i class="icon-people"></i>
                    <h3>Community</h3>
                    <p>Join our community and connect with other gamers and tournament organizers.</p>
                </div>
                <div class="feature">
                    <i class="icon-calendar"></i>
                    <h3>Organize</h3>
                    <p>Organize and manage your tournaments with ease.</p>
                </div>
            </div>
        </div>
     </section>
    <footer>
        <div class="footer-links">
            <a href="#">Privacy Policy</a>
            <a href="#">Terms of Service</a>
            <a href="#">Contact</a>
        </div>
        <div class="social-media">
            <a href="#"><i class="icon-facebook"></i></a>
            <a href="#"><i class="icon-twitter"></i></a>
            <a href="#"><i class="icon-instagram"></i></a>
        </div>
    </footer>
 
</body>
<script src="js/index.js"></script>
</html>
