package si.am.fitnes2.Servleti;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import si.am.fitnes2.DBase.ExerciseHelper;

import java.io.IOException;

@WebServlet("/deleteExercise")
public class deleteExercise extends HttpServlet {

	public deleteExercise() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ExerciseHelper.deleteExercise(Integer.parseInt(request.getParameter("idExe")));

		request.setAttribute("status", "Vaja uspešno izbrisana!");
		request.setAttribute("scroll", "allExercise");
		getServletContext().getRequestDispatcher("/coach.jsp").forward(request, response);
	}
}