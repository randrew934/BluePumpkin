<%-- 
    Document   : login
    Created on : 8-Jun-2020, 12:59:49 PM
    Author     : Ral
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="loginstyle.css">
   <link rel="stylesheet" href="fonts.css">
    <link rel="shortcut icon" type="image/png" href="b_logo.png">
     <link href="C:\Users\Ral\Desktop\Android Play Tools\Fonts\montserrat" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Bree+Serif&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="jquery.min.js"></script>
    <title>BluePumpkin</title>
  </head>
  <body>
    <section>
      <header><h1>BluePumpkin</h1></header>
      <div class="logincontainer">
          <form action="ValidateLogin" method="POST" name="employeelogin" id="BPlogin">
          <div class="loginformcontainer">
               <% Map<String,String> loginid = (Map<String,String>) request.getAttribute("loginid");
         %>
        <h1>Login To Your Account</h1>
        <h3>Employee ID</h3>
        <div class="formgroup"><input class="logineeid"  type="text" name="logineeid" onblur="validatelogin();" id="logineeid"><label id ="errorlogineeid"></label></div>
        <h3>Password</h3>
        <div class="formgroup"><input class="loginpasword" type="password"  name="loginpassword" onblur="validatepassword();" id="loginpassword"><label id ="errorloginpassword"></label></div>
        <div class="formgroup"><button class="signupButton" value= "login" type="button" onclick="validateform();"  id="login">Log In</button></div>
          <div class="formgroup"><h4 id="invalidlogin"><%=loginid.get("loginid") %></h4></div>  
          </div>
          </form>
            </div>
    </section>
    <script type ="text/javascript">
       function validatepassword(){
     var loginpassword = document.getElementById("loginpassword").value;
      if(loginpassword === ""){
          document.getElementById("errorloginpassword").innerHTML = "Empty Password";
          document.getElementById("errorloginpassword").style.color = "red";
        }      
    }
    
    function validatelogin(){
        var loginee = document.getElementById("logineeid").value;
         if(loginee === ""){
        document.getElementById("errorlogineeid").innerHTML = "Empty Email or Employee ID";
        document.getElementById("errorlogineeid").style.color = "red";
    }
    }
    
    function validateform(){
        var loginee = document.getElementById("logineeid").value;
        var loginpassword = document.getElementById("loginpassword").value;
        
      if(loginee === ""){
        document.getElementById("errorlogineeid").innerHTML = "Empty Email or Employee ID";
        document.getElementById("errorlogineeid").style.color = "red";
    }
    
    else if(loginpassword === ""){
          document.getElementById("errorloginpassword").innerHTML = "Empty Password";
          document.getElementById("errorloginpassword").style.color = "red";
        }  
        
     else{
         document.getElementById('BPlogin').submit();
     }   
    }
    
    
    </script>
  </body>
  </html>
