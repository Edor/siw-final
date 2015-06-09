package model;

       
import java.util.List;
import javax.persistence.*;

@Entity
public class Orders {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
	private Users user;
	@OneToMany(cascade = {CascadeType.PERSIST, CascadeType.REMOVE})
	@JoinColumn(name="order_id")
	private List<OrderLine> orderList;
	private String creationTime;
	private String confirmationTime;
	private String shippingDate;
	
	/* Constructors */
	public Orders() {
		
	}
	
	/* Getters & Setters */
	public String getCreationTime() {
		return creationTime;
	}

	public void setCreationTime(String creationTime) {
		this.creationTime = creationTime;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public List<OrderLine> getOrderLines() {
		return orderList;
	}
	
	public void setOrderLines(List<OrderLine> orderLines) {
		this.orderList = orderLines;
	}

	public List<OrderLine> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<OrderLine> orderList) {
		this.orderList = orderList;
	}

	public String getConfirmationTime() {
		return confirmationTime;
	}

	public void setConfirmationTime(String confirmationTime) {
		this.confirmationTime = confirmationTime;
	}

	public String getShippingDay() {
		return shippingDate;
	}

	public void setShippingDay(String shippingDay) {
		this.shippingDate = shippingDay;
	}
}
