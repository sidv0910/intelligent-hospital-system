package Login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DoctorLogout
 */
@WebServlet("/DoctorLogout")
public class DoctorLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorLogout() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession(false);
		
		if(session != null)
		{
			session.invalidate();
			out.println("<script>");
			out.println("alert(\"Doctor Logged Out Successfully\")");
			out.println("window.location.href = \"Home.html\";");
			out.println("</script>");
		}
		else
		{
			out.println("<script>");
			out.println("alert(\"Doctor Not Logged In. \\nPlease Login!\")");
			out.println("window.location.href = \"Doctor-Login.html\";");
			out.println("</script>");
		}
		
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
