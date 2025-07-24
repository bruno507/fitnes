package si.am.fitnes2.Servleti;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import si.am.fitnes2.DBase.PackageHelper;
import si.am.fitnes2.DBase.UserHelper;

import java.io.IOException;

@WebServlet("/addPackage")
public class addPackage extends HttpServlet {

    public addPackage() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int type = Integer.parseInt(request.getParameter("tip"));
        int id = Integer.parseInt(request.getParameter("id"));

        if(type == 0) {
            int vis = Integer.parseInt(request.getParameter("obiski"));
            if (vis > 0){ UserHelper.changeVisit(id, vis); }
        }
        else if (type == 1)     {
            int idPac = Integer.parseInt(request.getParameter("idPac"));
            PackageHelper.addPackageSold(id, idPac);       }

        response.sendRedirect("usercheck?id=" + id);
    }
}