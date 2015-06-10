package model;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless(name = "uFacade")
public class UserFacade {
	
	@PersistenceContext(unitName = "books")
	private EntityManager em;

	public Users createUser(String firstName, String lastName, String email,
			String password, String role, String shippingAddress) {
		Users user = new Users(firstName, lastName, email, password, role);
		Address address = new Address(shippingAddress, 00000, "Rome", "Italy");
		user.setShippingAddress(address);
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
