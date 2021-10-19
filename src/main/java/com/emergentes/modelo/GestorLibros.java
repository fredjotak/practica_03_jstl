package com.emergentes.modelo;

import java.util.ArrayList;
import java.util.Iterator;

public class GestorLibros {
    private ArrayList<Libro> listaLibros;
    
    public GestorLibros(){
        this.listaLibros = new ArrayList<Libro>();
    }

    public ArrayList<Libro> getListaLibros() {
        return listaLibros;
    }

    public void setListaLibros(ArrayList<Libro> listaLibros) {
        this.listaLibros = listaLibros;
    }
    
    public void insertarLibro(Libro libro){
        this.listaLibros.add(libro);
    }
    
    public void modificarLibro(int pos, Libro libro){
        this.listaLibros.set(pos, libro);
    }
    
    public void eliminarlibro(int pos){
        this.listaLibros.remove(pos);
    }
    
    public int obtieneId(){
        int idAux = 0;
        for(Libro item: this.listaLibros){
            idAux = item.getId();
        }
        return idAux+1;
    }
    
    public int ubicarLibro(int id){
        int pos = -1;
        Iterator<Libro> it = this.listaLibros.iterator();
        
        while(it.hasNext()){
            pos++;
            Libro aux = it.next();
            if(aux.getId() == id){
                break;
            }
        }
        return pos;
    }
}
