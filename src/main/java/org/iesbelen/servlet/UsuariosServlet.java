package org.iesbelen.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.iesbelen.dao.UsuarioDAO;
import org.iesbelen.dao.UsuarioDAOImpl;
import org.iesbelen.model.Usuario;

import java.io.IOException;
import java.util.List;


@WebServlet(name = "usuariosServlet", value = "/tienda/usuarios/*")
public class UsuariosServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher;

        String pathInfo = request.getPathInfo(); //

        if (pathInfo == null || "/".equals(pathInfo)) {
            UsuarioDAO userDAO = new UsuarioDAOImpl();

            //GET 
            //	/usuarios/
            //	/usuarios

            request.setAttribute("listaProductos", userDAO.getAll());
            dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/usuarios/usuarios.jsp");

        } else {
            // GET
            // 		/usuarios/{id}
            // 		/usuarios/{id}/
            // 		/usuarios/edit/{id}
            // 		/usuarios/edit/{id}/
            // 		/usuarios/crear
            // 		/usuarios/crear/

            pathInfo = pathInfo.replaceAll("/$", "");
            String[] pathParts = pathInfo.split("/");

            if (pathParts.length == 2 && "crear".equals(pathParts[1])) {

                // GET
                // /productos/crear
                UsuarioDAO userDAO = new UsuarioDAOImpl();
                List<Usuario> usuarios = userDAO.getAll();
                request.setAttribute("usuarios", usuarios);

                dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/usuarios/crear-usuario.jsp");


            } else if (pathParts.length == 2) {
                UsuarioDAO userDAO = new UsuarioDAOImpl();
                // GET
                // /productos/{id}
                try {
                    request.setAttribute("usuario",userDAO.find(Integer.parseInt(pathParts[1])));
                    dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/usuarios/detalle-usuario.jsp");

                } catch (NumberFormatException nfe) {
                    nfe.printStackTrace();
                    dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/usuarios/usuarios.jsp");
                }

            } else if (pathParts.length == 3 && "editar".equals(pathParts[1]) ) {
                UsuarioDAO userDAO = new UsuarioDAOImpl();

                // GET
                // /productos/editar/{id}
                try {
                    request.setAttribute("usuario", userDAO.find(Integer.parseInt(pathParts[2])));
                    dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/usuarios/editar-usuario.jsp");

                } catch (NumberFormatException nfe) {
                    nfe.printStackTrace();
                    dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/usuarios/usuarios.jsp");
                }


            } else {

                System.out.println("Opción POST no soportada.");
                dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/usuarios/usuarios.jsp");

            }

        }

        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher;
        String __method__ = request.getParameter("__method__");

        System.out.println(__method__);

        if (__method__ == null) {
            String usuario = request.getParameter("usuario");
            String password = request.getParameter("password");
            String rol = request.getParameter("rol");
            Usuario nuevoUser= new Usuario();
            nuevoUser.setUsuario(usuario);
            nuevoUser.setPassword(password);
            nuevoUser.setRol(rol);

            UsuarioDAO UsuarioDAO = new UsuarioDAOImpl();
            UsuarioDAO.create(nuevoUser);

        } else if (__method__ != null && "put".equalsIgnoreCase(__method__)) {
            // Actualizar uno existente
            //Dado que los forms de html sólo soportan method GET y POST utilizo parámetro oculto para indicar la operación de actulización PUT.
            doPut(request, response);

        } else if (__method__ != null && "delete".equalsIgnoreCase(__method__)) {
            // Actualizar uno existente
            //Dado que los forms de html sólo soportan method GET y POST utilizo parámetro oculto para indicar la operación de actulización DELETE.
            doDelete(request, response);

        } else {
            System.out.println("Opción POST no soportada.");
        }

        //response.sendRedirect("../../../tienda/productos");
        response.sendRedirect(request.getContextPath() + "/tienda/usuarios");
    }


    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");
        String rol = request.getParameter("rol");
        Integer id = Integer.parseInt(request.getParameter("idUsuario"));
        Usuario nuevoUser= new Usuario();
        UsuarioDAO userDAO = new UsuarioDAOImpl();


        try {
            nuevoUser.setIdUsuario(id);
            nuevoUser.setUsuario(usuario);
            nuevoUser.setPassword(password);
            nuevoUser.setRol(rol);
            userDAO.update(nuevoUser);
        } catch (NumberFormatException nfe) {
            nfe.printStackTrace();
        }

    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
    {
        RequestDispatcher dispatcher;
        UsuarioDAO UsuarioDAO = new UsuarioDAOImpl();
        String codigo = request.getParameter("codigo");

        try {

            int id = Integer.parseInt(codigo);

            UsuarioDAO.delete(id);

        } catch (NumberFormatException nfe) {
            nfe.printStackTrace();
        }
    }
}
