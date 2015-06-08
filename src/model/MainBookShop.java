package model;

import javax.persistence.*;

public class MainBookShop {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		EntityManagerFactory emf = Persistence.createEntityManagerFactory("books");
		EntityManager em = emf.createEntityManager();
		
		em.close();
		emf.close();

	}

}
