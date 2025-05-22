package br.com.xfjay.passbank.servlets;

import br.com.xfjay.passbank.dao.BankAccountDAO;
import br.com.xfjay.passbank.dao.DAOFactory;
import br.com.xfjay.passbank.model.BankAccount;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/listBankAccounts") // Define a URL para acessar este servlet
public class ListBankAccountsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BankAccountDAO bankAccountDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        // Obtém uma instância do DAO através da Factory
        bankAccountDAO = DAOFactory.getBankAccountDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Busca todas as contas bancárias
            List<BankAccount> accounts = bankAccountDAO.findAll();

            // Adiciona a lista de contas ao objeto request para ser acessada na JSP
            request.setAttribute("accountsList", accounts);

            // Encaminha a requisição para a página JSP que exibirá as contas
            request.getRequestDispatcher("/WEB-INF/jsp/listBankAccounts.jsp").forward(request, response);

        } catch (Exception e) {
            // Em uma aplicação real, trate o erro de forma mais robusta
            e.printStackTrace();
            // Você pode redirecionar para uma página de erro
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro ao buscar contas bancárias.");
        }
    }
}