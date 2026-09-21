@IsTest
private class AccountServiceRevenueCalculationTest {

    @IsTest
    static void testGetTotalRevenue() {

        Account acc1 = new Account(
            Name = 'Account 1',
            AnnualRevenue = 1000000
        );

        Account acc2 = new Account(
            Name = 'Account 2',
            AnnualRevenue = 2500000
        );

        insert new List<Account>{acc1, acc2};

        Test.startTest();

        Decimal totalRevenue = AccountService.getTotalRevenue(
            new Set<Id>{acc1.Id, acc2.Id}
        );

        Test.stopTest();

        System.assertEquals(3500000, totalRevenue);
    }
}