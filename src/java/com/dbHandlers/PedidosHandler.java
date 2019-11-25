/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dbHandlers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

/**
 *
 * @author mauri
 */
public class PedidosHandler {
    private Connection conn;
    private Statement stmt;
    
    public PedidosHandler() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        this.conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/velascirios", "root", "");
        this.stmt = conn.createStatement();
    }
    
    private void checkForDB() throws SQLException {
        String query = "CREATE DATABASE IF NOT EXISTS velascirios";
        
        this.stmt.execute(query);
    }
    
    private void checkForTable()throws SQLException {
        String query = "CREATE TABLE IF NOT EXISTS pedidos"
            + "(id INT AUTO_INCREMENT PRIMARY KEY,"
            + "nombreCliente VARCHAR(50) NOT NULL,"
            + "tel VARCHAR(30) NOT NULL,"
            + "fechaEntrega DATE NOT NULL,"
            + "descripcion VARCHAR(255) NOT NULL);";
        
        this.stmt.execute(query);
    }
    
    public void createPedido(String nombreCliente, String tel, String fechaEntrega, String descripcion) throws SQLException {
        this.checkForDB();
        this.checkForTable();
        String query = "INSERT INTO pedidos (nombreCliente, tel, fechaEntrega, descripcion)" +
                   "VALUES ('" + nombreCliente + "', '" + tel + "', '" + fechaEntrega + "', '" + descripcion + "');";
        this.stmt.execute(query);
    }
    
    public void closeConnection() throws SQLException {
        this.stmt.close();
    }
}
