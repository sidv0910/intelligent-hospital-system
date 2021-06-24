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

@WebServlet("/PatientRegister")
public class PatientRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PatientRegister() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		
		try
		{
			String uname = request.getParameter("uname");
			String email = request.getParameter("email");
			String pword = request.getParameter("pword");
	        String name = request.getParameter("fname") + " " + request.getParameter("lname");
			String gender = request.getParameter("gender");
			String dob = request.getParameter("dob");
			String marital = request.getParameter("marital");
			int age = Integer.parseInt(request.getParameter("age"));
			String profession = request.getParameter("profession");
			long mobile = Long.parseLong(request.getParameter("mobile"));
			String address = request.getParameter("address");
			String emgName = request.getParameter("name");
			String emgRelation = request.getParameter("relation");
			long emgContact = Long.parseLong(request.getParameter("contact"));
			
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/intelligent_hospital_system", "EP_Practical", "190032121");
				
				PreparedStatement pstmt;
				
				String sql1 = "select patient_id from patient where patient_id=?";
				String sql2 = "insert into patient values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
				String sql3 = "select email from patient where email=?";
				
				String pid = ""; 
				
				boolean check = false;
				
				while (check == false)
				{
					pstmt = conn.prepareStatement(sql1);
					
					String first = "FEP";
					Random rand = new Random();
					int middle = (rand.nextInt(1000) + 9000);
					String last = "" + Character.toUpperCase(name.charAt(0));
					for (int i = 1; i < name.length() - 1; i++) 
			            if (name.charAt(i) == ' ') 
			            	last += Character.toUpperCase(name.charAt(i + 1));
					pid = first + middle + last;
					
					pstmt.setString(1, pid);
					
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
					out.println("alert(\"Patient is already registered.\");");
					out.println("window.location.href = \"Patient-Login.html\";");
					out.println("</script>");
					out.close();
				}
				else
				{
					File f = new File(request.getParameter("path"));
					String path = "Images/Patient/"+pid+".jpg";
					
					pstmt = conn.prepareStatement(sql2);
					pstmt.setString(1, pid);
					pstmt.setString(2, uname);
					pstmt.setString(3, email);
					pstmt.setString(4, pword);
					pstmt.setString(5, name);
					pstmt.setString(6, gender);
					pstmt.setString(7, dob);
					pstmt.setString(8, marital);
					pstmt.setInt(9, age);
					pstmt.setString(10, profession);
					pstmt.setLong(11, mobile);
					pstmt.setString(12, address);
					pstmt.setString(13, emgName);
					pstmt.setString(14, emgRelation);
					pstmt.setLong(15, emgContact);
					pstmt.setString(16, path);
					
					int count = pstmt.executeUpdate();
					
					if (count > 0)
					{
						BufferedImage image = new BufferedImage(200, 230, BufferedImage.TYPE_INT_ARGB);
						image = ImageIO.read(f);
						File f1 = new File(path);
						ImageIO.write(image, "jpg", f1);
						
						out.println("<script>");
						out.println("alert(\"Patient Registration Successful. \\n \\nPatient ID - " + pid + "\\n(Please remember this Patient ID for future Login reference.)\");");
						out.println("window.location.href = \"Patient-Login.html\";");
						out.println("</script>");
					}
					else
					{
						out.println("<script>");
						out.println("alert(\"Patient Registration Failed. \\nPlease Retry.\");");
						out.println("window.location.href = \"Patient-Register.html\";");
						out.println("</script>");
					}
				}
				out.close();
			}
			catch (ClassNotFoundException e)
			{
				out.println("<script>");
				out.println("alert(\"Patient Registration Failed. \\nPlease Retry.\");");
				out.println("window.location.href = \"Patient-Register.html\";");
				out.println("</script>");
				out.close();
				
				e.printStackTrace();
			} 
			catch (SQLException e) 
			{
				out.println("<script>");
				out.println("alert(\"Patient Registration Failed. \\nPlease Retry.\");");
				out.println("window.location.href = \"Patient-Register.html\";");
				out.println("</script>");
				out.close();
				
				e.printStackTrace();
			}
			
		}
		catch (IOException e1)
		{
			out.println("<script>");
			out.println("alert(Patient Registration Failed. \nPlease Retry.)");
			out.println("window.location.href = \"Patient-Register.html\";");
			out.println("</script>");
			out.close();
			
			e1.printStackTrace();
		}
	}
}