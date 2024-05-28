package dao;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.Part;
import javax.sql.rowset.serial.SerialBlob;

import dto.User;
import dto.user;

public class Dao {

	public static Connection getconnection() throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db4 ","root","root");
		return con;
	}
	
	public int saveUser(user u) throws ClassNotFoundException, SQLException
	{
		Connection con = getconnection();
		PreparedStatement pst=con.prepareStatement("insert into db4.user values (?,?,?,?,?,?,?,?,?,?)");
		pst.setString(1, u.getName());
		pst.setString(2, u.getEmail());
		pst.setLong(3, u.getMobile());
		pst.setString(4, u.securityQuestion());
		pst.setString(5, u.getAnswer());
		pst.setString(6, u.getPassword());
		pst.setString(7, u.getAddress());
		pst.setString(8, u.getCity());
		pst.setString(9, u.getState());
		pst.setString(10, u.getCountry());
		
		int res=pst.executeUpdate();
		return res;	
	}
	
	
	public int addProduct(int id,String name,String cat,int price,String actice,byte[] image) throws ClassNotFoundException, SQLException {
		Connection con = getconnection();
		PreparedStatement pst = con.prepareStatement("insert into db4.product values (?,?,?,?,?,?)");
		pst.setInt(1, id);
		pst.setString(2, name);
		pst.setString(3, cat);
		pst.setLong(4, price);
		pst.setString(5, actice);
		
		Blob imageBlob = new SerialBlob(image) ;
		pst.setBlob(6, imageBlob);
		int res = pst.executeUpdate();
		return res;
		
	}
	
	public int update(int eid,String name,String cat,long price,String actice) throws ClassNotFoundException, SQLException
	{
		Connection con = getconnection();
		PreparedStatement pst = con.prepareStatement("update product set name=?,category=?,price=?,active=? where id=?");
		pst.setInt(5, eid);
		pst.setString(1, name);
		pst.setString(2, cat);
		pst.setLong(3, price);
		pst.setString(4, actice);
		
//		Blob imageBlob = new SerialBlob(image) ;
//		pst.setBlob(5, imageBlob);
		int res = pst.executeUpdate();
		return res;
	}
	
	public int deleteTaskById(int taskid) throws ClassNotFoundException, SQLException 
	{
		Connection con = getconnection();
		PreparedStatement pst = con.prepareStatement("delete from db4.product where id = ?");
		pst.setInt(1, taskid);
		int res = pst.executeUpdate();
		return res;	
	}
	
	public user findByEmail(String email) throws SQLException, ClassNotFoundException {
		Connection con = getconnection();
		PreparedStatement pst = con.prepareStatement("select * from db4.user where email = ?");
		pst.setString(1, email);
		ResultSet rs = pst.executeQuery();
		if(rs.next()) {
			
			//convert blob image to byte[]
//			Blob imageBlob = rs.getBlob(5);
//			byte[] image = imageBlob.getBytes(1, (int)imageBlob.length());

			user u = new user(rs.getString(1),rs.getString(2),rs.getLong(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10));
			
			return u;
			
		}
		else {
			return null;
		}
	}
	
	public int remove(int taskid) throws ClassNotFoundException, SQLException 
	{
		Connection con = getconnection();
		PreparedStatement pst = con.prepareStatement("delete from db4.cart where id = ?");
		pst.setInt(1, taskid);
		int res = pst.executeUpdate();
		return res;	
	}
	
	
}
