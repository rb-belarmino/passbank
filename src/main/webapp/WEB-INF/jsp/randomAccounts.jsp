<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>PassBank - Minhas Contas</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
  <style>
    body {
      background: linear-gradient(135deg, #4568DC, #5B72E4);
      min-height: 100vh;
      padding: 40px 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    .content-container {
      max-width: 900px;
      margin: 0 auto;
    }
    .header-card {
      background-color: white;
      border-radius: 20px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
      padding: 25px 30px;
      margin-bottom: 30px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .account-card {
      background: linear-gradient(to right, #ffffff, #f8f9fc);
      border-radius: 20px;
      box-shadow: 0 12px 30px rgba(0, 0, 0, 0.1);
      padding: 30px 25px;
      margin-bottom: 30px;
      position: relative;
      overflow: hidden;
      border-left: 6px solid #4568DC;
      transition: all 0.3s ease;
    }
    .account-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    }
    .bank-icon {
      font-size: 28px;
      color: #4568DC;
      margin-right: 15px;
      background: rgba(69, 104, 220, 0.1);
      width: 50px;
      height: 50px;
      display: flex;
      align-items: center;
      justify-content: center;
      border-radius: 15px;
    }
    .account-type {
      font-size: 0.8rem;
      padding: 5px 12px;
      border-radius: 30px;
      background-color: rgba(69, 104, 220, 0.1);
      color: #4568DC;
      display: inline-block;
      margin-left: 12px;
      font-weight: 600;
      letter-spacing: 0.5px;
      text-transform: uppercase;
    }
    .account-details {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
      gap: 20px;
      margin-top: 25px;
    }
    .detail-item {
      padding: 15px;
      background-color: #f8f9fc;
      border-radius: 12px;
      transition: all 0.2s ease;
      border: 1px solid rgba(0,0,0,0.05);
    }
    .detail-item:hover {
      background-color: #ffffff;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
    }
    .detail-label {
      font-size: 0.75rem;
      color: #6c757d;
      margin-bottom: 8px;
      font-weight: 600;
      text-transform: uppercase;
      letter-spacing: 0.7px;
    }
    .detail-value {
      font-size: 1.1rem;
      font-weight: 600;
      color: #333;
    }
    .action-buttons {
      margin-top: 20px;
      display: flex;
      gap: 12px;
    }
    .btn-primary {
      background: linear-gradient(135deg, #4568DC, #5B72E4);
      border: none;
      padding: 10px 20px;
      font-weight: 600;
      border-radius: 10px;
      box-shadow: 0 5px 15px rgba(69, 104, 220, 0.3);
    }
    .btn-primary:active{
      transform: scale(0.95);
    }
    .btn-primary:hover {
      background: linear-gradient(135deg, #3a57c4, #4d63d2);
      transform: translateY(-2px);
      box-shadow: 0 8px 20px rgba(59, 85, 230, 0.4);
    }
    h1 {
      color: #333;
      font-size: 2rem;
      margin: 0;
      font-weight: 700;
    }
    h4 {
      font-weight: 600;
      font-size: 1.3rem;
      margin: 0;
    }
    .footer {
      text-align: center;
      margin-top: 30px;
      padding: 20px 0;
    }
    .card-chip {
      width: 45px;
      height: 35px;
      background: linear-gradient(45deg, #ddd, #999);
      border-radius: 8px;
      position: absolute;
      right: 30px;
      top: 30px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    .card-chip::before {
      content: "";
      position: absolute;
      width: 25px;
      height: 15px;
      background: #a0a0a0;
      top: 10px;
      left: 10px;
      border-radius: 3px;
    }
    .btn-outline-primary, .btn-outline-secondary, .btn-outline-danger {
      border-radius: 8px;
      padding: 6px 12px;
      font-weight: 500;
      transition: all 0.2s ease;
    }
    .btn-outline-primary:hover, .btn-outline-secondary:hover, .btn-outline-danger:hover {
      transform: translateY(-2px);
    }
    .btn-light {
      background-color: white;
      color: #4568DC;
      border: none;
      padding: 10px 20px;
      border-radius: 10px;
      font-weight: 600;
      box-shadow: 0 5px 15px rgba(255, 255, 255, 0.2);
      transition: all 0.2s ease;
    }
    .btn-light:hover {
      background-color: #f8f9fa;
      transform: translateY(-2px);
      box-shadow: 0 8px 20px rgba(255, 255, 255, 0.3);
    }
    .btn-outline-light {
      color: white;
      border: 2px solid white;
      padding: 10px 20px;
      border-radius: 10px;
      font-weight: 600;
      transition: all 0.2s ease;
    }
    .btn-outline-light:hover {
      background-color: rgba(255, 255, 255, 0.1);
      transform: translateY(-2px);
    }
    .balance-highlight {
      color: #28a745;
      font-weight: 700;
    }
    .account-header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-bottom: 15px;
    }
  </style>
</head>
<body>
<div class="container content-container">
  <div class="header-card">
    <h1><i class="bi bi-credit-card-2-front me-2"></i> Minhas Contas</h1>

  </div>

  <div id="accounts-container">
    <!-- Conta 1 - Pré-gerada estaticamente -->
    <div class="account-card">
      <div class="account-header">
        <div class="d-flex align-items-center">
          <div class="bank-icon"><i class="bi bi-bank"></i></div>
          <h4>Banco do Brasil<span class="account-type">Conta Corrente</span></h4>
        </div>
        <div class="card-chip"></div>
      </div>

      <div class="account-details">
        <div class="detail-item">
          <div class="detail-label">NÚMERO DA CONTA</div>
          <div class="detail-value">57892-4</div>
        </div>
        <div class="detail-item">
          <div class="detail-label">AGÊNCIA</div>
          <div class="detail-value">1234</div>
        </div>
        <div class="detail-item">
          <div class="detail-label">SALDO ATUAL</div>
          <div class="detail-value balance-highlight">R$ 5.247,89</div>
        </div>
        <div class="detail-item">
          <div class="detail-label">DATA DE ABERTURA</div>
          <div class="detail-value">15/03/2020</div>
        </div>
      </div>

      <div class="mt-4">
        <div class="detail-item">
          <div class="detail-label">CARTÃO VINCULADO</div>
          <div class="detail-value">**** **** **** 4785 <span class="text-muted">(Validade: 05/2026)</span></div>
        </div>
      </div>

      <div class="action-buttons">
        <button class="btn btn-sm btn-outline-primary">
          <i class="bi bi-pencil me-1"></i> Editar
        </button>
        <button class="btn btn-sm btn-outline-secondary">
          <i class="bi bi-arrows-angle-expand me-1"></i> Detalhes
        </button>
        <button class="btn btn-sm btn-outline-danger">
          <i class="bi bi-trash me-1"></i> Excluir
        </button>
      </div>
    </div>

    <!-- Conta 2 - Pré-gerada estaticamente -->
    <div class="account-card">
      <div class="account-header">
        <div class="d-flex align-items-center">
          <div class="bank-icon"><i class="bi bi-building-fill"></i></div>
          <h4>Bradesco<span class="account-type">Conta Poupança</span></h4>
        </div>
        <div class="card-chip"></div>
      </div>

      <div class="account-details">
        <div class="detail-item">
          <div class="detail-label">NÚMERO DA CONTA</div>
          <div class="detail-value">32458-9</div>
        </div>
        <div class="detail-item">
          <div class="detail-label">AGÊNCIA</div>
          <div class="detail-value">3456</div>
        </div>
        <div class="detail-item">
          <div class="detail-label">SALDO ATUAL</div>
          <div class="detail-value balance-highlight">R$ 8.712,45</div>
        </div>
        <div class="detail-item">
          <div class="detail-label">DATA DE ABERTURA</div>
          <div class="detail-value">22/09/2021</div>
        </div>
      </div>

      <div class="mt-4">
        <div class="detail-item">
          <div class="detail-label">CARTÃO VINCULADO</div>
          <div class="detail-value">**** **** **** 2943 <span class="text-muted">(Validade: 08/2027)</span></div>
        </div>
      </div>

      <div class="action-buttons">
        <button class="btn btn-sm btn-outline-primary">
          <i class="bi bi-pencil me-1"></i> Editar
        </button>
        <button class="btn btn-sm btn-outline-secondary">
          <i class="bi bi-arrows-angle-expand me-1"></i> Detalhes
        </button>
        <button class="btn btn-sm btn-outline-danger">
          <i class="bi bi-trash me-1"></i> Excluir
        </button>
      </div>
    </div>
  </div>

  <div class="footer">
    <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-light">
      <i class="bi bi-arrow-left me-1"></i> Dashboard
    </a>
    <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-light ms-2">
      <i class="bi bi-box-arrow-right me-1"></i> Sair
    </a>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    // Bancos, tipos de contas e agências possíveis
    const banks = [
      {name: 'Banco do Brasil', icon: 'bi-bank'},
      {name: 'Itaú', icon: 'bi-building'},
      {name: 'Bradesco', icon: 'bi-building-fill'},
      {name: 'Caixa Econômica', icon: 'bi-piggy-bank'},
      {name: 'Santander', icon: 'bi-currency-exchange'},
      {name: 'Nubank', icon: 'bi-credit-card-2-front'},
      {name: 'Inter', icon: 'bi-credit-card-fill'}
    ];

    const accountTypes = ['Conta Corrente', 'Conta Poupança', 'Conta Salário', 'Conta Digital'];
    const agencies = ['0001', '1234', '5678', '2022', '4321', '9876', '3456', '7890'];

    // Função para gerar contas aleatórias
    function generateRandomAccounts(count = 3) {
      try {
        console.log("Gerando contas aleatórias...");
        const accountsContainer = document.getElementById('accounts-container');
        if (!accountsContainer) {
          console.error("Container de contas não encontrado!");
          return;
        }

        accountsContainer.innerHTML = ''; // Limpa contas existentes

        for (let i = 0; i < count; i++) {
          const bank = banks[Math.floor(Math.random() * banks.length)];
          const accountType = accountTypes[Math.floor(Math.random() * accountTypes.length)];
          const agency = agencies[Math.floor(Math.random() * agencies.length)];
          const accountNumber = Math.floor(10000 + Math.random() * 90000) + '-' + Math.floor(1 + Math.random() * 9);
          const balance = (Math.random() * 10000).toFixed(2).replace('.', ',');

          // Data de abertura aleatória nos últimos 5 anos
          const today = new Date();
          const startDate = new Date(today);
          startDate.setFullYear(today.getFullYear() - 5);
          const openDate = new Date(startDate.getTime() + Math.random() * (today.getTime() - startDate.getTime()));
          const formattedDate = openDate.toLocaleDateString('pt-BR');

          // Gerar um cartão com 4 últimos dígitos visíveis
          const lastFourDigits = Math.floor(1000 + Math.random() * 9000);
          const cardNumber = `**** **** **** ${lastFourDigits}`;

          // Gerar data de validade do cartão
          const expYear = today.getFullYear() + Math.floor(1 + Math.random() * 5);
          const expMonth = Math.floor(1 + Math.random() * 12).toString().padStart(2, '0');

          const accountCard = document.createElement('div');
          accountCard.className = 'account-card';
          accountCard.innerHTML = `
              <div class="account-header">
                <div class="d-flex align-items-center">
                  <div class="bank-icon"><i class="bi ${bank.icon}"></i></div>
                  <h4>${bank.name}<span class="account-type">${accountType}</span></h4>
                </div>
                <div class="card-chip"></div>
              </div>

              <div class="account-details">
                <div class="detail-item">
                  <div class="detail-label">NÚMERO DA CONTA</div>
                  <div class="detail-value">${accountNumber}</div>
                </div>
                <div class="detail-item">
                  <div class="detail-label">AGÊNCIA</div>
                  <div class="detail-value">${agency}</div>
                </div>
                <div class="detail-item">
                  <div class="detail-label">SALDO ATUAL</div>
                  <div class="detail-value balance-highlight">R$ ${balance}</div>
                </div>
                <div class="detail-item">
                  <div class="detail-label">DATA DE ABERTURA</div>
                  <div class="detail-value">${formattedDate}</div>
                </div>
              </div>

              <div class="mt-4">
                <div class="detail-item">
                  <div class="detail-label">CARTÃO VINCULADO</div>
                  <div class="detail-value">${cardNumber} <span class="text-muted">(Validade: ${expMonth}/${expYear})</span></div>
                </div>
              </div>

              <div class="action-buttons">
                <button class="btn btn-sm btn-outline-primary">
                  <i class="bi bi-pencil me-1"></i> Editar
                </button>
                <button class="btn btn-sm btn-outline-secondary">
                  <i class="bi bi-arrows-angle-expand me-1"></i> Detalhes
                </button>
                <button class="btn btn-sm btn-outline-danger">
                  <i class="bi bi-trash me-1"></i> Excluir
                </button>
              </div>
            `;

          accountsContainer.appendChild(accountCard);
        }
        console.log("Contas geradas com sucesso!");
      } catch (error) {
        console.error("Erro ao gerar contas:", error);
      }
    }

    // Gerar contas quando o botão for clicado
    document.getElementById('generateMore').addEventListener('click', function() {
      generateRandomAccounts(Math.floor(2 + Math.random() * 3));
    });
  });

</script>
</body>
</html>