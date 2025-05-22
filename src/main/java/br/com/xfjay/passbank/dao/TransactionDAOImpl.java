package br.com.xfjay.passbank.dao;

import br.com.xfjay.passbank.model.Transaction;
import br.com.xfjay.passbank.utils.DatabaseConnection;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class TransactionDAOImpl implements TransactionDAO {

    @Override
    public Transaction save(Transaction transaction) {
        String sql = "INSERT INTO transactions (amount, balance_after_transaction, transaction_date, description) VALUES (?, ?, ?, ?)";
        // Se você adicionou bank_account_id à sua tabela transactions e ao modelo Transaction:
        // String sql = "INSERT INTO transactions (amount, balance_after_transaction, transaction_date, description, bank_account_id) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            pstmt.setDouble(1, transaction.getAmount());
            pstmt.setDouble(2, transaction.getBalanceAfterTransaction());
            if (transaction.getTransactionDate() != null) {
                pstmt.setTimestamp(3, Timestamp.valueOf(transaction.getTransactionDate()));
            } else {
                pstmt.setNull(3, Types.TIMESTAMP);
            }
            pstmt.setString(4, transaction.getDescription());
            // if (transaction.getBankAccountId() != 0) { // Exemplo de como lidar com bank_account_id
            //     pstmt.setInt(5, transaction.getBankAccountId());
            // } else {
            //     pstmt.setNull(5, Types.INTEGER);
            // }
            pstmt.executeUpdate();

            try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    transaction.setId(generatedKeys.getInt(1));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return transaction;
    }

    @Override
    public Optional<Transaction> findById(int id) {
        String sql = "SELECT id, amount, balance_after_transaction, transaction_date, description FROM transactions WHERE id = ?";
        // Se tiver bank_account_id:
        // String sql = "SELECT id, amount, balance_after_transaction, transaction_date, description, bank_account_id FROM transactions WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Timestamp timestamp = rs.getTimestamp("transaction_date");
                    LocalDateTime transactionDate = null;
                    if (timestamp != null) {
                        transactionDate = timestamp.toLocalDateTime();
                    }
                    Transaction transaction = new Transaction(
                            rs.getInt("id"),
                            rs.getDouble("amount"),
                            rs.getDouble("balance_after_transaction"),
                            transactionDate,
                            rs.getString("description")
                    );
                    // Se tiver bank_account_id:
                    // transaction.setBankAccountId(rs.getInt("bank_account_id"));
                    return Optional.of(transaction);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Optional.empty();
    }

    @Override
    public List<Transaction> findAll() {
        List<Transaction> transactions = new ArrayList<>();
        String sql = "SELECT id, amount, balance_after_transaction, transaction_date, description FROM transactions";
        // Se tiver bank_account_id:
        // String sql = "SELECT id, amount, balance_after_transaction, transaction_date, description, bank_account_id FROM transactions";
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Timestamp timestamp = rs.getTimestamp("transaction_date");
                LocalDateTime transactionDate = null;
                if (timestamp != null) {
                    transactionDate = timestamp.toLocalDateTime();
                }
                Transaction transaction = new Transaction(
                        rs.getInt("id"),
                        rs.getDouble("amount"),
                        rs.getDouble("balance_after_transaction"),
                        transactionDate,
                        rs.getString("description")
                );
                // Se tiver bank_account_id:
                // transaction.setBankAccountId(rs.getInt("bank_account_id"));
                transactions.add(transaction);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return transactions;
    }

    @Override
    public List<Transaction> findByAccountId(int accountId) {
        List<Transaction> transactions = new ArrayList<>();
        String sql = "SELECT id, amount, balance_after_transaction, transaction_date, description FROM transactions WHERE bank_account_id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, accountId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Timestamp timestamp = rs.getTimestamp("transaction_date");
                    LocalDateTime transactionDate = null;
                    if (timestamp != null) {
                        transactionDate = timestamp.toLocalDateTime();
                    }
                    Transaction transaction = new Transaction(
                            rs.getInt("id"),
                            rs.getDouble("amount"),
                            rs.getDouble("balance_after_transaction"),
                            transactionDate,
                            rs.getString("description")
                    );
                    // transaction.setBankAccountId(accountId); // Ou rs.getInt("bank_account_id") se estiver selecionando
                    transactions.add(transaction);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return transactions;
    }

    // Implementações de update e delete (se necessárias)
    // @Override
    // public Transaction update(Transaction transaction) { ... }
    // @Override
    // public void delete(int id) { ... }
}