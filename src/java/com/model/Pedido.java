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
    public int id;
    public String nombreCliente;
    public String tel;
    public Date fechaEntrega;
    public boolean entregado;
    public String descripcion;

    public Pedido(int id, String nombreCliente, String tel, Date fechaEntrega, boolean entregado, String descripcion) throws Exception {
        this.id = id;
        this.nombreCliente = nombreCliente;
        this.tel = tel;
        this.fechaEntrega = fechaEntrega;
        this.entregado = entregado;
        this.descripcion = descripcion;
    }
}
