package model;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless(name = "aFacade")
public class AuthorFacade {

	@PersistenceContext(unitName = "books")
	private EntityManager em;

	public Author createAuthor(String firstName, String lastName) {
		Author author = new Author(firstName, lastName);
		em.persist(author);
		return author;
	}

	public Author getAuthor(Long id) {
		Author author = em.find(Author.class, id);
		return author;
	}

	public void updateAuthor(Author author) {
		em.merge(author);
	}

	private void deleteAuthor(Author author) {
		em.remove(author);
	}

	public void deleteAuthor(Long id) {
		Author author = em.find(Author.class, id);
		deleteAuthor(author);
	}
}
