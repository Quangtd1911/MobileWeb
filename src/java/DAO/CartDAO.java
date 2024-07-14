/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Cart;
import java.awt.CardLayout;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author toden
 */
public class CartDAO extends DAO {

    public CartDAO() {
        super();
    }

    @Override
    public List<Cart> getCartByAccount(int id) {
        String sql = "select c.account_id, p.product_name, c.product_id, c.ammount, p.img, p.list_price from Cart as c join Product as p on c.product_id = p.product_id where c.account_id = ?";
        List<Cart> CartList = new ArrayList<Cart>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int aid = rs.getInt(1);
                String pName = rs.getString(2);
                int pid = rs.getInt(3);
                int ammount = rs.getInt(4);
                String img = rs.getString(5);
                double price = rs.getDouble(6);

                CartList.add(new Cart(aid, pName, pid, img, ammount, price));
            }
        } catch (Exception e) {
            status = "Error at read Cart " + e.getMessage();
        }
        return CartList;
    }

    @Override
    public List<Cart> updateCart(int aid, int pid, int amount) {
        String sql = "UPDATE [dbo].[Cart]\n"
                + "   SET [ammount] = ?\n"
                + " WHERE product_id = ?";
        List<Cart> CartList = new ArrayList<Cart>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, amount+1);
            ps.setInt(2, pid);
            ps.executeUpdate();
            CartList = getCartByAccount(aid);
        } catch (Exception e) {
            status = "Error at add Cart " + e.getMessage();
        }
        return CartList;
    }

    @Override
    public List<Cart> addCart(int aid, int pid) {
        String sql = "insert into Cart(account_id,product_id,[ammount]) values(?,?,?)";
        List<Cart> CartList = new ArrayList<Cart>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, aid);
            ps.setInt(2, pid);
            ps.setInt(3, 1);
            ps.executeUpdate();
            CartList = getCartByAccount(aid);
        } catch (Exception e) {
            status = "Error at add Cart " + e.getMessage();
        }
        return CartList;
    }

    @Override
    public Cart getCartByPid(int pid) {
        String sql = "SELECT * FROM cart where product_id = " + pid;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Cart(rs.getInt(1), rs.getInt(2), rs.getInt(3));
            }
        } catch (Exception e) {
            status = "Error at read Cart " + e.getMessage();
        }
        return null;
    }

    @Override
    public List<Cart> DelOneCart(int aid, int pid) {
        String sql = "delete from Cart where account_id = ? AND product_id = ? ";
        List<Cart> CartList = new ArrayList<Cart>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, aid);
            ps.setInt(2, pid);
            ps.executeUpdate();
            CartList = getCartByAccount(aid);
        } catch (Exception e) {
            status = "Error at add Cart " + e.getMessage();
        }
        return CartList;
    }

    @Override
    public List<Cart> DelCartByAccountId(int aid) {
        String sql = "delete from Cart where account_id = ? ";
        List<Cart> CartList = new ArrayList<Cart>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, aid);
            ps.executeUpdate();
            CartList = getCartByAccount(aid);
        } catch (Exception e) {
            status = "Error at add Cart " + e.getMessage();
        }
        return CartList;
    }
}
