/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author toden
 */
public class CategoryDAO extends DAO {

    public CategoryDAO() {
        super();
    }

    @Override
    public List<Category> getAllCate() {
        String sql = "select * from Category";
        List<Category> CateList = new ArrayList<Category>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int Id = rs.getInt(1);
                String name = rs.getString(2);

                CateList.add(new Category(Id, name));
            }
        } catch (Exception e) {
            status = "Error at read Category " + e.getMessage();
        }
        return CateList;
    }

    public static void main(String[] args) {
        System.out.println(new CategoryDAO().getAllCate().size());
    }

    public Category getCategoryById(int id) {
        try {
            String sql = "select *  from Category where category_id = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Category a = new Category();
                a.setCategory_id(rs.getInt(1));
                a.setName(rs.getString(2));
                return a;
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertCategory(String name) {
        try {
            String sql = "INSERT INTO [dbo].[Category]\n"
                    + "           ([category_name])\n"
                    + "     VALUES\n"
                    + "           (?)";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, name);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateCategory(Category category) {
        try {
            String sql = "UPDATE [dbo].[Category]\n"
                    + "   SET [category_name] = ?\n"
                    + " WHERE category_id = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, category.getName());
            stm.setInt(2, category.getCategory_id());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
