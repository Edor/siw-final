package model;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaQuery;

import java.util.List;

@Stateless(name = "bFacade")
public class BookFacade {

	@PersistenceContext(unitName = "books")
	private EntityManager em;

	public  Book createBook(String title, String publisher, Double price, Integer availability) {
		Book book = new Book(title.toUpperCase(), publisher.toUpperCase(), price, availability);
		em.persist(book);
		return book;
	}

	public Book getBook(Long id) {
		Book book;
		try { 
			book = em.find(Book.class, id);
		} catch (NullPointerException e) {
			return null;
		}
		return book;
	}
	
	public Book getBook(String title) {
		String qString = "SELECT b FROM Book b WHERE u.title=:title";
		Query query = em.createQuery(qString);
		query.setParameter("title", title);
		Book book = (Book) JpaResultHelper.getSingleResultOrNull(query);
		
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
}