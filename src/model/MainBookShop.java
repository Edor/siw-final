package model;

import javax.persistence.*;

// Questa classe serve ad inizializzare il database. Cambiare il file persistence.xml di conseguenza quando
// la si intende utilizzare.
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
