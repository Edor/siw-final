package model;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaQuery;

import java.util.List;

@Stateless(name = "Facade")
public class Facade {

	@PersistenceContext(unitName = "books")
	private EntityManager em;

	public  Book createBook(String title, String publisher, Double price) {
		Book book = new Book(title, publisher,price);
		em.persist(book);
		return book;
	}

	public Book getBook(Long id) {
		Book book = em.find(Book.class, id);
		return book;
	}

	public List<Book> getAllBooks() {
		CriteriaQuery<Book> cq = em.getCriteriaBuilder().createQuery(Book.class);
		cq.select(cq.from(Book.class));
		List<Book> book = em.createQuery(cq).getResultList();
		return book;
	}

	public void updateProduct(Book book) {
		em.merge(book);
	}

	private void deleteBook(Book book) {
		em.remove(book);
	}

	public void deleteBook(Long id) {
		Book book = em.find(Book.class, id);
		deleteBook(book);
	}
	
	

	public Users createUser(String firstName, String lastName, String email,
			String password, String role) {
		Users user = new Users(firstName, lastName, email, password, role);
		em.persist(user);
		return user;
	}
	
	public Users getUser(Long id) {
		Users user = em.find(Users.class, id);
		return user;
	}
	
	public void updateUser(Users user) {
		em.merge(user);
	}

	private void deleteUser(Users user) {
		em.remove(user);
	}

	public void deleteUser(Long id) {
		Users user = em.find(Users.class, id);
		deleteUser(user);
	}

}