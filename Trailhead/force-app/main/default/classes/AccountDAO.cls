public with sharing class AccountDAO {
    private static AccountDAO instance = new AccountDAO();
    public static AccountDAO getInstance() {
        return instance;
    }

    public List<Account> buscarContas(Set<Id> idContas){
        List<Account> contas = new List<Account>();
        contas = [SELECT Id, Name, Rating FROM Account WHERE Id IN: idContas];
        return contas;
    }
}
