public with sharing class OpportunityService {

    public static Decimal calculateTotalAmount(List<Opportunity> opportunities) {

        Decimal total = 0;

        for(Opportunity opp : opportunities) {
            total += opp.Amount;
        }

        return total;
    }
}