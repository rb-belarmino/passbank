package br.com.xfjay.passbank.servlets;

import br.com.xfjay.passbank.dao.LoginDAO;
import br.com.xfjay.passbank.dao.LoginDAOImpl;
import br.com.xfjay.passbank.model.Login;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.util.Optional;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LoginDAO loginDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        loginDAO = new LoginDAOImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/jsp/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String passwordPlain = request.getParameter("password");
        String passwordConfirm = request.getParameter("passwordConfirm");

        // Validações básicas
        if (username == null || username.trim().isEmpty() ||
                passwordPlain == null || passwordPlain.trim().isEmpty() ||
                passwordConfirm == null || passwordConfirm.trim().isEmpty()) {
            request.setAttribute("error", "Todos os campos são obrigatórios.");
            request.getRequestDispatcher("/WEB-INF/jsp/register.jsp").forward(request, response);
            return;
        }

        if (!passwordPlain.equals(passwordConfirm)) {
            request.setAttribute("error", "As senhas não coincidem.");
            request.getRequestDispatcher("/WEB-INF/jsp/register.jsp").forward(request, response);
            return;
        }

        // Verificar se o usuário já existe
        try {
            Optional<Login> existingUser = loginDAO.findByUsername(username);
            if (existingUser.isPresent()) {
                request.setAttribute("error", "Este nome de usuário já está em uso.");
                request.getRequestDispatcher("/WEB-INF/jsp/register.jsp").forward(request, response);
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Erro ao verificar usuário. Tente novamente.");
            request.getRequestDispatcher("/WEB-INF/jsp/register.jsp").forward(request, response);
            return;
        }

        // Hashear a senha
        String hashedPassword = BCrypt.hashpw(passwordPlain, BCrypt.gensalt());

        // Criar e salvar o novo login
        Login newLogin = new Login(username, hashedPassword);
        try {
            loginDAO.save(newLogin);
            // Após o cadastro, redirecionar para a página de login com uma mensagem de sucesso
            request.getSession().setAttribute("successMessage", "Cadastro realizado com sucesso! Faça o login.");
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Erro ao salvar novo usuário. Tente novamente.");
            request.getRequestDispatcher("/WEB-INF/jsp/register.jsp").forward(request, response);
        }
    }
}