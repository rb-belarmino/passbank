package br.com.xfjay.passbank.dao;

import br.com.xfjay.passbank.model.VirtualCard;
import java.util.List;
import java.util.Optional;

public interface VirtualCardDAO {
    VirtualCard save(VirtualCard virtualCard);
    Optional<VirtualCard> findById(int id);
    List<VirtualCard> findAll();
    VirtualCard update(VirtualCard virtualCard);
    void delete(int id);
    // Optional: List<VirtualCard> findByBankAccountId(int bankAccountId);
}