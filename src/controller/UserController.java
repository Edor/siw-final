package controller;


import model.*;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;

@ManagedBean
public class UserController {
	private Long id;
	private String email;
	private String password;
	private String firstName;
	private String middleName;
	private String lastName;
	private String role;
	private String shippingAddress;
	private Users user;

	@EJB(name= "uFacade")
	private UserFacade userFacade;

	public String createUser() {
		String role = new String("user");
		this.user = userFacade.createUser(firstName, lastName, email, password, role, shippingAddress);
		return "index"; 
	}

	public String findUser() {
		this.user = userFacade.getUser(id);
		return "user";
	}

	public String findUser(Long id) {
		this.user = userFacade.getUser(id);
		return "user";
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

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public UserFacade getUsersFacade() {
		return userFacade;
	}

	public void setUsersFacade(UserFacade userFacade) {
		this.userFacade = userFacade;
	}

	public Long getId() {
		return id;
	}
}