package net.sk.shoppingbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import net.sk.shoppingbackend.dao.CategoryDAO;
import net.sk.shoppingbackend.dto.Category;

public class CategoryTestCase {

	private static AnnotationConfigApplicationContext context;
	private static CategoryDAO categoryDAO;
	private Category category;

	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("net.sk.shoppingbackend");
		context.refresh();
		categoryDAO = (CategoryDAO) context.getBean("categoryDAO");
	}

	/*
	 * @Test public void testAddCategory() {
	 * 
	 * 
	 * }
	 */

	/*
	 * @Test public void testGetCategory() {
	 * 
	 * category = categoryDAO.get(2);
	 * 
	 * assertEquals("successfully fetched a single category from the table!"
	 * ,"Laptop",category.getName());
	 * 
	 * }
	 */

	/*
	 * @Test public void testUpdateCategory() {
	 * 
	 * category = categoryDAO.get(2);
	 * 
	 * category.setName("TV");
	 * 
	 * assertEquals("successfully updated single category in the table!",true,
	 * categoryDAO.update(category));
	 * 
	 * }
	 */

	/*
	 * @Test public void testDeleteCategory() {
	 * 
	 * category = categoryDAO.get(2);
	 * assertEquals("successfully deleted single category in the table!",true,
	 * categoryDAO.delete(category));
	 * 
	 * }
	 */

	/*
	 * @Test public void testDeleteCategory() {
	 * 
	 * category = categoryDAO.get(2);
	 * assertEquals("successfully deleted single category in the table!",true,
	 * categoryDAO.delete(category));
	 * 
	 * }
	 */

	/*
	 * @Test public void testListCategory() {
	 * 
	 * assertEquals("successfully fetched list of category in the table!",1,
	 * categoryDAO.list().size());
	 * 
	 * }
	 */

	@Test
	public void testCRUDCategory() {

		//add operation
		category = new Category();
		category.setName("Clothing");
		category.setDescription("this is clothing description");
		category.setImageURL("CAT3.png");
		assertEquals("successfully added a category inside the table!", true, categoryDAO.add(category));

		category = new Category();
		category.setName("Television");
		category.setDescription("this is television description");
		category.setImageURL("CAT5.png");
		assertEquals("successfully added a category inside the table!", true, categoryDAO.add(category));
		
		//fetching and updating the category
		category = categoryDAO.get(2);
		category.setName("TV"); 
		assertEquals("successfully updated single category in the table!",true,categoryDAO.update(category));
		
		//delete the category
		assertEquals("successfully deleted single category in the table!",true,categoryDAO.delete(category));
		
		
		//fetching the list
		assertEquals("successfully fetched list of category in the table!",1,categoryDAO.list().size());
				
	}
}