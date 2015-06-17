package controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;

import model.*;

import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.context.FacesContext;

@ManagedBean
public class OrderController {

	@ManagedProperty(value="#{param.id}")
	private Long id;

	@ManagedProperty(value="#{param.orderLineId}")
	private Long orderLineId;

	@ManagedProperty(value="#{sessionScope['currentOrder']}")
	private Order currentOrder;

	@ManagedProperty(value="#{sessionScope['currentBook']}")
	private Book currentBook;

	@ManagedProperty(value="#{sessionScope['customerController'].currentCustomer}")
	private Customer currentCustomer;

	private String message;
	private int quantity = 1; // quantità  della order line appena inserita
	private List<Order> orders;

	/* contiene i isbn dei libri delle righe ordine con una quantita'
	 *  inferiore alle disponibilita' in magazzino */

	private List<String> codiceBookRigheOrdine = new ArrayList<String>() ; 

	private int quantityNew = 1;
	private String codeBookLineOrder = null;


	@EJB(beanName="customerFacade")
	private CustomerFacade customerFacade;

	@EJB(beanName="orderFacade")
	private OrderFacade orderFacade;

	@EJB(beanName="orderLineFacade")
	private OrderLineFacade orderLineFacade;

	@EJB(beanName="bookFacade")
	private BookFacade bookFacade;

	public String createOrder() {
		this.currentOrder = orderFacade.createOrder(Calendar.getInstance(TimeZone.getTimeZone("Europe/Rome")), this.currentCustomer);
		this.currentCustomer.addOrder(this.currentOrder);
		FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("currentOrder", this.currentOrder);
		return "order";
	}

	public String addOrderLine() {
		if(this.quantity<=0){
			this.message = "Qty deve essere > 0";
		} else {
			this.message = "";
			OrderLine orderLine = this.currentOrder.checkOrderLine(currentBook);
			if(orderLine != null){
				orderLine.setQuantity(orderLine.getQuantity()+this.quantity);
				orderLineFacade.updateOrderLine(orderLine);
				this.message = "incrementata la qty book nel carrello !";
			} else {
				orderLine = orderLineFacade.createOrderLine(currentBook.getPrice(), this.quantity, currentBook);
				this.currentOrder.addOrderLine(orderLine);
				orderFacade.updateOrder(currentOrder);
			}
		}
		return "order";
	}

	public String deleteOrderLine() {
		OrderLine orderLine = this.currentOrder.getOrderLineById(this.orderLineId);
		this.currentOrder.removeOrderLine(orderLine);
		orderLineFacade.deleteOrderLine(this.orderLineId);
		orderFacade.updateOrder(currentOrder);
		this.message = "Linea ordine rimossa!";
		return "order";
	}

	public String changeQuantityOrderLine() {
		if(this.quantityNew <=0){
			this.quantityNew = 1;
			this.message = "La quantitÃ  deve essere maggiore di 0";
		} else {
			List<OrderLine> orderLines = this.currentOrder.getOrderLines();
			for(OrderLine orderLine : orderLines){

				if(orderLine.getBook().getIsbn().equals(this.codeBookLineOrder)){
					orderLine.setQuantity(this.quantityNew);
					orderLineFacade.updateOrderLine(orderLine);
					orderFacade.updateOrder(currentOrder);
					this.quantityNew = 1;
				}
			}
			this.message = "Quantità order line modificata!";
		}
		return "order";
	}

	public String closeOrder() {
		List<OrderLine> orderLines = this.currentOrder.getOrderLines();
		if(orderLines.size() == 0){
			//Se non ho order line nell order, non posso chiudere!!!
			this.message = "Non hai scelto nessun Book!";
		}else{
			this.currentOrder.setCompletedTime(Calendar.getInstance(TimeZone.getTimeZone("Europe/Rome")));
			this.currentOrder.setChiuso();
			orderFacade.updateOrder(currentOrder);
			customerFacade.updateCustomer(currentCustomer);
			this.message = "Ordine chiuso correttamente!";
		}
		return "order";
	}

	public String processedOrder() {
		if(this.checkOrderQuantity()){
			this.reduceOrderQuantity();
			this.currentOrder.setProcessedTime(Calendar.getInstance(TimeZone.getTimeZone("Europe/Rome")));
			this.currentOrder.setEvaso();
			orderFacade.updateOrder(currentOrder);
			customerFacade.updateCustomer(currentCustomer);
			if(this.currentOrder.isBookCancellato()){
				this.message = "Alquni book non sono piu disponibili!";
			}else{
				this.message = "Ordine evaso correttamente!";
			}
		} else {
			this.message = "Ordine non evaso! quantita' scelte non piu disponibili! \nCodice Prodotti in righe d'ordine non evadibili: "+this.codiceBookRigheOrdine.toString();
		}
		return "orderDetails";
	}

	private boolean checkOrderQuantity() {
		this.codiceBookRigheOrdine.clear();
		List<OrderLine> orderLines = this.currentOrder.getOrderLines();
		for(OrderLine orderLine : orderLines){
			if(orderLine.getQuantity()>orderLine.getBook().getAvailability()){
				this.codiceBookRigheOrdine.add(orderLine.getBook().getIsbn());
			}
		}
		if(this.codiceBookRigheOrdine.size() == 0)
			return true;
		else
			return false;
	}

	private boolean reduceOrderQuantity() {
		List<OrderLine> orderLines = this.currentOrder.getOrderLines();
		for(OrderLine orderLine : orderLines){
			int quantityOriginal = orderLine.getBook().getAvailability(); 
			int quantityToReduce = orderLine.getQuantity(); 
			orderLine.getBook().setAvailability(quantityOriginal-quantityToReduce);
			bookFacade.updateBook(orderLine.getBook());
		}
		return true;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String listOrders() {
		this.orders = orderFacade.getAllOrder();
		return "allOrders"; 
	}

	public String findOrder() {
		this.currentOrder = orderFacade.getOrder(id);
		FacesContext.getCurrentInstance().getExternalContext().getSessionMap().put("currentOrder", this.currentOrder);
		return "order";
	}

	public String findOrderByAdministrator() {
		this.findOrder();
		return "orderDetails";
	}

	public String findOrder(Long id) {
		this.currentOrder = orderFacade.getOrder(id);
		return "order";
	}

	public Order getCurrentOrder() {
		return currentOrder;
	}

	public void setCurrentOrder(Order order) {
		this.currentOrder = order;
	}

	public Customer getCurrentCustomer() {
		return currentCustomer;
	}

	public void setCurrentCustomer(Customer customer) {
		this.currentCustomer = customer;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Book getCurrentBook() {
		return currentBook;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Long getOrderLineId() {
		return orderLineId;
	}

	public void setOrderLineId(Long orderLineId) {
		this.orderLineId = orderLineId;
	}

	public int getQuantityNew() {
		return quantityNew;
	}

	public void setQuantityNew(int quantityNew) {
		this.quantityNew = quantityNew;
	}


	public List<String> getCodiceBookRigheOrdine() {
		return codiceBookRigheOrdine;
	}

	public void setCodiceBookRigheOrdine(List<String> codiceBookRigheOrdine) {
		this.codiceBookRigheOrdine = codiceBookRigheOrdine;
	}

	public String getCodeBookLineOrder() {
		return codeBookLineOrder;
	}

	public void setCodeBookLineOrder(String codeBookLineOrder) {
		this.codeBookLineOrder = codeBookLineOrder;
	}

	public CustomerFacade getCustomerFacade() {
		return customerFacade;
	}

	public void setCustomerFacade(CustomerFacade customerFacade) {
		this.customerFacade = customerFacade;
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

	public BookFacade getBookFacade() {
		return bookFacade;
	}

	public void setBookFacade(BookFacade bookFacade) {
		this.bookFacade = bookFacade;
	}

	public void setCurrentBook(Book currentBook) {
		this.currentBook = currentBook;
	}

}