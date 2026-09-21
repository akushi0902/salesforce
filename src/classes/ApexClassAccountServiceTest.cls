@IsTest
public with sharing class ApexClassAccountServiceTest {

    @TestSetup
    static void setupTestData() {
        List<Account> accList = new List<Account>();
        for(Integer i = 0; i < 3; i++) {
            accList.add(new Account(Name = 'Setup Account ' + i));
        }
        insert accList;
    }

    @IsTest
    static void testCreateDummyAccounts() {
        System.Test.startTest();
        List<Account> createdAccounts = ApexClassAccountService.createDummyAccounts(2);
        System.Test.stopTest();

        System.assertEquals(2, createdAccounts.size(), 'Two accounts should be created');
    }

    @IsTest
    static void testFetchDummyAccounts() {
        System.Test.startTest();
        List<Account> fetchedAccounts = ApexClassAccountService.fetchDummyAccounts(5);
        System.Test.stopTest();

        System.assert(!fetchedAccounts.isEmpty(), 'Fetched accounts should not be empty');
    }

    @IsTest
    static void testUpdateDummyAccountName() {
        Account acc = [SELECT Id FROM Account LIMIT 1];

        System.Test.startTest();
        ApexClassAccountService.updateDummyAccountName(acc.Id, 'Updated Dummy Name');
        System.Test.stopTest();

        Account updatedAcc = [SELECT Name FROM Account WHERE Id = :acc.Id];
        System.assertEquals('Updated Dummy Name', updatedAcc.Name, 'Account name should be updated');
    }
}