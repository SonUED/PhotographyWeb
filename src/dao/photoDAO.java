package dao;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import beans.Image;
import beans.Photo;
import beans.Userr;
import db.ConnectSQL;

public class photoDAO {
	public static List<Photo> getAllPhoto(Connection conn){
		List<Photo> listPhoto = new ArrayList<>();
		
		String sql = "select * from List_Photo";
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				int iD = rs.getInt("ID");
			 String namePhoto = rs.getString("Name_Service_Photo");
			 float price = rs.getFloat("Price_Photo");
			 String description = rs.getString("Title");
			 Photo photo = new Photo(iD,namePhoto, price, description);
			 listPhoto.add(photo);	 
			}
			rs.close();
			pst.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listPhoto;
	}
	public static List<Image> getAllImage(Connection conn){
		List<Image> listImage = new ArrayList<>();
		String sql = "select * from Image";
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				int iD = rs.getInt("id");
				String name = rs.getString("name");
				Blob blob = rs.getBlob("image");
				InputStream inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                 
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);                  
                }
                 
                byte[] imageBytes = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
            
        		Image image = new Image(iD,name, base64Image);
				listImage.add(image);
				inputStream.close();
	            outputStream.close();
			}
			rs.close();
			pst.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listImage;
	}
	//Count User
	public static int countUser(Connection conn){
		String sql = " SELECT COUNT(user) as countUser FROM Login";
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				int counttUser = rs.getInt("countUser");
				return counttUser;
			}
			rs.close();
			pst.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	//Count Service 
	public static int countService(Connection conn) {
		String sql = "Select count(id) as countSer from List_Photo";
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				int countSer = rs.getInt("countSer");
				return countSer;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}
	//Count Img
	public static int countImg(Connection conn) {
		String sql = "Select count(id) as countImg from Image";
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				int countImg = rs.getInt("countImg");
				return countImg;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}
	//ListUser 
	public static List<Userr> listUser(Connection conn){
		List<Userr> listUser = new ArrayList<Userr>();
		String sql = "select * from Login ";
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String user = rs.getString("userr");
				String location = rs.getString("location");
				String decent = rs.getString("decent");
				Userr userr = new Userr(id, name, user,location,decent);
				listUser.add(userr);
			}
			rs.close();
			pst.close();	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listUser;
	}
	Connection conn = ConnectSQL.getConnection();
	public static boolean insertPhoto(Photo photo,Connection conn ) throws SQLException{
		String sql = "insert into List_Photo(Name_Service_Photo, Price_Photo,Title) values (?,?,?)";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setString(1, photo.getName());
		pst.setFloat(2, photo.getPrice());
		pst.setString(3, photo.getDes());
		boolean rowInserted = pst.executeUpdate() >0;
		pst.close();
		conn.close();
		return rowInserted;
		
	}
	public static boolean deletePhoto(Connection conn,Photo photo) throws SQLException{
		String sql = "Delete from List_Photo where ID = ?";
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, photo.getId());
			if(pst.executeUpdate()>0) {
				return true;
			}
		pst.close();	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public static boolean updatePhoto(Connection conn,Photo photo) throws SQLException{
		String sql = "update List_Photo set Name_Service_Photo = ? ,Price_Photo=?,Title=? where ID = ? ";
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, photo.getName());
			pst.setFloat(2, photo.getPrice());
			pst.setString(3, photo.getDes());
			pst.setInt(4, photo.getId());
			if(pst.	executeUpdate() >0) {
				return true;	
			}
			pst.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
}
	public static Photo getPhoto(Connection conn, int id) throws SQLException{
		Photo photo = null;
		String sql = "select * from List_Photo where ID = ?";
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				int iD = rs.getInt("ID");
				String name = rs.getString("Name_Service_Photo");
				float price = rs.getFloat("Price_Photo");
				String des = rs.getString("Title");
				photo = new Photo(iD,name, price, des);
			}
			rs.close();
			pst.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return photo;
	}
	public static boolean deleteImg(Connection conn, Image img) throws SQLException {
		String sql = "Delete from Image where id = ?";
		try {
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, img.getId());
			if(pst.executeUpdate()>0) {
				return true;
			}
		pst.close();	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
