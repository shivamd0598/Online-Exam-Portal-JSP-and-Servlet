<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="stylesheet" media="screen" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" media="screen" href="CSS/home.css">


	<title>Modify Details</title>

	<!--  -->

	<style>

	</style>

</head>

<body>

	<div class="container">
	
	
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="admin-panel.jsp" style="background-color: gray; color: hotpink;"><strong>ONLINE EXAM PORTAL</strong></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item ">
        <a class="nav-link" href="admin-panel.jsp">Home </a>
      </li>
       <li class="nav-item ">
        <a class="nav-link" href="student-registeration.jsp">Student Registeration </a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="view-all-student.jsp">View Students</a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="delete-student.jsp">Delete Students </a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="add-question.jsp">Add Questions</a>
      </li>
          <li class="nav-item">
        <a class="nav-link" href="delete-question.jsp">Delete Questions</a>
      </li>
            <li class="nav-item active">
        <a class="nav-link" href="modify-details.jsp">Modify Student Details<span class="sr-only">(current)</span></a>
        </li>
  
             <li class="nav-item">
        <a class="nav-link" href="add-course.jsp">Add Course</a>
        </li>
          <li class="nav-item ">
        <a class="nav-link" href="delete-course.jsp">Delete Course</a>
        </li>
      
      <form action="AdminLogoutServlet" method="post">
          
           <button type="submit" id="lgtbtn" >Logout</button>
      </form>
   
      </ul>
  </div>
</nav>

	

<div class="bd-example">
  <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
      <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="images/chalk-chalkboard-exam-459793.jpg" class="d-block w-100" alt="..."style=" width:100%; height: 500px !important;">
        <div class="carousel-caption d-none d-md-block">
        <strong>  <h5 style="background-color:darkgray; color:greenyellow;">"Do It Once, Do It Right. Get It Over With!" - Nan, CPA Forum member</h5></strong>
         
        </div>
      </div>
      <div class="carousel-item">
        <img src="images/homework-1735644_1920.png" class="d-block w-100" alt="..."style=" width:100%; height: 500px !important;">
        <div class="carousel-caption d-none d-md-block">
      <strong>      <h5 style="background-color:darkgray; color:greenyellow;;">"To be a good professional engineer, always start to study late for exams. Because it teaches you how to manage time and tackle emergencies." - Bill Gates</h5></strong>
        
        </div>
      </div>
      <div class="carousel-item">
        <img src="images/feedback-3239454_1920.jpg" class="d-block w-100" alt="..."style=" width:100%; height: 500px !important;">
        <div class="carousel-caption d-none d-md-block">
        <strong>    <h5 style="background-color:darkgray;color:greenyellow;"> "There are no secrets to success. It is the result of preparation, hard work learning from failure." - General Colin Powell</h5></strong>
          
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<br>
     
     <div class="container">
         
         
          <strong><center><h1 style="color: red; background-color: gray;">MODIFY STUDENT DETAILS</h1></center></strong>
         
         
         
    
         
        <form action="modify-details.jsp" method="post">
        
        
        
           
         <div class="container ">
  <div class="row">
    <div class="col-sm">
                          
                          
                          
      </div>
      
      <div class="col-sm">
          
          
          <button type="submit" class="btn btn-primary" name="submit-btn">GET RECORDS</button>
      </div>
      
      <div class="col-sm">
          
          
      </div>
      
      </div>
      </div>
</form>
<br>

      <%
    if(request.getAttribute("msg")!=null)
    {
        //out.println(request.getAttribute("msg"));
        String errmsg=request.getAttribute("msg").toString();
        out.println("<h2 style='color:red';>"+errmsg+"</h2>");
        
    }%>

<br>

  <table class="table table-dark">
  <thead>
    <tr id="tr">
      <th scope="col">Sno.</th>
      <th scope="col">First Name</th>
      <th scope="col">Last Name</th>
      <th scope="col">Gender</th>
      <th scope="col">Mobile No.</th>
      <th scope="col">Delete</th>
    </tr>
  </thead>
        <%
        if(request.getParameter("submit-btn")!=null)
        {
        int i=0;
        Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/examportal","root","root");
        PreparedStatement ps= con.prepareStatement("select * from students");
        ResultSet res=ps.executeQuery();
        
        while(res.next())
        {
        i++;
        %>
       
        
   
  <tbody>
  
    <tr id="tr">
      <th scope="row"><%=i %></th>
      <td> <%=res.getString("first_name")   %>  </td>
      <td> <%=res.getString("last_name")   %></td>
      <td> <%=res.getString("gender")   %></td>
      <td> <%=res.getString("mobile_no")   %></td>
      <td>
      <form action="modify-details1.jsp">
     <button type="submit" class="btn btn-primary" id="delete-btn" name="mod-btn" value=<%=res.getString("sno") %> style="font-size:18px;" >MODIFY DETAILS</button>
     </form>
     
      </td>
      
    </tr>
    
   <% 
   
   } 
        if(i==0)
        {
        	out.println("<h2 style='color:red';>NO RECORDS FOUND!!!</h2>");	
        }
        }
   %>
   
  </tbody>
</table>


    <center>
         <table>
         <tr>
         <form action="admin-panel.jsp" method="post">
     <center> <td><button type="submit" class="btn btn-primary" name="fintest"  style="font-size:18px;">Go Back</button>
           </center>
           </td>
          
          
    
         </tr>
         
         
         </table>
         
         
         </center>
      







     </div>
     
             
        
     
     
     
     
     <br>
     <br>
     <br>
      <hr style="height:1px;border:none;color:#333;background-color:#333;" />
     <footer>
         <p><Strong>All Rights Reserved &copy; 2019. <br> Created By @Shivam Dhar</Strong></p>
         
     </footer>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

	<script>
	</script>

</body>

</html>

      