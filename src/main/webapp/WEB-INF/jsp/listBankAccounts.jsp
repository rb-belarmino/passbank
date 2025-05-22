<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="br.com.xfjay.passbank.model.BankAccount" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%-- Para usar JSTL, se configurado --%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Lista de Contas Bancárias</title>
  <style>
    table {
      width: 80%;
      border-collapse: collapse;
      margin: 20px auto;
    }
    th, td {
      border: 1px solid #ddd;
      padding: 8px;
      text-align: left;
    }
    th {
      background-color: #f2f2f2;
    }
  </style>
</head>
<body>
<h1>Contas Bancárias Cadastradas</h1>

<%-- Verifica se a lista de contas não está vazia --%>
<%
  List<BankAccount> accounts = (List<BankAccount>) request.getAttribute("accountsList");
  if (accounts != null && !accounts.isEmpty()) {
%>
<table>
  <thead>
  <tr>
    <th>ID</th>
    <th>Nome do Banco</th>
    <th>Número da Conta</th>
    <th>Agência</th>
    <th>Tipo da Conta</th>
  </tr>
  </thead>
  <tbody>
  <%-- Itera sobre a lista de contas e exibe cada uma --%>
  <% for (BankAccount account : accounts) { %>
  <tr>
    <td><%= account.getId() %></td>
    <td><%= account.getBankName() %></td>
    <td><%= account.getAccountNumber() %></td>
    <td><%= account.getAgency() %></td>
    <td><%= account.getAccountType() %></td>
  </tr>
  <% } %>
  </tbody>
</table>
<% } else { %>
<p>Nenhuma conta bancária encontrada.</p>
<% } %>

<br/>
<a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-link">Voltar para Home</a>
<a href="${pageContext.request.contextPath}/logout" class="btn btn-link">Sair (Logout)</a>
<%-- Adicione aqui um link para a página de adicionar nova conta, se desejar --%>
<%-- <a href="${pageContext.request.contextPath}/addBankAccount.jsp">Adicionar Nova Conta</a> --%>

</body>
</html>