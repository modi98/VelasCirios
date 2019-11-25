/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author mauri
 */
public class Pedido {
    public String nombreCliente;
    public String tel;
    public Date fechaEntrega;
    public String descripcion;

    public Pedido(String nombreCliente, String tel, Date fechaEntrega, String descripcion) throws Exception {
        this.nombreCliente = nombreCliente;
        this.tel = tel;
        this.fechaEntrega = fechaEntrega;
        this.descripcion = descripcion;
    }
}
