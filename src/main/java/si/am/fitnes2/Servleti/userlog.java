package si.am.fitnes2.Servleti;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/userlog")
public class userlog extends HttpServlet {


    public userlog() {
        super();
    }

	public void doGet(HttpServletRequest request, HttpServletResponse response) 
		    throws IOException, ServletException{

		    if (request.isUserInRole("1")) {
		        response.sendRedirect("user.jsp");
		    } else if (request.isUserInRole("2")){
		        response.sendRedirect("coach.jsp");
		    }	else if (request.isUserInRole("3")) {
		    	response.sendRedirect("staff.jsp");
		    } else response.sendRedirect("login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (request.isUserInRole("1")) {
			getServletContext().getRequestDispatcher("/user.jsp").forward(request, response);
		} else if (request.isUserInRole("2")){
			getServletContext().getRequestDispatcher("/coach.jsp").forward(request, response);
		}	else if (request.isUserInRole("3")) {
			getServletContext().getRequestDispatcher("/staff.jsp").forward(request, response);
		} else response.sendRedirect("login.jsp");
	}
}
