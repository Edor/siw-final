package model;

import java.util.List;
import javax.persistence.*;

public class JpaResultHelper {
	public static Object getSingleResultOrNull(Query query) {
		query.setMaxResults(1);
		@SuppressWarnings("unchecked")
		List<Object> results = query.getResultList();
		if (results.isEmpty() || results == null) return null;
		return results.get(0);
	}

}
