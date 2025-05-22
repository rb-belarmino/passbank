<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Pass Bank</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body, html { height: 100%; margin: 0; font-family: 'Inter', sans-serif; }
        .bg-dark-custom { background-color: #121212; color: #ffffff; min-height: 100%; display: flex; align-items: center; justify-content: center; text-align: center; padding: 20px; }
        .content-wrapper { max-width: 400px; width: 100%; background-color: #1e1e1e; padding: 30px; border-radius: 10px; box-shadow: 0 8px 16px rgba(0,0,0,0.3); }
        .pass-bank-title { font-size: 2.5rem; font-weight: bold; margin-bottom: 1.5rem; letter-spacing: 1px; }
        .form-group label { color: #adb5bd; text-align: left; display: block; }
        .form-control { background-color: #2a2e34; border: 1px solid #495057; color: #ffffff; border-radius: 0.5rem; }
        .form-control:focus { background-color: #2a2e34; border-color: #007bff; color: #ffffff; box-shadow: none; }
        .btn-custom-primary { background-color: #007bff; border-color: #007bff; color: white; padding: 0.75rem 1.5rem; font-size: 1rem; border-radius: 0.5rem; width: 100%; transition: background-color 0.3s ease, border-color 0.3s ease; margin-top: 1rem;}
        .btn-custom-primary:hover { background-color: #0056b3; border-color: #0056b3; }
        .error-message { color: #dc3545; margin-bottom: 1rem; font-size: 0.9rem; }
        .links-container { margin-top: 1.5rem; color: #adb5bd; font-size: 0.9rem; }
        .links-container a { color: #007bff; text-decoration: none; }
        .links-container a:hover { text-decoration: underline; }
        .success-message { color: #28a745; margin-bottom: 1rem; font-size: 0.9rem; background-color: rgba(40, 167, 69, 0.1); border: 1px solid rgba(40, 167, 69, 0.3); padding: 0.75rem; border-radius: 0.375rem; }
    </style>
</head>
<body class="bg-dark-custom">
<div class="content-wrapper">

    <h1 class="pass-bank-title">LOGIN</h1>
    <%
        String error = (String) request.getAttribute("error");
        if (error != null && !error.isEmpty()) {
    %>
    <p class="error-message"><%= error %></p>
    <%
        }
        // Adicionar este bloco para mensagem de sucesso
        String successMessage = (String) session.getAttribute("successMessage");
        if (successMessage != null && !successMessage.isEmpty()) {
    %>
    <p class="success-message"><%= successMessage %></p>
    <%
            session.removeAttribute("successMessage"); // Limpar a mensagem da sessão após exibi-la
        }
    %>
    <form method="post" action="${pageContext.request.contextPath}/login">
        <div class="form-group">
            <label for="username">Usuário:</label>
            <input type="text" class="form-control" id="username" name="username" required>
        </div>
        <div class="form-group">
            <label for="password">Senha:</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        <button type="submit" class="btn btn-custom-primary">Entrar</button>
    </form>
    <div class="links-container">
        <%-- Link para registro pode ser adicionado futuramente --%>
        <%-- Não tem uma conta? <a href="${pageContext.request.contextPath}/register.jsp">Crie uma aqui</a> <br/> --%>
        <a href="${pageContext.request.contextPath}/index.jsp">Voltar para Home</a>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>