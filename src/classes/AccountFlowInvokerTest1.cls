@IsTest
private class AccountFlowInvokerTest1 {

    @IsTest
    static void testAccountCreated() {

        Test.startTest();

        AccountFlowInvoker.createAccount('Test Account 1');

        Test.stopTest();

        Account acc = [
            SELECT Id, Name
            FROM Account
            WHERE Name = 'Test Account 1'
            LIMIT 1
        ];

        System.assertEquals('Test Account 1', acc.Name);
    }
}