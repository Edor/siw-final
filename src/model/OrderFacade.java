package model;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.joda.time.DateTime;

@Stateless(name = "oFacade")
public class OrderFacade {

	@PersistenceContext(unitName = "books")
	private EntityManager em;

	public Orders retrieveOrder(Users user) {
		if (findNotConfirmedOrder(user)!=null) return findNotConfirmedOrder(user);

		Orders order = new Orders();
		DateTime date = new DateTime();
		String dtToString = date.toString("dd/MM/yyyy HH:mm:ss");
		order.setCreationTime(dtToString);

		order.setUser(user);

		em.persist(order);

		return order;
	}

	public Orders confirmOrder(Orders order) {
		DateTime date = new DateTime();
		String dtToString = date.toString("dd/MM/yyyy HH:mm:ss");
		order.setConfirmationTime(dtToString);
		order.setCompleted(true);
		em.merge(order);

		return order;
	}

	public Orders shipOrder(Orders order) {
		DateTime date = new DateTime();
		String dtToString = date.toString("dd/MM/yyyy");
		order.setShippingDate(dtToString);
		em.merge(order);

		return order;
	}

	public void addOrderLine(Orders order, Long bookId, Integer qty) {
		BookFacade bFac = new BookFacade();
		Book book = bFac.getBook(bookId);
		OrderLine orderLine = new OrderLine(book, qty);
		order.getOrderList().add(orderLine);
		//em.merge(order) crea due istanze di orderLine. Ho rimosso merge(order) e tenuto persist(orderLine). Da provare
		em.persist(orderLine);
	}

	public Orders findNotConfirmedOrder(Users user) {
		String qString = "SELECT o FROM Orders o WHERE o.user.email=:email AND o.completed=false";
		Query query = em.createQuery(qString);
		query.setParameter("email", user.getEmail());
		Orders order = (Orders) JpaResultHelper.getSingleResultOrNull(query);
		return order;
	}
}
