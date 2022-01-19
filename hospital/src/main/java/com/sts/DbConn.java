package com.sts;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DbConn {
	Connection con;
	Statement stmt;
	PreparedStatement pst;

	public DbConn() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root", "Tiger@6");

			stmt = con.createStatement();

		} 
		catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public ResultSet display() throws SQLException {
		String str = "select * from patient";
		ResultSet rs = stmt.executeQuery(str);
		return rs;
	}

	public void insertuser(String name, String email, String phone, String address) throws SQLException {
		String str = "insert into patient(name,emailid,phone,address) values('" + name + "','" + email + "','"
				+ phone + "','" + address + "')";
		stmt.executeUpdate(str);
	}
	public void updateuser(int id, String name, String email,String phone, String address) throws SQLException {
		String str = "update patient set name='" + name + "', emailid='" + email + "', phone='"+ phone + "', address='"
				+ address + "' where id=" + id;
		stmt.executeUpdate(str);
	}
	
	public ResultSet displayuser(int id) throws SQLException {
		String str = "select * from patient where id="+id;
		ResultSet rs = stmt.executeQuery(str);
		return rs;
	}
	public void deluser(int id) throws SQLException {
		String str = "delete from patient where id="+id;
		stmt.executeUpdate(str);
		
	}
	public ResultSet displayuserrecord(int id) throws SQLException {
		String str = "select * from medicalrecords where patientid="+id;
		ResultSet rs = stmt.executeQuery(str);
		return rs;
	}
	public void insertrecord(int pid,String doc,String tablet,String doctor,String disease,String nextvisit) throws SQLException {
		String str = "insert into medicalrecords(patientid,doc,tablet,doctor,disease,nextvisit) values("+pid+",'" + doc + "','" + tablet + "','"
				+ doctor + "','" + disease + "','" + nextvisit + "')";
		stmt.executeUpdate(str);
	}
}
