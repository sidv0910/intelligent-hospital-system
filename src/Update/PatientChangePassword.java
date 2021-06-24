package Update;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class PatientChangePassword
 */
@WebServlet("/PatientChangePassword")
public class PatientChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientChangePassword() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession(false);
		
		if (session == null) {
			out.println("<script>");
			out.println("alert(\"Sorry, you haven't logged in. \\nPlease login first!\")");
			out.println("window.location.href=\"Patient-Login.html\"");
			out.println("</script>");
		}
		else {
			String old = request.getParameter("old");
			String repeat = request.getParameter("repeat");
			
			if (repeat.equals(session.getAttribute("pword").toString())) {
				out.println("<script>");
				out.println("alert(\"New Password can't be the same as Current Password.\\nRetry!\")");
				out.println("window.location.href=\"PatientChangePassword.jsp\"");
				out.println("</script>");
			}
			else {
				if (old.equals(session.getAttribute("pword").toString())) {
					try {
						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/intelligent_hospital_system", "EP_Practical", "190032121");
						
						String query = "update patient set password=? where patient_id=?";
						PreparedStatement pstmt = conn.prepareStatement(query);
						pstmt.setString(1, repeat);
						pstmt.setString(2, session.getAttribute("pid").toString());
						int rs = pstmt.executeUpdate();
						
						if (rs > 0) {
							session.setAttribute("pword", repeat);
							out.println("<script>");
							out.println("alert(\"Password Changed Successfully\")");
							out.println("window.location.href=\"Patient-Login-Home.jsp\"");
							out.println("</script>");
						}
						else {
							out.println("<script>");
							out.println("alert(\"Unable to Change Password.\\nRetry!\")");
							out.println("window.location.href=\"PatientChangePassword.jsp\"");
							out.println("</script>");
						}
					}
					catch (ClassNotFoundException e) {
						out.println("<script>");
						out.println("alert(\"Unable to Change Password.\\nRetry!\")");
						out.println("window.location.href=\"PatientChangePassword.jsp\"");
						out.println("</script>");
					}
					catch (SQLException e) {
						out.println("<script>");
						out.println("alert(\"Unable to Change Password.\\nRetry!\")");
						out.println("window.location.href=\"PatientChangePassword.jsp\"");
						out.println("</script>");
					}
				}
				else {
					out.println("<script>");
					out.println("alert(\"Wrong Current Password.\\nRetry!\")");
					out.println("window.location.href=\"PatientChangePassword.jsp\"");
					out.println("</script>");
				}
			}
		}
	}
}