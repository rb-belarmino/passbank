package br.com.xfjay.passbank.filters;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter("/*") // Aplica a todos os requests, a lógica de quais proteger está no método
public class AuthenticationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        String requestURI = httpRequest.getRequestURI();
        String contextPath = httpRequest.getContextPath();

        boolean isLoggedIn = (session != null && session.getAttribute("loggedInUser") != null);

        // Páginas/recursos públicos
        boolean isLoginResource = requestURI.equals(contextPath + "/login") || requestURI.equals(contextPath + "/login.jsp");
        boolean isIndexPage = requestURI.equals(contextPath + "/") || requestURI.equals(contextPath + "/index.jsp");
        boolean isRegisterResource = requestURI.equals(contextPath + "/register") || requestURI.equals(contextPath + "/register.jsp");
        // Adicione aqui outros recursos públicos como CSS, JS, imagens se não estiverem em WEB-INF
        // Ex: boolean isStaticResource = requestURI.startsWith(contextPath + "/css/") || requestURI.startsWith(contextPath + "/js/");
        boolean isBootstrapCss = requestURI.contains("bootstrap.min.css"); // Permite CDN do Bootstrap
        boolean isBootstrapJs = requestURI.contains("bootstrap.min.js") || requestURI.contains("jquery.slim.min.js") || requestURI.contains("popper.min.js");


        if (isLoggedIn || isLoginResource || isIndexPage || isRegisterResource || isBootstrapCss || isBootstrapJs /* || isStaticResource */) {            chain.doFilter(request, response); // Permite o acesso
        } else {
            // Se não estiver logado e tentar acessar uma página protegida, redireciona para o login
            httpResponse.sendRedirect(contextPath + "/login.jsp");
        }
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Código de inicialização do filtro (opcional)
    }

    @Override
    public void destroy() {
        // Código de limpeza do filtro (opcional)
    }
}