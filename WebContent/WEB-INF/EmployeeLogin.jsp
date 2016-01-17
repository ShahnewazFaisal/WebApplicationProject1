<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>CFS for Employee</title>
		<link href="css/bootstrap.min.css" rel="stylesheet">
	</head>
	<body>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="page-header">
  					<h1>Carnegie Financial Services <small>Mutual Fund</small></h1>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
  			<div class="col-md-2">
  
			<ul class="nav nav-pills nav-stacked">
  				<li role="presentation" class="active"><a href="login.html">Login</a></li>
 				<li role="presentation"><a href="changepwd.html">Change Password</a></li>
  				<li role="presentation"><a href="create_employee_acnt.html">Create Employee Account</a></li>
  				<li role="presentation"><a href="create_customer_acnt.html">Create Customer Account</a></li>
  				<li role="presentation"><a href="reset_customer_pwd.html">Reset Customer Password</a></li>
  				<li role="presentation"><a href="#">View Customer Account</a></li>
  				<li role="presentation"><a href="#">View Customer Transaction History</a></li>
  				<li role="presentation"><a href="#">Deposit Check</a></li>
  				<li role="presentation"><a href="#">Create Fund</a></li>
  				<li role="presentation"><a href="#">Transition Day</a></li>
  				<li role="presentation"><a href="#">Log Out</a></li>
  			</div>
			</ul>
			<div class="col-md-1"></div>
			<div class="col-md-5">
				<br>
				<br>
				
					<div class="header"><h3>Employee Login</div>
				<br>
				<br>
				
				
				<form class="form-horizontal">
  					<div class="form-group">
    					<label for="username" class="col-sm-2 control-label">User Name</label>
    					<div class="col-sm-10">
      						<input type="text" class="form-control" id="username" placeholder="User Name">
    					</div>
  					</div>
  					<div class="form-group">
    					<label for="inputPassword" class="col-sm-2 control-label">Password</label>
   						 <div class="col-sm-10">
      						<input type="password" class="form-control" id="inputPassword" placeholder="Password">
   						</div>
  					</div>
  					<div class="form-group">
    					<div class="col-sm-offset-2 col-sm-10">
      						<div class="checkbox">
        					<label>
          						<input type="checkbox"> Remember me
        					</label>
      						</div>
    					</div>
  					</div>
  					<div class="form-group">
    					<div class="col-sm-offset-2 col-sm-10">
      						<button type="submit" class="btn btn-primary">Sign in</button>
    					</div>
  					</div>
				</form>
			</div>
			<div class="col-md-2"></div>
			<div class="col-md-1"></div>
		</div>
		<script src="js/jquery.js"></script>
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>