package si.am.fitnes2.Servleti;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.joda.time.DateTime;
import si.am.fitnes2.DBase.DropByHelper;

import java.io.IOException;

@WebServlet("/confirmVisit")
public class confirmVisit extends HttpServlet {

	private final long now = new DateTime().getMillis();

    public confirmVisit() {
        super();
        }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		long end = Long.parseLong(request.getParameter("package"));
		int visit = Integer.parseInt(request.getParameter("visit"));
		String status;

		if(end > now) {
			DropByHelper.addDropBy(id,0);
			status = "Obisk uspešno dodan";
		}
		else if (visit > 0) {
			DropByHelper.addDropBy(id,-1);
			status = "Obisk uspešno dodan";
		}
		else {
			status = "Vstop ni možen";
		}
		request.setAttribute("status", status);
		getServletContext().getRequestDispatcher("/visitList.jsp").forward(request, response);
	}
}