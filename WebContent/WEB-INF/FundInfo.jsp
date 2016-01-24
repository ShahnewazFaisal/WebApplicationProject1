<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="template-head.jsp" />
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
	  				<li role="presentation" class="active"><a href="ViewAccount.do">Manage Account</a></li>
	  				<li role="presentation"><a href="BuyFund.do">Buy Fund</a></li>
	  				<!-- <li role="presentation"><a href="ViewSelfTransactionHistory.do">Transaction History</a></li> -->
	  				<li role="presentation"><a href="ResearchFund.do">Research Fund</a></li>
	  				<!-- <li role="presentation"><a href="RequestCheck.do">Request Check</a></li> -->
	  				<li role="presentation"><a href="CustomerLogout.do">Log Out</a></li>
	  			</c:otherwise>
  			</c:choose>
  			
  			</ul>
  			</div>
			
			<div class="col-md-6">
				<br>
				<br>
				<br>
				<div class="col-sm-1"></div>
				<div class="col-sm-11">
					<div class="header"><h3>View Fund Information</div>
				</div>
				<br>
				<br>
				<br>
				<br>
				<br>
				
			<table width="100%" class="favoritetable table-bordered table-hover">
			<col width="12.5%">
			<col width="12.5%">
			<col width="12.5%">
			<col width="12.5%">
			<col width="12.5%">
			<col width="12.5%">
			<col width="12.5%">
			<col width="12.5%">
			<tr class="title">
				<td>Fund Ticker</td>
				<td>Fund Name</td>
				<td>Shares</td>
				<td>Position Value</td>
				<td>Shares to Sell</td>
				<td>Operation</td>
			</tr>
			<c:forEach var="fund" items="${fundInfo}">
			<form action="SellFund.do" method="POST">
           		<tr>
        			<td>
        				<span style="text-align:center">
        					<input type="hidden" name="fundid" value=${ fund.fundid }>
        					${ fund.ticker }
        				</span>
                    </td>
                    <td>
        				<span style="text-align:center">
        					${ fund.fundname } 
        				</span>
                    </td>
                    <td>
        				<span style="text-align:center">
        					${ fund.share }
        				</span>
                    </td>
                    <td>
        				<span style="text-align:center">
        					${ fund.amount }
        				</span>
                    </td>
                    <td>
        				<span style="text-align:center">
        					<input type="text" name="shareSell" value="" />
        				</span>
                    </td>
                    <td>
                			<input type="hidden" name="sellFund" value="${ customer.cid }" />
                			<input type="submit" name="button" value="Sell" />
                    </td>
   				</tr>
   				</form>
   			</c:forEach>
			<c:forEach var="error" items="${errors}">   
			   	<div id="errormsg"> ${error} </div>
			</c:forEach>
			</table>
				
			</div>
			<div class="col-md-2"></div>
			<div class="col-md-1"></div>
		</div>
<jsp:include page="template-bottom.jsp" />
