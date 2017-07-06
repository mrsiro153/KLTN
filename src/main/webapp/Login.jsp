<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="style.css">
		<meta charset="UTF-8">
		<title>Login Page</title>
		<script src="javascript.js"></script>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<!---->
		<link href="https://fonts.googleapis.com/css?family=Merriweather" rel="stylesheet">
	</head>
	<body class="background_main">
		<div class="row" style="margin-top:60px">
			<div class="col-md-2"></div>
			<div class="login col-md-8">
				<img src="hinhanh/logo.png" class="col-md-4">
				<div>
					<h1 class="cl1">QUIZ ONLINE</h1><br>
					<p style="font-family: 'Merriweather', serif;">Ho Chi Minh Technical and Education</p>
					<form class="form-horizontal cl1 col-md-8" action="login" method="post">
						<div class="col-md-0">
							<input type="radio" name="kind" value="1">Admin &nbsp;
							<input type="radio" name="kind" value="2"> Student
							&nbsp;
							<input type="radio" name="kind" value="3"> Lecture
							&nbsp;
							<input type="radio" name="kind" value="4"> Exam Manager
							&nbsp;
							<input type="radio" name="kind" value="5"> Quizz bank Manager
						</div>
						<br>
						<!--MSSV-->
						<div class="form-group">
							<label class="control-label col-md-3" for="StudentID">User ID</label>
							<div class="col-md-6">
								<input class="form-control" name="user" placeholder="Your ID" required>
							</div>
						</div>
						<!--password-->
						<div class="form-group">
							<label class="control-label col-md-3">Password:</label>
							<div class="col-md-6">
								<input type="password" name="pass" class="form-control" placeholder="Enter Password" required>
							</div>
						</div>
						<p style="margin-left:10px;color:red">${error}</p>
						<!--submit-->
						<div class="form-group">
							<div class="col-md-8 ">
								<div class="col-md-5"></div>
								<button type="submit" class="btn btn-primary btn-lg">LOG IN</button>
							</div>
						</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					</form>
					<div class="col-md-5 col-md-offset-10">
						<button class="btn btn-primary btn-xs forget">Forget password?
						</button>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>