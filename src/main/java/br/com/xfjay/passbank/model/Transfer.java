package br.com.xfjay.passbank.model;

import java.time.LocalDateTime;

public class Transfer extends Transaction {
    private int destinationAccountNumber;
    private int destinationAgencyNumber;
    private String destinationAccountType;
    private String destinationBankName;

    public Transfer(int accountId, double transferValue, double balanceAfterTransaction, String description,
                    int destinationAccountNumber, int destinationAgencyNumber, String destinationAccountType, String destinationBankName) {
        super(accountId, transferValue, balanceAfterTransaction, description, "TRANSFER");
        this.destinationAccountNumber = destinationAccountNumber;
        this.destinationAgencyNumber = destinationAgencyNumber;
        this.destinationAccountType = destinationAccountType;
        this.destinationBankName = destinationBankName;
    }

    public Transfer(int id, int accountId, double amount, double balanceAfterTransaction, LocalDateTime transactionDate, String description,
                    int destinationAccountNumber, int destinationAgencyNumber, String destinationAccountType, String destinationBankName) {
        super(id, accountId, amount, balanceAfterTransaction, transactionDate, description, "TRANSFER");
        this.destinationAccountNumber = destinationAccountNumber;
        this.destinationAgencyNumber = destinationAgencyNumber;
        this.destinationAccountType = destinationAccountType;
        this.destinationBankName = destinationBankName;
    }

    public int getDestinationAccountNumber() { return destinationAccountNumber; }
    public void setDestinationAccountNumber(int destinationAccountNumber) { this.destinationAccountNumber = destinationAccountNumber; }
    public int getDestinationAgencyNumber() { return destinationAgencyNumber; }
    public void setDestinationAgencyNumber(int destinationAgencyNumber) { this.destinationAgencyNumber = destinationAgencyNumber; }
    public String getDestinationAccountType() { return destinationAccountType; }
    public void setDestinationAccountType(String destinationAccountType) { this.destinationAccountType = destinationAccountType; }
    public String getDestinationBankName() { return destinationBankName; }
    public void setDestinationBankName(String destinationBankName) { this.destinationBankName = destinationBankName; }


}