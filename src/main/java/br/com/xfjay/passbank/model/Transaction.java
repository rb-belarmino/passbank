package br.com.xfjay.passbank.model;

import java.time.LocalDateTime;

public class Transaction {
    private int id;
    private double amount;
    private double balanceAfterTransaction;
    private LocalDateTime transactionDate;
    private String description;
    private int accountId;
    private String transactionType;

    public Transaction(int accountId, double amount, double balanceAfterTransaction, String description, String transactionType) {
        this.accountId = accountId;
        this.amount = amount;
        this.balanceAfterTransaction = balanceAfterTransaction;
        this.transactionDate = LocalDateTime.now();
        this.description = description;
        this.transactionType = transactionType;
    }

    public Transaction(int id, int accountId, double amount, double balanceAfterTransaction, LocalDateTime transactionDate, String description, String transactionType) {
        this.id = id;
        this.accountId = accountId;
        this.amount = amount;
        this.balanceAfterTransaction = balanceAfterTransaction;
        this.transactionDate = transactionDate;
        this.description = description;
        this.transactionType = transactionType;
    }

    public Transaction(int id, double amount, double balanceAfterTransaction, LocalDateTime transactionDate, String description) {
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }
    public double getBalanceAfterTransaction() { return balanceAfterTransaction; }
    public void setBalanceAfterTransaction(double balanceAfterTransaction) { this.balanceAfterTransaction = balanceAfterTransaction; }
    public LocalDateTime getTransactionDate() { return transactionDate; }
    public void setTransactionDate(LocalDateTime transactionDate) { this.transactionDate = transactionDate; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public int getAccountId() { return accountId; }
    public void setAccountId(int accountId) { this.accountId = accountId; }
    public String getTransactionType() { return transactionType; }
    public void setTransactionType(String transactionType) { this.transactionType = transactionType; } // Pode ser útil

    @Override
    public String toString() {
        return "Transaction{" +
                "id=" + id +
                ", accountId=" + accountId +
                ", type='" + transactionType + '\'' +
                ", amount=" + amount +
                ", balanceAfterTransaction=" + balanceAfterTransaction +
                ", transactionDate=" + transactionDate +
                ", description='" + description + '\'' +
                '}';
    }
}