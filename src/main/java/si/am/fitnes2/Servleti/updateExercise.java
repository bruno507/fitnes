package si.am.fitnes2.Servleti;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import si.am.fitnes2.DBase.ExerciseHelper;
import si.am.fitnes2.Entitete.Exercise;

import java.io.IOException;

@WebServlet("/updateExercise")
public class updateExercise extends HttpServlet {

	public updateExercise() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Exercise exercise = ExerciseHelper.getExercise(Integer.parseInt(request.getParameter("id")));

		exercise.setTitle(request.getParameter("title"));
		exercise.setDescription(request.getParameter("comment"));
		exercise.setLink1(ExerciseHelper.cropLink(request.getParameter("link1")));
		exercise.setLink2(ExerciseHelper.cropLink(request.getParameter("link2")));

		ExerciseHelper.updateExercise(exercise);

		request.setAttribute("status", "Vaja uspešno spremenjena!");
		getServletContext().getRequestDispatcher("/exerciseInfo.jsp?idExercise="+exercise.getId()).forward(request, response);
	}
}