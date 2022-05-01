<%-- 
    Document   : Reminder
    Created on : 10-Jun-2020, 12:22:41 PM
    Author     : Ral
--%>

<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="homestyle.css">
   <link rel="stylesheet" href="homebodystyle.css">
   <link rel="stylesheet" href="remindersstyle.css">
   <link rel="stylesheet" href="preloader.css">
   <link rel="stylesheet" href="fonts.css">
    <link rel="shortcut icon" type="image/png" href="bp_logo.png">
     <link href="C:\Users\Ral\Desktop\Android Play Tools\Fonts\montserrat" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <title>BluePumpkin</title>
  </head>
  <body>
        <%

	String driverName = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "blue_pumpkin";
	String userId = "root";
	String password = "";
	
	try {
		Class.forName(driverName);
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	}
	
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
%>
    <div class="wrapper">
   <%
	try{	
            
            LocalDate today = java.time.LocalDate.now();
            String date = today.toString();
            
		connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
		statement=connection.createStatement();
		String sql = "Select * from emp_details WHERE DATE_FORMAT(dateofbirth, '%m-%d') = DATE_FORMAT('"+date+"', '%m-%d')";
                
                
                String name=(String)session.getAttribute("name"); 
		resultSet = statement.executeQuery(sql);
                
                %>
      <div class="top_navbar">
       <div class="drawer">
         <div></div>
         <div></div>
         <div></div>
       </div>
       <div class="top_menu">
         <div class="logo"> BluePumpkin</div>
           <ul>
           <li><a href="contactus.jsp"><i class="fas fa-phone"></i></a></li>
           <li><a href="faq.jsp"><i class="fas fa-question"></i></a></li>
          </ul>
       </div>
       <div class="side_bar">
          <ul>
           <li><p><span style="font-family:pacifico;">Hi,  </span><span id="usertitle"><%  out.print(name);  %></span></p></li>
           <li><a href="SessionVerify" ><span class="icon"><i class="fas fa-home fa-lg" aria-hidden="true"></i></span><span class= "title">Home</span></a></li>
           <li><a href="employeeevents" ><span class="icon"><i class="fas fa-gamepad fa-lg" aria-hidden="true"></i></span><span class= "title">Events</span></a></li>
           <li><a href="Reminder" class="active"><span class="icon"><i class="fas fa-bell fa-lg" aria-hidden="true"></i></span><span class= "title">Reminder</span></a></li>
           <li><a href="employeeprofile"><span class="icon"><i class="fas fa-user fa-lg" aria-hidden="true"></i></span><span class= "title">Profile</span></a></li>
           <li><a href="logoutservlet"><span class="icon"><i class="fas fa-power-off fa-lg" aria-hidden="true"></i></span><span class= "title">Log out</span></a></li>
           </ul>
       </div>
     </div>
     <section>
          
<div class="main_container">
  <div class="item">
    <div class="remindercontainer">
<h1>Reminders</h1>
<div class="reminder_container_date"><span id="currentdate"></span></div>
<div class="remindercontainertables">
<div class = "remindercontainertable_row">
                
                <%
		while(resultSet.next()){
                    if(!resultSet.getString("logineeid").equals(name)){
	%>
		
			<div class = "remindercontainertable_col">
			<p>Today is <span><%=resultSet.getString("full_name") %></span>'s birthday. Wish Them Well <i class="fas fa-birthday-cake"></i></p>
                        </div>
		
		            
	<%		
		}
}
	%>

</div>
</div>
    </div>
</div>
</div>
</section>
     <script src="jquery.min.js"></script>
 <script>
   $(document).ready(function() {
     $(".drawer").click(function(){
       $(".wrapper").toggleClass("collapse");

     });
	 
        $(window).on("load",function(){
         
			// document.getElementById("birthdayname").innerHTML = "Drew";
			 var today = new Date();
			 var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
			 document.getElementById("currentdate").innerHTML = date;
                         
		
	  });
 });
 </script>
 <div class="loader-wrapper">
   <h3>BluePumpkin</h3>
   <span class="loader"><span class="loader-inner"></span></span>
 </div>
 <script>
     $(window).on("load",function(){
       $(".loader-wrapper").fadeOut("slow");
       
       document.getElementById('usertitle').innerHTML = localStorage.getItem("name");
       
     });
 </script>
    </div>
        <%
            } catch (Exception e) {
		e.printStackTrace();
	}
%>
   </body>
   </html>
