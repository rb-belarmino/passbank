package br.com.xfjay.passbank.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {

    private static final String URL = "jdbc:oracle:thin:@oracle.fiap.com.br:1521:orcl";
    private static final String USER = "rm559881";
    private static final String PASSWORD = "091081";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
            System.err.println("Oracle JDBC Driver não encontrado.");
            e.printStackTrace();
            throw new SQLException("Oracle JDBC Driver não encontrado.", e);
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    public static void main(String[] args) {
        try (Connection conn = getConnection()) {
            if (conn != null) {
                System.out.println("Conexão com o banco de dados Oracle estabelecida com sucesso!");
            } else {
                System.out.println("Falha ao conectar ao banco de dados Oracle.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}