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
	private Integer qty;
	private Long bookId;
	private Orders order;

	@EJB(name = "uFacade")
	private UserFacade userFacade;
	
	@EJB(name = "oFacade")
	private OrderFacade orderFacade;

	public String doLogin() {
		this.user = this.userFacade.getUser(email);
		if (this.userFacade.checkPsw(this.user, password)) {
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
	
	public String createOrderLine() {
		this.order = orderFacade.retrieveOrder(this.user);
		orderFacade.addOrderLine(this.order, this.bookId, this.qty);
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

	public Integer getQty() {
		return qty;
	}

	public void setQty(Integer qty) {
		this.qty = qty;
	}

	public Long getBookId() {
		return bookId;
	}

	public void setBookId(Long bookId) {
		this.bookId = bookId;
	}

	public Orders getOrder() {
		return order;
	}

	public void setOrder(Orders order) {
		this.order = order;
	}

	public OrderFacade getOrderFacade() {
		return orderFacade;
	}

	public void setOrderFacade(OrderFacade orderFacade) {
		this.orderFacade = orderFacade;
	}
}
