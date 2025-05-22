package br.com.xfjay.passbank.model;

import br.com.xfjay.passbank.dao.LoginDAO;
import br.com.xfjay.passbank.dao.LoginDAOImpl;
import br.com.xfjay.passbank.utils.DatabaseConnection;
import org.mindrot.jbcrypt.BCrypt;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Optional;

class LoginTest {

    private LoginDAO loginDAO;
    private Connection connection; // Para limpeza

    @BeforeEach
    void setUp() throws SQLException {
        loginDAO = new LoginDAOImpl();
        connection = DatabaseConnection.getConnection();

        try (Statement stmt = connection.createStatement()) {
            // stmt.execute("DELETE FROM T_LOGIN"); // Descomente se quiser limpar a tabela antes de cada teste
        }
    }

    @AfterEach
    void tearDown() throws SQLException {
        if (connection != null && !connection.isClosed()) {
            try (Statement stmt = connection.createStatement()) {
                stmt.execute("DELETE FROM T_LOGIN WHERE USERNAME LIKE 'testUserDB%'");
                stmt.execute("DELETE FROM T_LOGIN WHERE USERNAME = 'userToSave'");
            } finally {
                connection.close();
            }
        }
    }

    @Test
    void testSaveAndRetrieveLoginFromDatabase() {
        // Arrange
        String username = "userToSave";
        String rawPassword = "securePassword123";
        // Se você implementar o hashing no DAO, o objeto Login ainda usa a senha em texto plano aqui.
        // Se o DAO espera um hash, você precisaria hashear aqui:
        String hashedPassword = BCrypt.hashpw(rawPassword, BCrypt.gensalt());
        Login loginToSave = new Login(username, hashedPassword);

        // Act
        loginDAO.save(loginToSave);

        // Assert
        Optional<Login> retrievedLoginOpt = loginDAO.findByUsername(username);
        assertTrue(retrievedLoginOpt.isPresent(), "Login não encontrado no banco após salvar.");
        Login retrievedLogin = retrievedLoginOpt.get();
        assertEquals(username, retrievedLogin.getUsername(), "Username recuperado não corresponde.");

        assertTrue(BCrypt.checkpw(rawPassword, retrievedLogin.getPassword()), "A verificação da senha falhou.");

    }


    @Test
    void testLoginConstructorAndGetters() {
        String expectedUsername = "testUser";
        String expectedPassword = "testPassword123";
        Login login = new Login(expectedUsername, expectedPassword);
        assertEquals(expectedUsername, login.getUsername());
        assertEquals(expectedPassword, login.getPassword());
    }

    @Test
    void testSetUsername() {
        Login login = new Login("initialUser", "initialPassword");
        String newUsername = "updatedUser";
        login.setUsername(newUsername);
        assertEquals(newUsername, login.getUsername());
    }

    @Test
    void testSetPassword() {
        Login login = new Login("initialUser", "initialPassword");
        String newPassword = "updatedPassword456";
        login.setPassword(newPassword);
        assertEquals(newPassword, login.getPassword());
    }
}