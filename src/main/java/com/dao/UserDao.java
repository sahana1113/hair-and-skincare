package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.mindrot.jbcrypt.BCrypt;

import com.config.HikariCPDataSource;
import com.pojo.UserDetails;

public class UserDao {
	public Connection getCon() throws SQLException {
		return HikariCPDataSource.getConnection();
	}

	public boolean userRegister(UserDetails user) {
		int rs = 0;
		String hash = hashPassword(user.getPassword());
		String query = "INSERT INTO users(username,password,usermail,phonenumber,age,gender,location) VALUES(?,?,?,?,?,?,?) ";
		try (Connection con = getCon(); 
				PreparedStatement ps = con.prepareStatement(query)) {
			ps.setString(1, user.getUsername());
			ps.setString(2, hash);
			ps.setString(3, user.getUsermail());
			ps.setString(4, user.getPhoneNumber());
			ps.setLong(5, user.getAge());
			ps.setString(6, user.getGender());
			ps.setString(7, user.getLocation());
			rs = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs > 0;
	}

	public String hashPassword(String password) {
		return BCrypt.hashpw(password, BCrypt.gensalt());
	}

	public int validateUser(UserDetails loginUser) {
		int rs = 0;
		String query = "SELECT password,user_id FROM users where usermail=?";
		try (Connection con = getCon(); 
				PreparedStatement ps = con.prepareStatement(query)) {
			ps.setString(1, loginUser.getUsermail());
			ResultSet result=ps.executeQuery();
			if(result.next())
			{
				String storedHash=result.getString("password");
				if(BCrypt.checkpw(loginUser.getPassword(), storedHash))
				{
					rs=result.getInt("user_id");
					return rs;
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

}
