package com.form;

import java.util.ArrayList;
import java.util.List;

import org.mybeans.form.FormBean;

/**
 * 
 * @author faisalshahnewaz
 *
 */
public class ResearchFundSearchForm extends FormBean{

	private String fundname;
	private String action;

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}
	
	public String getFundname() {
		return fundname;
	}

	public void setFundname(String fundname) {
		this.fundname = fundname;
	}
	
	public List<String> getValidationErrors() {
		
		List<String> errors = new ArrayList<String>();
		
		if (fundname == null || fundname.trim().length() == 0)
			errors.add("Fund name required");
		
		//sanitization check
		if (fundname.matches(".*[<>\"].*"))
			errors.add("invalid Fund name");
		
		return errors;
	}
	
}