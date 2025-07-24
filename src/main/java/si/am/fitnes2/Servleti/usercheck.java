package si.am.fitnes2.Servleti;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import si.am.fitnes2.DBase.PackageHelper;
import si.am.fitnes2.DBase.UserHelper;
import si.am.fitnes2.Entitete.PackageSold;
import si.am.fitnes2.Entitete.User;

import java.io.IOException;
import java.util.List;

@WebServlet("/usercheck")
public class usercheck extends HttpServlet {

    public usercheck() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		User user = UserHelper.getUser(id);
		List<PackageSold> allPac = PackageHelper.getPackageSold(id);
		if(user!=null && user.getRole() == 1) {
			request.setAttribute("user", user);
			request.setAttribute("paketi", allPac);
			getServletContext().getRequestDispatcher("/userData.jsp").forward(request, response);
		}
		else {
			request.setAttribute("eror", "Iskani uporabnik ni član!");
			request.setAttribute("scroll", "members");
			getServletContext().getRequestDispatcher("/staff.jsp").forward(request, response);
		}
	}
}