package br.com.xfjay.passbank.model;

import java.time.LocalDateTime;

public class Deposit extends Transaction {

    public Deposit(int accountId, double depositValue, double balanceAfterTransaction, String description) {
        super(accountId, depositValue, balanceAfterTransaction, description, "DEPOSIT");
    }

    public Deposit(int id, int accountId, double amount, double balanceAfterTransaction, LocalDateTime transactionDate, String description) {
        super(id, accountId, amount, balanceAfterTransaction, transactionDate, description, "DEPOSIT");
    }

}