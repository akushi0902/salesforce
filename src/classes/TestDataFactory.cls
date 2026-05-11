@isTest
public class TestDataFactory {

    public static Account createAccount(Boolean insertRec) {
        Account acc = new Account(
            Name = 'Test Account',
            Active__c = 'Active'
        );
        if (insertRec) insert acc;
        return acc;
    }
}