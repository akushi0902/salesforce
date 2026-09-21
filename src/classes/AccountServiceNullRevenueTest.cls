@IsTest
private class AccountServiceNullRevenueTest {

    @IsTest
    static void testNullRevenue() {

        Account acc = new Account(
            Name = 'Null Revenue Account'
        );
        insert acc;

        Test.startTest();
        AccountService.updateAccountRating(new Set<Id>{acc.Id});
        Test.stopTest();

        Account result = [
            SELECT Rating
            FROM Account
            WHERE Id = :acc.Id
        ];

        System.assertEquals('Cold', result.Rating);
    }
}