<%-- 
    Document   : Registration
    Created on : 18-Nov-2022, 2:50:50 PM
    Author     : dieudonne
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Course Register Form Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //custom-theme -->
<!-- css files -->
<link href="//fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&amp;subset=devanagari,latin-ext" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese" rel="stylesheet">
<link href="style.css" type="text/css" rel="stylesheet" media="all">   
<link href="style1.css" type="text/css" rel="stylesheet" media="all"> 
<!-- //css files -->

<link rel="stylesheet" href="font-awesome.css"> <!-- Font-Awesome-Icons-CSS -->

        <title>JSP Page</title>
    </head>
    <body>
<div id="menu" style="margin-top: -50px">
                        <ul>
                            <li><a href="index.html">Home</a></li>
                            <li><a href="about us.html">About Us</a></li>
                            <li><a href="#">Exams</a>
                           <div id="sub-menu">
                                    <ul>
                                        <li><a href="#">C</a></li>
                                        <li><a href="#">C++</a></li>
                                        <li><a href="#">Java</a></li>
                                        <li><a href="#">Python</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li id="active"><a href="register.html">Register</a></li>
                            <li><a href="sign in.html">Sign in</a></li>
                        </ul>
                    </div>
<section class="register">
    <a href="index.html"><img src="logo2.png" alt="alt" style="position: absolute; width: 200px;height: 70px; margin-left: 100px; margin-top: -70px;"/></a>
	<div class="register-full">
		<div class="register-left">
			<div class="register">
				<div class="logo">
				</div>
				<h1>Register to our Exam Platform</h1>
				<p>This is a platform where we provide some programming important questions that may 
                                help you during your job interview or other interviews </p>
				<div class="content3">
					<ul>
						<li><a class="" href="#"> Know More</a></li>
						<li><a class="read" href="#"> Get Started</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="register-right">
			<div class="register-in">
				<h2>register here</h2>
				<div class="register-form">
					<form action="jspservelet" method="post">
						<div class="fields-grid">
							<div class="styled-input agile-styled-input-top">
								<input type="text" name="fname" placeholder="username/firstname" required=""> 
								
								<span></span>
							</div>
							<div class="styled-input">
								<input type="email" name="email" placeholder="Email" required="">
								
								<span></span>
							</div>
							<div class="styled-input">
								<input type="password" name="password" placeholder="password" required="">
								
								<span></span>
							</div>
							<div class="styled-input agile-styled-input-top">
								<select name="dropdown" id="category2" required="">
									<option value="">Exams Type*</option>
									<option value="">C</option>
                                                                        <option value="">C++</option>
									<option value="">Java</option>
                                                                        <option value="">Python</option>
								</select>
								<span></span>
							</div>
							<div class="clear"> </div>
							 <label class="checkbox"><input type="checkbox" name="checkbox" checked>
                                                             <i></i>I agree to the <a href="#">Terms and Conditions</a></label>
						</div>
						<input type="submit" value="Register">
					</form>
				</div>
			</div>
			<div class="clear"> </div>
		</div>
	<div class="clear"> </div>
	</div>
	<!-- copyright -->
	<p class="agile-copyright">© 2022 NRExaminers. All Rights Reserved | Design by Innocent & Dieudonne</p>
	<!-- //copyright -->
</section>
        
        
        
    </body>
</html>
