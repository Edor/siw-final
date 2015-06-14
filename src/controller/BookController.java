package controller;

import java.util.List;
import model.*;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;

@ManagedBean
@SessionScoped
public class BookController {
	//@ManagedProperty(value="#{param.id}")
	private Long id;
	private String title;
	private Double price;
	private String author1;
	private String author2;
	private String author3;
	private String author4;
	private String publisher;
	private Integer availability;
	private Book book;
	private List<Book> books;
	private Orders order;
	private Integer qty;
	@ManagedProperty(value="#{sessionController.user}")
	private Users current;
	
	@EJB(name = "bFacade")
	private BookFacade bookFacade;
	
	@EJB(name = "aFacade")
	private AuthorFacade authorFacade;
	
	@EJB(name = "oFacade")
	private OrderFacade orderFacade;

	public String createBook() {
		this.book = bookFacade.createBook(title, publisher, price, availability);
		return "book"; 
	}
	
	public String createOrderLine() {
		this.order = orderFacade.retrieveOrder(this.current);
		orderFacade.addOrderLine(this.order, this.book, this.qty);
		return "index";
	}

	public String listBooks() {
		this.books = bookFacade.getAllBooks();
		return "bookList"; 
	}

	public String findBook() {
		this.book = bookFacade.getBook(id);
		return "book";
	}

	public String findBook(Long id) {
		this.book = bookFacade.getBook(id);
		return "book";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getAuthor1() {
		return author1;
	}

	public void setAuthor1(String author1) {
		this.author1 = author1;
	}

	public String getAuthor2() {
		return author2;
	}

	public void setAuthor2(String author2) {
		this.author2 = author2;
	}

	public String getAuthor3() {
		return author3;
	}

	public void setAuthor3(String author3) {
		this.author3 = author3;
	}

	public String getAuthor4() {
		return author4;
	}

	public void setAuthor4(String author4) {
		this.author4 = author4;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public Integer getAvailability() {
		return availability;
	}

	public void setAvailability(Integer availability) {
		this.availability = availability;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public List<Book> getBooks() {
		return books;
	}

	public void setBooks(List<Book> books) {
		this.books = books;
	}

	public Orders getOrder() {
		return order;
	}

	public void setOrder(Orders order) {
		this.order = order;
	}

	public Integer getQty() {
		return qty;
	}

	public void setQty(Integer qty) {
		this.qty = qty;
	}

	public Users getCurrent() {
		return current;
	}

	public void setCurrent(Users current) {
		this.current = current;
	}

	public BookFacade getBookFacade() {
		return bookFacade;
	}

	public void setBookFacade(BookFacade bookFacade) {
		this.bookFacade = bookFacade;
	}

	public AuthorFacade getAuthorFacade() {
		return authorFacade;
	}

	public void setAuthorFacade(AuthorFacade authorFacade) {
		this.authorFacade = authorFacade;
	}

	public OrderFacade getOrderFacade() {
		return orderFacade;
	}

	public void setOrderFacade(OrderFacade orderFacade) {
		this.orderFacade = orderFacade;
	}
}


