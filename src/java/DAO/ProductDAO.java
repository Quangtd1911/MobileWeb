/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author toden
 */
public class ProductDAO extends DAO  {
    public ProductDAO(){
        super();
    }
    @Override
    public List<Product> getAllProduct(){
        String sql = "select * from Product";
        List<Product> ProductList = new ArrayList<Product>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                int Id = rs.getInt(1);
                String name = rs.getNString(2);
                double price = rs.getDouble(3);
                int cid = rs.getInt(4);
                String img = rs.getString(5);
                
                ProductList.add(new Product(Id, name, price, cid, img));
            }
        } catch (Exception e) {
            status = "Error at read Category "+e.getMessage();
        }
        return ProductList;
    }
    @Override
    public List<Product> DelOneProduct(int id){
        String sql = "Delete from Product where product_id = ?";
        List<Product> ProductList = new ArrayList<Product>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            ProductList = getAllProduct();
        } catch (Exception e) {
            status = "Error at read Category "+e.getMessage();
        }
        return ProductList;
    }
    @Override
    public Product getOnePro(int id){
        String sql = "Select * from Product where product_id = ?";
        Product p = new Product();   
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                int Id = rs.getInt(1);
                String name = rs.getNString(2);
                double price = rs.getDouble(3);
                int cid = rs.getInt(4);
                String img = rs.getString(5);
                p = new Product(Id, name, price, cid, img);
            }     
        }
        catch (Exception e) {
            status = "Error at read Category "+e.getMessage();
        }
        return p;
    }
    @Override
    public List<Product> addProduct(String name, double price, int cid, String img){
        String sql = "insert into Product values(?,?,?,?)";
        List<Product> ProductList = new ArrayList<Product>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,name);
            ps.setDouble(2, price);
            ps.setInt(3, cid);
            ps.setString(4, img);
            ps.executeUpdate();
            ProductList = getAllProduct();
        } catch (Exception e) {
            status = "Error at read Category "+e.getMessage();
        }
        return ProductList;
    }
    
    @Override
    public List<Product> updateProduct(String name, double price, int cid, String img, int pid){
        String sql = "Update Product set product_name = ?, list_price = ?, category_id = ?, img = ? where product_id = ?";
        List<Product> ProductList = new ArrayList<Product>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,name);
            ps.setDouble(2, price);
            ps.setInt(3, cid);
            ps.setString(4, img);
            ps.setInt(5, pid);
            ps.executeUpdate();
            ProductList = getAllProduct();
        } catch (Exception e) {
            status = "Error at read Category "+e.getMessage();
        }
        return ProductList;
    }
    
    @Override
    public List<Product> getProductByCate(int id){
        String sql = "select * from Product where category_id = ?";
        List<Product> ProductList = new ArrayList<Product>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                int Id = rs.getInt(1);
                String name = rs.getNString(2);
                double price = rs.getDouble(3);
                int cid = rs.getInt(4);
                String img = rs.getString(5);
                
                ProductList.add(new Product(Id, name, price, cid, img));
            }
        } catch (Exception e) {
            status = "Error at read Category "+e.getMessage();
        }
        return ProductList;
    }
    
}
