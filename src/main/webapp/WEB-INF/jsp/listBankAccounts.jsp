<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>PassBank - Bem-vindo</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
      padding-top: 50px;
    }
    .welcome-card {
      background-color: white;
      border-radius: 10px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
      padding: 30px;
      margin-bottom: 30px;
      text-align: center;
    }
    .logo {
      font-size: 48px;
      margin-bottom: 20px;
      color: #0d6efd;
    }
  </style>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
</head>
<body>
<div class="container">
  <div class="welcome-card">
    <div class="logo">
      <i class="bi bi-bank"></i>
    </div>
    <h1>Bem-vindo ao PassBank</h1>
    <p class="lead mt-3">Você está logado com sucesso.</p>

    <div class="mt-4">
      <a href="${pageContext.request.contextPath}/randomAccounts" class="btn btn-primary btn-lg">
        <i class="bi bi-credit-card"></i> Minhas Contas
      </a>
    </div>
  </div>

  <div class="d-flex justify-content-center">
    <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-danger">
      <i class="bi bi-box-arrow-right"></i> Sair
    </a>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>