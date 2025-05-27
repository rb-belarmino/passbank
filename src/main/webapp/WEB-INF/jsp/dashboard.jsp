<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR" data-theme="light">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>PassBank - Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
  <style>
    :root {
      --primary-color: #4568DC;
      --secondary-color: #5B72E4;
      --accent-color: #2ee59d;
      --text-color: #333;
      --text-muted: #6c757d;
      --bg-light: #f8f9fc;
      --card-bg: #ffffff;
      --card-shadow: 0 12px 30px rgba(0, 0, 0, 0.1);
      --hover-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
      --gradient-bg: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
      --btn-shadow: 0 5px 15px rgba(69, 104, 220, 0.3);
      --btn-hover-shadow: 0 8px 20px rgba(59, 85, 230, 0.4);
      --danger-color: #dc3545;
      --success-color: #28a745;
      --padding-card: 30px 25px;
      --border-radius-lg: 20px;
      --border-radius-md: 15px;
      --border-radius-sm: 10px;
      --transition-speed: 0.3s;
    }

    [data-theme="dark"] {
      --primary-color: #5B72E4;
      --secondary-color: #7B84EE;
      --accent-color: #33daad;
      --text-color: #e1e1e1;
      --text-muted: #a8a8a8;
      --bg-light: #1a1a2e;
      --card-bg: #272741;
      --card-shadow: 0 12px 30px rgba(0, 0, 0, 0.3);
      --hover-shadow: 0 15px 35px rgba(0, 0, 0, 0.4);
      --gradient-bg: linear-gradient(135deg, #2a2a5a, #3f3f7d);
      --btn-shadow: 0 5px 15px rgba(91, 114, 228, 0.3);
      --btn-hover-shadow: 0 8px 20px rgba(91, 114, 228, 0.4);
      --danger-color: #e74c3c;
      --success-color: #2ecc71;
    }

    body {
      background: var(--gradient-bg);
      min-height: 100vh;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      padding: 40px 0;
      color: var(--text-color);
      transition: background var(--transition-speed) ease;
    }

    .dashboard-container {
      max-width: 1200px;
      margin: 0 auto;
    }

    .welcome-header {
      background-color: var(--card-bg);
      border-radius: var(--border-radius-lg);
      box-shadow: var(--card-shadow);
      padding: var(--padding-card);
      margin-bottom: 30px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      position: relative;
      overflow: hidden;
      transform: translateZ(0);
      transition: all var(--transition-speed) ease;
    }

    .welcome-header:hover {
      transform: translateY(-5px) translateZ(0);
      box-shadow: var(--hover-shadow);
    }

    .welcome-header::before {
      content: "";
      position: absolute;
      width: 200px;
      height: 200px;
      background: linear-gradient(45deg, rgba(69, 104, 220, 0.1), rgba(91, 114, 228, 0.05));
      border-radius: 50%;
      top: -100px;
      right: -50px;
      z-index: 0;
      transition: all var(--transition-speed) ease;
    }

    .welcome-header:hover::before {
      transform: scale(1.2);
    }

    .dashboard-card {
      background: var(--card-bg);
      border-radius: var(--border-radius-lg);
      box-shadow: var(--card-shadow);
      padding: var(--padding-card);
      margin-bottom: 30px;
      position: relative;
      overflow: hidden;
      transition: all var(--transition-speed) ease;
      transform-style: preserve-3d;
      perspective: 1000px;
    }

    .dashboard-card:hover {
      transform: translateY(-5px) rotateX(2deg) rotateY(2deg);
      box-shadow: var(--hover-shadow);
    }

    .stat-card {
      border-left: 6px solid var(--primary-color);
      text-align: center;
      display: flex;
      flex-direction: column;
      justify-content: center;
      height: 100%;
    }

    .quick-action {
      border-top: 6px solid var(--accent-color);
      text-align: center;
      cursor: pointer;
    }

    .quick-action:hover .action-icon {
      transform: scale(1.1) translateY(-5px);
    }

    .notification-card {
      border-right: 6px solid var(--danger-color);
    }

    .action-icon {
      font-size: 2.5rem;
      color: var(--primary-color);
      margin-bottom: 15px;
      transition: transform var(--transition-speed) ease;
      display: inline-block;
    }

    .stat-title {
      font-size: 1rem;
      color: var(--text-muted);
      font-weight: 600;
      margin-bottom: 10px;
      transition: color var(--transition-speed) ease;
    }
    /* Adicionar no bloco de estilos */
    .ripple-effect {
      position: absolute;
      border-radius: 50%;
      transform: scale(0);
      background: rgba(255, 255, 255, 0.4);
      pointer-events: none;
      animation: ripple 0.6s linear;
      z-index: 0;
    }

    @keyframes ripple {
      to {
        transform: scale(2.5);
        opacity: 0;
      }
    }

    .btn {
      position: relative;
      overflow: hidden;
    }
    .stat-value {
      font-size: 1.8rem;
      font-weight: 700;
      color: var(--text-color);
      transition: color var(--transition-speed) ease;
    }

    .recent-transaction {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 15px 0;
      border-bottom: 1px solid rgba(128, 128, 128, 0.1);
      transition: all var(--transition-speed) ease;
    }

    .recent-transaction:hover {
      background-color: rgba(128, 128, 128, 0.05);
      transform: translateX(5px);
      padding-left: 10px;
      border-radius: var(--border-radius-sm);
    }

    .recent-transaction:last-child {
      border-bottom: none;
    }

    .transaction-icon {
      width: 45px;
      height: 45px;
      background-color: rgba(69, 104, 220, 0.1);
      border-radius: 12px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1.2rem;
      color: var(--primary-color);
      margin-right: 15px;
      transition: all var(--transition-speed) ease;
    }

    .recent-transaction:hover .transaction-icon {
      transform: scale(1.1);
    }

    .transaction-detail {
      flex-grow: 1;
    }

    .transaction-title {
      font-weight: 600;
      margin: 0;
      font-size: 1rem;
      color: var(--text-color);
      transition: color var(--transition-speed) ease;
    }

    .transaction-date {
      font-size: 0.8rem;
      color: var(--text-muted);
      transition: color var(--transition-speed) ease;
    }

    .transaction-amount {
      font-weight: 700;
      font-size: 1.1rem;
      transition: all var(--transition-speed) ease;
    }

    .transaction-amount.positive {
      color: var(--success-color);
    }

    .transaction-amount.negative {
      color: var(--danger-color);
    }

    h1 {
      color: var(--text-color);
      font-size: 2rem;
      margin: 0;
      font-weight: 700;
      z-index: 1;
      position: relative;
      transition: color var(--transition-speed) ease;
    }

    h3 {
      font-weight: 600;
      font-size: 1.3rem;
      margin-bottom: 20px;
      position: relative;
      color: var(--text-color);
      transition: color var(--transition-speed) ease;
    }

    h3::after {
      content: "";
      position: absolute;
      left: 0;
      bottom: -8px;
      width: 40px;
      height: 4px;
      border-radius: 2px;
      background: var(--primary-color);
      transition: background var(--transition-speed) ease;
    }

    .chart-container {
      position: relative;
      width: 100%;
      height: 250px;
      transition: all var(--transition-speed) ease;
    }

    .nav-menu {
      margin-bottom: 30px;
      background-color: var(--card-bg);
      border-radius: var(--border-radius-md);
      box-shadow: var(--card-shadow);
      overflow: hidden;
      transition: all var(--transition-speed) ease;
    }

    .nav-menu ul {
      display: flex;
      list-style: none;
      padding: 0;
      margin: 0;
    }

    .nav-menu li {
      flex: 1;
    }

    .nav-menu a {
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 20px;
      text-decoration: none;
      color: var(--text-color);
      transition: all var(--transition-speed) ease;
      border-bottom: 3px solid transparent;
    }

    .nav-menu a:hover {
      background-color: rgba(69, 104, 220, 0.05);
      border-bottom: 3px solid var(--primary-color);
    }

    .nav-menu a.active {
      background-color: var(--primary-color);
      color: white;
    }

    .nav-menu i {
      font-size: 1.5rem;
      margin-bottom: 8px;
    }

    .notification-dot {
      width: 8px;
      height: 8px;
      background-color: var(--danger-color);
      border-radius: 50%;
      display: inline-block;
      margin-left: 5px;
      position: relative;
      top: -10px;
      right: -10px;
      box-shadow: 0 0 0 rgba(220, 53, 69, 0.4);
      animation: pulse-dot 2s infinite;
    }

    @keyframes pulse-dot {
      0% {
        box-shadow: 0 0 0 0 rgba(220, 53, 69, 0.4);
      }
      70% {
        box-shadow: 0 0 0 6px rgba(220, 53, 69, 0);
      }
      100% {
        box-shadow: 0 0 0 0 rgba(220, 53, 69, 0);
      }
    }
    .tips-carousel {
      position: relative;
    }

    .tips-container {
      position: relative;
      overflow: hidden;
      height: 100px;
    }

    .tip-item {
      position: absolute;
      width: 100%;
      opacity: 0;
      transition: all 0.5s ease;
      transform: translateX(50px);
    }

    .tip-item.active {
      opacity: 1;
      transform: translateX(0);
    }

    .tips-navigation {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-top: 15px;
    }

    .tip-nav-btn {
      background: transparent;
      border: none;
      color: var(--primary-color);
      cursor: pointer;
      font-size: 1.2rem;
      padding: 5px;
      transition: all 0.3s ease;
    }

    .tip-nav-btn:hover {
      transform: scale(1.2);
    }

    .tip-indicators {
      display: flex;
      gap: 8px;
    }

    .tip-indicator {
      width: 8px;
      height: 8px;
      background-color: rgba(91, 114, 228, 0.3);
      border-radius: 50%;
      cursor: pointer;
      transition: all 0.3s ease;
    }

    .tip-indicator.active {
      background-color: var(--primary-color);
      transform: scale(1.3);
    }
    .action-buttons {
      display: flex;
      margin-top: 20px;
      gap: 10px;
    }

    .btn-primary {
      background: var(--gradient-bg);
      border: none;
      padding: 10px 20px;
      font-weight: 600;
      border-radius: var(--border-radius-sm);
      box-shadow: var(--btn-shadow);
      transition: all var(--transition-speed) ease;
    }

    .btn-primary:hover {
      background: linear-gradient(135deg, #3a57c4, #4d63d2);
      transform: translateY(-2px);
      box-shadow: var(--btn-hover-shadow);
    }

    .notification-card .card-title {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .badge {
      font-size: 0.7rem;
      padding: 5px 10px;
      border-radius: 20px;
      transition: all var(--transition-speed) ease;
    }

    .progress-bar {
      border-radius: 5px;
      background: linear-gradient(90deg, var(--primary-color), var(--accent-color));
      transition: width var(--transition-speed) ease;
    }

    .pulse {
      animation: pulse 2s infinite;
    }

    @keyframes pulse {
      0% { transform: scale(1); }
      50% { transform: scale(1.02); }
      100% { transform: scale(1); }
    }

    .progress-container {
      margin-bottom: 10px;
      transition: all var(--transition-speed) ease;
    }

    .progress-container:hover {
      transform: translateX(5px);
    }

    .progress-info {
      display: flex;
      justify-content: space-between;
      margin-bottom: 5px;
      transition: all var(--transition-speed) ease;
    }

    .progress-label {
      font-size: 0.85rem;
      font-weight: 600;
      color: var(--text-color);
      transition: color var(--transition-speed) ease;
    }

    .progress {
      height: 10px;
      border-radius: 5px;
      background-color: rgba(0, 0, 0, 0.1);
      transition: all var(--transition-speed) ease;
    }

    [data-theme="dark"] .progress {
      background-color: rgba(255, 255, 255, 0.1);
    }

    .card-body {
      position: relative;
      z-index: 1;
    }

    .footer {
      text-align: center;
      margin-top: 30px;
      padding: 20px 0;
    }

    .footer a {
      margin: 0 5px;
      transition: all var(--transition-speed) ease;
    }

    .wave-bg {
      position: absolute;
      bottom: 0;
      left: 0;
      width: 100%;
      height: 50%;
      background: linear-gradient(180deg, rgba(255, 255, 255, 0) 0%, rgba(69, 104, 220, 0.05) 100%);
      transform: skewY(-3deg);
      transform-origin: bottom left;
      transition: all var(--transition-speed) ease;
    }

    [data-theme="dark"] .wave-bg {
      background: linear-gradient(180deg, rgba(0, 0, 0, 0) 0%, rgba(91, 114, 228, 0.05) 100%);
    }

    /* Modo escuro botão */
    .theme-switch {
      position: fixed;
      top: 20px;
      right: 20px;
      z-index: 1000;
      width: 50px;
      height: 50px;
      border-radius: 50%;
      background: var(--card-bg);
      display: flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
      box-shadow: var(--card-shadow);
      transition: all var(--transition-speed) ease;
    }

    .theme-switch:hover {
      transform: scale(1.1);
    }

    .theme-switch i {
      font-size: 1.5rem;
      color: var(--text-color);
    }

    /* Animações */
    .fade-in {
      opacity: 0;
      transform: translateY(20px);
      transition: opacity 0.8s ease, transform 0.8s ease;
    }

    .fade-in.visible {
      opacity: 1;
      transform: translateY(0);
    }

    /* Para dispositivos menores */
    @media (max-width: 768px) {
      .welcome-header {
        flex-direction: column;
        text-align: center;
      }

      .welcome-header div:last-child {
        margin-top: 20px;
      }

      .nav-menu ul {
        flex-wrap: wrap;
      }

      .nav-menu li {
        flex: 0 0 33.333%;
      }

      .nav-menu a {
        padding: 15px 10px;
      }

      h1 {
        font-size: 1.8rem;
      }

      .stat-value {
        font-size: 1.5rem;
      }

      .dashboard-card {
        padding: 20px 15px;
      }
    }

    @media (max-width: 576px) {
      .nav-menu li {
        flex: 0 0 50%;
      }
    }
    .real-time-info {
      text-align: right;
      transition: all var(--transition-speed) ease;
    }

    .time-display {
      font-size: 1.8rem;
      font-weight: 700;
      color: var(--primary-color);
    }

    .date-display {
      font-size: 0.9rem;
      color: var(--text-muted);
    }
    /* Novos estilos */
    .glassmorph {
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(10px);
      -webkit-backdrop-filter: blur(10px);
      border: 1px solid rgba(255, 255, 255, 0.1);
    }

    [data-theme="dark"] .glassmorph {
      background: rgba(0, 0, 0, 0.2);
      border: 1px solid rgba(255, 255, 255, 0.05);
    }

    .shimmer {
      position: relative;
      overflow: hidden;
    }

    .shimmer::after {
      content: '';
      position: absolute;
      top: -100%;
      left: -100%;
      width: 50%;
      height: 300%;
      background: linear-gradient(
              to right,
              rgba(255, 255, 255, 0) 0%,
              rgba(255, 255, 255, 0.2) 50%,
              rgba(255, 255, 255, 0) 100%
      );
      transform: rotate(30deg);
      animation: shimmer 6s infinite;
    }

    @keyframes shimmer {
      0% { transform: translateX(-100%) rotate(30deg); }
      100% { transform: translateX(300%) rotate(30deg); }
    }

    /* Efeito 3D para cartões */
    .tilt-effect {
      transform-style: preserve-3d;
      transform: perspective(1000px);
    }

    .card-3d-content {
      transition: transform 0.3s ease;
      transform-style: preserve-3d;
    }

    .quick-action:hover .card-3d-content {
      transform: translateZ(20px);
    }

    /* Feedback de clique */
    .btn-feedback:active,
    .quick-action:active {
      transform: scale(0.95);
    }
  </style>
</head>
<body>
<div class="theme-switch" id="themeSwitch">
  <i class="bi bi-moon-fill"></i>
</div>

<div class="container dashboard-container">
  <div class="welcome-header fade-in">
    <div>
      <h1 class="shimmer"><i class="bi bi-bank me-2"></i>PassBank</h1>
      <p class="lead mt-2 mb-0">Olá, <strong>${username}</strong>! Bem-vindo ao seu dashboard.</p>
    </div>
    <div class="d-flex align-items-center">
      <button class="btn btn-primary btn-feedback">
        <i class="bi bi-plus-lg me-2"></i> Nova Transação
      </button>
    </div>
    <div class="real-time-info ms-auto me-3">
      <div class="time-display" id="timeDisplay"></div>
      <div class="date-display" id="dateDisplay"></div>
    </div>
  </div>

  <div class="nav-menu fade-in">
    <ul>
      <li><a href="#" class="active"><i class="bi bi-house-fill"></i> Início</a></li>
      <li><a href="${pageContext.request.contextPath}/randomAccounts"><i class="bi bi-credit-card-2-front"></i> Minhas Contas</a></li>
      <li>
        <a href="#">
          <i class="bi bi-bell-fill"></i> Notificações
          <span class="notification-dot"></span>
        </a>
      </li>
      <li><a href="#"><i class="bi bi-pie-chart-fill"></i> Investimentos</a></li>
      <li><a href="#"><i class="bi bi-gear-fill"></i> Configurações</a></li>
    </ul>
  </div>

  <div class="row">
    <div class="col-md-8">
      <div class="row">
        <!-- Stats -->
        <div class="col-md-4">
          <div class="dashboard-card stat-card fade-in">
            <i class="bi bi-wallet2 action-icon"></i>
            <div class="stat-title">SALDO TOTAL</div>
            <div class="stat-value">R$ 24.578,32</div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="dashboard-card stat-card fade-in">
            <i class="bi bi-arrow-down-circle action-icon text-success"></i>
            <div class="stat-title">RECEITAS DO MÊS</div>
            <div class="stat-value text-success">R$ 7.892,10</div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="dashboard-card stat-card fade-in">
            <i class="bi bi-arrow-up-circle action-icon text-danger"></i>
            <div class="stat-title">DESPESAS DO MÊS</div>
            <div class="stat-value text-danger">R$ 3.245,87</div>
          </div>
        </div>

        <!-- Chart -->
        <div class="col-md-12">
          <div class="dashboard-card fade-in">
            <h3>Fluxo de Caixa</h3>
            <div class="chart-container">
              <canvas id="cashFlowChart"></canvas>
            </div>
          </div>
        </div>

        <!-- Recent Transactions -->
        <div class="col-md-12">
          <div class="dashboard-card fade-in">
            <h3>Transações Recentes</h3>
            <div class="recent-transaction">
              <div class="transaction-icon">
                <i class="bi bi-bag-fill"></i>
              </div>
              <div class="transaction-detail">
                <p class="transaction-title">Supermercado Extra</p>
                <p class="transaction-date">Hoje, 14:30</p>
              </div>
              <div class="transaction-amount negative">- R$ 287,45</div>
            </div>
            <div class="recent-transaction">
              <div class="transaction-icon">
                <i class="bi bi-building"></i>
              </div>
              <div class="transaction-detail">
                <p class="transaction-title">Salário</p>
                <p class="transaction-date">Ontem, 08:15</p>
              </div>
              <div class="transaction-amount positive">+ R$ 5.840,00</div>
            </div>
            <div class="recent-transaction">
              <div class="transaction-icon">
                <i class="bi bi-lightning-charge-fill"></i>
              </div>
              <div class="transaction-detail">
                <p class="transaction-title">Conta de Energia</p>
                <p class="transaction-date">24/05/2023, 10:22</p>
              </div>
              <div class="transaction-amount negative">- R$ 142,78</div>
            </div>
            <div class="recent-transaction">
              <div class="transaction-icon">
                <i class="bi bi-phone-fill"></i>
              </div>
              <div class="transaction-detail">
                <p class="transaction-title">Internet e Telefone</p>
                <p class="transaction-date">20/05/2023, 17:05</p>
              </div>
              <div class="transaction-amount negative">- R$ 189,90</div>
            </div>

            <div class="mt-3 text-center">
              <button class="btn btn-sm btn-primary btn-feedback">
                <i class="bi bi-plus-circle me-1"></i> Ver mais transações
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="col-md-4">
      <!-- Quick Actions -->
      <div class="row">
        <div class="col-6">
          <div class="dashboard-card quick-action tilt-effect fade-in">
            <div class="card-3d-content">
              <i class="bi bi-send-fill action-icon"></i>
              <p><strong>Transferir</strong></p>
            </div>
          </div>
        </div>
        <div class="col-6">
          <div class="dashboard-card quick-action tilt-effect fade-in">
            <div class="card-3d-content">
              <i class="bi bi-upc-scan action-icon"></i>
              <p><strong>Pagar</strong></p>
            </div>
          </div>
        </div>
        <div class="col-6">
          <div class="dashboard-card quick-action tilt-effect fade-in">
            <div class="card-3d-content">
              <i class="bi bi-piggy-bank-fill action-icon"></i>
              <p><strong>Investir</strong></p>
            </div>
          </div>
        </div>
        <div class="col-6">
          <div class="dashboard-card quick-action tilt-effect fade-in">
            <div class="card-3d-content">
              <i class="bi bi-cash-coin action-icon"></i>
              <p><strong>Depositar</strong></p>
            </div>
          </div>
        </div>
      </div>

      <!-- Budget Progress -->
      <div class="dashboard-card fade-in">
        <h3>Orçamento do Mês</h3>
        <div class="progress-container" data-progress="70">
          <div class="progress-info">
            <span class="progress-label">Alimentação</span>
            <span>R$ 850,00 / R$ 1.200,00</span>
          </div>
          <div class="progress">
            <div class="progress-bar" role="progressbar" style="width: 0%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
          </div>
        </div>
        <div class="progress-container" data-progress="90">
          <div class="progress-info">
            <span class="progress-label">Transporte</span>
            <span>R$ 450,00 / R$ 500,00</span>
          </div>
          <div class="progress">
            <div class="progress-bar" role="progressbar" style="width: 0%" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
          </div>
        </div>
        <div class="progress-container" data-progress="40">
          <div class="progress-info">
            <span class="progress-label">Lazer</span>
            <span>R$ 320,00 / R$ 800,00</span>
          </div>
          <div class="progress">
            <div class="progress-bar" role="progressbar" style="width: 0%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
          </div>
        </div>
        <div class="progress-container" data-progress="62">
          <div class="progress-info">
            <span class="progress-label">Educação</span>
            <span>R$ 620,00 / R$ 1.000,00</span>
          </div>
          <div class="progress">
            <div class="progress-bar" role="progressbar" style="width: 0%" aria-valuenow="62" aria-valuemin="0" aria-valuemax="100"></div>
          </div>
        </div>
      </div>

      <!-- Notification Card -->
      <div class="dashboard-card notification-card pulse fade-in">
        <div class="card-title">
          <h3>Notificações</h3>
          <span class="badge bg-danger">3 novas</span>
        </div>
        <div class="recent-transaction">
          <div class="transaction-icon">
            <i class="bi bi-exclamation-circle"></i>
          </div>
          <div class="transaction-detail">
            <p class="transaction-title">Fatura do cartão disponível</p>
            <p class="transaction-date">Vence em 5 dias</p>
          </div>
        </div>
        <div class="recent-transaction">
          <div class="transaction-icon">
            <i class="bi bi-percent"></i>
          </div>
          <div class="transaction-detail">
            <p class="transaction-title">Oferta exclusiva de investimento</p>
            <p class="transaction-date">Termina em 2 dias</p>
          </div>
        </div>
        <div class="recent-transaction">
          <div class="transaction-icon">
            <i class="bi bi-shield-lock"></i>
          </div>
          <div class="transaction-detail">
            <p class="transaction-title">Atualize suas informações de segurança</p>
            <p class="transaction-date">Último update: 60 dias atrás</p>
          </div>
        </div>
        <div class="wave-bg"></div>
      </div>

      <!-- Novidade: Dica Financeira -->
      <div class="dashboard-card glassmorph fade-in">
        <h3><i class="bi bi-lightbulb me-2"></i> Dicas Financeiras</h3>
        <div class="tips-carousel">
          <div class="tips-container" id="tipsContainer">
            <div class="tip-item active">
              <p><i class="bi bi-quote me-2"></i>Economize até 15% da sua renda mensal para emergências e alcance a segurança financeira mais rapidamente.</p>
            </div>
            <div class="tip-item">
              <p><i class="bi bi-quote me-2"></i>Diversifique seus investimentos para minimizar riscos e maximizar retornos a longo prazo.</p>
            </div>
            <div class="tip-item">
              <p><i class="bi bi-quote me-2"></i>Utilize o método 50-30-20: 50% para necessidades, 30% para desejos e 20% para poupança.</p>
            </div>
          </div>
          <div class="tips-navigation">
            <button class="tip-nav-btn" id="prevTip"><i class="bi bi-chevron-left"></i></button>
            <div class="tip-indicators" id="tipIndicators"></div>
            <button class="tip-nav-btn" id="nextTip"><i class="bi bi-chevron-right"></i></button>
          </div>
        </div>
      </div>
      </div>
    </div>
  </div>

  <div class="footer fade-in">
    <a href="#" class="btn btn-outline-light btn-feedback">
      <i class="bi bi-shield-lock me-1"></i> Segurança
    </a>
    <a href="#" class="btn btn-outline-light btn-feedback">
      <i class="bi bi-question-circle me-1"></i> Ajuda
    </a>
    <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-light btn-feedback">
      <i class="bi bi-box-arrow-right me-1"></i> Sair
    </a>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    // Animar entrada dos elementos
    animateElementsOnScroll();

    // Configuração do botão tema escuro/claro
    setupThemeSwitch();

    // Efeito de hover interativo nos cards
    setupCardHoverEffects();

    // Animação nos ícones de ação rápida
    setupActionIconAnimations();

    // Efeito 3D de inclinação dos cards
    setupTiltEffect();

    // Animação progressiva das barras de progresso
    animateProgressBars();

    // Gráfico de fluxo de caixa
    setupCashFlowChart();

    // Adicionar efeitos interativos aos botões de ação rápida
    setupQuickActionButtons();

    // Efeito de notificação pulsando
    setupPulseAnimation();
  });

  function animateElementsOnScroll() {
    const fadeElements = document.querySelectorAll('.fade-in');

    // Função para verificar se um elemento está visível
    function isElementInViewport(el) {
      const rect = el.getBoundingClientRect();
      return (
              rect.top <= (window.innerHeight || document.documentElement.clientHeight) &&
              rect.bottom >= 0
      );
    }

    // Função para animar elementos visíveis
    function handleScroll() {
      fadeElements.forEach(function(element) {
        if (isElementInViewport(element)) {
          element.classList.add('visible');
        }
      });
    }

    // Executar inicialmente para elementos já visíveis
    setTimeout(handleScroll, 300);

    // Adicionar evento de scroll
    window.addEventListener('scroll', handleScroll);
  }

  function setupThemeSwitch() {
    const themeSwitch = document.getElementById('themeSwitch');
    const html = document.documentElement;
    const icon = themeSwitch.querySelector('i');

    // Verificar se há preferência salva
    const savedTheme = localStorage.getItem('theme');
    if (savedTheme) {
      html.setAttribute('data-theme', savedTheme);
      updateThemeIcon(savedTheme, icon);
    }

    themeSwitch.addEventListener('click', function() {
      const currentTheme = html.getAttribute('data-theme') || 'light';
      const newTheme = currentTheme === 'light' ? 'dark' : 'light';

      html.setAttribute('data-theme', newTheme);
      localStorage.setItem('theme', newTheme);

      updateThemeIcon(newTheme, icon);
    });
  }

  function updateThemeIcon(theme, iconElement) {
    if (theme === 'dark') {
      iconElement.className = 'bi bi-sun-fill';
    } else {
      iconElement.className = 'bi bi-moon-fill';
    }
  }

  function setupCardHoverEffects() {
    const cards = document.querySelectorAll('.dashboard-card');
    cards.forEach(card => {
      card.addEventListener('mouseenter', function() {
        cards.forEach(c => {
          if (c !== card) {
            c.style.opacity = '0.9';
            c.style.filter = 'blur(1px)';
          }
        });
      });

      card.addEventListener('mouseleave', function() {
        cards.forEach(c => {
          c.style.opacity = '1';
          c.style.filter = 'blur(0px)';
        });
      });
    });
  }

  function setupActionIconAnimations() {
    const actionIcons = document.querySelectorAll('.action-icon');
    actionIcons.forEach(icon => {
      icon.addEventListener('click', function() {
        this.style.transform = 'scale(1.2) rotate(10deg)';
        setTimeout(() => {
          this.style.transform = 'scale(1) rotate(0deg)';
        }, 500);
      });
    });
  }

  function setupTiltEffect() {
    const tiltCards = document.querySelectorAll('.tilt-effect');

    tiltCards.forEach(card => {
      card.addEventListener('mousemove', handleTilt);
      card.addEventListener('mouseleave', resetTilt);
    });

    function handleTilt(e) {
      const card = this;
      const cardRect = card.getBoundingClientRect();
      const cardWidth = cardRect.width;
      const cardHeight = cardRect.height;
      const centerX = cardRect.left + cardWidth / 2;
      const centerY = cardRect.top + cardHeight / 2;
      const mouseX = e.clientX - centerX;
      const mouseY = e.clientY - centerY;
      const rotateX = (-mouseY / (cardHeight / 2)) * 10;
      const rotateY = (mouseX / (cardWidth / 2)) * 10;

      card.style.transform = `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg)`;
    }

    function resetTilt() {
      this.style.transform = 'perspective(1000px) rotateX(0) rotateY(0)';
    }
  }

  function animateProgressBars() {
    const progressContainers = document.querySelectorAll('.progress-container');

    // Função para animar cada barra
    function animateProgress(container) {
      const progressBar = container.querySelector('.progress-bar');
      const targetProgress = container.dataset.progress;

      // Animação da barra
      setTimeout(() => {
        progressBar.style.width = targetProgress + '%';
      }, 300);
    }

    // Verifica quando cada contêiner de progresso está visível
    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          animateProgress(entry.target);
          observer.unobserve(entry.target);
        }
      });
    });

    progressContainers.forEach(container => {
      observer.observe(container);
    });
  }

  function setupCashFlowChart() {
    const ctx = document.getElementById('cashFlowChart').getContext('2d');

    // Configurar gradientes para o gráfico
    const greenGradient = ctx.createLinearGradient(0, 0, 0, 250);
    greenGradient.addColorStop(0, 'rgba(40, 167, 69, 0.8)');
    greenGradient.addColorStop(1, 'rgba(40, 167, 69, 0.1)');

    const redGradient = ctx.createLinearGradient(0, 0, 0, 250);
    redGradient.addColorStop(0, 'rgba(220, 53, 69, 0.8)');
    redGradient.addColorStop(1, 'rgba(220, 53, 69, 0.1)');

    const cashFlowChart = new Chart(ctx, {
      type: 'line',
      data: {
        labels: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun'],
        datasets: [
          {
            label: 'Receitas',
            data: [5840, 6200, 5950, 7300, 6800, 7892],
            borderColor: '#28a745',
            backgroundColor: greenGradient,
            tension: 0.4,
            fill: true,
            pointBackgroundColor: '#28a745',
            pointBorderColor: '#fff',
            pointHoverRadius: 6,
            pointHoverBorderWidth: 3
          },
          {
            label: 'Despesas',
            data: [3200, 3450, 2980, 3100, 3600, 3245],
            borderColor: '#dc3545',
            backgroundColor: redGradient,
            tension: 0.4,
            fill: true,
            pointBackgroundColor: '#dc3545',
            pointBorderColor: '#fff',
            pointHoverRadius: 6,
            pointHoverBorderWidth: 3
          }
        ]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        interaction: {
          mode: 'index',
          intersect: false,
        },
        plugins: {
          tooltip: {
            callbacks: {
              label: function(context) {
                let label = context.dataset.label || '';
                if (label) {
                  label += ': ';
                }
                if (context.parsed.y !== null) {
                  label += 'R$ ' + context.parsed.y.toFixed(2);
                }
                return label;
              }
            },
            backgroundColor: 'rgba(0, 0, 0, 0.7)',
            titleFont: {
              size: 13
            },
            bodyFont: {
              size: 12
            },
            padding: 10,
            borderColor: 'rgba(255, 255, 255, 0.1)',
            borderWidth: 1
          },
          legend: {
            labels: {
              font: {
                size: 12
              }
            }
          }
        },
        scales: {
          y: {
            beginAtZero: true,
            grid: {
              color: 'rgba(200, 200, 200, 0.1)',
              lineWidth: 1
            },
            ticks: {
              callback: function(value) {
                return 'R$ ' + value;
              },
              font: {
                size: 11
              }
            }
          },
          x: {
            grid: {
              display: false
            },
            ticks: {
              font: {
                size: 11
              }
            }
          }
        },
        animation: {
          duration: 2000,
          easing: 'easeOutQuart'
        }
      }
    });

    // Detectar mudanças de tema e atualizar o gráfico
    const themeSwitch = document.getElementById('themeSwitch');
    themeSwitch.addEventListener('click', () => {
      // Pequeno tempo para que a mudança de tema ocorra primeiro
      setTimeout(() => {
        // Atualizar cores do gráfico baseado no tema
        const theme = document.documentElement.getAttribute('data-theme');

        // Atualizar opções do gráfico com base no tema
        if (theme === 'dark') {
          cashFlowChart.options.scales.y.grid.color = 'rgba(255, 255, 255, 0.1)';
          cashFlowChart.options.scales.x.ticks.color = 'rgba(255, 255, 255, 0.7)';
          cashFlowChart.options.scales.y.ticks.color = 'rgba(255, 255, 255, 0.7)';
        } else {
          cashFlowChart.options.scales.y.grid.color = 'rgba(0, 0, 0, 0.1)';
          cashFlowChart.options.scales.x.ticks.color = 'rgba(0, 0, 0, 0.7)';
          cashFlowChart.options.scales.y.ticks.color = 'rgba(0, 0, 0, 0.7)';
        }

        cashFlowChart.update();
      }, 100);
    });
  }

  function setupQuickActionButtons() {
    const quickActions = document.querySelectorAll('.quick-action');
    quickActions.forEach(action => {
      action.addEventListener('click', function() {
        this.style.transform = 'scale(0.95)';
        setTimeout(() => {
          this.style.transform = 'scale(1)';
        }, 200);
      });
    });

    // Efeito feedback para todos os botões
    const allButtons = document.querySelectorAll('.btn-feedback');
    allButtons.forEach(btn => {
      btn.addEventListener('click', function() {
        const originalBg = this.style.background;
        const originalTransform = this.style.transform;

        this.style.transform = 'scale(0.95)';

        setTimeout(() => {
          this.style.transform = originalTransform || '';
        }, 200);
      });
    });
  }

  function setupPulseAnimation() {
    const pulseElements = document.querySelectorAll('.pulse');
    pulseElements.forEach(element => {
      setInterval(() => {
        element.classList.add('animate');
        setTimeout(() => {
          element.classList.remove('animate');
        }, 1000);
      }, 3000);
    });

    // Adicionar efeitos de confirmação para transações
    const transactions = document.querySelectorAll('.recent-transaction');
    transactions.forEach(transaction => {
      transaction.addEventListener('click', function() {
        // Animação de clique
        this.style.backgroundColor = 'rgba(128, 128, 128, 0.1)';
        setTimeout(() => {
          this.style.backgroundColor = '';
        }, 300);

        // Mostrar detalhes de transação (poderia abrir um modal)
        const title = this.querySelector('.transaction-title').textContent;
        console.log(`Detalhes da transação: ${title}`);
      });
    });
  }

  // No final do arquivo dashboard.jsp, adicione esta função
  function setupMicroInteractions() {
    // Adicionar efeito de ondulação (ripple) aos botões
    const buttons = document.querySelectorAll('.btn');
    buttons.forEach(button => {
      button.addEventListener('mousedown', function(e) {
        const ripple = document.createElement('span');
        ripple.classList.add('ripple-effect');

        const rect = this.getBoundingClientRect();
        const size = Math.max(rect.width, rect.height);

        ripple.style.width = ripple.style.height = `${size}px`;
        ripple.style.left = `${e.clientX - rect.left - size/2}px`;
        ripple.style.top = `${e.clientY - rect.top - size/2}px`;

        this.appendChild(ripple);

        setTimeout(() => {
          ripple.remove();
        }, 600);
      });
    });
  }

  function setupClock() {
    function updateClock() {
      const now = new Date();
      const timeDisplay = document.getElementById('timeDisplay');
      const dateDisplay = document.getElementById('dateDisplay');

      timeDisplay.textContent = now.toLocaleTimeString('pt-BR');
      dateDisplay.textContent = now.toLocaleDateString('pt-BR', {
        weekday: 'long',
        day: 'numeric',
        month: 'long'
      });
    }

    updateClock();
    setInterval(updateClock, 1000);
  }

  // Adicionar à lista de funções no DOMContentLoaded
  document.addEventListener('DOMContentLoaded', function() {
    // Funções existentes...
    setupClock();
    setupMicroInteractions();
  });

  function setupLoadingEffects() {
    const statsCards = document.querySelectorAll('.stat-card');

    statsCards.forEach((card, index) => {
      const statValue = card.querySelector('.stat-value');
      const originalValue = statValue.textContent;

      // Iniciar com zero
      statValue.textContent = '0';

      // Animar o valor
      setTimeout(() => {
        animateValue(statValue, 0, parseFloat(originalValue.replace(/[^0-9,-]+/g,'')), 1500);
      }, 300 + (index * 200));
    });
  }

  function animateValue(element, start, end, duration) {
    const isDecimal = element.textContent.includes(',');
    const isNegative = end < 0;
    const prefix = element.textContent.replace(/[\d,.,-]+/, '');

    let startTimestamp = null;
    const step = (timestamp) => {
      if (!startTimestamp) startTimestamp = timestamp;
      const progress = Math.min((timestamp - startTimestamp) / duration, 1);
      const current = progress * (end - start) + start;

      if (isDecimal) {
        element.textContent = prefix + formatCurrency(current);
      } else {
        element.textContent = prefix + Math.floor(current).toLocaleString('pt-BR');
      }

      if (progress < 1) {
        window.requestAnimationFrame(step);
      }
    };

    window.requestAnimationFrame(step);
  }

  function formatCurrency(value) {
    return value.toLocaleString('pt-BR', {
      minimumFractionDigits: 2,
      maximumFractionDigits: 2
    });
  }

  function setupTipsCarousel() {
    const tips = document.querySelectorAll('.tip-item');
    const prevBtn = document.getElementById('prevTip');
    const nextBtn = document.getElementById('nextTip');
    const indicators = document.getElementById('tipIndicators');

    let currentTip = 0;

    // Criar indicadores
    tips.forEach((_, index) => {
      const indicator = document.createElement('div');
      indicator.classList.add('tip-indicator');
      if (index === 0) indicator.classList.add('active');
      indicator.addEventListener('click', () => showTip(index));
      indicators.appendChild(indicator);
    });

    // Mostrar dica específica
    function showTip(index) {
      tips.forEach(tip => tip.classList.remove('active'));
      document.querySelectorAll('.tip-indicator').forEach(ind => ind.classList.remove('active'));

      tips[index].classList.add('active');
      document.querySelectorAll('.tip-indicator')[index].classList.add('active');
      currentTip = index;
    }

    // Botões de navegação
    prevBtn.addEventListener('click', () => {
      currentTip = (currentTip - 1 + tips.length) % tips.length;
      showTip(currentTip);
    });

    nextBtn.addEventListener('click', () => {
      currentTip = (currentTip + 1) % tips.length;
      showTip(currentTip);
    });

    // Rotação automática
    setInterval(() => {
      currentTip = (currentTip + 1) % tips.length;
      showTip(currentTip);
    }, 8000);
  }

  // Adicionar à lista de funções no DOMContentLoaded
</script>
</body>
</html>