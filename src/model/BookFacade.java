package model;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaQuery;

import java.util.List;

@Stateless(name="bookFacade")
public class BookFacade {
	
    @PersistenceContext(unitName = "books")
    private EntityManager em;
    
	public Book createBook(String title, Double price, String publisher, String isbn, Integer availability, Author author) {
		Book book = new Book( title, price, publisher, isbn, availability, author);
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
        List<Book> books = em.createQuery(cq).getResultList();
		return books;
	}

	public void updateBook(Book book) {
        em.merge(book);
	}
	
    public void deleteBook(Book book) {
        em.remove(book);
    }

	public void deleteBook(Long id) {
        Book book = em.find(Book.class, id);
        deleteBook(book);
	}
}