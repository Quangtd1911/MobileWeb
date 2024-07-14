/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBContext.DBContext;
import Model.Account;
import Model.Cart;
import Model.Category;
import Model.Product;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author toden
 */
public class DAO {
    protected Connection con;
    protected String status="";
    public DAO(){
        try{
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error Connection "+e.getMessage();
        }
    }
    
    public List<Product> getAllProduct(){
        return null;
    }
    
    public List<Product> DelOneProduct(int id){
        return null;
    }
    
    public Product getOnePro(int id){
        return null;
    }
    
    public List<Product> addProduct(String name, double price, int cid, String img){
        return null;
    }

    public List<Category> getAllCate() {
       return null;
    }
    
    public List<Account> getAllAccount(){
        return null;
    }
    
    public int cusAccountExist(String email, String p){
        return 0;
    }
    
    
    public Account getOneAcc(int id){
       return null;
    }
    
    public Account findAccByName(String name, String p){
        return null;
    }
    
    public List<Product> updateProduct(String name, double price, int cid, String img, int pid){
        return null;
    }
    
    public List<Product> getProductByCate(int id){
        return null;
    }
    
    public List<Cart> getCartByAccount(int id){
         return null;
    }
            
    public List<Cart> addCart(int aid, int pid){
        return null;
    }
    
    public List<Cart> DelOneCart(int aid, int pid){
        return null;
    }
    
    public List<Cart> DelCartByAccountId(int aid){
        return null;
    }
    
    public int getNewestOrderId(){
        return 0;
    }
    
    public boolean addOrderDetail(List<Cart> carts){
        return false;
    }
    
    public boolean addOrder(int aid, List<Cart> carts){
        return false;
    }
    
    public boolean addOrder(int aid, Cart c){
        return false;
    }
    
    public boolean addOrderDetail(Cart c){
        return false;
    }
    public Account findAccByEmail(String email){
        return null;
    }
            
    public Account addAcc(String account, String password, String customer, String phone, String address, String email){
        return null;
    }

    public Cart getCartByPid(int pid) {
        return null;
    }

    public List<Cart> updateCart(int accountId, int pid, int ammount) {
        return null;
    }
}
