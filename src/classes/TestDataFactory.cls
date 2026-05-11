@IsTest
public class TestDataFactory {

    public static Account createAccount(Boolean isActive) {
        Account acc = new Account(
            Name = 'Test Account',
            Active__c = isActive 
                ? ApplicationConstants.STATUS_ACTIVE
                : ApplicationConstants.STATUS_INACTIVE
        );
        insert acc;
        return acc;
    }
}