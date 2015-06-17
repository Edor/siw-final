package model;

import javax.persistence.*;

@Entity
public class OrderLine {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column
	private Double unitPrice;

	@Column
	private Integer quantity;

	@OneToOne(fetch=FetchType.EAGER)
	private Book book;

	public OrderLine() {

	}

	public OrderLine(Double unitPrice, Integer quantity, Book book) {
		this.unitPrice = unitPrice;
		this.quantity = quantity;
		this.book = book;
	}

	// ***** Getters and setters *****

	public Long getId() {
		return id;
	}

	public Double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}
}
