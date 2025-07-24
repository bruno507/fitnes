package si.am.fitnes2.Servleti;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import si.am.fitnes2.DBase.UserHelper;
import si.am.fitnes2.Entitete.User;

import java.io.IOException;

@WebServlet("/changePass")
public class changePass extends HttpServlet {


    public changePass() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String status;
		int id = Integer.parseInt(request.getRemoteUser());
		String oldPass = UserHelper.encrypt(request.getParameter("old"));
		String newPass = request.getParameter("new");
		User user = UserHelper.getUser(id);
		assert user != null;
		if(user.getPassword().equalsIgnoreCase(oldPass)){
			UserHelper.changePass(id, newPass);
			status = "Uspešno ste spremenili geslo!";
		}
		else {
			status = "Vpisali ste napačno trenutno geslo!";
		}
		request.setAttribute("passStatus", status);
		request.setAttribute("scroll", "changePass");
		getServletContext().getRequestDispatcher("/userlog").forward(request, response);
	}
}