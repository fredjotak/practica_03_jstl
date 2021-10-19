<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/styleGlobal.css">
        <link rel="stylesheet" href="css/style.css">
        <title>JSP Page</title>
    </head>
    <body>
        <section>
            <div class="contenedor-formulario">
                <h1 class="formulario-titulo centro">
                    <c:if test="${requestScope.op == 'nuevo'}" var="res" scope="request">
                        Registro de
                    </c:if>
                    <c:if test="${requestScope.op == 'modificar'}" var="res" scope="request">
                        Modificar
                    </c:if> 
                    libro
                </h1>
                <div class="formulario-logo"><img src="./css/imagen/estante-para-libros.png" alt=""></div>
                <jsp:useBean id="miLibro" class="com.emergentes.modelo.Libro" scope="request" />
                
                <form class="formulario fondo-azul" action="Controller" method="POST">
                    <div class="formulario-campos">
                        <input type="hidden" name="hdnId" value='<jsp:getProperty name="miLibro" property="id" />' >
                        
                        <label for="txtTitulo">Título:</label>
                        <input type="text" id="txtTitulo" name="txtTitulo" required placeholder="título del libro" value='<jsp:getProperty name="miLibro" property="titulo" />' >
                        <br>
                        
                        <label for="txtAutor">Autor:</label>
                        <input type="text" id="txtAutor" name="txtAutor" required placeholder="autor del libro" value='<jsp:getProperty name="miLibro" property="autor" />' >
                        <br>
                        
                        <label for="txtResumen">Resumen:</label>
                        <textarea name="txtResumen" id="txtResumen" rows="5" required placeholder="resumen del libro" ><jsp:getProperty name="miLibro" property="resumen" /></textarea>
                        <br>
                        
                        <label for="rdMedio">Medio:</label>
                        <div class="formulario-campos-radio">
                            <input type="radio" name="rdMedio" id="rdMedio" value="Físico" 
                                   <c:if test="${miLibro.medio == 'Físico'}" var="resM" scope="request">checked</c:if>
                            /> Físico<br>
                            <input type="radio" name="rdMedio" id="rdMedio" value="Magnético"
                            <c:if test="${miLibro.medio == 'Magnético'}" var="resM" scope="request">checked</c:if>
                            /> Magnético
                        </div>
                        <br>
                        <input type="hidden" name="opg" value="${requestScope.op}" />
                        <input type="hidden" name="op" value="grabar" />
                    </div>
                    <input class="boton fondo-naranja centro" type="submit" value="<c:if test="${requestScope.op == 'nuevo'}" var="res" scope="request">Registrar</c:if> <c:if test="${requestScope.op == 'modificar'}" var="res" scope="request">Modificar</c:if>" />
                </form>
            </div>
        </section>
        <footer>
            © Noviembre 2021 - Todos los derechos reservados
        </footer>
    </body>
</html>
