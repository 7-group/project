<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*,java.util.Properties" %>
<%@ page import="java.io.*,java.util.*,java.net.*" %>
<%
	String loginOut = request.getParameter("logoff");
	if(session.getAttribute("username") == null){
	response.sendRedirect("index.jsp");
	}
	
 	if(request.getParameter("logoff") != null){
 		session.setAttribute("username", null);
 		//session.invalidate();
		response.sendRedirect("index.jsp");
		}

try
{
   // BBDD Connection
   Class.forName("com.mysql.jdbc.Driver");
   Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/java", "root", "ezaldivar");
   if (!conexion.isClosed())
   {
      // Query 1 Basic Information
      String username = (String)session.getAttribute("username");
      PreparedStatement st = conexion.prepareStatement("SELECT * FROM basic_information WHERE user=?");
      st.setString(1, username);
      ResultSet rs = st.executeQuery();
      
      // results, name, last_name, profession, address, email, phone, photo_profile
      if(rs.next()){
  		//out.println(rs.getString("name")+" "+rs.getString("last_name"));
  		String fullName = rs.getString("name")+" "+rs.getString("last_name");
  		String profession = rs.getString("profession");
  		String address = rs.getString("address");
  		String email = rs.getString("email");
  		String telephone = rs.getString("telephone_number");
  		String img = rs.getString("img");
  		
  		//sessions about basic_information
  		session.setAttribute("fullName", fullName);
  		session.setAttribute("profession", profession);
  		session.setAttribute("address", address);
  		session.setAttribute("email", email);
  		session.setAttribute("telephone", telephone);
  		session.setAttribute("img", img);
  		} 

      // Query 2 loginID, it will be used as a reference in skills and languages queries.
      PreparedStatement st2 = conexion.prepareStatement("SELECT login_id FROM login WHERE user=?");
      st2.setString(1, username);
      ResultSet rs2 = st2.executeQuery();
      
      // results
      if(rs2.next()){
  		String loginID = rs2.getString("login_id");
  		session.setAttribute("login_id", loginID);
  		}
      
   // Query 3 skills
   	  String loginID = rs2.getString("login_id");
      PreparedStatement st3 = conexion.prepareStatement("SELECT login_id, skill, percentage FROM skills s INNER JOIN relation_skill_percentage r ON r.s_id = s.s_id WHERE login_id=?");
      st3.setString(1, loginID);
      ResultSet rs3 = st3.executeQuery();
      
      // results
      while(rs3.next()){
    	String skillPercentage = rs3.getString("percentage");
  		session.setAttribute("percentage", skillPercentage);
  		}
      // close connection
      conexion.close(); 
      
   }
   else
      // error connection
      out.println("fail");
}
catch (Exception e)
{
   // Other Errors.
   out.println("Excepcion "+e);
   e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<title>CV</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif}
</style>
<body class="w3-light-grey">
<!-- Page Container -->
<div class="w3-content w3-margin-top" style="max-width:1400px;">

  <!-- The Grid -->
  <div class="w3-row-padding">
  
    <!-- Left Column -->
    <div class="w3-third">
      <div class="w3-white w3-text-grey w3-card-4">
        <div class="w3-display-container">
          <img src="<%=session.getAttribute("img") %>" style="width:100%" alt="Avatar">
          <div class="w3-display-bottomleft w3-container w3-text-white">
            <h2><%=session.getAttribute("fullName") %></h2>
          </div>
        </div>
        <div class="w3-container">
          <p><i class="fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal"></i><%=session.getAttribute("profession") %></p>
          <p><i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"></i><%=session.getAttribute("address") %></p>
          <p><i class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"></i><%=session.getAttribute("email") %></p>
          <p><i class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i>+34 <%=session.getAttribute("telephone") %></p>
          <hr>

          <p class="w3-large"><b><i class="fa fa-asterisk fa-fw w3-margin-right w3-text-teal"></i>Skills</b></p>
          <p>Adobe Photoshop</p>
          <div class="w3-light-grey w3-round-xlarge w3-small">
            <div class="w3-container w3-center w3-round-xlarge w3-teal" style="width:75%">75%</div>
          </div>
          <p>JavaScript</p>
          <div class="w3-light-grey w3-round-xlarge w3-small">
            <div class="w3-container w3-center w3-round-xlarge w3-teal" style="width:80%">
              <div class="w3-center w3-text-white">80%</div>
            </div>
          </div>
          <p>Linux</p>
          <div class="w3-light-grey w3-round-xlarge w3-small">
            <div class="w3-container w3-center w3-round-xlarge w3-teal" style="width:90%">90%</div>
          </div>
          <p>PHP</p>
          <div class="w3-light-grey w3-round-xlarge w3-small">
            <div class="w3-container w3-center w3-round-xlarge w3-teal" style="width:60%">60%</div>
          </div>
          <br>

          <p class="w3-large w3-text-theme"><b><i class="fa fa-globe fa-fw w3-margin-right w3-text-teal"></i>Languages</b></p>
          <p>English</p>
          <div class="w3-light-grey w3-round-xlarge">
            <div class="w3-round-xlarge w3-teal" style="height:24px;width:60%"></div>
          </div>
          <p>Spanish</p>
          <div class="w3-light-grey w3-round-xlarge">
            <div class="w3-round-xlarge w3-teal" style="height:24px;width:100%"></div>
          </div>
          <p>Catala</p>
          <div class="w3-light-grey w3-round-xlarge">
            <div class="w3-round-xlarge w3-teal" style="height:24px;width:75%"></div>
          </div>
          <br>
        </div>
      </div><br>

    <!-- End Left Column -->
    </div>

    <!-- Right Column -->
    <div class="w3-twothird">
    
      <div class="w3-container w3-card-2 w3-white w3-margin-bottom">
        <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-suitcase fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Work Experience <span style="float:right"><a href="userCV.jsp?logoff">Log out</a></span></h2>
        <div class="w3-container">
          <h5 class="w3-opacity"><b>Front End Developer / w3schools.com</b></h5>
          <h6 class="w3-text-teal"><i class="fa fa-calendar fa-fw w3-margin-right"></i>Jan 2015 - <span class="w3-tag w3-teal w3-round">Current</span></h6>
          <p>Lorem ipsum dolor sit amet. Praesentium magnam consectetur vel in deserunt aspernatur est reprehenderit sunt hic. Nulla tempora soluta ea et odio, unde doloremque repellendus iure, iste.</p>
          <hr>
        </div>
        <div class="w3-container">
          <h5 class="w3-opacity"><b>Web Developer / something.com</b></h5>
          <h6 class="w3-text-teal"><i class="fa fa-calendar fa-fw w3-margin-right"></i>Mar 2012 - Dec 2014</h6>
          <p>Consectetur adipisicing elit. Praesentium magnam consectetur vel in deserunt aspernatur est reprehenderit sunt hic. Nulla tempora soluta ea et odio, unde doloremque repellendus iure, iste.</p>
          <hr>
        </div>
        <div class="w3-container">
          <h5 class="w3-opacity"><b>Graphic Designer / designsomething.com</b></h5>
          <h6 class="w3-text-teal"><i class="fa fa-calendar fa-fw w3-margin-right"></i>Jun 2010 - Mar 2012</h6>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. </p><br>
        </div>
      </div>

      <div class="w3-container w3-card-2 w3-white">
        <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Education</h2>
        <div class="w3-container">
          <h5 class="w3-opacity"><b>W3Schools.com</b></h5>
          <h6 class="w3-text-teal"><i class="fa fa-calendar fa-fw w3-margin-right"></i>Forever</h6>
          <p>Web Development! All I need to know in one place</p>
          <hr>
        </div>
        <div class="w3-container">
          <h5 class="w3-opacity"><b>London Business School</b></h5>
          <h6 class="w3-text-teal"><i class="fa fa-calendar fa-fw w3-margin-right"></i>2013 - 2015</h6>
          <p>Master Degree</p>
          <hr>
        </div>
        <div class="w3-container">
          <h5 class="w3-opacity"><b>School of Coding</b></h5>
          <h6 class="w3-text-teal"><i class="fa fa-calendar fa-fw w3-margin-right"></i>2010 - 2013</h6>
          <p>Bachelor Degree</p><br>
        </div>
      </div>

    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  
  <!-- End Page Container -->
</div>

<footer class="w3-container w3-teal w3-center w3-margin-top">
  <p>Find me on social media.</p>
  <i class="fa fa-facebook-official w3-hover-opacity"></i>
  <i class="fa fa-instagram w3-hover-opacity"></i>
  <i class="fa fa-snapchat w3-hover-opacity"></i>
  <i class="fa fa-pinterest-p w3-hover-opacity"></i>
  <i class="fa fa-twitter w3-hover-opacity"></i>
  <i class="fa fa-linkedin w3-hover-opacity"></i>
  <p>CV Manager by <a href="" target="_blank">7-group</a></p>
</footer>

</body>
</html>
    