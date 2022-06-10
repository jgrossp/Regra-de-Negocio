trigger CriacaoOportunidade on Opportunity (after insert) {

    if (Trigger.isInsert) {
        OportunidadeBO.getInstance().atualizarRating(Trigger.new);
    }
    
}