package net.sk.shoppingbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import net.sk.shoppingbackend.dao.ProductDAO;
import net.sk.shoppingbackend.dto.Product;

public class ProductTestCase {
	
	private static AnnotationConfigApplicationContext context;
	private static ProductDAO productDAO;
	private Product product;
	
	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("net.sk.shoppingbackend");
		context.refresh();
		productDAO = (ProductDAO) context.getBean("productDAO");
	}
	
	/*@Test
	public void testCRUDProduct() {
		
		//create application
		product = new Product();
		product.setName("OppoSelfie S53");
		product.setBrand("Oppo");
		product.setDescription("This is some description for oppo mobile phones");
		product.setUnitPrice(25000);
		product.setActive(true);
		product.setCategoryId(3);
		product.setSupplierId(3);
		assertEquals("something went wrong while inserting a new product!",
				true,productDAO.add(product));
		
		
		//reading and updating the category
		product = productDAO.get(2);
		product.setName("Samsung A10s");
		assertEquals("something went wrong while updating the existing record..!!",
				true,productDAO.update(product));
		
		
		//delete product
		assertEquals("something went wrong while deleting the existing record..!!",
				true,productDAO.delete(product));
		
		
		assertEquals("Something went wrong while fetching the list of products",
				6,productDAO.list().size());		
	}*/
	
	
	@Test
	public void testListActiveProduct() {
		assertEquals("Something went wrong while fetching the list of products",
				5,productDAO.listActiveProducts().size());	
	}
	
	
	@Test
	public void testListActiveProductProductsByCategory() {
		assertEquals("Something went wrong while fetching the list of products",
				3,productDAO.listActiveProductsByCategory(3).size());
		assertEquals("Something went wrong while fetching the list of products",
				2,productDAO.listActiveProductsByCategory(1).size());
	}
	
	
	@Test
	public void testGetLatestActiveProduct() {
		assertEquals("Something went wrong while fetching the list of products",
				3,productDAO.getLatestActiveProducts(3).size());
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
