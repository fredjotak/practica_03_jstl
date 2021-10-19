<%@page import="com.emergentes.modelo.Libro"%>
<%@page import="com.emergentes.modelo.GestorLibros"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    if(session.getAttribute("libreria")==null) {
        GestorLibros objetoGL = new GestorLibros();
        
        // cargando libos por defecto
        objetoGL.insertarLibro(new Libro(1, "PROGRAMACIÓN Y ESTRUCTURA DE DATOS AVANZADAS", "VV.AA.", "El texto aborda el estudio en profundidad de los esquemas algorítmicos y de las estructuras de datos desde una perspéctiva diáctica", "Físico"));
        objetoGL.insertarLibro(new Libro(2, "ORGANIZACION Y ARQUITECTURA DE COMPUTADORAS ", "William Stallings", "La finalidad de este texto es que el lector aprenda los principios de diseño e implementación de  la organización y arquitectura de las computadoras actuales.", "Magnético"));
        objetoGL.insertarLibro(new Libro(3, "JAVASCRIPT DESARROLLE EFICAZMENTE", "Alexandre Brillant", "Este libro sobre JavaScript está dirigido a los desarrolladores que desean mejorar sus habilidades y competencias de JavaScript.", "Magnético"));
        
        session.setAttribute("libreria", objetoGL);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/styleGlobal.css">
        <link rel="stylesheet" href="css/style.css">
        <title>JSTL - Librería</title>
    </head>
    <body>
        <section>
            <h1>Librería</h1>
            <a href="Controller?op=nuevo" class="boton fondo-naranja centro ancho-200p">Nuevo</a>
            <div class="contenedor-lista">
                <% int contador = 0; %>
                <c:forEach var="item" items="${sessionScope.libreria.getListaLibros()}">
                    <div class="lista-detalle <%=(contador++%2==0)? "fondo-azul": "fondo-celeste"%>">
                        <p>
                            <b>Id: </b> ${item.id} <br>
                            <b>Título: </b> ${item.titulo} <br>
                            <b>Autor: </b> ${item.autor} <br>
                            <b>Medio: </b> ${item.medio} <br>
                            <b>Resumen: </b> ${item.resumen}
                        </p>
                        <div class="lista-detalle-boton-2">
                        <a href="Controller?op=modificar&id=${item.id}" class="boton centro fondo-verde">Editar</a>
                        <a href="Controller?op=eliminar&id=${item.id}" class="boton centro fondo-rojo" onclick="return confirm('Estas seguro de eliminar el libro ${item.titulo}');">Eliminar</a>
                    </div>
                    </div>
                </c:forEach>
            </div>
        </section>
        <footer>
            © Noviembre 2021 - Todos los derechos reservados
        </footer>
    </body>
</html>
