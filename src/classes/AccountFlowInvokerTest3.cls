@IsTest
private class AccountFlowInvokerTest3 {

    @IsTest
    static void testMultipleAccounts() {

        Test.startTest();

        AccountFlowInvoker.createAccountAndRunFlow('Account A');
        AccountFlowInvoker.createAccountAndRunFlow('Account B');
        AccountFlowInvoker.createAccountAndRunFlow('Account C');

        Test.stopTest();

        Integer accCount = [
            SELECT Count()
            FROM Account
            WHERE Name IN ('Account A','Account B','Account C')
        ];

        System.assertEquals(3, accCount);
    }
}