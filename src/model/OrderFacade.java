package model;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaQuery;

import java.util.Calendar;
import java.util.List;

@Stateless(name="orderFacade")
public class OrderFacade {
	
    @PersistenceContext(unitName = "books")
    private EntityManager em;
    
	public Order createOrder(Calendar creationTime, Customer customer) {
		Order order = new Order(creationTime, customer);
		em.persist(order);
		return order;
	}
	
	public Order getOrder(Long id) {
	    Order order = em.find(Order.class, id);
		return order;
	}
	
	public List<Order> getAllOrder() {
		CriteriaQuery<Order> cq = em.getCriteriaBuilder().createQuery(Order.class);
		cq.select(cq.from(Order.class));
		List<Order> order = em.createQuery(cq).getResultList();
		return order;
	
	}
	
	public List<Order> getAllOrderClosed() {
		Query q = em.createQuery("SELECT o FROM Order o WHERE o.chiuso = true ORDER BY o.id");
		List<Order> orders = q.getResultList();
		return orders;
	}
	
	

	
	public void updateOrder(Order order) {
        em.merge(order);
	}
	
    private void deleteOrder(Order order) {
        em.remove(order);
    }

	public void deleteBook(Long id) {
        Order order = em.find(Order.class, id);
        deleteOrder(order);
	}
}