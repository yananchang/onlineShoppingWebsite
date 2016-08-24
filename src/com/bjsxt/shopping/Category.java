package com.bjsxt.shopping;

import java.util.ArrayList;
import java.util.List;

public class Category {
	int id;
	int pid;
	String name;
	String descr;
	boolean leaf;
	int grade;

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public boolean isLeaf() {
		return leaf;
	}
	public void setLeaf(boolean leaf) {
		this.leaf = leaf;
	}
	
	public void addChild(Category c){
		Category.addChildCategory(id, c.getName(), c.getDescr());
	}

	public void delete(){
		CategoryDAO.delete(this,id, this.pid);
	}
	
	public static void add(Category c){
		CategoryDAO.save(c);
	}

	
	public static List<Category> getCategories(){
		List<Category> list = new ArrayList<Category>();
		CategoryDAO.getCategories(list,0);
		return list;
	}
	
	public static void addChildCategory(int pid, String name, String descr){
		CategoryDAO.addChildCategory(pid, name, descr);
	}
	
	
	public static void addTopCategory(String name, String descr){
		/*
		Category c = new Category();
		c.setId(-1);
		c.setName(name);
		c.setDescr(descr);
		c.setPid(0);
		c.setLeaf(true);
		c.setGrade(1);
		CategoryDAO.save(c);
		//add(c);
		 */
		addChildCategory(0, name, descr);
	}
	
	public static Category loadById(int id){
		return CategoryDAO.loadById(id);
	}
	
	
	
}
