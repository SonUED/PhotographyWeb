<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	
	<meta charset="utf-8">
	<title>Admin Page</title>
 	<style>
	     <%@ include file="css/font-awesome.min.css"%>
	      <%@ include file="css/normalize.css"%>
	       <%@ include file="css/milligram.min.css"%>
	        <%@ include file="css/styles.css"%>
		</style>
	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700" rel="stylesheet">
	 <link href="https://fonts.googleapis.com/css?family=Modak|Quicksand:300,400,500,700" rel="stylesheet">
	<link  href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" rel="stylesheet">
	<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
</head>

<body>
	<div class="navbar">
		<div class="row">
			<div class="column column-30 col-site-title"><a href="#" class="site-title float-left">SonBK Service</a></div>
			<div class="column column-40 col-search"><a href="#" class="search-btn fa fa-search"></a>
				<input type="text" name="" value="" placeholder="Search..." />
			</div>
			<div class="column column-30">
				<div class="user-section"><a href="#">
					<img src="https://scontent.fdad3-3.fna.fbcdn.net/v/t1.0-9/57578692_2312616922395370_4539371323352154112_o.jpg?_nc_cat=111&_nc_eui2=AeFqbGhY99qkIwetEViLcekk58BtRNAHKu6TKkUdIxiofqpIqz6SGQiilzA5udwiDHu8W9W5EmqkLOPYFEE5F7mqW7usgnW1qsDNAy3cI-_5vg&_nc_oc=AQlfpbmcUlgyjon0wucCycP3wMBPSbi_qKhg0OGpCHlN4vUon0LNrBrsPQ9pWQkH8HtHqB5ulvKMlKekgNCz8DZG&_nc_ht=scontent.fdad3-3.fna&oh=a53af5cdb064ba893a58838b91f9cd5e&oe=5D6F03F2" placeholder.com/50x50" alt="profile photo" class="circle float-left profile-photo" width="50" height="auto">
				
				
					<div class="username">
						<h4>SonBK</h4>
						<p>Administrator</p>
					</div>
				</a></div>
			</div>
		</div>
	</div>
	<div class="row">
		<div id="sidebar" class="column">
			<h5>Navigation</h5>
			<ul>
				<li><a href="#"><em class="fa fa-home"></em> Home</a></li>
				<li><a href="#charts"><em class="fa fa-campground"></em>Photograh Outdoor</a></li>
				<li><a href="#"><em class="fab fa-stumbleupon-circle"></em>&nbsp Photograph Indoor</a></li>
				<li><a href="#"><em class="fa fa-baby"></em>Photograph Baby</a></li>
				<li><a href="#"><em class="fa fa-heart"></em>Photograph Couple</a></li>
				<li><a href="#"><em class="fa fa-video"></em>Record Pre-Wedding video</a></li>
				<li><a href="#"><em class="fa fa-palette"></em>Design</a></li>
				<li><a href="#tables"><em class="fa fa-user-friends"></em>Member</a></li>
			</ul>
		</div>
		<section id="main-content" class="column column-offset-20">
			<div class="row grid-responsive">
				<div class="column page-heading">
					<div class="large-card">
								<h1>Hello, <c:out value="${decent}"/> !</h1>	
						<p class="text-large">I am Siri - your virtual assistant, below is your database</p>
						<div class="count">
							<div class="countUser">
							<i class="fas fa-user-shield"></i>
								<a><c:out value="${countUser}"></c:out></a>	
							<div class="num-user">
							</div>
							
						</div>
						<div class="countUser2">
							<i class="fab fa-servicestack"></i>
							<a><c:out value="${countSer}"></c:out>
							</a>
							<div class="num-ser">
							</div>	
						</div>
						<div class="countUser3">
							<i class="far fa-images"></i>
							<a><c:out value="${countImg}"></c:out>
							</a>
							<div class="num-img">
							</div>	
						</div>
						</div>
					</div>
				</div>
			</div>
			
			<!--Charts-->
			<h5>List Image Photograph Outdoor</h5><a class="anchor" name="charts"></a>
			<a href="insert_img.jsp"><button type ="button">Add Image</button></a>
			<a href="PhotoForm.jsp"><button type ="button">Add Service</button></a>
			<table border="1" cellpadding="5">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Description</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="photo" items="${listPhoto}">
                <tr>
                    <td><c:out value="${photo.id}" /></td>
                    <td><c:out value="${photo.name}" /></td>
                    <td><c:out value="${photo.price}" /></td>
                    <td><c:out value="${photo.des}" /></td>
                  
                    <td>
                        <a href="/LoginWithDatabase/edit?id=<c:out value="${photo.id}"/>">Edit</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="/LoginWithDatabase/delete?id=<c:out value="${photo.id}"/>">Delete</a>                     
                    </td>
                </tr>
            </c:forEach>
        </table>
			<div class="row grid-responsive" id="list-img">
			 <form method="post">
					<div class="list-img-content">
					 <c:forEach var="image" items="${listImage}">
					  		<div class="img">
					  			<a><c:out value="${image.id}"/></a>
						  		<img src="data:image/jpg;base64,${image.base64Image}"/>

						  		<a href="/LoginWithDatabase/delete_img?id=<c:out value="${image.id}"/>"><button type ="button">Delete</button></a>
						  		<a href="/edit_img"><button type ="button">Edit</button></a>
			  				</div>		  		
			  				
					  </c:forEach>
					 
					</div>
					</form>
			</div>
			
			<!--Widgets-->
			<h5 class="mt-2">Widgets</h5><a class="anchor" name="widgets"></a>
			<div class="row grid-responsive mt-1">
				<div class="column">
					<div class="card">
						<div class="card-title">
							<h2 class="float-left">Notifications</h2>
							<div class="badge background-primary float-right">36</div>
							<div class="clearfix"></div>
						</div>
						<div class="card-block">
							<div class="mt-1">
								<img src="https://scontent.fdad2-1.fna.fbcdn.net/v/t1.0-9/57059804_460944957980757_7909656504397987840_n.jpg?_nc_cat=108&_nc_oc=AQkwU2LOtG4sOmk0_30CSpA1-_b4v-lpWLm2N7sc-CObKawd-mR7aT3AKkxcLWAxoQE&_nc_ht=scontent.fdad2-1.fna&oh=7b023baab5067fe85d9aac935d4a9f71&oe=5D551E94" alt="profile photo" class="circle float-left profile-photo" width="45" height="auto">
								<div class="float-left ml-1">
									<p class="m-0"><strong>Ba Loc Van</strong> <span class="text-muted">uploaded a new photo</span></p>
									<p class="text-small text-muted">30 minutes ago</p>
								</div>
								<div class="clearfix"></div>
								<hr class="m-0 mb-2" />
							</div>
							<div class="mt-1">
								<img src="https://scontent.fdad1-1.fna.fbcdn.net/v/t1.0-9/33202853_191436254837787_4556881123333898240_n.jpg?_nc_cat=104&_nc_oc=AQnjYguoPHvbbqdvWwtOuHnyab8xhb62-Fjk3Do_zlZsNP8xiaXGIf0pvcOvtj2j7xo&_nc_ht=scontent.fdad1-1.fna&oh=c03e0f762f672e72734702b477d90186&oe=5D5A5578" alt="profile photo" class="circle float-left profile-photo" width="45" height="auto">
								<div class="float-left ml-1">
									<p class="m-0"><strong>Thanh Khang Tran</strong> <span class="text-muted">just replied to your message</span></p>
									<p class="text-small text-muted">12 hours ago</p>
								</div>
								<div class="clearfix"></div>
								<hr class="m-0 mb-2" />
							</div>
							<div class="mt-1">
								<img src="https://scontent.fdad2-1.fna.fbcdn.net/v/t31.0-1/c282.0.960.960a/p960x960/10506738_10150004552801856_220367501106153455_o.jpg?_nc_cat=1&_nc_oc=AQmXIaCS0jW4DILjI9PcDWQAtptFflSdckcPaNGjjbVXDS6UYuZrzZfVMXqt4it3G6Q&_nc_ht=scontent.fdad2-1.fna&oh=79ef0e99ed4ca9493b9563be5514495c&oe=5D68A969" alt="profile photo" class="circle float-left profile-photo" width="45" height="auto">
								<div class="float-left ml-1">
									<p class="m-0"><strong>Van Tien Nguyen</strong> <span class="text-muted">changed his status</span></p>
									<p class="text-small text-muted">2 days ago</p>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="column">
					<div class="card">
						<div class="card-title">
							<h2 class="float-left">Projects</h2>
							<div class="badge float-right">3 In Progress</div>
							<!--<div class="badge background-success float-right mr-1">5 Complete</div>-->
							<div class="clearfix"></div>
						</div>
						<div class="card-block progress-bars">
							<h5 class="float-left mt-1">Sale Management Software (PHP)</h5>
							<p class="float-right text-small text-muted mt-1">25%</p>
							<div class="clearfix"></div>
							<div class="progress-bar">
								<div class="progress background-primary" style="width: 25%;"></div>
							</div>
							
							<h5 class="float-left mt-1">Selling Food to Birds Web</h5>
							<p class="float-right text-small text-muted mt-1">85%</p>
							<div class="clearfix"></div>
							<div class="progress-bar">
								<div class="progress background-primary" style="width: 85%;"></div>
							</div>
							<h5 class="float-left mt-1">SonBK's Service Web</h5>
							<p class="float-right text-small text-muted mt-1">90%</p>
							<div class="clearfix"></div>
							<div class="progress-bar">
								<div class="progress background-primary" style="width: 90%;"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--Forms-->
			<h5 class="mt-2">Contact Form</h5><a class="anchor" name="forms"></a>
			<div class="row grid-responsive">
				<div class="column ">
					<div class="card">
						<div class="card-title">
							<h3>Mail Form</h3>
						</div>
						<div class="card-block">
							<form>
								<fieldset>
									<label for="nameField">Name</label>
									<input type="text" placeholder="Insert Name" id="nameField">
									<label for="ageRangeField">Age Range</label>
									<select id="ageRangeField">
										<option value="0-13">0-13</option>
										<option value="14-17">14-17</option>
										<option value="18-23">18-23</option>
										<option value="24+">24+</option>
									</select>
									<label for="commentField">Comment</label>
									<textarea placeholder="Hi SonBK..." id="commentField"></textarea>
									<div class="float-right">
										<input type="checkbox" id="confirmField">
										<label class="label-inline" for="confirmField">Send a copy to yourself</label>
									</div>
									<input class="button-primary" type="submit" value="Send">
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
			
			<!--Alerts-->
			<h5 class="mt-2">Alerts</h5><a class="anchor" name="alerts"></a>
			<div class="row grid-responsive">
				<div class="column">
					<div class="alert background-success"><em class="fa fa-thumbs-up"></em> Yay! Everything looks good</div>
					<div class="alert background-warning"><em class="fa fa-warning"></em> Are you sure you want to do that?</div>
					<div class="alert background-danger"><em class="fa fa-times-circle"></em> Oops, something went really wrong</div>
					<div class="alert"><em class="fa fa-bullhorn"></em> This is a generic alert without any defined background color</div>
				</div>
			</div>
			
		 	<!--Buttons-->
			<!--Tables-->
			<h5 class="mt-2">Members</h5><a class="anchor" name="tables"></a>
			<div class="row grid-responsive">
				<div class="column ">
					<div class="card">
						<div class="card-title">
							<h3>Current Members</h3>
						</div>
					
						 <div class="card-block">
							<table>
								<thead>
									<tr>
										<th>Name</th>
										<th>Role</th>
										<th>Username</th>
										<th>Location</th>
										<th>Decentralization</th>
									</tr>
								</thead>
								<tbody>
						 <c:forEach var="user" items="${listUser}">
									<tr>
										<td><c:out value="${user.id}" /></td>
										<td><c:out value="${user.name}" /></td>
										<td><c:out value="${user.user}" /></td>
										<td><c:out value="${user.location}" /></td>
										<td><c:out value="${user.decent}" /></td>
									</tr>
										</c:forEach>
								</tbody>
							</table>
							<c:set var="ss" value="1"></c:set>
							<c:if test="${kt == ss}">
								<button>Create New Admin</button>
							</c:if>
							<c:if test="${kt != ss}">
								<button disabled="disabled">Create New Admin</button>
							</c:if>
						
						</div>
					
					</div>
				</div>
			</div>
			
			<!--Grid-->
			<h5 class="mt-2">Grid</h5><a class="anchor" name="grid"></a>
			<div class="grid-example mt-2">
				<div class="row">
					<div class="column column-10">10%</div>
				</div>
				<div class="row">
					<div class="column column-20">20%</div>
				</div>
				<div class="row">
					<div class="column column-25">25%</div>
				</div>
				<div class="row">
					<!-- .column-33 or .column-34 both work for 1/3 column width -->
					<div class="column column-33">33%</div>
				</div>
				<div class="row">
					<div class="column column-40">40%</div>
				</div>
				<div class="row">
					<div class="column column-50">50%</div>
				</div>
				<div class="row">
					<div class="column column-60">60%</div>
				</div>
				<div class="row">
					<!-- .column-66 or .column-67 both work for 2/3 column width -->
					<div class="column column-67">67%</div>
				</div>
				<div class="row">
					<div class="column column-75">75%</div>
				</div>
				<div class="row">
					<div class="column column-80">80%</div>
				</div>
				<div class="row">
					<div class="column column-90">90%</div>
				</div>
				<div class="row">
					<div class="column">100%</div>
				</div>
			</div>
		</section>
	</div>
	<script>
	$('a').click(function(event){
	    $('html, body').animate({
	        scrollTop: $( $.attr(this, 'href') ).offset().top
	    }, 500);
	    event.preventDefault();
	});
	</script>
</body>
</html> 