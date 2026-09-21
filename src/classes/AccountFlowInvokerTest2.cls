@IsTest
private class AccountFlowInvokerTest2 {

    @IsTest
    static void testFlowUpdatedRating() {

        Test.startTest();

        AccountFlowInvoker.createAccount('Test Account 2');

        Test.stopTest();

        Account acc = [
            SELECT Rating
            FROM Account
            WHERE Name = 'Test Account 2'
            LIMIT 1
        ];

        System.assertEquals('Hot', acc.Rating);
    }
}