package model;


import javax.persistence.*;

@Entity
public class OrderLine {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@ManyToOne(cascade = {CascadeType.ALL})
	@JoinColumn(name="book_id")
	private Book item;
	@Column(nullable=false)
	private Integer qty;
	
	/* Constructor */
	public OrderLine(Book item, Integer qty) {
		this.item = item;
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

	public Book getItem() {
		return item;
	}

	public void setItem(Book item) {
		this.item = item;
	}

	public Integer getQty() {
		return qty;
	}

	public void setQty(Integer qty) {
		this.qty = qty;
	}
}
