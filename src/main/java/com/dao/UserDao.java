package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.Instant;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;

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

	public UserDetails validateUser(UserDetails loginUser) {
		UserDetails user=new UserDetails();
		String query = "SELECT * FROM users where usermail=?";
		try (Connection con = getCon(); 
				PreparedStatement ps = con.prepareStatement(query)) {
			ps.setString(1, loginUser.getUsermail());
			ResultSet result=ps.executeQuery();
			if(result.next())
			{
				String storedHash=result.getString("password");
				if(BCrypt.checkpw(loginUser.getPassword(), storedHash))
				{
					 LocalDate dob = Instant.ofEpochSecond(result.getLong("age"))
                             .atZone(ZoneId.systemDefault())
                             .toLocalDate();
					user.setAge(Period.between(dob, LocalDate.now()).getYears());
					user.setGender(result.getString("gender"));
					user.setLocation(result.getString("location"));
					user.setPhoneNumber(result.getString("phonenumber"));
					user.setUsername(result.getString("username"));
					user.setUsermail(result.getString("usermail"));
					user.setUserId(result.getInt("user_id"));
					return user;
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
