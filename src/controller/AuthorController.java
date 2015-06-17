package controller;

import model.*;

import java.util.List;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;

@ManagedBean
public class AuthorController {

	@ManagedProperty(value="#{param.id}")
	private Long id;

	private String firstName;
	private String lastName;
	private String middleName;
	private String code;
	private List<Book> books; 
	private Author author;

	@EJB(beanName="authorFacade")
	private AuthorFacade authorFacade;

	public String createAuthor() {
		this.author = authorFacade.createAuthor( firstName, lastName, middleName, code);
		return "authorInformation";
	}

	public String listBooks() {
		this.books = author.getPublications();
		return "authorBooks";
	}

	public String findAuthor() {
		this.author = authorFacade.getAuthor(code);
		return "authorInformation";
	}

	public String findAuthor(String name) {
		this.author = authorFacade.getAuthor(code);
		return "authorInformation";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public List<Book> getBooks() {
		return books;
	}

	public void setBooks(List<Book> books) {
		this.books = books;
	}

	public Author getAuthor() {
		return author;
	}

	public void setAuthor(Author author) {
		this.author = author;
	}

	public AuthorFacade getAuthorFacade() {
		return authorFacade;
	}

	public void setAuthorFacade(AuthorFacade authorFacade) {
		this.authorFacade = authorFacade;
	}

	/* Getters e Setters */


}
