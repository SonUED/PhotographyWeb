package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.sun.crypto.provider.RSACipher;
import com.sun.org.apache.xpath.internal.operations.Equals;
import com.sun.xml.internal.ws.api.streaming.XMLStreamReaderFactory.Default;

import beans.*;
import dao.photoDAO;
import db.ConnectSQL;

/**
 * Servlet implementation class ControllServlet
 */
@WebServlet("/ControllServlet")
@MultipartConfig()
public class ControllServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    Connection conn = ConnectSQL.getConnection();
    public ControllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String action = request.getServletPath();
		 switch (action) {
		 case "/new" :
			 showNewForm(request, response);
			 break;
		 case "/insert" :
			 try {
				insertPhoto(request, response);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			 break;
		 case "/delete" :
			 try {
				deletePhoto(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 break;
		
		 case "/edit" :
			 try {
				showEditForm(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 break;
		 case "/update" :
			 try {
				updatePhoto(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 case "/delete_img" :
			 try {
				deleteImg(request,response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 break;
		  case "/adminPage":
			 listImage_Admin(request, response);
			 break;
		 case "/image" :
			 InsertImage(request,response);
		 case "/listImage":
			 listImage(request, response);
			 break;
		 case "/logout":
			 logOut(request,response);
			 break;
		 case "/default":
				break;
		 }
		 
			 
	
	}
	private void logOut(HttpServletRequest request, HttpServletResponse response) {
		  request.getSession().removeAttribute("role");
		 RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
		 try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static boolean checkLogin(HttpServletRequest request, HttpServletResponse response) {
		Boolean check = false;
		HttpSession sess = request.getSession();		
		String ob = (String) sess.getAttribute("user");
		System.out.println(ob);
		if(ob.equals("cus")==true) {
			check = false;
		}
		else {
			check = true;
		}
		return check;
	}

	private void deleteImg(HttpServletRequest request, HttpServletResponse response) throws ServletException, SQLException {
		try {
			Connection conn = ConnectSQL.getConnection();
			int id = Integer.parseInt(request.getParameter("id"));
			System.out.println("id"+id);
			Image img = new Image(id);
			photoDAO.deleteImg(conn, img);
			response.sendRedirect("decent");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	private void InsertImage(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		 Part filePart = request.getPart("img");
		 String name = request.getParameter("name");
		 String sql = "insert into Image(name,image) values (?,?)";
		 InputStream input = filePart.getInputStream();
		 try {
			 Connection conn = ConnectSQL.getConnection();
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, name);
			pst.setBlob(2, input);
			int row = pst.executeUpdate();
			if(row>0) {
				response.sendRedirect("adminPage");
				return;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	public static void checkDecent(HttpServletRequest request, HttpServletResponse response) throws SQLException {
		String user = request.getParameter("username");
		String pass =request.getParameter("password");
		Connection conn  = ConnectSQL.getConnection();
		String sql = "select userr,pass from Login where userr = ? and pass= ?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,user );
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				String sql2 = "select decent from Login where userr = ? and pass =? ";
				HttpSession sess = request.getSession();
				sess.setAttribute("user", user);
				try {
					PreparedStatement pst2 = conn.prepareStatement(sql2);
					pst2.setString(1, user);
					pst2.setString(2, pass);
					ResultSet rs2 = pst2.executeQuery();				
					while(rs2.next()) {
						String decent = rs2.getString("decent");
						HttpSession ses1 = request.getSession();
						ses1.setAttribute("decent", decent);
						if(decent.trim().equals("Boss")==true) {
							HttpSession ses2 = request.getSession();
							ses2.setAttribute("kt", 1);
							RequestDispatcher rd = request.getRequestDispatcher("adminPage");
							rd.forward(request, response);
						}
						else {
							if(decent.trim().equals("Cus")==true) {
								HttpSession ses3 = request.getSession();
								ses3.setAttribute("role", decent);
								RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
								rd.forward(request, response);
							}
							else {
								if(decent.trim().equals("Admin")==true) {
									HttpSession ses2 = request.getSession();
									ses2.setAttribute("kt", 2);
									RequestDispatcher rd = request.getRequestDispatcher("adminPage");
									rd.forward(request, response);
								}
							
							}
						}

						 
					}
					rs2.close();
					pst2.close();	
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	private void updatePhoto(HttpServletRequest request, HttpServletResponse response)throws SQLException{	
		try {
			Connection conn = ConnectSQL.getConnection();
			int id = Integer.parseInt(request.getParameter("id"));
			System.out.println("id "+id);
			String name = request.getParameter("name");
			float price = Float.parseFloat(request.getParameter("price"));
			String des = request.getParameter("des");
			Photo photo  = new Photo(id,name, price, des);			
			photoDAO.updatePhoto(conn, photo);
			RequestDispatcher rd = request.getRequestDispatcher("adminPage");
			rd.forward(request, response);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}catch (IOException e) {
			
			e.printStackTrace();
		} catch (ServletException e) {
			
			e.printStackTrace();
		}
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException {
			try {
				Connection conn = ConnectSQL.getConnection();
				int id = Integer.parseInt(request.getParameter("id"));
		        Photo existingBook = photoDAO.getPhoto(conn,id);
		        RequestDispatcher dispatcher = request.getRequestDispatcher("PhotoForm.jsp");
		        request.setAttribute("existphoto", existingBook);
		        dispatcher.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} 	
	}

	private void deletePhoto(HttpServletRequest request, HttpServletResponse response) throws SQLException   {
		try {
			Connection conn = ConnectSQL.getConnection();
			int id = Integer.parseInt(request.getParameter("id"));
			Photo photo = new Photo(id);
			photoDAO.deletePhoto(conn, photo);
			RequestDispatcher rd = request.getRequestDispatcher("adminPage");
			rd.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		}catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	private void insertPhoto(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		try {
			Connection conn = ConnectSQL.getConnection();
			String name = request.getParameter("name");
	        float price = Float.parseFloat(request.getParameter("price"));
	        String des = request.getParameter("des");
	        Photo newBook = new Photo(name, price, des);
	        photoDAO.insertPhoto(newBook,conn);
	        response.sendRedirect("Call_Admin_page");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void showNewForm(HttpServletRequest request, HttpServletResponse response) {
		try {
				RequestDispatcher dispatcher = request.getRequestDispatcher("PhotoForm.jsp");
		        dispatcher.forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	private void listImage(HttpServletRequest request, HttpServletResponse response) throws ServletException {
		  try {
		
		List<Photo> listBook = photoDAO.getAllPhoto(conn);
        request.setAttribute("listPhoto", listBook);
        List<Image> listImage = photoDAO.getAllImage(conn);
        
		request.setAttribute("listImage", listImage);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/chupdon.jsp");
        requestDispatcher.forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	private void listImage_Admin(HttpServletRequest request, HttpServletResponse response) throws ServletException {
			  try {
			if(checkLogin(request, response)==true) {
				List<Photo> listBook = photoDAO.getAllPhoto(conn);
		        request.setAttribute("listPhoto", listBook);
				List<Image> listImage = photoDAO.getAllImage(conn);
				request.setAttribute("listImage", listImage);
				List<Userr> listUser = photoDAO.listUser(conn);
				request.setAttribute("listUser", listUser);
				int countUser = photoDAO.countUser(conn);
				request.setAttribute("countUser", countUser);
				int countSer = photoDAO.countService(conn);
				request.setAttribute("countSer",countSer);
				int countImg = photoDAO.countImg(conn);
				request.setAttribute("countImg",countImg);
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("/admin.jsp");
		        requestDispatcher.forward(request, response);
			}
			else {
				response.sendRedirect("login");
			}
			} catch (Exception e) {
				// TODO: handle exception
			}
	}
private void resgiCustomer(HttpServletRequest request, HttpServletResponse response) {
		Connection conn = ConnectSQL.getConnection();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		 switch (action) {
		 case "/image" :
			 InsertImage(request,response);
			 break;
	
		 case "/decent" :
			 try {
				checkDecent(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 break;
		 case "/adminPage":
			 listImage_Admin(request, response);
			 break;
		 case "/resgiCustomer":
			 resgiCustomer(request,response);
			 break;
		 default :
			 listImage_Admin(request, response);
			 break;
		 }
		 
	}

	

	

}
