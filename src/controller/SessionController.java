package controller;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

import model.UserFacade;
import model.*;

@ManagedBean
@SessionScoped
public class SessionController {

	private Users user;
	private String email;
	private String password;
	private String loggedInEmail;

	@EJB(name= "uFacade")
	private UserFacade userFacade;

	public String doLogin() {
		this.user = userFacade.getUser(email);
		if ((this.user != null) && (this.user.getPassword().equals(this.password))) {
			this.loggedInEmail = this.email;
			return "loginSuccessful";
		}
		else
			return "loginFailed";
	}
	
	public String doLogout() {
		this.user=null;
		this.email=null;
		this.password=null;
		this.loggedInEmail=null;
		
		return "index";
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLoggedInEmail() {
		return loggedInEmail;
	}

	public void setLoggedInEmail(String loggedInEmail) {
		this.loggedInEmail = loggedInEmail;
	}

	public UserFacade getUserFacade() {
		return userFacade;
	}

	public void setUserFacade(UserFacade userFacade) {
		this.userFacade = userFacade;
	}
}
