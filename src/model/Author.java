package model;


import java.util.List;
import javax.persistence.*;

@Entity
public class Author {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column(nullable=false)
	private String firstName;
	private String middleName;
	@Column(nullable=false)
	private String lastName;
	@ManyToMany(cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
	private List<Book> publications;
	
	/* Constructor */
	public Author(String firstName, String lastName) {
		this.firstName = firstName;
		this.lastName = lastName;
	}
	
	public Author() {
		
	}

	/* Getters & Setters */
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

	public List<Book> getPubblications() {
		return publications;
	}

	public void setPubblications(List<Book> pubblications) {
		this.publications = pubblications;
	}
}
