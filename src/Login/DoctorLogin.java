package Login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DoctorLogin
 */
@WebServlet("/DoctorLogin")
public class DoctorLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorLogin() {
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
		String did = request.getParameter("did");
		String uname = request.getParameter("uname");
		String pword = request.getParameter("pword");
		
		PrintWriter out = response.getWriter();
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/intelligent_hospital_system", "EP_Practical", "190032121");
			
			String sql = "select * from doctor where doctor_id=? and username=? and password=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, did);
			pstmt.setString(2, uname);
			pstmt.setString(3, pword);
			
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next())
			{
				
				HttpSession session = request.getSession(true);
				session.setAttribute("did", did);
				session.setAttribute("uname", uname);
				session.setAttribute("pword", pword);
				
				out.println("<script>");
				out.println("alert(\"Doctor Login Successful.\")");
				out.println("window.location.href = \"DoctorLoginHome.jsp\";");
				out.println("</script>");
			}
			else
			{
				out.println("<script>");
				out.println("alert(\"Doctor Login Failed. \\nPlease Retry.\")");
				out.println("window.location.href = \"Doctor-Login.html\";");
				out.println("</script>");
			}
			
			out.close();
		}
		catch (ClassNotFoundException e)
		{
			out.println("<script>");
			out.println("alert(\"Doctor Login Failed. \\nPlease Retry.\")");
			out.println("window.location.href = \"Doctor-Login.html\";");
			out.println("</script>");
			out.close();
			
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			out.println("<script>");
			out.println("alert(\"Doctor Login Failed. \\nPlease Retry.\")");
			out.println("window.location.href = \"Doctor-Login.html\";");
			out.println("</script>");
			out.close();
			
			e.printStackTrace();
		}
	}

}
