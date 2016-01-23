package com.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.genericdao.MatchArg;
import org.genericdao.RollbackException;
import org.mybeans.form.FormBeanException;
import org.mybeans.form.FormBeanFactory;

import com.databean.FundBean;
import com.databean.FundPriceHistoryBean;
import com.form.ResearchFundSearchForm;
import com.form.ViewCustomerAccountSearchForm;
import com.model.FundDAO;
import com.model.FundPriceHistoryDAO;
import com.model.Model;

public class ResearchFundAction extends Action {
	
	private FormBeanFactory<ResearchFundSearchForm> formBeanFactory = FormBeanFactory.getInstance(ResearchFundSearchForm.class);
	FundDAO fundDAO;
	FundPriceHistoryDAO fundPriceHistoryDAO;
	
	public ResearchFundAction(Model model) {
		fundDAO = model.getFundDAO();
		fundPriceHistoryDAO = model.getFundPriceHistoryDAO();
	}
	@Override
	public String getName() {
		return "ResearchFund.do";
	}

	@Override
	public String perform(HttpServletRequest request) {
		
		List<String> errors = new ArrayList<String>();
		request.setAttribute("error", errors);
		
		try{
			//get the form variable username from jsp request
			ResearchFundSearchForm form = formBeanFactory.create(request);
	        request.setAttribute("form",form);
			
			String fundId = request.getParameter("fundId");
			if(fundId == null){
				FundBean[] fundList;
				
				//check search or the whole list
				System.out.println(form.getAction());
				if(form.getAction() != null && form.getAction().equals("SearchFundName")) {
					System.out.println("ee");
					//check if any validation error
			        errors.addAll(form.getValidationErrors());
			        if(errors.size()>0) {
			        	 System.out.println("err");
			        	return "ResearchFund.jsp";
			        }
					
					fundList = fundDAO.getFundListBySearch(form.getFundname());
					request.setAttribute("fundList",fundList);
					
					//check if any user exists after search, add error if none
					if(fundList.length==0) {
						errors.add("No fund with name "+ form.getFundname() + " exists");
					}
					
				}
				else {
					fundList = fundDAO.match();
					request.setAttribute("fundList",fundList);
//					return "ResearchFund.jsp";
				}
				
				System.out.println("error"+errors.size());
				return "ResearchFund.jsp";	
			}
			
			int fundid = Integer.parseInt(fundId);
			
			FundPriceHistoryBean[] fundHistory = fundPriceHistoryDAO.match(MatchArg.equals("fundid", fundid));
			if(fundHistory.length == 0){
				errors.add("Cannot find the fund");
				return "ResearchFund.jsp";
			}
			FundBean fund = fundDAO.read(fundid);
			request.setAttribute("fundName", fund.getFundName());
			request.setAttribute("fundHistory", fundHistory);
			return "ResearchFund.jsp";
		}catch(RollbackException e){
			errors.add("Exception");
			return "ResearchFund.jsp";
		} catch (FormBeanException e) {
			// TODO Auto-generated catch block
			errors.add(e.getMessage());
			return "ResearchFund.jsp";
		}
	}
	
}
