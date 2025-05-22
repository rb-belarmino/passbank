package br.com.xfjay.passbank.model;

public class BankAccount {
    private int id;
    private String bankName;
    private int accountNumber;
    private int agency;
    private String accountType;

    public BankAccount(String bankName, int accountNumber, int agency, String accountType) {
        this.bankName = bankName;
        this.accountNumber = accountNumber;
        this.agency = agency;
        this.accountType = accountType;
    }


    public BankAccount(int id, String bankName, int accountNumber, int agency, String accountType) {
        this.id = id;
        this.bankName = bankName;
        this.accountNumber = accountNumber;
        this.agency = agency;
        this.accountType = accountType;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public int getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(int accountNumber) {
        this.accountNumber = accountNumber;
    }

    public int getAgency() {
        return agency;
    }

    public void setAgency(int agency) {
        this.agency = agency;
    }

    public String getAccountType() {
        return accountType;
    }

    public void setAccountType(String accountType) {
        this.accountType = accountType;
    }

    public void createBankAccount() {
        System.out.println("Conta do Banco criada com sucesso. Dados da sua conta do Banco: " + "ID: " + id + ", Nome do banco: " + bankName + ", Número da conta: " + accountNumber + ", Agência: " + agency + ", Tipo da conta: " + accountType);
    }
}