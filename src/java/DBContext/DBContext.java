/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBContext;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author toden
 */
public class DBContext {

    public Connection getConnection()throws Exception {        
        String url = "jdbc:sqlserver://"+serverName+":"+portNumber +
                ";databaseName="+dbName;//+"; integratedSecurity=true";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");         
        return DriverManager.getConnection(url, userID, password);
//        return DriverManager.getConnection(url);
    }
    public DBContext(){
        
    }
    public DBContext(String u, String p){
        userID = u;
        password = p;
    }
    /*Insert your other code right after this comment*/
   
    /*Change/update information of your database connection, DO NOT change name of instance variables in this class*/
    private final String serverName = "localhost";
    private final String dbName = "ASSGN_PRJ_Ban_Hang_Web2_Ban_Dien_Thoai";
    private final String portNumber = "1433";
    private  String userID = "sa";
    private  String password = "sa";
    
    public static void main(String[] args){
        try{
            new DBContext().getConnection();
            System.out.println("Ket noi thanh cong");
        } catch(Exception e){
            System.out.println("Ket noi that bai"+e.getLocalizedMessage()+" "+e.getMessage());
        }
    }
}
