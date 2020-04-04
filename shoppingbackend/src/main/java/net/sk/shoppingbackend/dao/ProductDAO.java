package net.sk.shoppingbackend.dao;

import java.util.List;

import net.sk.shoppingbackend.dto.Product;

public interface ProductDAO {
	
	Product get(int ProductId);
	List<Product> list();
	boolean add(Product product);
	boolean update(Product product);
	boolean delete(Product product);
	
	//business method
	List<Product> listActiveProducts();
	List<Product> listActiveProductsByCategory(int categoryId);
	List<Product> getLatestActiveProducts(int count);
	
}
