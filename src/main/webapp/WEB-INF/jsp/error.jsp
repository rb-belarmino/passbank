<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Erro - Pass Bank</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap" rel="stylesheet">
  <style>
    body, html { height: 100%; margin: 0; font-family: 'Inter', sans-serif; }
    .bg-dark-custom { background-color: #121212; color: #ffffff; min-height: 100%; display: flex; flex-direction: column; align-items: center; justify-content: center; text-align: center; padding: 20px; }
    .error-title { font-size: 2.5rem; font-weight: bold; margin-bottom: 1rem; }
    .error-message-text { font-size: 1.2rem; color: #adb5bd; margin-bottom: 2rem; }
    .btn-home { background-color: #007bff; border-color: #007bff; color: white; padding: 0.75rem 1.5rem; font-size: 1rem; border-radius: 0.5rem; text-decoration: none; transition: background-color 0.3s ease, border-color 0.3s ease; }
    .btn-home:hover { background-color: #0056b3; border-color: #0056b3; text-decoration: none; color: white; }
  </style>
</head>
<body class="bg-dark-custom">
<h1 class="error-title">Oops! Algo deu errado.</h1>
<%
  String errorMessage = "Ocorreu um erro inesperado ao processar sua solicitação.";
  Integer statusCode = (Integer) request.getAttribute("jakarta.servlet.error.status_code");
  // Throwable throwable = (Throwable) request.getAttribute("jakarta.servlet.error.exception"); // Para depuração

  if (statusCode != null) {
    if (statusCode == 404) {
      errorMessage = "A página que você está procurando não foi encontrada (Erro 404).";
    } else if (statusCode == 500) {
      errorMessage = "Houve um problema interno no servidor (Erro 500). Por favor, tente novamente mais tarde.";
    } else {
      errorMessage = "Ocorreu um erro (Código: " + statusCode + ").";
    }
  }
%>
<p class="error-message-text"><%= errorMessage %></p>
<a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-home">Voltar para a Página Inicial</a>
</body>
</html>