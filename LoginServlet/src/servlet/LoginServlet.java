package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name = "Login", urlPatterns = { "/Login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final String DBNAME = "java";
    private static final String DB_USERNAME = "root";
    private static final String DB_PASSWORD = "ezaldivar";
	
    private static final String LOGIN_QUERY = "SELECT user,pass FROM login WHERE user=? and pass=?";
    private static final String HOME_PAGE_ADMIN = "./adminCV.jsp";
    private static final String HOME_PAGE_CV = "./userCV.jsp";
    private static final String LOGIN_PAGE = "./index.jsp";


    	        
    	        
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String strUserName = request.getParameter("username");
		String strPassword = request.getParameter("password");
		String strErrMsg = null;
		HttpSession session = request.getSession();
		boolean isValidLogon = false;
		try {
			isValidLogon = authenticateLogin(strUserName, strPassword);
			if(isValidLogon) {
				session.setAttribute("username", strUserName);
			} else {
				strErrMsg = "User name or Password is invalid. Please try again.";
			}
		} catch(Exception e) {
			strErrMsg = "Unable to validate user / password in database";
			
		}

		if(isValidLogon) {
			if(strUserName.equals("admin")){
				//Admin page
				response.sendRedirect(HOME_PAGE_ADMIN);
			}else{
				//Common user's CV
				response.sendRedirect(HOME_PAGE_CV);
			}
			
		} else {
			session.setAttribute("errorMsg", strErrMsg);
			response.sendRedirect(LOGIN_PAGE);
		}
		
	}
	
	private boolean authenticateLogin(String strUserName, String strPassword) throws Exception {
		boolean isValid = false;
		Connection conn = null;
		try {
			conn = getConnection();
			PreparedStatement prepStmt = conn.prepareStatement(LOGIN_QUERY);
			prepStmt.setString(1, strUserName);
			prepStmt.setString(2, strPassword);
			ResultSet rs = prepStmt.executeQuery();
			if(rs.next()) {
				System.out.println("User login is valid in DB");
				isValid = true;
			}
		} catch(Exception e) {
			System.out.println("validateLogon: Error while validating password: "+e.getMessage());
			throw e;
		} finally {
			closeConnection(conn);
		}
		return isValid;
	}
	
	private void closeConnection(Connection conn) {
		try {
			if(conn!=null && !conn.isClosed()) {
				conn.close();
			}
		} catch(SQLException sqle) {
			System.out.println("Error while closing connection.");
		}
	}
	
	private Connection getConnection() throws Exception {
		Connection conn = null;
		try {
			String url = "jdbc:mysql://localhost/"+DBNAME+"?user="+DB_USERNAME+"&password="+DB_PASSWORD;
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url);
		} catch (SQLException sqle) {
			System.out.println("SQLException: Unable to open connection to db: "+sqle.getMessage());
			throw sqle;
		} catch(Exception e) {
			System.out.println("Exception: Unable to open connection to db: "+e.getMessage());
			throw e;
		}
		return conn;
	}

}

