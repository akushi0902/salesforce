@IsTest
private class AccountServiceWarmRatingTest {

    @IsTest
    static void testWarmRating() {

        Account acc = new Account(
            Name = 'Warm Account',
            AnnualRevenue = 2000000
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

        System.assertEquals('Warm', result.Rating);
    }
}