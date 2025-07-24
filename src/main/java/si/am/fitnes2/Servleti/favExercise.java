package si.am.fitnes2.Servleti;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import si.am.fitnes2.DBase.ExerciseHelper;

import java.io.IOException;

@WebServlet("/favExercise")
public class favExercise extends HttpServlet{


	public favExercise() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int add = Integer.parseInt(request.getParameter("add"));
		int idExe = Integer.parseInt(request.getParameter("idExe"));
		int userID = Integer.parseInt(request.getRemoteUser());

		if(add == 0) {
			ExerciseHelper.removeFavExercise(idExe, userID);
		}
		else if(add == 1) {
			ExerciseHelper.addFavExercise(idExe, userID);
		}
		 response.sendRedirect("user.jsp#favExercise");
	}
}