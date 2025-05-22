<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registrar - PassBank</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    body { display: flex; align-items: center; justify-content: center; min-height: 100vh; margin: 0; background-color: #212529; color: #f8f9fa; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
    .content-wrapper { background-color: #343a40; padding: 2.5rem; border-radius: 0.75rem; box-shadow: 0 0.5rem 1.5rem rgba(0, 0, 0, 0.25); width: 100%; max-width: 420px; text-align: center; }
    .pass-bank-title { font-size: 2.2rem; font-weight: bold; color: #007bff; margin-bottom: 1.5rem; text-transform: uppercase; letter-spacing: 1px; }
    .form-group label { display: block; text-align: left; margin-bottom: 0.5rem; font-weight: 500; color: #adb5bd; }
    .form-control { background-color: #495057; border: 1px solid #6c757d; color: #f8f9fa; border-radius: 0.375rem; padding: 0.75rem 1rem; }
    .form-control:focus { background-color: #495057; border-color: #007bff; color: #ffffff; box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25); }
    .btn-custom-primary { background-color: #007bff; border-color: #007bff; color: white; padding: 0.75rem 1.5rem; font-size: 1rem; border-radius: 0.5rem; width: 100%; transition: background-color 0.3s ease, border-color 0.3s ease; margin-top: 1.5rem; }
    .btn-custom-primary:hover { background-color: #0056b3; border-color: #0056b3; }
    .error-message { color: #dc3545; margin-bottom: 1rem; font-size: 0.9rem; background-color: rgba(220, 53, 69, 0.1); border: 1px solid rgba(220, 53, 69, 0.3); padding: 0.75rem; border-radius: 0.375rem; }
    .success-message { color: #28a745; margin-bottom: 1rem; font-size: 0.9rem; background-color: rgba(40, 167, 69, 0.1); border: 1px solid rgba(40, 167, 69, 0.3); padding: 0.75rem; border-radius: 0.375rem; }
    .login-link { margin-top: 1.5rem; color: #adb5bd; font-size: 0.9rem; }
    .login-link a { color: #007bff; text-decoration: none; }
    .login-link a:hover { text-decoration: underline; }
  </style>
</head>
<body>
<div class="content-wrapper">
  <h1 class="pass-bank-title">Criar Conta</h1>
  <%
    String error = (String) request.getAttribute("error");
    if (error != null && !error.isEmpty()) {
  %>
  <p class="error-message"><%= error %></p>
  <%
    }
    String successMessage = (String) request.getAttribute("successMessage"); // Para mensagens de sucesso via request
    if (successMessage == null) { // Tenta pegar da sessão se não estiver no request
      successMessage = (String) session.getAttribute("successMessage");
      if (successMessage != null) {
        session.removeAttribute("successMessage"); // Limpa após exibir
      }
    }
    if (successMessage != null && !successMessage.isEmpty()) {
  %>
  <p class="success-message"><%= successMessage %></p>
  <%
    }
  %>
  <form method="post" action="${pageContext.request.contextPath}/register">
    <div class="form-group">
      <label for="username">Usuário:</label>
      <input type="text" class="form-control" id="username" name="username" required>
    </div>
    <div class="form-group">
      <label for="password">Senha:</label>
      <input type="password" class="form-control" id="password" name="password" required>
    </div>
    <div class="form-group">
      <label for="passwordConfirm">Confirmar Senha:</label>
      <input type="password" class="form-control" id="passwordConfirm" name="passwordConfirm" required>
    </div>
    <button type="submit" class="btn btn-custom-primary">Registrar</button>
  </form>
  <div class="login-link">
    Já tem uma conta? <a href="${pageContext.request.contextPath}/login.jsp">Faça Login</a>
  </div>
</div>
</body>
</html>