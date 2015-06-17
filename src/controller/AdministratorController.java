package controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import model.*;

import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;

@ManagedBean
@SessionScoped
public class AdministratorController {

	private String firstName;
	private String lastName;
	private String passwordCustomer;
	private String email;
	private String phoneNumber;
	private String street;
	private String city;
	private String state;
	private String zipcode;
	private String country;
	private Date dateOfBirth;
	private Calendar registrationDate;

	private String nickname;
	private String password;
	private Administrator currentAdministrator;

	private String message;

	private List<Order> orders;

	@ManagedProperty(value="#{authorsBook}")
	private List<Author> authors;

	@ManagedProperty(value="#{currentBook}")
	private Book book;

	@EJB(beanName="administratorFacade")
	private AdministratorFacade administratorFacade;

	@EJB(beanName="customerFacade")
	private CustomerFacade customerFacade;

	@EJB(beanName="orderFacade")
	private OrderFacade orderFacade;

	@EJB(beanName="authorFacade")
	private AuthorFacade authorFacade;

	@EJB(beanName="bookFacade")
	private BookFacade bookFacade;

	public String createAdministrator() {
		this.currentAdministrator = administratorFacade.createAdministrator(nickname, password);
		return "adminView";
	}

	public String loginAdministrator() {
		FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("customerController");
		try{
			Administrator administrator = administratorFacade.getAdministratorByNickname(nickname);
			if (administrator.verificaPassword(this.password)) {
				setCurrentAdministrator(administrator);
				return "adminView";
			}
			else{
				// Password Errata
				FacesContext.getCurrentInstance().addMessage("loginAdministrator:accediAdmin", new FacesMessage("Login Errato! Nickname o password non inseriti correttamente!"));
				return "loginAdministrator";
			}
		}
		catch (Exception e) {
			// Amministratore non trovato
			FacesContext.getCurrentInstance().addMessage("loginAdministrator:accediAdmin", new FacesMessage("Login Errato! Nickname o password non inseriti correttamente!"));
			return "loginAdministrator";
		}
	}

	public String createCustomer() {
		try{
			/*Genera automaticamente la data */
			this.registrationDate = Calendar.getInstance(TimeZone.getTimeZone("Europe/Rome"));
			customerFacade.createCustomer(firstName, lastName, passwordCustomer, email, phoneNumber, dateOfBirth, street, city, state, zipcode, country, registrationDate);
			this.message = "Registrazione utente effettuata!";
			return "registrationDone";
		}catch(Exception e){
			/*Customer gi‡ registrato*/
			this.resetCustomer();
			FacesContext.getCurrentInstance().addMessage("registrationCustomerByAdmin:signinCustomerByAdmin", new FacesMessage("Utente gi√† registrato!"));
			return "customerRegistrationByAdmin";
		}
	}

	public String deleteCustomer() {
		try{
			customerFacade.deleteCustomerByEmail(email);
			this.message = "Cliente cancellato correttamente!";
			return "adminMenuOrders";
		}catch(Exception e){
			FacesContext.getCurrentInstance().addMessage("deletingCustomer:deleteCustomer", new FacesMessage("Utente inesistente!"));
			return "deleteCustomer";
		}
	}

	
	public String listClosedOrders() {
		this.orders = orderFacade.getAllOrderClosed();
		return "adminMenuOrders";
	}
	


	private void resetCustomer(){
		this.firstName = null;
		this.lastName = null;
		this.passwordCustomer = null;
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

	public String logoutAdministrator() {
		FacesContext.getCurrentInstance().getExternalContext().invalidateSession();
		return "index";
	}

	public String newBook() {
		this.authors = authorFacade.getAllAuthor();
		return "newBook";
	}

	public String newAuthor() {
		return "newAuthor";
	}

	public String newCustomer() {
		return "customerRegistrationByAdmin";
	}

	public String modifyBook() {
		this.authors = new ArrayList<Author>(authorFacade.getAllAuthor());
		this.book = (Book) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("currentBook");
		List<Author> authorCancel = new ArrayList<Author>(this.book.getAuthors());
		this.authors.removeAll(authorCancel); 
		FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("authorsBook", this.authors);
		return "modifyBook";
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword() {
		return password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Administrator getCurrentAdministrator() {
		return currentAdministrator;
	}

	public void setCurrentAdministrator(Administrator administrator) {
		this.currentAdministrator = administrator;
	}


	//Seguono i Getters e Setters dei dati del nuovo customer

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

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getPasswordCustomer() {
		return passwordCustomer;
	}

	public void setPasswordCustomer(String passwordCustomer) {
		this.passwordCustomer = passwordCustomer;
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

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
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

	public void setRegistrationDate(Calendar registrationDate) {
		this.registrationDate = registrationDate;
	}

	public List<Author> getAuthors() {
		return authors;
	}

	public void setAuthors(List<Author> authors) {
		this.authors = authors;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public AdministratorFacade getAdministratorFacade() {
		return administratorFacade;
	}

	public void setAdministratorFacade(AdministratorFacade administratorFacade) {
		this.administratorFacade = administratorFacade;
	}

	public CustomerFacade getCustomerFacade() {
		return customerFacade;
	}

	public void setCustomerFacade(CustomerFacade customerFacade) {
		this.customerFacade = customerFacade;
	}

	public OrderFacade getOrderFacade() {
		return orderFacade;
	}

	public void setOrderFacade(OrderFacade orderFacade) {
		this.orderFacade = orderFacade;
	}

	public AuthorFacade getAuthorFacade() {
		return authorFacade;
	}

	public void setAuthorFacade(AuthorFacade authorFacade) {
		this.authorFacade = authorFacade;
	}

	public BookFacade getBookFacade() {
		return bookFacade;
	}

	public void setBookFacade(BookFacade bookFacade) {
		this.bookFacade = bookFacade;
	}


}