package net.sk.shoppingbackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import net.sk.shoppingbackend.dao.ProductDAO;
import net.sk.shoppingbackend.dto.Product;


@Repository("productDAO")
@Transactional
public class ProductDAOImpl implements ProductDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	/*
	 * SINGLE
	 */
	@Override
	public Product get(int ProductId) {
		try {
			return sessionFactory
					.getCurrentSession()
						.get(Product.class,Integer.valueOf(ProductId));
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	
	
	/*
	 * LIST
	 */
	@Override
	public List<Product> list() {
		
		return sessionFactory
					.getCurrentSession()
						.createQuery("FROM Product", Product.class)
							.getResultList();
		
	}

	
	
	/*
	 * INSERT
	 */
	@Override
	public boolean add(Product product) {
		try {
			sessionFactory
					.getCurrentSession()
						.persist(product);
			return true;
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	
	
	/*
	 * UPDATE
	 */
	@Override
	public boolean update(Product product) {
		try {
			sessionFactory
					.getCurrentSession()
						.update(product);
			return true;
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	
	
	
	@Override
	public boolean delete(Product product) {
		try {
			product.setActive(false);
			return this.update(product);
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	
	
	
	@Override
	public List<Product> listActiveProducts() {
		String selectActiveProducts = "FROM Product WHERE active = :active";
		return sessionFactory
					.getCurrentSession()
						.createQuery(selectActiveProducts, Product.class)
							.setParameter("active", true)
								.getResultList();
	}

	
	
	
	@Override
	public List<Product> listActiveProductsByCategory(int categoryId) {
		String listActiveProductsByCategory = "FROM Product WHERE active = :active AND categoryId = :categoryId";
		return sessionFactory
					.getCurrentSession()
						.createQuery(listActiveProductsByCategory, Product.class)
							.setParameter("active", true)
							.setParameter("categoryId", categoryId)
								.getResultList();
	}

	
	
	
	@Override
	public List<Product> getLatestActiveProducts(int count) {
		return sessionFactory
					.getCurrentSession()
						.createQuery("FROM Product WHERE active = :active ORDER BY id", Product.class)
							.setParameter("active", true)
								.setFirstResult(0)
								.setMaxResults(count)
									.getResultList();
	}
}

