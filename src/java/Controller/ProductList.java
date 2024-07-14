/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AccountDAO;
import DAO.CartDAO;
import DAO.CategoryDAO;
import DAO.DAO;
import DAO.ProductDAO;
import Model.Account;
import Model.Cart;
import Model.Category;
import Model.Pagination.Pagination;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author toden
 */
public class ProductList extends HttpServlet {

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
            out.println("<title>Servlet ProductList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductList at " + request.getContextPath() + "</h1>");
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
    DAO Pdao;
    DAO Cdao;
    DAO Adao;
    DAO CartDAO;
    Pagination Page;

    public void init() {
        Pdao = new ProductDAO();
        Cdao = new CategoryDAO();
        Adao = new AccountDAO();
        CartDAO = new CartDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        HttpSession session = request.getSession();
        List<Product> P = Pdao.getAllProduct();
        List<Category> cl = Cdao.getAllCate();
        //setting cart
        if (session.getAttribute("Account") != null) {
            Account acc = (Account) session.getAttribute("Account");
            if (CartDAO.getCartByAccount(acc.getAccountId()) != null) {
                List<Cart> carts = CartDAO.getCartByAccount(acc.getAccountId());
                session.setAttribute("Cart", carts);
            }
        }

        //seting pagination
        if (session.getAttribute("page") == null) {
            Page = new Pagination(P.size(), 8, 1);
            session.setAttribute("page", Page);
        } else if (request.getParameter("cp") != null) {
            int cp = Integer.parseInt(request.getParameter("cp"));
            Page = new Pagination(P.size(), 8, cp);
            session.setAttribute("page", Page);
        }
        //

        if (request.getParameter("cateSelect") != null && !request.getParameter("cateSelect").contains("t")) {
            int idcateSelect = Integer.parseInt(request.getParameter("cateSelect"));
            if (idcateSelect != 0) {
                P = Pdao.getProductByCate(idcateSelect);
            }
            request.setAttribute("cs", idcateSelect);
        }
        // search
        if (request.getParameter("search") != null && request.getParameter("search") != "") {
            List<Product> searchL = new ArrayList<>();
            String strSearch = request.getParameter("search");
            for (Product p : P) {
                if (p.getProductName().contains(strSearch)) {
                    searchL.add(p);
                }
            }
            if (searchL.size() != 0) {
                P = searchL;
            }
        }
        //
        session.setAttribute("cl", cl);
        session.setAttribute("p", P);
        if ((Account) session.getAttribute("Account") != null) {
            Account acc = (Account) session.getAttribute("Account");
            if (acc.getRoleId() != 1) {
                request.getRequestDispatcher("manager/productList.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("productList.jsp").forward(request, response);
            }
        } else {
            request.getRequestDispatcher("productList.jsp").forward(request, response);
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
        //processRequest(request, response);
        HttpSession session = request.getSession();
        List<Category> cl = Cdao.getAllCate();
        session.setAttribute("cl", cl);
        //btn add to cart click
        if (request.getParameter("addToCart") != null) {
            if (session.getAttribute("Account") != null) {
                Account acc = (Account) session.getAttribute("Account");
                int pid = Integer.parseInt(request.getParameter("pid"));
                Cart c = CartDAO.getCartByPid(pid);
                List<Cart> carts = null;
                if (c != null) {
                    carts = CartDAO.updateCart(acc.getAccountId(), pid,c.getAmmount());
                } else {
                    carts = CartDAO.addCart(acc.getAccountId(), pid);
                }
                session.setAttribute("Cart", carts);
                response.sendRedirect("productList.jsp");
            } else {
                response.sendRedirect("signIn.jsp");
            }
        }
        //
        if (request.getParameter("btnDel") != null) {
            int id = Integer.parseInt(request.getParameter("pid"));
            List<Product> p = Pdao.DelOneProduct(id);
            session.setAttribute("p", p);
            Account acc = (Account) session.getAttribute("Account");
            if (acc != null && acc.getRoleId() != 0) {
                request.getRequestDispatcher("manager/productList.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("productList.jsp").forward(request, response);
            }
        }
        if (request.getParameter("btnUpdate") != null) {
            int id = Integer.parseInt(request.getParameter("pid"));
            Product p = Pdao.getOnePro(id);
            request.setAttribute("pU", p);
            request.getRequestDispatcher("updateProduct.jsp").forward(request, response);
        }
        if (request.getParameter("btnAdd") != null) {
            request.getRequestDispatcher("addProduct.jsp").forward(request, response);
        }

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
