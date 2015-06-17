package model;

import java.util.List;

import javax.persistence.*;

@Entity
@NamedQuery(name = "findAllAuthors", query = "SELECT pr FROM Author pr")
public class Author {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(nullable=false)
	private String firstName;

	@Column
	private String middleName;

	@Column(unique = true)
	private String code;

	@Column(nullable=false)
	private String lastName;



	@ManyToMany(mappedBy = "authors", fetch=FetchType.EAGER)
	private List<Book> publications;



	public Author(){
	}

	public Author(String firstName, String lastName, String middleName ,String code){
		this.firstName = firstName;
		this.lastName = lastName;
		this.middleName = middleName;
		this.code=code;
	}

	public void addBook(Book book) {
		this.publications.add(book);
	}

	public void removeBook(Book book) {
		this.publications.remove(book);
	}




	//  Getters & Setters   



	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((code == null) ? 0 : code.hashCode());
		result = prime * result
				+ ((lastName == null) ? 0 : lastName.hashCode());
		return result;
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

	public List<Book> getPublications() {
		return publications;
	}

	public void setPublications(List<Book> publications) {
		this.publications = publications;
	}


	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}



	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Author other = (Author) obj;
		if (code == null) {
			if (other.code != null)
				return false;
		} else if (!code.equals(other.code))
			return false;
		if (lastName == null) {
			if (other.lastName != null)
				return false;
		} else if (!lastName.equals(other.lastName))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Author [code=" + code + ", firstName=" + firstName
				+ ", middleName=" + middleName + ", lastName=" + lastName + "]";
	}



}
