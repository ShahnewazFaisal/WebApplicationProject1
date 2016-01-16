
package com.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;




import org.genericdao.MatchArg;
import org.genericdao.RollbackException;
import org.mybeans.form.FormBeanException;
import org.mybeans.form.FormBeanFactory;

import com.databean.EmployeeBean;
import com.form.CreateEmployeeForm;
import com.model.EmployeeDAO;
import com.model.Model;



/*
 * Processes the parameters from the form in register.jsp.
 * If successful:
 *   (1) creates a new User bean
 *   (2) sets the "user" session attribute to the new User bean
 *   (3) redirects to view to manage.do.
 */
public class CreateEmployeeAction extends Action {
	private FormBeanFactory<CreateEmployeeForm> formBeanFactory = FormBeanFactory.getInstance(CreateEmployeeForm.class);

	private EmployeeDAO employeeDAO;
	
	public CreateEmployeeAction(Model model) {
		employeeDAO = model.getEmployeeDAO();
	}

	public String getName() { return "createEmployee.do"; }

    public String perform(HttpServletRequest request) {
        List<String> errors = new ArrayList<String>();
        request.setAttribute("errors",errors);

        try {
        	CreateEmployeeForm form = formBeanFactory.create(request);
	        //request.setAttribute("userList",employeeDAO.getEmployees());
	        request.setAttribute("form",form);
	
	        // If no params were passed, return with no errors so that the form will be
	        // presented (we assume for the first time).
	        if (!form.isPresent()) {
	            return "CreateEmployeePwd.jsp";
	        }
	
	        // Any validation errors?
	        errors.addAll(form.getValidationErrors());
	        if (errors.size() != 0) {
	            return "CreateEmployeePwd.jsp";
	        }
	         EmployeeBean[] checkUser = employeeDAO.match(MatchArg.equals("username", form.getUsername()));
	        // Create the user bean
	         
	         if(checkUser.length > 0){
	        	 errors.add("User with email: " + form.getUsername() + " already exists");
	        	 return "register.jsp";
	         }
	        EmployeeBean employee = new EmployeeBean();
	        employee.setUsername((form.getUsername()));
	        employee.setFirstname(form.getFirstname());
	        employee.setLastname(form.getLastname());
	        employee.setPassword(form.getPassword());
        	employeeDAO.create(employee);
        
			// Attach (this copy of) the user bean to the session
	        HttpSession session = request.getSession(false);
	        session.setAttribute("employee",employee);
	        
			return "manage.do";
        } catch (RollbackException e) {
        	errors.add(e.getMessage());
        	return "error.jsp";
        } catch (FormBeanException e) {
        	errors.add(e.getMessage());
        	return "error.jsp";
        }
    }
}
