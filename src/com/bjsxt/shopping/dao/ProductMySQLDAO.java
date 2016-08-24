package com.bjsxt.shopping.dao;

import java.util.*;
import java.util.List;

import com.bjsxt.shopping.Product;

public class ProductMySQLDAO implements ProductDAO{
	public  List<Product> getProducts(){
		return null;
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
	
	public boolean deleteProductByCategoryId(int categoryId){
		return false;
	}
	
	public boolean deleteProductsById(int[] idArray){
		return false;
	}
	
	public boolean updateProduct(Product p){
		return false;
	}

	@Override
	public boolean addProduct(Product p) {
		// TODO Auto-generated method stub
		return false;
	}
	
	
}
