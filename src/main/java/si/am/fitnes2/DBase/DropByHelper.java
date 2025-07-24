package si.am.fitnes2.DBase;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class DropByHelper {

	public static void addDropBy(int id, int visit) {
	try(Connection conn = DBase.getInstance().getConnection()) {
			
			String sql = "INSERT INTO visit (user_id, arrival)VALUES(?, NOW())";
			if (visit == -1) {
				UserHelper.changeVisit(id, visit);
			}
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1,id);
			ps.executeUpdate();
		}
		catch (Exception e){
			System.err.println("Izjema!111");
			System.err.println(e.getMessage());
			throw new RuntimeException(e.getMessage());
		}
	}
	public static List<String> allDropBy(int id){
		SimpleDateFormat f = new SimpleDateFormat("d. MMMM yyyy HH:mm");

		try (Connection conn1 = DBase.getInstance().getConnection()) {
			
			String sql = "SELECT arrival FROM user, visit WHERE user_id=user.id AND user.id=? ORDER BY visit.arrival DESC;";
			PreparedStatement ps = conn1.prepareStatement(sql);
			ps.setInt(1,id);
			ResultSet rs2 = ps.executeQuery();
			List<String> all = new ArrayList<>();
			while (rs2.next()) {
				all.add(f.format(rs2.getTimestamp(1)));
			}
			return all;
		}
		catch (SQLException | NullPointerException e) {
		System.err.println("Izjema!112");
		System.err.println(e.getMessage());
		throw new RuntimeException(e.getMessage());
	}	
}}