public with sharing class OportunidadeBO {
    private static OportunidadeBO instance = new OportunidadeBO();

    public static OportunidadeBO getInstance() {
        return instance;
    }

    public void atualizarRating(List<Opportunity> oportunidades){
        Set<Id> idContas = new Set<Id>();
        for(Opportunity oportunidade : oportunidades){
            idContas.add(oportunidade.AccountId);
        }
        if (!idContas.isEmpty()) {
            List<Account> contas = new List<Account>();
            contas = AccountDAO.getInstance().buscarContas(idContas);
            if (!contas.isEmpty()) {
                List<Account> contasAtualizadas = new List<Account>();
                for(Account conta : contas){
                    conta.Rating = 'Hot';
                    contasAtualizadas.add(conta);
                }
                if (!contasAtualizadas.isEmpty()) {
                    update contasAtualizadas;
                }
            }
        }
    }
}
