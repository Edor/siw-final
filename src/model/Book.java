package model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.*;

@Entity
@NamedQuery(name = "findAllBook", query = "SELECT p FROM Book p")
public class Book {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(nullable = false)
	private String title;

	@Column(nullable=false)
	private Double price;

	private String publisher;

	@Column(unique = true)
	private String isbn;

	@Column(nullable = false)
	private Integer availability;

	@ManyToMany(fetch=FetchType.EAGER)
	private List<Author> authors;

	public Book() {
	}

	public Book(String title, Double price, String publisher, String isbn, Integer availability, Author author) {
		this.title = title;
		this.price = price;
		this.publisher = publisher;
		this.isbn = isbn;
		this.availability = availability;
		this.authors = new ArrayList<Author>();
		this.authors.add(author);
	}

	public void addAuthor(Author author){
		this.authors.add(author);
		author.addBook(this);
	}

	public void removeAuthor(Author author) {
		this.authors.remove(author);
		author.removeBook(this);
	}

	//          Getters & Setters        

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

	public Integer getAvailability() {
		return availability;
	}

	public void setAvailability(Integer availability) {
		this.availability = availability;
	}

	public List<Author> getAuthors() {
		return authors;
	}

	public void setAuthors(List<Author> authors) {
		this.authors = authors;
	}

	public boolean equals(Object obj) {
		Book book = (Book)obj;
		return this.getIsbn().equals(book.getIsbn());
	}

	public int hashCode() {
		return this.isbn.hashCode();
	}

	public String toString() {
		final StringBuilder sb = new StringBuilder();
		sb.append("Book"); 
		sb.append("{id=").append(id); 
		sb.append(", Title='").append(title); 
		sb.append(", price=").append(price); 
		sb.append(", Publisher='").append(publisher); 
		sb.append(", isbn='").append(isbn);
		sb.append("}\n");
		return sb.toString();
	}
}