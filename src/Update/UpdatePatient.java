package Update;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UpdatePatient
 */
@WebServlet("/UpdatePatient")
public class UpdatePatient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePatient() {
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
	
		String marital = request.getParameter("marital");
		if (marital == null) {
			marital = request.getParameter("hidden");
		}
		int age = Integer.parseInt(request.getParameter("age"));
		String profession = request.getParameter("profession");
		long mobile = Long.parseLong(request.getParameter("mobile"));
		String address = request.getParameter("address");
		String emgName = request.getParameter("emgName");
		String emgRelation = request.getParameter("emgRelation");
		long emgContact = Long.parseLong(request.getParameter("emgContact"));
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/intelligent_hospital_system", "EP_Practical", "190032121");
			
			String sql = "update patient set marital=?, age=?, profession=?, mobile=?, address=?, emgName=?, emgRelation=?, emgContact=? where patient_id=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, marital);
			pstmt.setInt(2, age);
			pstmt.setString(3, profession);
			pstmt.setLong(4, mobile);
			pstmt.setString(5, address);
			pstmt.setString(6, emgName);
			pstmt.setString(7, emgRelation);
			pstmt.setLong(8, emgContact);
			pstmt.setString(9, session.getAttribute("pid").toString());
			
			int rs = pstmt.executeUpdate();
			
			if (rs > 0) {
				out.println("<script>");
				out.println("alert(\"Profile Updated Successfully.\");");
				out.println("window.location.href = \"PatientViewProfile.jsp\";");
				out.println("</script>");
			}
			else {
				out.println("<script>");
				out.println("alert(\"Unable to Update your Profile.\");");
				out.println("window.location.href = \"PatientUpdateProfile.jsp\";");
				out.println("</script>");
			}
			out.close();
		}
		catch (ClassNotFoundException e)
		{
			out.println("<script>");
			out.println("alert(\"Unable to Update your Profile.\");");
			out.println("window.location.href = \"PatientUpdateProfile.jsp\";");
			out.println("</script>");
			out.close();
			
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			out.println("<script>");
			out.println("alert(\"Unable to Update your Profile.\");");
			out.println("window.location.href = \"PatientUpdateProfile.jsp\";");
			out.println("</script>");
			out.close();
			
			e.printStackTrace();
		}
		catch (NumberFormatException e) 
		{
			out.println("<script>");
			out.println("alert(\"Unable to Update your Profile.\");");
			out.println("window.location.href = \"PatientUpdateProfile.jsp\";");
			out.println("</script>");
			out.close();
			
			e.printStackTrace();
		}
	}
}
