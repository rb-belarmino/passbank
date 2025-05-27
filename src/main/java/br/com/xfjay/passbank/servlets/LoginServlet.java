package br.com.xfjay.passbank.servlets;

import br.com.xfjay.passbank.dao.LoginDAO;
import br.com.xfjay.passbank.dao.LoginDAOImpl; // Certifique-se que esta importação existe
import br.com.xfjay.passbank.model.Login;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.util.Optional; // Importação para Optional

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LoginDAO loginDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        loginDAO = new LoginDAOImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String passwordAttempt = request.getParameter("password");

        if (username == null || username.trim().isEmpty() || passwordAttempt == null || passwordAttempt.trim().isEmpty()) {
            request.setAttribute("error", "Usuário e senha são obrigatórios.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        Login loginCredentialsFromDB = null;
        try {
            // A chamada ao DAO para buscar o usuário
            Optional<Login> loginOpt = loginDAO.findByUsername(username);
            if (loginOpt.isPresent()) {
                loginCredentialsFromDB = loginOpt.get();
            }
        } catch (Exception e) {
            // Logar a exceção e informar o usuário sobre um erro genérico
            e.printStackTrace(); // É uma boa prática logar o erro no servidor
            request.setAttribute("error", "Ocorreu um erro ao processar sua solicitação. Tente novamente mais tarde.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return; // Interrompe a execução se houver erro no banco
        }

        // Lógica de verificação de senha e login
        if (loginCredentialsFromDB != null) {
            // Compara a senha fornecida com o hash armazenado usando BCrypt
            if (BCrypt.checkpw(passwordAttempt, loginCredentialsFromDB.getPassword())) {
                HttpSession session = request.getSession();
                session.setAttribute("loggedInUser", username);
                response.sendRedirect(request.getContextPath() + "/randomAccounts");            } else {
                // Senha incorreta
                request.setAttribute("error", "Usuário ou senha inválidos.");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } else {
            // Usuário não encontrado
            request.setAttribute("error", "Usuário ou senha inválidos.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }
}