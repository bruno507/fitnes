package si.am.fitnes2.Servleti;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import si.am.fitnes2.DBase.UserHelper;
import si.am.fitnes2.Entitete.User;

import java.io.IOException;
import java.util.UUID;

@WebServlet("/addUser")
public class addUser extends HttpServlet {

    public addUser() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

       String name = request.getParameter("name");
       String name2 = request.getParameter("name2");
       String email = request.getParameter("email");
       String password = UUID.randomUUID().toString().substring(0,4);
       int role = Integer.parseInt(request.getParameter("role"));
       User user = new User(name, name2, email, password, role);
       int id = UserHelper.addUser(user);
       user.setId(id);

       request.setAttribute("user", user);
       getServletContext().getRequestDispatcher("/userAdded.jsp").forward(request, response);
    }
}