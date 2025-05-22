package br.com.xfjay.passbank.dao;

import br.com.xfjay.passbank.model.Login;
import java.util.Optional;

public interface LoginDAO {
    Login save(Login login);
    Optional<Login> findByUsername(String username);
}