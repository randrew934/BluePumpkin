<%-- 
    Document   : adminprofile
    Created on : 12-Jun-2020, 2:51:01 PM
    Author     : Ral
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
      <head>
    <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="homestyle.css">
   <link rel="stylesheet" href="homebodystyle.css">
   <link rel="stylesheet" href="admintopstyle.css">
   <link rel="stylesheet" href="adminprofilesstyle.css">
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
    <div class="wrapper">
      <div class="top_navbar">
       <div class="drawer">
         <div></div>
         <div></div>
         <div></div>
       </div>
       <div class="top_menu">
         <div class="logo"> BluePumpkin</div>
         <label id="adminTitle">Admin Page</label>
          <ul>
           <li><a href="contactus.jsp"><i class="fas fa-phone"></i></a></li>
           <li><a href="faq.jsp"><i class="fas fa-question"></i></a></li>
          </ul>
       </div>
       <div class="side_bar">
         <ul>
           <li><a href="AdminVerify"><span class="icon"><i class="fas fa-home fa-lg" aria-hidden="true"></i></span><span class= "title">Home</span></a></li>
           <li><a href="adminevents" ><span class="icon"><i class="fas fa-gamepad fa-lg" aria-hidden="true"></i></span><span class= "title">Events</span></a></li>
           <li><a href="adminreminder"><span class="icon"><i class="fas fa-bell fa-lg" aria-hidden="true"></i></span><span class= "title">Reminder</span></a></li>
           <li><a href="adminprofile" class="active"><span class="icon"><i class="fas fa-user fa-lg" aria-hidden="true"></i></span><span class= "title">Profile</span></a></li>
           <li><a href="logoutservlet"><span class="icon"><i class="fas fa-power-off fa-lg" aria-hidden="true"></i></span><span class= "title">Log out</span></a></li>
           </ul>
       </div>
     </div>
     <section>
       <div class="main_container">
       <div class="item">
                   <div class="warningClass"><h3 id="a" align="center"><font><strong>Open with a desktop!!!</strong></font></h3></div> 
           <div class="adminprofilescontainer">
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
     
<h2 id="a" align="center"><font><strong>Profile Database</strong></font></h2>
<div class="createAccountButtonContainer"><button class="createAccountButton" type="button" onclick="" id="createAccountButton">Create Account</button></div>
<table class="adminprofilescontainer_table">
<thead>
	<tr>
                <td><b>Delete</b></td>
		<td><b>Employee_ID</b></td>
		<td><b>Password</b></td>
		<td><b>Full Name</b></td>
                <td><b>Email</b></td>
                <td><b>Date Of Birth</b></td>
	</tr>
     </thead>
<tbody>
   <%
	try{	
		connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
		statement=connection.createStatement();
		String sql ="SELECT * FROM emp_details";
                String admin = "admin";

		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
                    if(!resultSet.getString("logineeid").equals(admin)){
	%>
		<tr >
			<td><a href="deleteadminprofiles?eid=<%=resultSet.getString("e_db_id") %>"><i class="fas fa-trash fa-lg"></i></a></td>
			<td><%=resultSet.getString("logineeid") %></td>
			<td><%=resultSet.getString("loginpassword") %></td>
                        <td><%=resultSet.getString("full_name") %></td>
			<td><%=resultSet.getString("email") %></td>
                        <td><%=resultSet.getDate("dateofbirth") %></td>          
              
            </tr>
		            
<%
    }
	}	
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

</tbody>
</table>
<div class="adminoverallcreatecontainer">
    <div class="closecreateformcontainer"><a href="#" class="closecreate"><i class="fas fa-times fa-lg"></i></a></div>
 <form action="createaccount" method="POST" name="createaccountform" id="BPACaccount">
          <div class="createformcontainer">
        <h1>Create an Account</h1>
        <h3>Full Name</h3>
        <div class="formgroup"><input class="formfullname" type="text" name="formfullname" placeholder="Full Name" onblur="validateformfullname();" id="formfullname"><label id ="errorfullname"></label></div>
        <h3>Employee ID</h3>
        <div class="formgroup"><input class="formemployeeid" type="text" name="formemployeeid" placeholder="Employee ID" onblur="validateformemployeeid()" id="formemployeeid"><label id ="erroremployeeid"></label></div>
        <h3>Email Address</h3>
        <div class="formgroup"><input class="formemail" type="email" name="formemail" placeholder="Email Address" onblur="validateformemail();" id="formemail"><label id ="errormail"></label></div>
        <h3>Password</h3>
        <div class="formgroup"><input class="formpassword" type="password" name="formpassword" placeholder="Password" onblur="validateformpassword();" id="formpassword"><label id ="errorpassword"></label></div>
        <h3>Date of Birth</h3>
        <div class="formgroup"><input class="formemployeedob" type="date" name="formemployeedob" value="" min="1960-01-01" max="2000-12-31" id="formemployeedob"></div>
        <div class="formgroup"><button class="signupButton" type="button" onclick="validateformSubmit();" id="signup">Create Account</button></div>
          </div>
      </form>  
</div>  
    <script src="jquery.min.js"></script>
<script>
  $(document).ready(function() {
    $(".drawer").click(function(){
      $(".wrapper").toggleClass("collapse");

    });

    $(".createAccountButton").click(function(){
  $(".createAccountButtonContainer").toggleClass("collapsecreateAccountButtonContainer");
      $(".adminoverallcreatecontainer").toggleClass("expandadminoverallcreatecontainer");

    });

    $(".closecreate").click(function(){
      $(".createAccountButtonContainer").toggleClass("collapsecreateAccountButtonContainer");
      $(".adminoverallcreatecontainer").toggleClass("expandadminoverallcreatecontainer");

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
        var formpassword= document.getElementById("formpassword").value;
         if(formpassword === ""){
        document.getElementById("errorpassword").innerHTML = "Empty Password";
        document.getElementById("errorpassword").style.color = "red";
        alert("wprking");
    }
    }
    
     function validateformemployeeid(){
        var formemployeeid= document.getElementById("formemployeeid").value;
         if(formemployeeid === ""){
        document.getElementById("erroremployeeid").innerHTML = "Empty Employee ID";
        document.getElementById("erroremployeeid").style.color = "red";
    }
    }
    
    function validateformSubmit(){
        var formfullname = document.getElementById("formfullname").value;
        var formemail= document.getElementById("formemail").value;
        var formpassword= document.getElementById("formpassword").value;
        var formemployeeid= document.getElementById("formemployeeid").value;
        
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
    
    else if(formemployeeid === ""){
        document.getElementById("erroremployeeid").innerHTML = "Empty Employee ID";
        document.getElementById("erroremployeeid").style.color = "red";
    }
    
    else{
      document.getElementById('BPACaccount').submit();   
    }
    }
    
    
    </script>
           </div>
       </div>
       </div>
</section>
    </div>
  </body>
  </html>