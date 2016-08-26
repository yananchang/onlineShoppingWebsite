package com.bjsxt.shopping.dao;

import java.util.Date;
import java.util.List;

import com.bjsxt.shopping.Product;

public interface ProductDAO {
	public  List<Product> getProducts();
	
	public List<Product> getProducts(int pageNo, int pageSize);
	
	public int findProducts(List<Product > list,
									  int[] categoryId, 
									  String keyWord, 
									  double lowNormalPrice, 
									  double highNormalPrice,
									  double lowMemberPrice,
									  double highMemberPrice,
									  Date startDate,
									  Date endDate,
									  int pageNo,
									  int pageSize);
	
	public boolean deleteProductByCategoryId(int categoryId);
	
	public boolean deleteProductsById(int[] idArray);
	
	public boolean updateProduct(Product p);
	
	public boolean addProduct(Product p);

	public int getProducts(List<Product> products, int pageNo, int pageSize);
}
