package si.am.fitnes2.DBase;

import org.joda.time.DateTime;
import si.am.fitnes2.Entitete.Package;
import si.am.fitnes2.Entitete.PackageSold;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class PackageHelper {

	public static List<PackageSold> getPackageSold(int id) {

	try (Connection conn = DBase.getInstance().getConnection()){
		String sql1 = "SELECT package.title, package_sold.start, package_sold.end FROM user, package, package_sold WHERE package_sold.user_id=user.id AND package_sold.package_id=package.id AND user.id=? ORDER BY start DESC ;";

		PreparedStatement st = conn.prepareStatement(sql1);
		st.setInt(1,id);
		ResultSet rs2 = st.executeQuery();
		List<PackageSold> allPac = new ArrayList<>();

		while(rs2.next()){
			PackageSold pak = new PackageSold();
			pak.setTitle(rs2.getString(1));
			pak.setStart(rs2.getDate(2));
			pak.setEnd(rs2.getDate(3));
			allPac.add(pak);
		}
		return allPac;
 	}
	catch (SQLException | NullPointerException e){
		System.err.println("Izjema311");
		System.err.println(e.getMessage());
		throw new RuntimeException(e.getMessage());
		}
	}
	public static List<Package> getPackageDef() {

			try (Connection conn1 = DBase.getInstance().getConnection()){
			Statement st22 = conn1.createStatement();
			ResultSet rs22;
			rs22 = st22.executeQuery("SELECT package.* FROM package;");
			List<Package> allPac= new ArrayList<>();
			while(rs22.next()){
				Package pac = new Package();
				pac.setId(rs22.getInt(1));
				pac.setName(rs22.getString(2));
				pac.setDays(rs22.getInt(3));
				allPac.add(pac);
			}
			return allPac;
		}
		catch (Exception e){
			System.err.println("Izjema!312");
			System.err.println(e.getMessage());
			throw new RuntimeException(e.getMessage());
		}
	}
	public static void addPackageSold(int id, int idPac) {

		Timestamp date = new Timestamp(Calendar.getInstance().getTime().getTime());
		try (Connection conn = DBase.getInstance().getConnection()) {
			int dni=0;

			String sql1 = "SELECT days FROM package WHERE id=?;";
			PreparedStatement ps2 = conn.prepareStatement(sql1);
			ps2.setInt(1, idPac);
			ResultSet rs2 = ps2.executeQuery();
			while(rs2.next()){
				dni=rs2.getInt(1);
			}
			Timestamp konec= new Timestamp(new DateTime().plusDays(dni).getMillis());
			String vstavi = "INSERT into package_sold (start, end, user_id, package_id) VALUES (?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(vstavi);
			ps.setTimestamp(1, date);
			ps.setTimestamp(2, konec);
			ps.setInt(3, id);
			ps.setInt(4, idPac);
			ps.executeUpdate();
		}
		catch (SQLException e){
			System.err.println("Izjema!313");
			System.err.println(e.getMessage());
			throw new RuntimeException(e.getMessage());
		}
	}
} 