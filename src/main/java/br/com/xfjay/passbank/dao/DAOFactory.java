package br.com.xfjay.passbank.dao;

import br.com.xfjay.passbank.dao.BankAccountDAO;
import br.com.xfjay.passbank.dao.TransactionDAO;
import br.com.xfjay.passbank.dao.VirtualCardDAO;

import br.com.xfjay.passbank.dao.BankAccountDAOImpl;
import br.com.xfjay.passbank.dao.TransactionDAOImpl;
import br.com.xfjay.passbank.dao.VirtualCardDAOImpl;

public class DAOFactory {

    /**
     * Retorna uma instância de VirtualCardDAO.
     * @return uma implementação de VirtualCardDAO.
     */
    public static VirtualCardDAO getVirtualCardDAO() {
        return new VirtualCardDAOImpl();
    }

    /**
     * Retorna uma instância de BankAccountDAO.
     * @return uma implementação de BankAccountDAO.
     */
    public static BankAccountDAO getBankAccountDAO() {
        return new BankAccountDAOImpl();
    }

    /**
     * Retorna uma instância de TransactionDAO.
     * @return uma implementação de TransactionDAO.
     */
    public static TransactionDAO getTransactionDAO() {
        return new TransactionDAOImpl();
    }
}