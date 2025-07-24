package si.am.fitnes2.DBase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import si.am.fitnes2.Entitete.Exercise;

public class ExerciseHelper {

	public static List<Exercise> allExercise() {
		List<Exercise> allExe = new ArrayList<>();
		try (Connection conn = DBase.getInstance().getConnection()) {
			String sql = "SELECT * FROM exercise";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				allExe.add(setExercise(rs));
			}
		}
		catch (SQLException | NullPointerException e) {
			System.err.println("Izjema!511");
			System.err.println(e.getMessage());
			throw new RuntimeException(e.getMessage());
		}
		return allExe;
	}
	public static Exercise getExercise(int id) {
		try (Connection conn = DBase.getInstance().getConnection()) {

			String sql = "SELECT * FROM exercise WHERE id = ?;";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			rs.next();
			return setExercise(rs);
		}
		catch (SQLException | NullPointerException e) {
			System.err.println("Izjema!512");
			System.err.println(e.getMessage());
			throw new RuntimeException(e.getMessage());
		}
	}
	private static Exercise setExercise(ResultSet rs) throws SQLException {
		Exercise exercise = new Exercise();
		exercise.setId(rs.getInt(1));
		exercise.setTitle(rs.getString(2));
		exercise.setDescription(rs.getString(3));
		exercise.setLink1(rs.getString(4));
		exercise.setLink2(rs.getString(5));
		exercise.setCoach(rs.getInt(6));
		return exercise;
	}
	public static ArrayList<Exercise> getUserFavExercise(int id) {
		ArrayList<Exercise> allExe = new ArrayList<>();
		String SQL = "SELECT exercise.* FROM exercise_fav, exercise WHERE exercise_fav.exercise_id = exercise.id AND exercise_fav.user_id = ? ;";

		try (Connection conn = DBase.getInstance().getConnection()) {

			PreparedStatement ps = conn.prepareStatement(SQL);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				allExe.add(setExercise(rs));
			}
		}
		catch (SQLException | NullPointerException e) {
			System.err.println("Izjema!513");
			System.err.println(e.getMessage());
			throw new RuntimeException(e.getMessage());
		}
		return allExe;
	}
	public static void addFavExercise(int idExe, int idUser) {

		String SQL = "INSERT INTO exercise_fav VALUES (?, ?);";
		try (Connection conn = DBase.getInstance().getConnection()) {

			PreparedStatement ps = conn.prepareStatement(SQL);
			ps.setInt(1, idExe);
			ps.setInt(2, idUser);
			ps.execute();
		}
		catch (SQLException | NullPointerException e) {
			System.err.println("Izjema!514");
			System.err.println(e.getMessage());
			throw new RuntimeException(e.getMessage());
		}
	}
	public static void removeFavExercise(int idExe, int idUser) {
		String SQL = "DELETE FROM exercise_fav WHERE exercise_id = ? AND user_id = ?;";
		try (Connection conn = DBase.getInstance().getConnection()) {

			PreparedStatement ps = conn.prepareStatement(SQL);
			ps.setInt(1, idExe);
			ps.setInt(2, idUser);
			ps.execute();
		}
		catch (SQLException | NullPointerException e) {
			System.err.println("Izjema!515");
			System.err.println(e.getMessage());
			throw new RuntimeException(e.getMessage());
		}		
	}
	public static void updateExercise(Exercise exercise) {
		try (Connection conn = DBase.getInstance().getConnection()) {

			String sql = "UPDATE exercise SET title = ?, description = ?, link1 = ?, link2 = ? WHERE id=?;";

			PreparedStatement st = conn.prepareStatement(sql);
			st.setString(1, exercise.getTitle());
			st.setString(2, exercise.getDescription());
			st.setString(3, exercise.getLink1());
			st.setString(4, exercise.getLink2());
			st.setInt(5, exercise.getId());
			st.executeUpdate();
		}
		catch (SQLException | NullPointerException e) {
			System.err.println("Izjema!516");
			System.err.println(e.getMessage());
			throw new RuntimeException(e.getMessage());
		}
	}
	public static void addExercise(Exercise exercise) {
		try (Connection conn = DBase.getInstance().getConnection()) {

			String sql = "INSERT INTO exercise (title, description, link1, link2, user_id) VALUES (?,?,?,?,?)";

			PreparedStatement st = conn.prepareStatement(sql);

			st.setString(1, exercise.getTitle());
			st.setString(2, exercise.getDescription());
			st.setString(3, exercise.getLink1());
			st.setString(4, exercise.getLink2());
			st.setInt(5, exercise.getCoach());

			st.executeUpdate();
		}
		catch (SQLException | NullPointerException e) {
			System.err.println("Izjema!517");
			System.err.println(e.getMessage());
			throw new RuntimeException(e.getMessage());
		}
	}
	public static void deleteExercise(int idExe) {
		try (Connection conn = DBase.getInstance().getConnection()) {

			String sql = "DELETE FROM exercise WHERE id=?;";
			String sql1 = "DELETE FROM exercise_fav WHERE exercise_id=?;";

			PreparedStatement st = conn.prepareStatement(sql);
			st.setInt(1, idExe);
			st.executeUpdate();

			PreparedStatement st1 = conn.prepareStatement(sql1);
			st1.setInt(1, idExe);
			st1.executeUpdate();
		}
		catch (SQLException | NullPointerException e) {
			System.err.println("Izjema!518");
			System.err.println(e.getMessage());
			throw new RuntimeException(e.getMessage());
		}
	}
	public static String cropLink(String x) {
		String pattern = "(?<=watch\\?v=|.be/|/videos/|embed/)[^#]{11}";
		Pattern compiledPattern = Pattern.compile(pattern);
		Matcher matcher1 = compiledPattern.matcher(x);
		if(matcher1.find()){
			return matcher1.group();
		}else{
			return null;
		}
	}
}