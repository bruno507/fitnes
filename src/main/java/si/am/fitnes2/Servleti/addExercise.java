package si.am.fitnes2.Servleti;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import si.am.fitnes2.DBase.ExerciseHelper;
import si.am.fitnes2.Entitete.Exercise;

import java.io.IOException;

@WebServlet("/addExercise")

public class addExercise extends HttpServlet {

    public addExercise() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Exercise exercise = new Exercise(
                request.getParameter("naziv"),
                request.getParameter("comment"),
                ExerciseHelper.cropLink(request.getParameter("link1")),
                ExerciseHelper.cropLink(request.getParameter("link2")),
                Integer.parseInt(request.getRemoteUser())
        );
        ExerciseHelper.addExercise(exercise);

            request.setAttribute("status", "Vaja uspešno dodana!");
            request.setAttribute("scroll", "allExercise");
            getServletContext().getRequestDispatcher("/coach.jsp").forward(request, response);
		}
}