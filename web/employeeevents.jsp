<%-- 
    Document   : employeeevents.jsp
    Created on : 11-Jun-2020, 11:52:46 PM
    Author     : Ral
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="eventsstyle.css">
   <link rel="stylesheet" href="employeeeventsbodystyle.css">
   <link rel="stylesheet" href="events.css">
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
         <ul>
           <li><a href="contactus.jsp"><i class="fas fa-phone"></i></a></li>
           <li><a href="faq.jsp"><i class="fas fa-question"></i></a></li>
          </ul>
       </div>
       <div class="side_bar">
         <ul>
           <li><p><span style="font-family:pacifico;">Hi,  </span><span id="usertitle"><%  String name=(String)session.getAttribute("name"); out.print(name);  %></span></p></li>
           <li><a href="SessionVerify" ><span class="icon"><i class="fas fa-home fa-lg" aria-hidden="true"></i></span><span class= "title">Home</span></a></li>
           <li><a href="employeeevents" class="active"><span class="icon"><i class="fas fa-gamepad fa-lg" aria-hidden="true"></i></span><span class= "title">Events</span></a></li>
           <li><a href="Reminder"><span class="icon"><i class="fas fa-bell fa-lg" aria-hidden="true"></i></span><span class= "title">Reminder</span></a></li>
           <li><a href="employeeprofile" ><span class="icon"><i class="fas fa-user fa-lg" aria-hidden="true"></i></span><span class= "title">Profile</span></a></li>
           <li><a href="logoutservlet"><span class="icon"><i class="fas fa-power-off fa-lg" aria-hidden="true"></i></span><span class= "title">Log out</span></a></li>
           </ul>
       </div>
     </div>
     <section>
       <div class="main_container">
         <div class="eventscontainer">
           <h1>Upcoming</h1>
           <h2>Events</h2>
         <div class="eventsbodycontainer">
           <div class= "eventsformcont">
           <form action="employeeeventssubmit" method="POST" name="employeeevents" id="BPEEevent">
             <h4>Enter your Employeeid to confirm <span id="eventnumber"></span></h4>
             <div class="formeventsgroup">
             <div class="formgroup"><input class="formeventseeid" type="text" name="formeventseeid" id="formeventseeid" value=""></div>
             <div class="formgroup"><input class="formeventseeeventno" type="text" name="formeventseeeventno" id="formeventseeeventno" value="" style="display:none;"></div>
             <div class="formgroup"><button class="confirmButton" type="button" onclick="" id="confirmevent" >Confirm</button></div>
             <div class="formgroup"><button class="cancelButton" type="button" onclick="" id="cancelevent">Cancel</button></div>
             <div class="formgroup"><label id ="errorlogineeid"></label></div>
           </div>
           </form>
           </div>
           <div class="eventitemcont" id="eventitemcont1">
             <div class="eventitemcont1_trans">
             <h3>Heading</h3>
             <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
               Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
               Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
               Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
               <a href="#" class="applyButton" id="applyButton1"><button >Apply Now</button></a>
             </div>
           </div>

             <div class="eventitemcont" id="eventitemcont2">
               <div class="eventitemcont2_trans">
               <h3>Heading</h3>
               <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                 Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                 Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                 Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                 <a href="#" class="applyButton" id="applyButton2"><button >Apply Now</button></a>
               </div>
             </div>

               <div class="eventitemcont" id="eventitemcont3">
                 <div class="eventitemcont3_trans">
                 <h3>Heading</h3>
                 <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                   Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                   Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                   Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                  <a href="#" class="applyButton" id="applyButton3"><button >Apply Now</button></a>
                 </div>
               </div>
           </div>
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

     $(".applyButton").click(function(){
       var id = $(this).attr('id');

       if(id === "applyButton1"){
         document.getElementById("eventnumber").innerHTML = "Event 1";
         document.getElementById("formeventseeeventno").value = "1";
         $(".eventitemcont").toggleClass("hideapplyeventitemcont");
         $(".eventsformcont").toggleClass("showeventsformcont");
       }

       else if(id === "applyButton2"){
        document.getElementById("eventnumber").innerHTML = "Event 2";
        document.getElementById("formeventseeeventno").value = "2";
         $(".eventitemcont").toggleClass("hideapplyeventitemcont");
         $(".eventsformcont").toggleClass("showeventsformcont");
       }

       else{
         document.getElementById("eventnumber").innerHTML = "Event 3";
         document.getElementById("formeventseeeventno").value = "3";
          $(".eventitemcont").toggleClass("hideapplyeventitemcont");
          $(".eventsformcont").toggleClass("showeventsformcont");
       }

     });

     $(".cancelButton").click(function(){
	 document.getElementById("errorlogineeid").innerHTML = "";
       $(".eventitemcont").toggleClass("hideapplyeventitemcont");
       $(".eventsformcont").toggleClass("showeventsformcont");

     });
     
     
       $(".confirmButton").click(function(){
     
     var eventsid = document.getElementById("formeventseeid").value;
     var realid = localStorage.getItem("name");
     
      if(eventsid === ""){
          document.getElementById("errorlogineeid").innerHTML = "Empty Employee iD";
          
      }else if(eventsid !== realid){
          document.getElementById("errorlogineeid").innerHTML = "Wrong Employee ID"; 
          
        }else{
          document.getElementById("errorlogineeid").innerHTML = ""; 
          document.getElementById('BPEEevent').submit(); 
        }
	 

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
      function validateEvent(){
        var eventseeid = document.getElementById("formeventseeid").value;
          document.getElementById('usertitle').innerHTML = localStorage.getItem("name");
        
      if(eventseeid === ""){
        document.getElementById("errorlogineeid").innerHTML = "Empty Email or Employee ID";
        document.getElementById("errorlogineeid").style.color = "red";
    }
    
        
     else{
         document.getElementById('EEvents').submit();
     }   
    }
	   
     });
 </script>
  </body>
  </html>
