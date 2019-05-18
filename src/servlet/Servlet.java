package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.ConnectSQL;

/**
 * Servlet implementation class Servlet
 */
@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.print(ConnectSQL.getConnection());
		String action = request.getServletPath();
		String un = request.getParameter("username");
		String pw = request.getParameter("password");
		Connection conn = ConnectSQL.getConnection();
		String sql = "select userr,pass from Login where userr = ? and pass = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, un);
			ps.setString(2, pw);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				response.sendRedirect("Photo_list.jsp");
				return;
			}
			response.sendRedirect("error.html");
			return;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	private void Login(HttpServletRequest request , HttpServletResponse response) {
		try {
			String un = request.getParameter("username");
			String pw = request.getParameter("password");
			Connection conn = ConnectSQL.getConnection();
			String sql = "select userr,pass from Login where userr = ? and pass = ?";
			try {
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, un);
				ps.setString(2, pw);
				ResultSet rs = ps.executeQuery();
				while(rs.next()) {
					response.sendRedirect("success.html");
					return;
				}
				response.sendRedirect("error.html");
				return;
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
