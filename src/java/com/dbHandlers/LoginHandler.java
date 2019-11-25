/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dbHandlers;

import com.model.Usuario;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
/**
 *
 * @author mauri
 */
public class LoginHandler {
    private Connection conn;
    private Statement stmt;
    
    public LoginHandler() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        this.conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/velascirios", "root", "");
        this.stmt = conn.createStatement();
    }
    
    private void checkForDB() throws SQLException {
        String query = "CREATE DATABASE IF NOT EXISTS velascirios";
        
        this.stmt.execute(query);
    }
    
    private void checkForTable()throws SQLException {
        String query = "CREATE TABLE IF NOT EXISTS usuarios"
            + "(id INT AUTO_INCREMENT PRIMARY KEY,"
            + "correo VARCHAR(30) NOT NULL,"
            + "nombre VARCHAR(30) NOT NULL,"
            + "pass VARCHAR(30) NOT NULL,"
            + "rol VARCHAR(30) NOT NULL)";
        
        this.stmt.execute(query);
    }
    
    public void createUser(String correo, String nombre, String password, String rol) throws SQLException {
        this.checkForDB();
        this.checkForTable();
        String query = "INSERT INTO usuarios (correo, nombre, pass, rol)" +
                   "VALUES ('" + correo + "', '" + nombre + "', '" + password + "', '" + rol + "')";
        
        this.stmt.execute(query);
        this.stmt.close();
    }
    
    public void actualizarUsuario(int usuarioId, String nombre, String correo, String rol) throws SQLException {
        this.checkForDB();
        this.checkForTable();
        String query = "UPDATE usuarios SET "
                + "nombre = '" + nombre + "', "
                + "correo = '" + correo + "', "
                + "rol = '" + rol + "' "
                + "WHERE id = " + usuarioId + ";";
        this.stmt.execute(query);
        this.stmt.close();
    }
    
    public ArrayList<Usuario> getUsers() throws SQLException {
        this.checkForDB();
        this.checkForTable();
        
        String query = "SELECT id, correo, nombre, rol FROM usuarios";
        ResultSet rs = this.stmt.executeQuery(query);
        
        ArrayList<Usuario> result = new ArrayList<Usuario>();
        while (rs.next()) {
            int c1 = rs.getInt("id");
            String c2 = rs.getString("correo");
            String c3 = rs.getString("nombre");
            String c4 = rs.getString("rol");
            result.add(new Usuario(c1, c2, c3, c4));
        }
        this.stmt.close();
        return result;
    }
    
    public ArrayList<Usuario> getUser(String correo, String pass) throws SQLException {
        this.checkForDB();
        this.checkForTable();
        
        String query = "SELECT id, correo, nombre, rol FROM usuarios WHERE correo = '" + correo + "' AND pass = '" + pass + "'";
        ResultSet rs = this.stmt.executeQuery(query);
        
        ArrayList<Usuario> result = new ArrayList<Usuario>();
        while (rs.next()) {
            int c1 = rs.getInt("id");
            String c2 = rs.getString("correo");
            String c3 = rs.getString("nombre");
            String c4 = rs.getString("rol");
            result.add(new Usuario(c1, c2, c3, c4));
        }
        this.stmt.close();
        return result;
    }
}
