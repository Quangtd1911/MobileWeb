/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Cart;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author toden
 */
public class OrderDAO extends DAO {

    public OrderDAO() {
        super();
    }

    @Override
    public boolean addOrder(int aid, List<Cart> carts) {
        double total = 0;
        for (Cart c : carts) {
            total += c.getPrice() * c.getAmmount();
        }
        String sql = "INSERT INTO [dbo].[Order]\n"
                + "           ([order_date]\n"
                + "           ,[account_id]\n"
                + "           ,[total])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?)";
        Date date = new Date();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDate(1, new java.sql.Date(date.getTime()));
            ps.setInt(2, aid);
            ps.setDouble(3, total);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            status = "Error at addOrder " + e.getMessage();
        }
        return false;
    }

    @Override
    public boolean addOrder(int aid, Cart c) {
        String sql = "insert into Order values (?,?,?)";
        Date date = new Date();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDate(1, new java.sql.Date(date.getTime()));
            ps.setInt(2, aid);
            ps.setDouble(3, c.getAmmount() * c.getPrice());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            status = "Error at addOrder " + e.getMessage();
        }
        return false;
    }

    @Override
    public int getNewestOrderId() {
        String sql = "select top 1 * from [Order] order by order_id desc";
        int id = 1;
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
            status = "Error at getNewestOrderId " + e.getMessage();
        }
        return id;
    }
    
    @Override
    public boolean addOrderDetail(List<Cart> carts) {
        String sql = "INSERT INTO [dbo].[OrderDetail]\n"
                + "           ([order_id]\n"
                + "           ,[product_id]\n"
                + "           ,[quantity]\n"
                + "           ,[price])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        for (Cart c : carts) {
            try {
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, getNewestOrderId());
                ps.setInt(2, c.getProductId());
                ps.setInt(3, c.getAmmount());
                ps.setDouble(4, c.getPrice() * c.getAmmount());
                ps.executeUpdate();
                
            } catch (Exception e) {
                status = "Error at addOrderDetail " + e.getMessage();
                return false;
            }
        }

        return true;
    }

    @Override
    public boolean addOrderDetail(Cart c) {
        String sql = "insert into OrderDetail values (?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, getNewestOrderId());
            ps.setInt(2, c.getProductId());
            ps.setInt(3, c.getAmmount());
            ps.setDouble(4, c.getPrice() * c.getAmmount());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            status = "Error at addOrderDetail " + e.getMessage();

        }
        return false;
    }
}
