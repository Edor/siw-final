package controller;

import java.util.ArrayList;
import java.util.List;
import model.*;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.context.FacesContext;

@ManagedBean
public class BookController {

	@ManagedProperty(value="#{param.id}")
	private Long id;

	private String title;
	private String publisher;
	private	String isbn;
	private Double price;
	private Integer availability; 
	private List<Book> books;
	private Author author;
	private String authorName;

	private String authorNameDelete;

	@ManagedProperty(value="#{sessionScope['authorsBook']}")
	private List<Author> authors;

	@ManagedProperty(value="#{sessionScope['currentBook']}")
	private Book book;

	@EJB(beanName="bookFacade")
	private BookFacade bookFacade;

	@EJB(beanName="authorFacade")
	private AuthorFacade authorFacade;

	@EJB(beanName="orderFacade")
	private OrderFacade orderFacade;

	@EJB(beanName="orderLineFacade")
	private OrderLineFacade orderLineFacade;

	public String createBook() {
		try{
			this.author = authorFacade.getAuthor(this.authorName);
			this.book = bookFacade.createBook(title, price, publisher, isbn, availability, author);
			this.author.addBook(this.book);
			FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("currentProduct", this.book);
			return "book";
		}catch(Exception e){
			/*isbn gia presente nel DB*/
			this.resetBook();
			FacesContext.getCurrentInstance().addMessage("newBook:createBook", new FacesMessage("ISBN Book already exists"));
			return "newBook";
		}
	}

	public String updateBook() {
		bookFacade.updateBook(this.book);
		return "book";
	}

	public String addAuthor() {
		this.author = authorFacade.getAuthor(this.authorName);
		this.book.addAuthor(this.author);
		bookFacade.updateBook(this.book);
		authorFacade.updateAuthor(this.author);

		updateListAuthor();
		return "modifyBook";
	}

	private void resetBook(){
		this.title = null;
		this.isbn = null;
		this.price = null;
		this.publisher = null;
		this.availability = 0;
		this.author = null;
	}

	public String removeAuthor() {
		this.author = authorFacade.getAuthor(this.authorNameDelete);
		this.book.removeAuthor(this.author);
		bookFacade.updateBook(this.book);
		authorFacade.updateAuthor(this.author);

		updateListAuthor();
		return "modifyBook";
	}

	private void updateListAuthor() {
		// aggiornamento lista nuovi author per book
		List<Author> authorsAll = new ArrayList<Author>(authorFacade.getAllAuthor());
		List<Author> authorCancel = new ArrayList<Author>(this.book.getAuthors());
		authorsAll.removeAll(authorCancel); // vengono visualizzati solo author  non associati al book
		this.authors = authorsAll;
		FacesContext.getCurrentInstance().getExternalContext().getSessionMap().remove("authorsBook");
		FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("authorsBook", this.authors);
	}

	public String deleteBook(){
		/*se il book è¨ associato a qualche ordine va cancellata la riga d'ordine
		 * altrimenti all'evasione ci sarà  un book non piu disponibile*/

		List<Order> allOrders = this.orderFacade.getAllOrder();
		List<OrderLine> righe_ordini = new ArrayList<OrderLine>();
		if(allOrders.size() != 0){
			for(Order ordine: allOrders){
				righe_ordini.clear();
				righe_ordini = ordine.getOrderLines();
				if(righe_ordini.size() != 0){
					for(OrderLine rigaordine: righe_ordini){
						if (rigaordine.getBook().getId().equals(book.getId())){
							this.orderLineFacade.deleteOrderLine(rigaordine.getId());
							ordine.setBookCancellato(true);
							this.orderFacade.updateOrder(ordine);
						}
					}
				}
			}
		}

		this.bookFacade.deleteBook(book.getId());
		return "administratorPage";
	}


	public String listBooks() {
		this.books = bookFacade.getAllBooks();
		return "books"; 
	}

	public String findBook() {
		this.book = bookFacade.getBook(id);
		FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("currentBook", this.book);
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

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getAvailability() {
		return availability;
	}

	public void setAvailability(Integer availability) {
		this.availability = availability;
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

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String getAuthorNameDelete() {
		return authorNameDelete;
	}

	public void setAuthorNameDelete(String authorNameDelete) {
		this.authorNameDelete = authorNameDelete;
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

	public OrderLineFacade getOrderLineFacade() {
		return orderLineFacade;
	}

	public void setOrderLineFacade(OrderLineFacade orderLineFacade) {
		this.orderLineFacade = orderLineFacade;
	}


}