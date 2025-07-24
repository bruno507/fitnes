package si.am.fitnes2.DBase;

import jakarta.xml.bind.DatatypeConverter;
import si.am.fitnes2.Entitete.User;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserHelper {

	public static User getUser(int id) {

		try (Connection conn = DBase.getInstance().getConnection()){
		String sql = "SELECT * FROM user WHERE id=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
		User user = new User();
		user.setId(rs.getInt(1));
		user.setName(rs.getString(2));
		user.setLastN(rs.getString(3));
		user.setEmail(rs.getString(4));
		user.setPassword(rs.getString(5));
		user.setRole(rs.getInt(6));
		user.setVisit(rs.getInt(7));

		return user;
		}

		else return null;

		} catch (SQLException e) {
			System.err.println("Izjema!411");
			System.err.println(e.getMessage());
			throw new RuntimeException(e.getMessage());
		}
	}

	public static void changePass(int id, String newPass) {
		try (Connection conn = DBase.getInstance().getConnection()){

			String sql = "UPDATE user SET pass=? WHERE id=?;";
			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, encrypt(newPass));
			st.setInt(2, id);
			st.executeUpdate();

		}catch (SQLException e) {
			System.err.println("Izjema!412");
			System.err.println(e.getMessage());
			throw new RuntimeException(e.getMessage());
	}}

	public static void changeVisit(int id, int visit) {

		try (Connection conn = DBase.getInstance().getConnection()) {

			String sql = "UPDATE user SET visits=visits+? WHERE id=?;";
			PreparedStatement ps2 = conn.prepareStatement(sql);
			ps2.setInt(1, visit);
			ps2.setInt(2, id);
			ps2.executeUpdate();
		}
		catch (SQLException e) {
			System.err.println("Izjema!413");
			System.err.println(e.getMessage());
			throw new RuntimeException(e.getMessage());
		}
	}
	public static int addUser(User u) {

		try(Connection conn = DBase.getInstance().getConnection()) {

			String sql = "INSERT INTO user (name,last_name,email,pass,role,visits) VALUES (?, ?, ?, ?, ?, ?)";
			String sql1 = "SELECT LAST_INSERT_ID()";
			PreparedStatement ps = conn.prepareStatement(sql);
			PreparedStatement ps1 = conn.prepareStatement(sql1);
			ps.setString(1, u.getName());
			ps.setString(2, u.getLastN());
			ps.setString(3, u.getEmail());
			ps.setString(4, encrypt(u.getPassword()));
			ps.setInt(5, u.getRole());
			if(u.getRole() == 1){
				ps.setInt(6,0);
			}
			else {
				ps.setNull(6,4);
			}
			ps.executeUpdate();
			ResultSet rs = ps1.executeQuery();
			rs.next();
            return rs.getInt(1);

		} catch (Exception e){
			System.err.println("Izjema!414");
			System.err.println(e.getMessage());
			throw new RuntimeException();
		}
	}
	public static List<User> getAllUsers(int role) {

		try (Connection conn = DBase.getInstance().getConnection()) {
			String sql = "select * from user where role = ? order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, role);
			ResultSet rs = ps.executeQuery();
			List<User> allUsers = new ArrayList<>();
			while (rs.next()) {
				User u = new User(rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4));
				allUsers.add(u);
			}
			return allUsers;
		}
		catch (Exception e) {
			System.err.println("Izjema!415");
			System.err.println(e.getMessage());
			throw new RuntimeException();
		}
	}
	public static String encrypt(String xx) {
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(xx.getBytes(StandardCharsets.UTF_8));
			return DatatypeConverter.printHexBinary(hash);
		}
		catch (Exception e) {
			System.err.println("Izjema!211");
			System.err.println(e.getMessage());
			throw new RuntimeException(e.getMessage());
		}
	}
}