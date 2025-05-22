package br.com.xfjay.passbank.dao;

import br.com.xfjay.passbank.model.VirtualCard;
import br.com.xfjay.passbank.utils.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class VirtualCardDAOImpl implements VirtualCardDAO {

    @Override
    public VirtualCard save(VirtualCard virtualCard) {
        String sql = "INSERT INTO virtual_cards (card_name, card_number, expiry_date, cvv) VALUES (?, ?, ?, ?)";
        // If linking to bank_accounts, add bank_account_id column and parameter:
        // String sql = "INSERT INTO virtual_cards (card_name, card_number, expiry_date, cvv, bank_account_id) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, new String[]{"ID"})) { // "ID" for Oracle

            pstmt.setString(1, virtualCard.getCardName());
            pstmt.setString(2, virtualCard.getCardNumber());
            pstmt.setString(3, virtualCard.getExpiryDate());
            pstmt.setInt(4, virtualCard.getCvv());
            // if (virtualCard.getBankAccountId() != 0) { // Example if you add bankAccountId
            //     pstmt.setInt(5, virtualCard.getBankAccountId());
            // } else {
            //     pstmt.setNull(5, Types.INTEGER);
            // }
            pstmt.executeUpdate();

            try (ResultSet generatedKeys = pstmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    virtualCard.setId(generatedKeys.getInt(1));
                } else {
                    throw new SQLException("Creating virtual card failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return virtualCard;
    }

    @Override
    public Optional<VirtualCard> findById(int id) {
        String sql = "SELECT id, card_name, card_number, expiry_date, cvv FROM virtual_cards WHERE id = ?";
        // If linking to bank_accounts, add bank_account_id to SELECT
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    VirtualCard card = new VirtualCard(
                            rs.getInt("id"),
                            rs.getString("card_name"),
                            rs.getString("card_number"),
                            rs.getString("expiry_date"),
                            rs.getInt("cvv")
                    );
                    // if (rs.getObject("bank_account_id") != null) { // Example
                    //     card.setBankAccountId(rs.getInt("bank_account_id"));
                    // }
                    return Optional.of(card);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Optional.empty();
    }

    @Override
    public List<VirtualCard> findAll() {
        List<VirtualCard> cards = new ArrayList<>();
        String sql = "SELECT id, card_name, card_number, expiry_date, cvv FROM virtual_cards";
        // If linking to bank_accounts, add bank_account_id to SELECT
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                VirtualCard card = new VirtualCard(
                        rs.getInt("id"),
                        rs.getString("card_name"),
                        rs.getString("card_number"),
                        rs.getString("expiry_date"),
                        rs.getInt("cvv")
                );
                // if (rs.getObject("bank_account_id") != null) { // Example
                //     card.setBankAccountId(rs.getInt("bank_account_id"));
                // }
                cards.add(card);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cards;
    }

    @Override
    public VirtualCard update(VirtualCard virtualCard) {
        String sql = "UPDATE virtual_cards SET card_name = ?, card_number = ?, expiry_date = ?, cvv = ? WHERE id = ?";
        // If linking to bank_accounts, add bank_account_id to UPDATE
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, virtualCard.getCardName());
            pstmt.setString(2, virtualCard.getCardNumber());
            pstmt.setString(3, virtualCard.getExpiryDate());
            pstmt.setInt(4, virtualCard.getCvv());
            // Example for bank_account_id, adjust parameter index if used
            // pstmt.setInt(5, virtualCard.getBankAccountId());
            // pstmt.setInt(6, virtualCard.getId());
            pstmt.setInt(5, virtualCard.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return virtualCard;
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM virtual_cards WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}