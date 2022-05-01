<%-- 
    Document   : adminevents
    Created on : 12-Jun-2020, 9:17:53 AM
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
   <link rel="stylesheet" href="admineventsstyle.css">
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
           <li><a href="adminevents" class="active"><span class="icon"><i class="fas fa-gamepad fa-lg" aria-hidden="true"></i></span><span class= "title">Events</span></a></li>
           <li><a href="adminreminder"><span class="icon"><i class="fas fa-bell fa-lg" aria-hidden="true"></i></span><span class= "title">Reminder</span></a></li>
           <li><a href="adminprofile"><span class="icon"><i class="fas fa-user fa-lg" aria-hidden="true"></i></span><span class= "title">Profile</span></a></li>
           <li><a href="logoutservlet"><span class="icon"><i class="fas fa-power-off fa-lg" aria-hidden="true"></i></span><span class= "title">Log out</span></a></li>
           </ul>
       </div>
     </div>
     <section>
       <div class="main_container">
       <div class="item">
           <div class="warningClass"><h3 id="a" align="center"><font><strong>Open with a desktop!!!</strong></font></h3></div> 
           <div class="admineventscontainer">
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
     
<h2 id="a" align="center"><font><strong>Events Request</strong></font></h2>
<table class="admineventscontainer_table">
<thead>
	<tr>
		<td><b>Employee_ID</b></td>
		<td><b>Event_ID</b></td>
		<td><b>Submission_Date</b></td>
	</tr>
     </thead>
<tbody>
   <%
	try{	
		connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
		statement=connection.createStatement();
		String sql ="SELECT * FROM temp_events";

		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
	%>
		<tr >

			<td><%=resultSet.getString("employee_id") %></td>
			<td><%=resultSet.getString("event_id") %></td>
                        <td><%=resultSet.getDate("submission_date") %></td>
                        <td><a href="insertadminevents?eid=<%=resultSet.getString("e_user_id") %>"><i class="fas fa-check"></i></a></td>
                        <td><a href="deleteadminevents?eid=<%=resultSet.getString("e_user_id") %>"><i class="fas fa-times"></i></a></td>
                      
              
            </tr>
		            
	<%		
		}
//connection.close();
%>

</tbody>
</table>
<h2 id="a" align="center" style="margin-top:25px;"><font><strong>Accepted Request</strong></font></h2>
<table class="admineventscontainer_table">
<thead>
	<tr>
                <td><b>Select</b></td>
		<td><b>Employee_ID</b></td>
		<td><b>Event_ID</b></td>
		<td><b>Accepted_Date</b></td>
	</tr>
     </thead>
     
     <%
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql2 ="SELECT * FROM accepted_events";

		resultSet = statement.executeQuery(sql2);
		while(resultSet.next()){
%>
<tr>
			<td><input type="checkbox" name="record"></td>
			<td><%=resultSet.getString("employee_id") %></td>
			<td><%=resultSet.getString("event_id") %></td>
                        <td><%=resultSet.getDate("accept_date") %></td>
              
            </tr>
		     
<%
	}	
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</tbody>
</table>
 <script src="jquery.min.js"></script>
<script>
  $(document).ready(function() {
    $(".drawer").click(function(){
      $(".wrapper").toggleClass("collapse");

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
           </div>
       </div>
       </div>
</section>
    </div>
  </body>
  </html>
