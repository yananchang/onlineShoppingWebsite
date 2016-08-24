package com.bjsxt.shopping;

import com.bjsxt.shopping.dao.*;
import java.util.Date;
import java.util.List;

public class ProductMgr {
	
	ProductDAO dao = null;
	
	public ProductDAO getDao() {
		return dao;
	}

	public void setDao(ProductDAO dao) {
		this.dao = dao;
	}

	public  List<Product> getProducts(){
		return dao.getProducts();
	}
	
	public List<Product> getProducts(int pageNo, int pageSize){
		return null;
	}
	
	public List<Product> findProducts(int[] categoryId, 
									  String name, 
									  String descr, 
									  double lowNormalPrice, 
									  double highNormalPrice,
									  double lowMemberPrice,
									  double highMemberPrice,
									  Date startDate,
									  Date endDate,
									  int pageNo,
									  int pageSize){
		return null;
	}
	
	public List<Product> findProducts(String name){
		return null;
	}
	
	public boolean deleteProductByCategoryId(int categoryId){
		return false;
	}
	
	public boolean deleteProductsById(int[] idArray){
		return false;
	}
	
	public boolean updateProduct(Product p){
		return false;
	}
	
	
	
}
