@IsTest
private class AccountServiceColdRatingTest {

    @IsTest
    static void testColdRating() {

        Account acc = new Account(
            Name = 'Cold Account',
            AnnualRevenue = 500000
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