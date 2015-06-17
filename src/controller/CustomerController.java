package controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import model.*;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

@ManagedBean
@SessionScoped
public class CustomerController {

	private String firstName;
	private String lastName;
	private String password;
	private String email;
	private String phoneNumber;
	private String street;
	private String city;
	private String state;
	private String zipcode;
	private String country;
	private Date dateOfBirth;
	private Calendar registrationDate;
	private List<Order> orders;
	private List<Customer> customers; //Tutti customer registrati

	private Customer currentCustomer;

	@EJB(beanName="orderFacade")
	private OrderFacade orderFacade;

	@EJB(beanName="customerFacade")
	private CustomerFacade customerFacade;

	public String createCustomer() {
		try{
			/*Genera automaticamente la data di oggi */
			this.registrationDate = Calendar.getInstance(TimeZone.getTimeZone("Europe/Rome"));
			this.currentCustomer = customerFacade.createCustomer(firstName, lastName, password, email, phoneNumber, dateOfBirth, street, city, state, zipcode, country, registrationDate);
			return "registrationDone";
		}catch(Exception e){
			/*customer gia  registrato*/
			this.resetCustomer();
			FacesContext.getCurrentInstance().addMessage("registrationCustomer:signinCustomer", new FacesMessage("Registered user"));
			return "customerRegistration";
		}
	}



	public String loginCustomer() {
		FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("administratorController");
		try{
			Customer customer = customerFacade.getCustomerByEmail(email);
			if (customer.verificaPassword(this.password)) {
				setCurrentCustomer(customer);
				return "customerPage";
			}
			else{
				// Password Errata
				FacesContext.getCurrentInstance().addMessage("loginCustomer:accedi", new FacesMessage("Login Errato! L'indirizzo di posta elettronica o la password immessi non sono validi!"));
				return "login";
			}
		}
		catch (Exception e) {
			// Cliente non trovato
			FacesContext.getCurrentInstance().addMessage("loginCustomer:accedi", new FacesMessage("Login Errato! L'indirizzo di posta elettronica o la password immessi non sono validi!"));
			return "login";
		}
	}

	public String logoutCustomer() {
		FacesContext.getCurrentInstance().getExternalContext().invalidateSession();
		return "index";
	}

	private void resetCustomer(){
		this.firstName = null;
		this.lastName = null;
		this.password = null;
		this.email = null;
		this.phoneNumber = null;
		this.street = null;
		this.city = null;
		this.state = null;
		this.zipcode = null;
		this.country = null;
		this.dateOfBirth = null;
		this.registrationDate = null;
	}

	public String listCustomers() {
		this.customers = customerFacade.getAllCustomers();
		return "allCustomers";
	}

	public String findCustomer() {
		this.currentCustomer = customerFacade.getCustomer(email);
		return "customerInfo";
	}

	public String findCustomer(String email) {
		this.currentCustomer = customerFacade.getCustomer(email);
		return "customerInfo";
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public Calendar getRegistrationDate() {
		return registrationDate;
	}

	public List<Customer> getCustomers() {
		return customers;
	}

	public void setCustomers(List<Customer> customers) {
		this.customers = customers;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public void setRegistrationDate(Calendar registrationDate) {
		this.registrationDate = registrationDate;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public Customer getCurrentCustomer() {
		return currentCustomer;
	}

	public void setCurrentCustomer(Customer customer) {
		this.currentCustomer = customer;
	}



	public OrderFacade getOrderFacade() {
		return orderFacade;
	}



	public void setOrderFacade(OrderFacade orderFacade) {
		this.orderFacade = orderFacade;
	}



	public CustomerFacade getCustomerFacade() {
		return customerFacade;
	}



	public void setCustomerFacade(CustomerFacade customerFacade) {
		this.customerFacade = customerFacade;
	}
	
}