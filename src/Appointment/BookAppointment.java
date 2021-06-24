package Appointment;

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
 * Servlet implementation class BookAppointment
 */
@WebServlet("/BookAppointment")
public class BookAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookAppointment() {
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
			String patient_id = session.getAttribute("pid").toString();
			String doctor_id = request.getParameter("doctor_id");
			String symptoms = request.getParameter("symptoms");
			String date = request.getParameter("date");
			String time = request.getParameter("time");
			int height = Integer.parseInt(request.getParameter("height"));
			int weight = Integer.parseInt(request.getParameter("weight"));
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/intelligent_hospital_system", "EP_Practical", "190032121");
				
				String query = "select * from appointments where patient_id=? and doctor_id=? and date=? and time=?";
				PreparedStatement pstmt = conn.prepareStatement(query);
				pstmt.setString(1, patient_id);
				pstmt.setString(2, doctor_id);
				pstmt.setString(3, date);
				pstmt.setString(4, time);
				ResultSet rs = pstmt.executeQuery();
				if (rs.next()) {
					out.println("<script>");
					out.println("alert('You have already booked an appointment with this doctor for the given date and time.');");
					out.println("window.location.href=\"PatientBookAppointment.jsp\";");
					out.println("</script>");
				}
				else {
					query = "insert into appointments(patient_id, doctor_id, symptoms, date, time, height, weight) values(?, ?, ?, ?, ?, ?, ?)";
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, patient_id);
					pstmt.setString(2, doctor_id);
					pstmt.setString(3, symptoms);
					pstmt.setString(4, date);
					pstmt.setString(5, time);
					pstmt.setInt(6, height);
					pstmt.setInt(7, weight);
					int res = pstmt.executeUpdate();
					if (res > 0) {
						out.println("<script>");
						out.println("alert('Success!\\nYour appointment has been successfully booked.\\n\\nKeep checking Appointment History regarding updates for your appointment.\\nPay the fee at the time of visit.');");
						out.println("window.location.href=\"Patient-Login-Home.jsp\";");
						out.println("</script>");
					}
					else {
						out.println("<script>");
						out.println("alert('Request Failed!\\nUnable to book the appointment.');");
						out.println("window.location.href=\"Patient-Login-Home.jsp\";");
						out.println("</script>");
					}
				}
			}
			catch (ClassNotFoundException e) {
				out.println("<script>");
				out.println("alert('Request Failed!\\nUnable to book the appointment.');");
				out.println("window.location.href=\"Patient-Login-Home.jsp\";");
				out.println("</script>");
			}
			catch (SQLException e) {
				out.println("<script>");
				out.println("alert('Request Failed!\\nUnable to book the appointment.');");
				out.println("window.location.href=\"Patient-Login-Home.jsp\";");
				out.println("</script>");
			}
			catch (NullPointerException e) {
				out.println("<script>");
				out.println("alert('Request Failed!\\nUnable to book the appointment.');");
				out.println("window.location.href=\"Patient-Login-Home.jsp\";");
				out.println("</script>");
			}
		}
	}
}