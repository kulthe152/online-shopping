package net.sk.shoppingbackend.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import net.sk.shoppingbackend.dao.CategoryDAO;
import net.sk.shoppingbackend.dto.Category;


@Repository("categoryDAO")
public class CategoryDAOImpl implements CategoryDAO {

	private static List<Category> categories = new ArrayList<>();

	static {

		Category category = new Category();

		// adding first categories
		category.setId(1);
		category.setName("Television");
		category.setDescription("this is television description");
		category.setImageURL("CAT1.png");
		categories.add(category);

		// adding second categories
		category = new Category();
		category.setId(2);
		category.setName("Mobile");
		category.setDescription("this is Mobile description");
		category.setImageURL("CAT2.png");
		categories.add(category);

		// adding second categories
		category = new Category();
		category.setId(3);
		category.setName("laptop");
		category.setDescription("this is laptop description");
		category.setImageURL("CAT3.png");
		categories.add(category);

	}

	@Override
	public List<Category> list() {

		return categories;
	}

	@Override
	public Category get(int id) {
		
		for(Category category : categories) {
			
			if(category.getId() == id) return category;
			
		}
		
		return null;
	}

	
	
	
	
	
	
	
	
	
	
	
	
}












