/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dbHandlers;

import com.model.Pedido;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
            + "descripcion TEXT NOT NULL);";
        
        this.stmt.execute(query);
    }
    
    public void createPedido(String nombreCliente, String tel, String fechaEntrega, String descripcion) throws SQLException {
        this.checkForDB();
        this.checkForTable();
        String query = "INSERT INTO pedidos (nombreCliente, tel, fechaEntrega, descripcion)" +
                   "VALUES ('" + nombreCliente + "', '" + tel + "', '" + fechaEntrega + "', '" + descripcion + "');";
        this.stmt.execute(query);
    }
    
    public ArrayList<Pedido> getPedidos() throws SQLException {
        this.checkForDB();
        this.checkForTable();
        ResultSet rs = this.stmt.executeQuery("SELECT id, nombreCliente, tel, fechaEntrega, descripcion FROM pedidos");
        ArrayList<Pedido> result = new ArrayList<Pedido>();
        while (rs.next()) {
            try {
                result.add(new Pedido(rs.getString("nombreCliente"), rs.getString("tel"), rs.getTimestamp("fechaEntrega"), rs.getString("descripcion")));
            } catch (Exception _) {
                
            }
        }
        return result;
    }
    
    public void closeConnection() throws SQLException {
        this.stmt.close();
    }
}
