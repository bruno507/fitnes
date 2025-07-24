package si.am.fitnes2.Servleti;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import si.am.fitnes2.DBase.UserHelper;

import java.io.IOException;
import java.util.UUID;

@WebServlet("/resetPass")
public class resetPass extends HttpServlet {

	public resetPass() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		String ran = UUID.randomUUID().toString().substring(0,4);
		UserHelper.changePass(id, ran);

		request.setAttribute("new", ran);

		getServletContext().getRequestDispatcher("/passReset.jsp").forward(request, response);
	}
}
