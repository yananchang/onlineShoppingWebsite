package com.bjsxt.shopping;

import com.bjsxt.shopping.dao.*;
import java.util.Date;
import java.util.List;

public class ProductMgr {
	
	private static ProductMgr pm = null;
	private int pageCount = 0;
	
	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

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
	
	/**
	 * 
	 * @param products
	 * @param pageNo
	 * @param pageSize
	 * @return page counts of the specified pageSize
	 */
	public int getProducts(List<Product> products, int pageNo, int pageSize){
		return dao.getProducts(products, pageNo, pageSize);
	}
	
	
	public int findProducts(List<Product> list, int[] categoryId, 
									  String keyWord,
									  double lowNormalPrice, 
									  double highNormalPrice,
									  double lowMemberPrice,
									  double highMemberPrice,
									  Date startDate,
									  Date endDate,
									  int pageNo,
									  int pageSize){
		return dao.findProducts(list, categoryId, keyWord, lowNormalPrice, highNormalPrice, lowMemberPrice, highMemberPrice, startDate, endDate, pageNo, pageSize);
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
		return dao.updateProduct(p);
	}
	
	public boolean addProduct(Product p){
		return dao.addProduct(p);
	}
	
	public Product loadById(int id){
		return dao.loadById(id);
	}
	
	public boolean update(Product p){
		return dao.updateProduct(p);
	}
	
	public List<Product> getLatestProducts(int count){
		return dao.getLatestProducts(count);
	}
	
}
