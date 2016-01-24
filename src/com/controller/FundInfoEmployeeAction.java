package com.controller;

import java.util.*;
import java.math.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.genericdao.DuplicateKeyException;
import org.genericdao.MatchArg;
import org.genericdao.RollbackException;
import org.mybeans.form.FormBeanException;
import org.mybeans.form.FormBeanFactory;
import java.text.*;

import com.databean.*;
import com.form.*;
import com.model.*;

public class FundInfoEmployeeAction extends Action {
	FundDAO fDAO;
	PositionDAO pDAO;
	FundPriceHistoryDAO fphDAO;
	public FundInfoEmployeeAction(Model model) {
		fDAO = model.getFundDAO();
		pDAO = model.getPosDAO();
		fphDAO = model.getFundPriceHistoryDAO();
	}
	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return "FundInfoEmployee.do";
	}

	@Override
	public String perform(HttpServletRequest request) {
		// TODO Auto-generated method stub
		List<String> errors = new ArrayList<String>();
		request.setAttribute("errors", errors);
		List<FundInfoBean> fundInfo = new ArrayList<FundInfoBean>();
		request.setAttribute("fundInfo", fundInfo);
		HttpSession session = request.getSession();
		if (request.getParameter("button") == null) {
			return "ViewCustomerAccount.jsp";
		}
		if (!request.getParameter("button").equals("View")) {
			errors.add("Invalid Button");
			return "ViewCustomerAccount.jsp";
		}
		//CustomerBean customer = (CustomerBean) session.getAttribute("customer");
		int cid = Integer.parseInt(request.getParameter("customerid"));
		try {
			PositionBean[] pb = pDAO.match(MatchArg.equals("customerid", cid));
			for (int i = 0; i < pb.length; i++) {
				FundBean fb = fDAO.read(pb[i].getFundid());
				long recentPrice = fphDAO.getRecentPrice(pb[i].getFundid());
				fundInfo.add(new FundInfoBean(fb.getFundid(), fb.getTicker(), fb.getFundName(), pb[i].getShares(), recentPrice * pb[i].getShares()));
			}
			return "FundInfoEmployee.jsp";
		} catch (RollbackException e) {
			errors.add(e.getMessage());
			return "error.jsp";
		} catch (ParseException e) {
			errors.add(e.getMessage());
			return "error.jsp";
		}
		
	}
	
}
