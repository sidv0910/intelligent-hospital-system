package Register;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DoctorRegister
 */
@WebServlet("/DoctorRegister")
public class DoctorRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorRegister() {
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
		
		try
		{
			String uname = request.getParameter("uname");
			String email = request.getParameter("email");
			String pword = request.getParameter("pword");
			String fname = request.getParameter("fname");
			String mname = request.getParameter("mname");
			String lname = request.getParameter("lname");
			String name = "";
			if (mname.equals("") || mname == null)
				name = fname + " " + lname;
			else
				name = fname + " " + mname + " " + lname;
			name = "Dr. " + name;
			String dob = request.getParameter("dob");
			int age = Integer.parseInt(request.getParameter("age"));
			String pob = request.getParameter("pob");
			String gender = request.getParameter("gender");
			String legal = request.getParameter("legal");
			String marital = request.getParameter("marital");
			int noc = Integer.parseInt(request.getParameter("noc"));
			String citizen = request.getParameter("citizen");
			String address = request.getParameter("address");
			long mobile = Long.parseLong(request.getParameter("mobile"));
			String position = request.getParameter("position");
			int salary = Integer.parseInt(request.getParameter("salary"));
			String time = request.getParameter("time");
			
			String college1 = request.getParameter("college1");
			String location1 = request.getParameter("location1");
			String degree1 = request.getParameter("degree1");
			String from1 = request.getParameter("from1");
			String to1 = request.getParameter("to1");
			String college2 = request.getParameter("college2");
			String location2 = request.getParameter("location2");
			String degree2 = request.getParameter("degree2");
			String from2 = request.getParameter("from2");
			String to2 = request.getParameter("to2");
			String college3 = request.getParameter("college3");
			college3 = (college3.equals("")) ? null : college3;
			String location3 = request.getParameter("location3");
			location3 = (location3.equals("")) ? null : location3;
			String degree3 = request.getParameter("degree3");
			degree3 = (degree3.equals("")) ? null : degree3;
			String from3 = request.getParameter("from3");
			from3 = (from3.equals("")) ? null : from3;
			String to3 = request.getParameter("to3");
			to3 = (to3.equals("")) ? null : to3;
			
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/intelligent_hospital_system", "EP_Practical", "190032121");
				
				if (legal.equals("No"))
				{
					out.println("<script>");
					out.println("alert(\"You are not legally entitled to work as a doctor in this hospital.\");");
					out.println("window.location.href = \"Home.html\";");
					out.println("</script>");
					out.close();
				}
				else
				{
					PreparedStatement pstmt;
					
					String sql1 = "select doctor_id from doctor where doctor_id=?";
					String sql2 = "insert into doctor values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
					String sql3 = "select email from doctor where email=?";
					String sql4 = "insert into doctor_details values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
					
					String did = ""; 
					
					boolean check = false;
					
					while (check == false)
					{
						pstmt = conn.prepareStatement(sql1);
						
						String first = "FED";
						Random rand = new Random();
						int middle = (rand.nextInt(1000) + 9000);
						String last = Character.toString(fname.charAt(0)) + Character.toString(lname.charAt(0));
						did = first + middle + last;
						
						pstmt.setString(1, did);
						
						ResultSet rs = pstmt.executeQuery();
						
						if (!rs.next())
							check = true;
					}
					
					pstmt = conn.prepareStatement(sql3);
					pstmt.setString(1, email);
					ResultSet rs = pstmt.executeQuery();
					
					if (rs.next())
					{
						out.println("<script>");
						out.println("alert(\"Doctor is already registered.\");");
						out.println("window.location.href = \"Doctor-Login.html\";");
						out.println("</script>");
						out.close();
					}				
					else
					{
						File f = new File(request.getParameter("path"));
						String path = "Images/Doctor/"+did+".jpg";
						
						pstmt = conn.prepareStatement(sql2);
						pstmt.setString(1, did);
						pstmt.setString(2, uname);
						pstmt.setString(3, email);
						pstmt.setString(4, pword);
						pstmt.setString(5, name);
						pstmt.setString(6, dob);
						pstmt.setInt(7, age);
						pstmt.setString(8, pob);
						pstmt.setString(9, gender);
						pstmt.setString(10, marital);
						pstmt.setInt(11, noc);
						pstmt.setString(12, citizen);
						pstmt.setString(13, address);
						pstmt.setLong(14, mobile);
						pstmt.setString(15, position);
						pstmt.setInt(16, salary);
						pstmt.setString(17, time);
						pstmt.setString(18, path);
						
						int count1 = pstmt.executeUpdate();
						
						pstmt = conn.prepareStatement(sql4);
						pstmt.setString(1, did);
						pstmt.setString(2, college1);
						pstmt.setString(3, location1);
						pstmt.setString(4, degree1);
						pstmt.setString(5, from1);
						pstmt.setString(6, to1);
						pstmt.setString(7, college2);
						pstmt.setString(8, location2);
						pstmt.setString(9, degree2);
						pstmt.setString(10, from2);
						pstmt.setString(11, to2);
						pstmt.setString(12, college3);
						pstmt.setString(13, location3);
						pstmt.setString(14, degree3);
						pstmt.setString(15, from3);
						pstmt.setString(16, to3);
						
						int count2 = pstmt.executeUpdate();
						
						if ((count1 > 0) && (count2 > 0))
						{
							path = "D:\\Intelligent_Hospital_System\\WebContent\\Images\\Doctor\\" + did + ".jpg";
							BufferedImage image = new BufferedImage(200, 230, BufferedImage.TYPE_INT_ARGB);
							image = ImageIO.read(f);
							File f1 = new File(path);
							ImageIO.write(image, "jpg", f1);
							
							out.println("<script>");
							out.println("alert(\"Doctor Registration Successful. \\n \\nDoctor ID - " + did + "\\n(Please remember this Doctor ID for future Login reference.)\");");
							out.println("window.location.href = \"Doctor-Login.html\";");
							out.println("</script>");
							
						}
						else
						{
							out.println("<script>");
							out.println("alert(\"Doctor Registration Failed. \\nPlease Retry.\");");
							out.println("window.location.href = \"Doctor-Register.html\";");
							out.println("</script>");
						}
						
						out.close();
					}
				}
			}
			catch (ClassNotFoundException e)
			{
				out.println("<script>");
				out.println("alert(\"Doctor Registration Failed. \\nPlease Retry.\");");
				out.println("window.location.href = \"Doctor-Register.html\";");
				out.println("</script>");
				out.close();
				
				e.printStackTrace();
			} 
			catch (SQLException e) 
			{
				out.println("<script>");
				out.println("alert(\"Doctor Registration Failed. \\nPlease Retry.\");");
				out.println("window.location.href = \"Doctor-Register.html\";");
				out.println("</script>");
				out.close();
				
				e.printStackTrace();
			}
			
		}
		catch (Exception e1)
		{
			out.println("<script>");
			out.println("alert(\"Doctor Registration Failed. \\nPlease Retry.\");");
			out.println("window.location.href = \"Doctor-Register.html\";");
			out.println("</script>");
			out.close();
			
			e1.printStackTrace();
		}
	}

}
