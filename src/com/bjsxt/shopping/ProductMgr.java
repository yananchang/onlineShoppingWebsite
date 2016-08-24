package com.bjsxt.shopping;

import com.bjsxt.shopping.dao.*;
import java.util.Date;
import java.util.List;

public class ProductMgr {
	
	private static ProductMgr pm = null;
	
	static{
		if(pm == null){
			pm = new ProductMgr();
			// you should read config file to set the specific dao object
			pm.setDao(new ProductMySQLDAO());
		}
	}
	
	private ProductMgr(){}
	
	public static ProductMgr getInstance(){
		return pm;
	}
	
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
		return dao.getProducts(pageNo, pageSize);
		
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
	
	public boolean addProduct(Product p){
		return dao.addProduct(p);
	}
	
}
