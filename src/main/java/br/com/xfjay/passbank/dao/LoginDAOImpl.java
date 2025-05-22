package br.com.xfjay.passbank.dao;

import br.com.xfjay.passbank.model.Login;
import br.com.xfjay.passbank.utils.DatabaseConnection;

import org.mindrot.jbcrypt.BCrypt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Optional;

public class LoginDAOImpl implements LoginDAO {

    @Override
    public Login save(Login login) {

        String passwordToStore = login.getPassword();

        String sql = "INSERT INTO T_LOGIN (USERNAME, PASSWORD_HASH) VALUES (?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, login.getUsername());
            pstmt.setString(2, passwordToStore);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return login;
    }

    @Override
    public Optional<Login> findByUsername(String username) {
        String sql = "SELECT USERNAME, PASSWORD_HASH FROM T_LOGIN WHERE USERNAME = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, username);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Login login = new Login(rs.getString("USERNAME"), rs.getString("PASSWORD_HASH"));
                    return Optional.of(login);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Optional.empty();
    }
}