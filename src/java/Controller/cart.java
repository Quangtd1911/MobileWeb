/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AccountDAO;
import DAO.CartDAO;
import DAO.CategoryDAO;
import DAO.DAO;
import DAO.OrderDAO;
import DAO.ProductDAO;
import Model.Cart;
import Model.Pagination.Pagination;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author toden
 */
public class cart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet cart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet cart at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    DAO OrderDAO;
    DAO CartDAO;
    DAO PDAO;
    Pagination Page;

    public void init() {
        OrderDAO = new OrderDAO();
        CartDAO = new CartDAO();
        PDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        HttpSession session = request.getSession();
        if (request.getParameter("del") != null) {
            int aid = Integer.parseInt(request.getParameter("aid"));
            int pid = Integer.parseInt(request.getParameter("pid"));
            List<Cart> carts = CartDAO.DelOneCart(aid, pid);
            session.setAttribute("Cart", carts);
            response.sendRedirect("cart.jsp");
        }

        if (request.getParameter("buy") != null) {
            int aid = Integer.parseInt(request.getParameter("aid"));
            int pid = Integer.parseInt(request.getParameter("pid"));
            List<Cart> carts = (List<Cart>) session.getAttribute("Cart");
            for (Cart c : carts) {
                if (c.getAccountId() == aid && c.getProductId() == pid) {
                    OrderDAO.addOrder(aid, c);
                    OrderDAO.addOrderDetail(c);
                }
            }
            carts = CartDAO.DelOneCart(aid, pid);
            session.setAttribute("Cart", carts);
            response.sendRedirect("cart.jsp");
        }

        if (request.getParameter("btnDelAll") != null) {
            int pid = Integer.parseInt(request.getParameter("pid"));
            CartDAO.DelCartByAccountId(pid);
            session.setAttribute("Cart", null);
            response.sendRedirect("cart.jsp");
        }

        if (request.getParameter("btnBuyAll") != null) {
            int pid = Integer.parseInt(request.getParameter("pid"));
            List<Cart> carts = (List<Cart>) session.getAttribute("Cart");
            OrderDAO.addOrder(pid, carts);
            OrderDAO.addOrderDetail(carts);
            CartDAO.DelCartByAccountId(pid);
            session.setAttribute("Cart", null);
            response.sendRedirect("cart.jsp");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
