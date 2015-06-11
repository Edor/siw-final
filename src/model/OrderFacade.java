package model;

import java.util.LinkedList;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.joda.time.DateTime;

@Stateless(name = "oFacade")
public class OrderFacade {

	@PersistenceContext(unitName = "books")
	private EntityManager em;

	public Orders createOrder(Users user) {
		if (findNotConfirmedOrder(user)!=null) return findNotConfirmedOrder(user);

		Orders order = new Orders();
		DateTime date = new DateTime();
		String dtToString = date.toString("dd/MM/yyyy HH:mm:ss");
		order.setCreationTime(dtToString);

		order.setUser(user);

		List<OrderLine> orderLines = new LinkedList<OrderLine>();
		order.setOrderList(orderLines);

		em.persist(order);

		return order;
	}

	public Orders confirmOrder(Orders order) {
		DateTime date = new DateTime();
		String dtToString = date.toString("dd/MM/yyyy HH:mm:ss");
		order.setConfirmationTime(dtToString);
		em.merge(order);

		return order;
	}

	public Orders shipOrder(Orders order) {
		DateTime date = new DateTime();
		String dtToString = date.toString("dd/MM/yyyy");
		order.setShippingDay(dtToString);
		em.merge(order);

		return order;
	}

	public void addOrderLine(Orders order, Long id, Integer qty) {
		BookFacade bFac = new BookFacade();
		Book book = bFac.getBook(id);
		OrderLine orderLine = new OrderLine(book, qty);
		order.getOrderList().add(orderLine);
		em.persist(orderLine);
	}

	public Orders findNotConfirmedOrder(Users user) {
		String qString = "SELECT o FROM Orders o WHERE o.user.email=:email AND o.confirmationTime=null";
		Query query = em.createQuery(qString);
		query.setParameter("email", user.getEmail());

		try {
			Orders order = (Orders) query.getSingleResult();
			return order;
		} catch (NullPointerException e) {
			return null;
		}
	}
}
