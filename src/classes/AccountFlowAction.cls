public with sharing class AccountFlowAction {

    public class Request {
        @InvocableVariable(required=true)
        public Id accountId;
    }

    @InvocableMethod(label='Deactivate Accounts')
    public static void runFromFlow(List<Request> requests) {

        Set<Id> ids = new Set<Id>();
        for (Request r : requests) {
            ids.add(r.accountId);
        }

        List<Account> accs = [
            SELECT Id, Active__c
            FROM Account
            WHERE Id IN :ids
        ];

        for (Account acc : accs) {
            acc.Active__c = 'Inactive';
        }

        update accs;
    }
}