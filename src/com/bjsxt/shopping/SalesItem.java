package com.bjsxt.shopping;

public class SalesItem {
	int id;
	Product product;
	double unitPrice;
	int count;
	SalesOrder order;
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public SalesOrder getOrder() {
		return order;
	}
	public void setOrder(SalesOrder order) {
		this.order = order;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}

	
	
}
