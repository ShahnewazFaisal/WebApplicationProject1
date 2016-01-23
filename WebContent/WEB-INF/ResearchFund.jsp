<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>CFS for Customer</title>
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
			
				<c:choose>
				<c:when test="${customer == null}">  
  					<li role="presentation" class="active"><a href="CustomerLogin.do">Login</a></li>
  				</c:when>
  				<c:otherwise>
	 				<!-- <li role="presentation"><a href="ChangePassword.do">Change Password</a></li> -->
	  				<li role="presentation"><a href="ViewAccount.do">Manage Account</a></li>
	  				<li role="presentation"><a href="BuyFund.do">Buy Fund</a></li>
	  				<li role="presentation"><a href="SellFund.do">Sell Fund</a></li>
	  				<!-- <li role="presentation"><a href="ViewSelfTransactionHistory.do">Transaction History</a></li> -->
	  				<li role="presentation" class="active"><a href="ResearchFund.do">Research Fund</a></li>
	  				<!-- <li role="presentation"><a href="RequestCheck.do">Request Check</a></li> -->
	  				<li role="presentation"><a href="CustomerLogout.do">Log Out</a></li>
	  			</c:otherwise>
  				</c:choose>
  			</ul>
  			</div>
			
			<div class="col-md-5">
				<br>
				<br>
				<div class="col-sm-1"></div>
        <div class="col-sm-11">
					<div class="header"><h3>Research Fund</div>
					
        </div>
				<br>
				<br>
							<form class="navbar-form navbar-left" role="search" action="ResearchFund.do" method="POST">  			
  			<div class="form-group">
   			 <input type="text" class="form-control" placeholder="Search by Fund Name" name = "fundName">
  			</div>
  			<button type="submit" class="btn btn-default">Submit</button>
			</form>
				<br>
        		<br>
        		<br>
        		<br>
  					<div class="list-group">
  					<c:choose>
  					<c:when test="${fundHistory == null}">
  					<c:forEach var="fund" items="${fundList}">
  					<a href="ResearchFund.do?fundId=<c:out value ="${fund.fundid}"/>" class="list-group-item avtive">${fund.fundName }</a>
  					<br>
  					</c:forEach>
  					</c:when>
  					<c:otherwise>
  					<h2>${fundName }</h2>      
					  <table class="table">
					    <thead>
					      <tr>
					        <th>Date</th>
					        <th>Price</th>
					      </tr>
					    </thead>
					    <tbody>
					      <c:forEach var="datePrice" items="${fundHistory}"> 
					      <tr>
					        <td>${datePrice.pricedate }</td>
					        <td>${datePrice.price }</td>
					      </tr>
					      </c:forEach>
					    </tbody>
					  </table>	
  					</c:otherwise>
  					</c:choose>
  					</div>
  					
  					<c:forEach var="error" items="${errors}">   
			   		 	<div id="errormsg"> ${error} </div>
					</c:forEach>
		</div>
		<script src="js/jquery.js"></script>
		<script src="js/bootstrap.min.js"></script>
	</body>
</html>