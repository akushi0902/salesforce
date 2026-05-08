@isTest
private class AccountServiceTest {

    @isTest
    static void testDeactivateAccounts() {

        Account acc =
            TestDataFactory.createAccount(true);

        Test.startTest();
        AccountService.deactivateOldAccounts();
        Test.stopTest();

        Account updatedAcc = [
            SELECT Active__c
            FROM Account
            WHERE Id = :acc.Id
        ];

        System.assertEquals(
            'Inactive',
            updatedAcc.Active__c
        );
    }
}