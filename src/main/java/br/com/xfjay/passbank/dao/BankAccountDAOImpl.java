package br.com.xfjay.passbank.dao;

import br.com.xfjay.passbank.model.BankAccount;
import br.com.xfjay.passbank.utils.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class BankAccountDAOImpl implements BankAccountDAO {

    @Override
    public BankAccount save(BankAccount bankAccount) {
        String sql = "INSERT INTO bank_accounts (bank_name, account_number, agency, account_type) VALUES (?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, new String[]{"ID"})) { // "ID" for Oracle generated keys

            pstmt.setString(1, bankAccount.getBankName());
            pstmt.setInt(2, bankAccount.getAccountNumber());
            pstmt.setInt(3, bankAccount.getAgency());
            pstmt.setString(4, bankAccount.getAccountType());
            pstmt.executeUpdate();

            try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    bankAccount.setId(generatedKeys.getInt(1)); // Set the generated ID
                } else {
                    throw new SQLException("Creating bank account failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Consider more sophisticated error handling
        }
        return bankAccount;
    }

    @Override
    public Optional<BankAccount> findById(int id) {
        String sql = "SELECT id, bank_name, account_number, agency, account_type FROM bank_accounts WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    // This constructor assumes you've added 'id' to BankAccount model
                    BankAccount account = new BankAccount(
                            rs.getInt("id"),
                            rs.getString("bank_name"),
                            rs.getInt("account_number"),
                            rs.getInt("agency"),
                            rs.getString("account_type")
                    );
                    return Optional.of(account);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Optional.empty();
    }

    @Override
    public List<BankAccount> findAll() {
        List<BankAccount> accounts = new ArrayList<>();
        String sql = "SELECT id, bank_name, account_number, agency, account_type FROM bank_accounts";
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                // This constructor assumes you've added 'id' to BankAccount model
                BankAccount account = new BankAccount(
                        rs.getInt("id"),
                        rs.getString("bank_name"),
                        rs.getInt("account_number"),
                        rs.getInt("agency"),
                        rs.getString("account_type")
                );
                accounts.add(account);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return accounts;
    }

    @Override
    public BankAccount update(BankAccount bankAccount) {
        String sql = "UPDATE bank_accounts SET bank_name = ?, account_number = ?, agency = ?, account_type = ? WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, bankAccount.getBankName());
            pstmt.setInt(2, bankAccount.getAccountNumber());
            pstmt.setInt(3, bankAccount.getAgency());
            pstmt.setString(4, bankAccount.getAccountType());
            pstmt.setInt(5, bankAccount.getId()); // Assumes getId() exists
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bankAccount;
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM bank_accounts WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}