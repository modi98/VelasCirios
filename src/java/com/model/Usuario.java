/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

/**
 *
 * @author mauri
 */
public class Usuario {
    
    public int id;
    public String correo;
    public String nombre;
    public String rol;

    public Usuario(int id, String correo, String nombre, String rol) {
        this.id = id;
        this.correo = correo;
        this.nombre = nombre;
        this.rol = rol;
    }
}
