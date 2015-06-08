package model;


import java.util.List;
import javax.persistence.*;

@Entity
public class Publisher {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column(nullable=false)
	private String name;
	@ManyToMany(cascade = {CascadeType.ALL})
	private List<Book> publishedBooks;
	@OneToOne(cascade = {CascadeType.ALL})
	@JoinColumn(name="address_id")
	private Address address;
	private String phoneNumber;
	
	/* Constructors */
	public Publisher(String name, Address address) {
		this.name = name;
		this.address = address;
	}
	
	public Publisher() {
		
	}
	
	/* Getters & Setters */
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Book> getPublishedBooks() {
		return publishedBooks;
	}

	public void setPublishedBooks(List<Book> publishedBooks) {
		this.publishedBooks = publishedBooks;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
}
