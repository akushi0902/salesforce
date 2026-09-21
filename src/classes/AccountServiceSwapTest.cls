@isTest
private class AccountServiceSwapTest {

    @isTest
    static void testCreateAccount() {
        Test.startTest();
        Account acc = AccountServiceSwap.createAccount('Test Account');
        Test.stopTest();

        System.assertNotEquals(null, acc.Id);
        System.assertEquals('Test Account', acc.Name);
    }

    @isTest
    static void testGetAccountById() {
        Account acc = new Account(Name = 'Get Account');
        insert acc;

        Test.startTest();
        Account result = AccountServiceSwap.getAccountById(acc.Id);
        Test.stopTest();

        System.assertEquals(acc.Id, result.Id);
        System.assertEquals('Get Account', result.Name);
    }

    @isTest
    static void testUpdateAccountName() {
        Account acc = new Account(Name = 'Old Name');
        insert acc;

        Test.startTest();
        AccountServiceSwap.updateAccountName(acc.Id, 'New Name');
        Test.stopTest();

        Account updated = [
            SELECT Name
            FROM Account
            WHERE Id = :acc.Id
        ];

        System.assertEquals('New Name', updated.Name);
    }

    @isTest
    static void testDeleteAccount() {
        Account acc = new Account(Name = 'Delete Me');
        insert acc;

        Test.startTest();
        AccountServiceSwap.deleteAccount(acc.Id);
        Test.stopTest();

        System.assertEquals(
            0,
            [SELECT Count() FROM Account WHERE Id = :acc.Id]
        );
    }
}