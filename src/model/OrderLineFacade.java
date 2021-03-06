package model;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless(name="orderLineFacade")
public class OrderLineFacade {

	@PersistenceContext(unitName = "books")
	private EntityManager em;

	public OrderLine createOrderLine(Double unitPrice, Integer quantity, Book book) {
		OrderLine orderLine = new OrderLine(unitPrice, quantity, book);
		em.persist(orderLine);
		return orderLine;
	}

	public OrderLine getOrderLine(Long id) {
		OrderLine orderLine = em.find(OrderLine.class, id);
		return orderLine;
	}

	public void updateOrderLine(OrderLine orderLine) {
		em.merge(orderLine);
	}

	private void deleteOrderLine(OrderLine orderLine) {
		em.remove(orderLine);
	}

	public void deleteOrderLine(Long id) {
		OrderLine orderLine = em.find(OrderLine.class, id);
		deleteOrderLine(orderLine);
	}
}