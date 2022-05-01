<%-- 
    Document   : adminhome
    Created on : 12-Jun-2020, 8:59:50 AM
    Author     : Ral
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="homestyle.css">
   <link rel="stylesheet" href="homebodystyle.css">
   <link rel="stylesheet" href="admintopstyle.css">
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
           <li><a href="AdminVerify" class="active"><span class="icon"><i class="fas fa-home fa-lg" aria-hidden="true"></i></span><span class= "title">Home</span></a></li>
           <li><a href="adminevents"><span class="icon"><i class="fas fa-gamepad fa-lg" aria-hidden="true"></i></span><span class= "title">Events</span></a></li>
           <li><a href="adminreminder"><span class="icon"><i class="fas fa-bell fa-lg" aria-hidden="true"></i></span><span class= "title">Reminder</span></a></li>
           <li><a href="adminprofile"><span class="icon"><i class="fas fa-user fa-lg" aria-hidden="true"></i></span><span class= "title">Profile</span></a></li>
           <li><a href="logoutservlet"><span class="icon"><i class="fas fa-power-off fa-lg" aria-hidden="true"></i></span><span class= "title">Log out</span></a></li>
           </ul>
       </div>
     </div>
     <section>
     <div class="main_container">
       <div class="item">
         <div class ="homeeventscontainer">
           <a href="events.html">
         <div class="homeeventscon1">
           <h2 class="homeeventstops">Heading</h2>
           <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
             Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
             Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
             Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
             </div>
             </a>

          <a href="#">
         <div class="homeeventscon2">
           <h2 class="homeeventstops">Heading</h2>
           <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
             Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
             Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
             Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
              </div>
             </a>

        <a href="#">
         <div class="homeeventscon3">
           <h2 class="homeeventstops">Heading</h2>
           <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
              Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
              Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
              Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
              </div>
            </a>

       </div>

       <div class="winners">
         <header><h1>Last Winners</h1></header>
         <div class="winners_table">
         <div class="winners_row"><div class="winners_column_1"><h2 class="winner_rating">1</h2></div>
           <div class="winners_column_2"><p>Aaaaaaaa</p></div>
         </div>
         <div class="winners_row"><div class="winners_column_1"><h2>2</h2></div>
           <div class="winners_column_2"><p>Bbbbbbbb</p></div>
         </div>
         <div class="winners_row"><div class="winners_column_1"><h2>3</h2></div>
           <div class="winners_column_2"><p>Ccccccccc</p></div>
         </div>
         <div class="winners_row"><div class="winners_column_1"><h2>4</h2></div>
           <div class="winners_column_2"><p>Ddddddddddd</p></div>
         </div>
         <div class="winners_row"><div class="winners_column_1"><h2>5</h2></div>
           <div class="winners_column_2"><p>Eeeeeeee</p></div>
         </div>
         <div class="winners_row"><div class="winners_column_1"><h2>6</h2></div>
           <div class="winners_column_2"><p>Ffffffff</p></div>
         </div>
         <div class="winners_row"><div class="winners_column_1"><h2>7</h2></div>
           <div class="winners_column_2"><p>Gggggggg</p></div>
         </div>
         <div class="winners_row"><div class="winners_column_1"><h2>8</h2></div>
           <div class="winners_column_2"><p>Hhhhhhh</p></div>
         </div>
         <div class="winners_row"><div class="winners_column_1"><h2>9</h2></div>
           <div class="winners_column_2"><p>Iiiiiiii</p></div>
         </div>
         <div class="winners_row"><div class="winners_column_1"><h2>10</h2></div>
           <div class="winners_column_2"><p>Jjjjjjjj</p></div>
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
});
</script>
<div class="loader-wrapper">
  <h3>BluePumpkin</h3>
  <span class="loader"><span class="loader-inner"></span></span>
</div>
<script>
    $(window).on("load",function(){
      $(".loader-wrapper").fadeOut("slow");
      
      
     var name = document.getElementById('usertitle').innerHTML;
     localStorage.setItem("name",name);
     document.getElementById('usertitle').innerHTML = localStorage.getItem("name");
    });
</script>
    </div>
  </body>
  </html>

