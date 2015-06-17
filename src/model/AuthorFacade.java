package model;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaQuery;

import java.util.List;

@Stateless(name="authorFacade")
public class AuthorFacade {

	@PersistenceContext(unitName = "books")
	private EntityManager em;

	public Author createAuthor(String firstName, String lastName, String middleName, String code) {
		Author author = new Author( firstName, lastName, middleName,code);
		em.persist(author);
		return author;
	}

	public Author getAuthor(Long id) {
		Author author = em.find(Author.class, id);
		return author;
	}

	public Author getAuthor(String code) {
		Query q = em.createQuery("SELECT p FROM Author p WHERE p.code = :code");
		q.setParameter("code", code);
		Author author = (Author) q.getSingleResult();
		return author;
	}

	public List<Author> getAllAuthor() {
		CriteriaQuery<Author> cq = em.getCriteriaBuilder().createQuery(Author.class);
		cq.select(cq.from(Author.class));
		List<Author> authors = em.createQuery(cq).getResultList();
		return authors;
	}

	public void updateAuthor(Author author) {
		em.merge(author);
	}

	private void deleteAuthor(Author author) {
		em.remove(author);
	}

	public void deleteBook(Long id) {
		Author author = em.find(Author.class, id);
		deleteAuthor(author);
	}
}