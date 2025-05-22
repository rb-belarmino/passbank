<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pass Bank</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: 'Inter', sans-serif; /* Using Inter font */
        }
        .bg-dark-custom {
            background-color: #121212; /* Dark background as per the image */
            color: #ffffff; /* White text */
            min-height: 100%;
            display: flex;
            align-items: center; /* Vertically center content */
            justify-content: center; /* Horizontally center content */
            text-align: center;
            padding: 20px;
        }
        .content-wrapper {
            max-width: 600px; /* Max width for the content */
            width: 100%;
        }
        .pass-bank-title {
            font-size: 3.5rem; /* Large title */
            font-weight: bold;
            margin-bottom: 0.5rem;
            letter-spacing: 2px; /* Added letter spacing */
        }
        .pass-bank-subtitle {
            font-size: 1.1rem;
            color: #adb5bd; /* Lighter gray for subtitle */
            margin-bottom: 2.5rem;
        }
        .btn-custom-primary {
            background-color: #007bff; /* Bootstrap primary blue */
            border-color: #007bff;
            color: white;
            padding: 0.75rem 1.5rem;
            font-size: 1rem;
            border-radius: 0.5rem; /* Rounded corners for buttons */
            margin: 0 0.5rem; /* Spacing between buttons */
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }
        .btn-custom-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
            color: white;
        }
        .btn-custom-secondary {
            background-color: #6c757d; /* Bootstrap secondary gray */
            border-color: #6c757d;
            color: white;
            padding: 0.75rem 1.5rem;
            font-size: 1rem;
            border-radius: 0.5rem; /* Rounded corners for buttons */
            margin: 0 0.5rem; /* Spacing between buttons */
            transition: background-color 0.3s ease, border-color 0.3s ease;
        }
        .btn-custom-secondary:hover {
            background-color: #545b62;
            border-color: #545b62;
            color: white;
        }
        .buttons-container {
            margin-bottom: 2.5rem; /* Space below buttons */
        }
        .credit-card-placeholder {
            background-color: #2a2e34; /* Darker gray for card */
            border: 1px solid #495057; /* Slightly lighter border */
            border-radius: 15px; /* More rounded corners for card */
            padding: 20px;
            width: 300px; /* Fixed width for the card */
            height: 180px; /* Fixed height for the card */
            margin: 0 auto; /* Center the card */
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            box-shadow: 0 8px 16px rgba(0,0,0,0.3); /* Added shadow for depth */
            position: relative; /* For positioning elements inside */
        }
        .credit-card-chip {
            width: 40px;
            height: 30px;
            background-color: #b08d57; /* Gold-ish color for chip */
            border-radius: 4px;
        }
        .credit-card-token-text {
            font-size: 0.8rem;
            color: #adb5bd;
            align-self: flex-start; /* Align to the left under the chip */
            margin-top: 5px;
        }
        .credit-card-logo {
            align-self: flex-end; /* Align to the bottom right */
            /* Placeholder for Mastercard logo - using text for simplicity */
            font-size: 1rem;
            font-weight: bold;
            color: #ffffff;
        }
        .mastercard-circles {
            display: flex;
            align-items: center;
            position: absolute;
            bottom: 20px;
            right: 20px;
        }
        .mastercard-circle {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background-color: red; /* Placeholder */
        }
        .mastercard-circle.yellow {
            background-color: #FFC107; /* Yellow-orange */
            position: relative;
            left: -15px; /* Overlap */
            opacity: 0.85;
        }
        .mastercard-circle.red {
            background-color: #DC3545; /* Red */
        }
        .mastercard-text {
            font-size: 0.7rem;
            color: #fff;
            position: absolute;
            bottom: 8px; /* Adjust as needed */
            right: 20px; /* Adjust as needed */
            text-transform: lowercase;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .pass-bank-title {
                font-size: 2.5rem;
            }
            .pass-bank-subtitle {
                font-size: 1rem;
            }
            .btn-custom-primary, .btn-custom-secondary {
                padding: 0.6rem 1.2rem;
                font-size: 0.9rem;
                display: block; /* Stack buttons on smaller screens */
                width: 80%;
                margin: 0.5rem auto; /* Center stacked buttons */
            }
            .credit-card-placeholder {
                width: 250px;
                height: 150px;
            }
            .credit-card-chip {
                width: 35px;
                height: 25px;
            }
            .mastercard-circle {
                width: 25px;
                height: 25px;
            }
        }
        @media (max-width: 480px) {
            .pass-bank-title {
                font-size: 2rem;
            }
            .pass-bank-subtitle {
                font-size: 0.9rem;
            }
            .btn-custom-primary, .btn-custom-secondary {
                width: 90%;
            }
        }
    </style>
</head>
<body class="bg-dark-custom">

<div class="content-wrapper">
    <h1 class="pass-bank-title">PASS BANK</h1>
    <p class="pass-bank-subtitle">CONTROLLING YOUR TIME IS THE HIGHEST DIVIDEND MONEY PAYS.</p>

    <div class="buttons-container">
        <button type="button" class="btn btn-custom-primary" onclick="window.location.href='${pageContext.request.contextPath}/register'">Abrir Conta</button>
        <button type="button" class="btn btn-custom-secondary" onclick="window.location.href='${pageContext.request.contextPath}/login.jsp'">Já Tenho Conta</button>
    </div>

    <div class="credit-card-placeholder">
        <div>
            <div class="credit-card-chip"></div>
            <div class="credit-card-token-text">token</div>
        </div>
        <div>
            <div class="mastercard-circles">
                <div class="mastercard-circle red"></div>
                <div class="mastercard-circle yellow"></div>
            </div>
            <div class="mastercard-text">mastercard</div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
