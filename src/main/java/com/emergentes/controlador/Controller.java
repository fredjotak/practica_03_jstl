package com.emergentes.controlador;

import com.emergentes.modelo.GestorLibros;
import com.emergentes.modelo.Libro;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Controller", urlPatterns = {"/Controller"})
public class Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Libro objLibro = new Libro();
        int id, pos;
        
        String op = request.getParameter("op")!=null? request.getParameter("op"): "vista";
        if(op.equals("nuevo")){
            HttpSession sesion = request.getSession();
            GestorLibros libreria = (GestorLibros)sesion.getAttribute("libreria");
            
            objLibro.setId(libreria.obtieneId());
            
            request.setAttribute("op", op);
            request.setAttribute("miLibro", objLibro);
            request.getRequestDispatcher("editar.jsp").forward(request, response);
        } else if(op.equals("modificar")) {
            id = Integer.parseInt(request.getParameter("id"));
            HttpSession sesion = request.getSession();
            GestorLibros libreria = (GestorLibros)sesion.getAttribute("libreria");
            
            pos = libreria.ubicarLibro(id);
            objLibro = libreria.getListaLibros().get(pos);
            
            request.setAttribute("op", op);
            request.setAttribute("miLibro", objLibro);
            request.getRequestDispatcher("editar.jsp").forward(request, response);
        } else if(op.equals("eliminar")) {
            id = Integer.parseInt(request.getParameter("id"));
            HttpSession sesion = request.getSession();
            GestorLibros libreria = (GestorLibros)sesion.getAttribute("libreria");
            
            pos = libreria.ubicarLibro(id);
            libreria.eliminarlibro(pos);
            
            sesion.setAttribute("libreria", libreria);
            response.sendRedirect("index.jsp");
        } else if(op.equals("vista")) {
            response.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Libro objLibro = new Libro();
        int pos;
        String op = request.getParameter("op");
        
        if(op.equals("grabar")){
            // Recupera valores del formulario
            objLibro.setId(Integer.parseInt(request.getParameter("hdnId")));
            objLibro.setTitulo(request.getParameter("txtTitulo"));
            objLibro.setAutor(request.getParameter("txtAutor"));
            objLibro.setResumen(request.getParameter("txtResumen"));
            objLibro.setMedio(request.getParameter("rdMedio"));
            
            HttpSession sesion = request.getSession();
            GestorLibros libreria = (GestorLibros)sesion.getAttribute("libreria");
            
            String opg = request.getParameter("opg");
            if(opg.equals("nuevo")) {
                libreria.insertarLibro(objLibro);
            } else { // caso contrario editar
                pos = libreria.ubicarLibro(objLibro.getId());
                libreria.modificarLibro(pos, objLibro);
            }
            sesion.setAttribute("libreria", libreria);
            response.sendRedirect("index.jsp");
        }
    }
}
