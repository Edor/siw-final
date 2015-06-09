package model;


import java.util.List;

import javax.persistence.*;
@Entity
public class Book {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column(nullable=false)
	private String title;
	@ManyToMany(mappedBy="publications", cascade = {CascadeType.ALL})
	private List<Author> authors;
	private String publisher;
	@Column(nullable=false)
	private Double price;
	@Column(nullable=true)
	private Integer availability;
	
	/* Constructors */
	public Book(String title, String publisher, Double price) {
		this.title = title;
		this.publisher = publisher;
		this.price = price;
	}
	
	public Book() {
		
	}

	/* Getters & Setters */
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

	public List<Author> getAuthors() {
		return authors;
	}

	public void setAuthors(List<Author> authors) {
		this.authors = authors;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
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

}
