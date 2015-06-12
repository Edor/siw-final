package model;


import javax.persistence.*;

@Entity
public class OrderLine {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@ManyToOne(cascade = {CascadeType.ALL})
	@JoinColumn(name="book_id")
	private Book book;
	@Column(nullable=false)
	private Integer qty;
	
	/* Constructor */
	public OrderLine(Book book, Integer qty) {
		this.book = book;
		this.qty = qty;
	}
	
	public OrderLine() {
		
	}
	
	/*Getters & Setters */
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Integer getQty() {
		return qty;
	}

	public void setQty(Integer qty) {
		this.qty = qty;
	}
}
