public class AccountCleanupBatch
 implements Database.Batchable<SObject> {

    public Database.QueryLocator start(
        Database.BatchableContext bc
    ) {
        return Database.getQueryLocator(
            'SELECT Id, Active__c FROM Account WHERE Active__c = true'
        );
    }

    public void execute(
        Database.BatchableContext bc,
        List<Account> scope
    ) {
        for (Account acc : scope) {
            acc.Active__c = 'Inactive';
        }
        update scope;
    }

    public void finish(Database.BatchableContext bc) {
        AppLogger.log('Account cleanup batch completed');
    }
}