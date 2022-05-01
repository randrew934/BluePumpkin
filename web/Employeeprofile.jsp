<%-- 
    Document   : Employeeprofile
    Created on : 11-Jun-2020, 3:29:16 PM
    Author     : Ral
--%>

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
   <link rel="stylesheet" href="empprofilestyle.css">
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
           <li><p><span style="font-family:pacifico;">Hi,  </span><span id="usertitle"><%  String name=(String)session.getAttribute("name"); out.print(name);  %></span></p></li>
           <li><a href="SessionVerify" ><span class="icon"><i class="fas fa-home fa-lg" aria-hidden="true"></i></span><span class= "title">Home</span></a></li>
           <li><a href="employeeevents" ><span class="icon"><i class="fas fa-gamepad fa-lg" aria-hidden="true"></i></span><span class= "title">Events</span></a></li>
           <li><a href="Reminder"><span class="icon"><i class="fas fa-bell fa-lg" aria-hidden="true"></i></span><span class= "title">Reminder</span></a></li>
           <li><a href="employeeprofile" class="active"><span class="icon"><i class="fas fa-user fa-lg" aria-hidden="true"></i></span><span class= "title">Profile</span></a></li>
           <li><a href="logoutservlet"><span class="icon"><i class="fas fa-power-off fa-lg" aria-hidden="true"></i></span><span class= "title">Log out</span></a></li>
           </ul>
       </div>
     </div>
     <section>
     <div class="main_container">
    <div class="informationcontainer">
         <h1>Account Information</h1>
         	
   <%
	try{	
            
		connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
		statement=connection.createStatement();
		String sql = "Select * from emp_details where logineeid='"+name+"' ";

		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
	%>
      <div class="employeeinfocont1">
      <div class="employeeidcont"><p><%=resultSet.getString("logineeid") %></p></div>
        <div class="employeebutcont"><button>Edit</button></div>
      </div>
      <div class="employeeinfocont2">
        <div class="employeeinfoitem"><h3>Full Name:</h3><p id="displayfullname"><%=resultSet.getString("full_name") %></p></div>
        <div class="employeeinfoitem"><h3>Email Address:</h3><p id="displayemail"><%=resultSet.getString("email") %></p></div>
        <div class="employeeinfoitem"><h3>Date of Birth:</h3><p id="displaydob"><%=resultSet.getDate("dateofbirth") %></p></div>
        <div class="employeeinfoitem" style="display:none;"> <p id="displaypassword"><%=resultSet.getString("loginpassword") %></p></div>
      </div>
      	<%		
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
     </div>
       <div class="editcontainer">
         <div class="closeeditcontainer">
        <ul>
           <li><a href="#" class="closeedit"><i class="fas fa-times fa-lg"></i></a></li>
         </ul>
       </div>
         <form action="EmployeeProfileVerify" method="POST" name="employeelogin" id="BPProfileEdit">
           <div class="editformcontainer">
               
        <h1>Edit your profile</h1>
         <h3>Full Name</h3>
         <div class="formgroup"><input class="formfullname" type="text" name="formfullname" value="" id="formfullname" onblur="validateformfullname();"><label id ="errorfullname"></label></div>
         <h3>Email Address</h3>
         <div class="formgroup"><input class="formemail" type="email" name="formemail" value="" id="formemail" onblur="validateformemail()"><label id ="errormail"></label></div>
         <h3>Password</h3>
         <div class="formgroup"><input class="formpasword" type="password" name="formpassword" value="" id="formpasword" onblur="validateformpassword()"><label id ="errorpassword"></label></div>
         <h3>Date of Birth</h3>
         <div class="formgroup"><input class="formemployeedob" type="date" name="formemployeedob"  value="" min="1960-01-01" max="2000-12-31" id="formemployeedob"></div>

         <div class="formgroup"><button class="saveaccountButton" type="button" onclick="validateform();" id="saveaccount">Save Account</button></div>
           </div>
          </form>
             </div>
   </div>
  </section>
   </div>
    <script src="jquery.min.js"></script>
<script>

  $(document).ready(function() {
    $(".drawer").click(function(){
      $(".wrapper").toggleClass("collapse");

    });

    $(".employeebutcont").click(function(){
      $(".informationcontainer").toggleClass("collapseinformationcontainer");
      $(".editcontainer").toggleClass("expandeditcontainer");
      $('#formfullname').val($("#displayfullname").text());
      $('#formemail').val($("#displayemail").text());
      $('#formpasword').val($("#displaypassword").text());
      var x = $("#displaydob").text();
      document.getElementById("formemployeedob").value = x;

    });

    $(".closeedit").click(function(){
      $(".informationcontainer").toggleClass("collapseinformationcontainer");
      $(".editcontainer").toggleClass("expandeditcontainer");

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
    });
</script>

    <script type ="text/javascript">
       function validateformfullname(){
     var formfullname = document.getElementById("formfullname").value;
      if(formfullname === ""){
          document.getElementById("errorfullname").innerHTML = "Empty Full Name";
          document.getElementById("errorfullname").style.color = "red";
        }      
    }
    
    function validateformemail(){
        var formemail= document.getElementById("formemail").value;
         if(formemail === ""){
        document.getElementById("errormail").innerHTML = "Empty Email";
        document.getElementById("errormail").style.color = "red";
    }
    }
    
       function validateformpassword(){
        var formpassword= document.getElementById("formpasword").value;
         if(formpassword === ""){
        document.getElementById("errorpassword").innerHTML = "Empty Password";
        document.getElementById("errorpassword").style.color = "red";
    }
    }
    
    function validateform(){
        var formfullname = document.getElementById("formfullname").value;
        var formemail= document.getElementById("formemail").value;
        var formpassword= document.getElementById("formpasword").value;
        
      if(formfullname === ""){
          document.getElementById("errorfullname").innerHTML = "Empty Full Name";
          document.getElementById("errorfullname").style.color = "red";
        }      
   
         else if(formemail === ""){
        document.getElementById("errormail").innerHTML = "Empty Email";
        document.getElementById("errormail").style.color = "red";
    }
    
        
         else if(formpassword === ""){
        document.getElementById("errorpassword").innerHTML = "Empty Password";
        document.getElementById("errorpassword").style.color = "red";
    }
    
    else{
      document.getElementById('BPProfileEdit').submit();   
    }
    }
    
    
    </script>
  </body>
  </html>
