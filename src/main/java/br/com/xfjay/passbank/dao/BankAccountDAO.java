package br.com.xfjay.passbank.dao;

import br.com.xfjay.passbank.model.BankAccount;
import java.util.List;
import java.util.Optional;

public interface BankAccountDAO {
    BankAccount save(BankAccount bankAccount);
    Optional<BankAccount> findById(int id);
    List<BankAccount> findAll();
    BankAccount update(BankAccount bankAccount);
    void delete(int id);
}