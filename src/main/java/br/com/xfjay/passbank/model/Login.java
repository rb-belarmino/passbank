package br.com.xfjay.passbank.model;

public class Login {

    private String username;
    private String password; // Esta agora armazenará a senha em texto plano ou o hash do DB

    public Login(String username, String password) {
        this.username = username;
        this.password = password; // No contexto de createLogin, é a senha em texto. No getLogin, é o hash.
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}