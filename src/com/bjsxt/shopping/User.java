package com.bjsxt.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.bjsxt.shopping.util.DB;

public class User {
	
	public User(){}
	
	public User(String username, String password, String phone, String addr,
			Timestamp rdate) {
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.addr = addr;
		this.rdate = rdate;
	}

	public User(String username, String password, String phone, String addr) {
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.addr = addr;
		this.rdate = new Timestamp(System.currentTimeMillis());
	}
	
	private int id;
	private String username;
	private String password;
	private String phone;
	private String addr;
	private Timestamp rdate;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String pssword) {
		this.password = pssword;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Timestamp getRdate() {
		return rdate;
	}
	public void setRdate(Timestamp rdate) {
		this.rdate = rdate;
	}
	/*
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	*/
	
	public void save(){
		Connection conn = null;
		PreparedStatement pstmt = null;	
		try {
			conn = DB.getConn();
			String sql = "insert into ruser values (null, ?,?,?,?,?)"; 
			pstmt = DB.prepStmt(conn, sql);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			pstmt.setString(3, phone);
			pstmt.setString(4, addr);
			pstmt.setTimestamp(5, rdate);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DB.closeStmt(pstmt);
			DB.closeConn(conn);
			
		}
				
	}
	
	public static List<User> getUsers(){
		List<User> list = new ArrayList<User>();
		Connection conn = null;
		ResultSet rs = null;
		try {
			conn = DB.getConn();
			String sql = "select * from ruser";
			rs = DB.executeQuery(conn, sql);
			while(rs.next()){
				User u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setAddr(rs.getString("addr"));
				u.setRdate(rs.getTimestamp("rdate"));
				list.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DB.closeRs(rs);
		}
		return list;
	}
	
	public static boolean userExists(String username){
		//check the table to find out if username exists or not
		//TODO
		return false;
	}
	
	public static boolean isPasswordCorrect(String username, String password){
		//TODO
		return false;
	}
	
	public static User validate(String username, String password) throws UserNotFoundException, PasswordNotCorrectException{
		Connection conn = null;
		ResultSet rs = null;
		User u = null;
		try {
			conn = DB.getConn();
			String sql = "select * from ruser where username = '" + username +"'"; 
			rs = DB.executeQuery(conn, sql);
			if(!rs.next()){
				throw new UserNotFoundException();
			}else if(!rs.getString("password").equals(password)){
				throw new PasswordNotCorrectException();
			}else{
				u = new User();
				u.setId(rs.getInt("id"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
				u.setPhone(rs.getString("phone"));
				u.setAddr(rs.getString("addr"));
				u.setRdate(rs.getTimestamp("rdate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DB.closeRs(rs);
			DB.closeConn(conn);
		}
		
		return u;
	}
	
	public void update(){
		Connection conn = null;
		PreparedStatement pstmt = null;	
		try {
			conn = DB.getConn();
			String sql = "update ruser set username = ?, phone = ?, addr = ? where id = " + this.id; 
			pstmt = DB.prepStmt(conn, sql);
			pstmt.setString(1, username);
			pstmt.setString(2, phone);
			pstmt.setString(3, addr);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DB.closeStmt(pstmt);
			DB.closeConn(conn);
			
		}	
	}
	
	
}







