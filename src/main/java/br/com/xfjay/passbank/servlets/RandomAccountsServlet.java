package br.com.xfjay.passbank.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/randomAccounts")
public class RandomAccountsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Verifica se o usuário está autenticado
        if (request.getSession().getAttribute("loggedInUser") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Não busca nada do banco de dados, apenas redireciona para a página JSP
        // que vai gerar dados aleatórios via JavaScript
        request.getRequestDispatcher("/WEB-INF/jsp/randomAccounts.jsp").forward(request, response);    }
}