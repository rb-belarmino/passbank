package br.com.xfjay.passbank.dao;

import br.com.xfjay.passbank.model.Transaction;
import java.util.List;
import java.util.Optional;

public interface TransactionDAO {
    Transaction save(Transaction transaction);
    Optional<Transaction> findById(int id);
    List<Transaction> findAll();
    List<Transaction> findByAccountId(int accountId); // Para buscar transações de uma conta específica

    // Métodos para update e delete são opcionais para transações.
    // Se decidir que precisa deles, descomente-os aqui e
    // adicione/descomente as implementações correspondentes em TransactionDAOImpl.
    // Transaction update(Transaction transaction);
    // void delete(int id);
}