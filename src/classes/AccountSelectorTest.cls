@IsTest
public class AccountSelectorTest {

    @testSetup
    static void setupData() {
        List<Account> accounts = new List<Account>();

        // Active accounts
        for (Integer i = 0; i < 3; i++) {
            accounts.add(new Account(
                Name = 'Active Account ' + i,
                Industry = 'Technology',
                Active__c = 'Active',
                Description = 'Test Description ' + i
            ));
        }

        // Inactive account (should not be returned)
        accounts.add(new Account(
            Name = 'Inactive Account',
            Industry = 'Finance',
            Active__c = 'Inactive',
            Description = 'Inactive Description'
        ));

        insert accounts;
    }

    @IsTest
    static void testGetActiveAccounts() {

        Test.startTest();
            List<Account> result =
                AccountSelector.getActiveAccounts(10);
        Test.stopTest();

        System.assertEquals(
            3,
            result.size(),
            'Only active accounts should be returned'
        );

        for (Account acc : result) {
            System.assertEquals(
                'Active',
                acc.Active__c,
                'Returned account must be Active'
            );
        }
    }

    @IsTest
    static void testGetAccountById() {

        Account acc = [
            SELECT Id, Name, Description
            FROM Account
            WHERE Name LIKE 'Active Account%'
            LIMIT 1
        ];

        Test.startTest();
            Account result =
                AccountSelector.getAccountById(acc.Id);
        Test.stopTest();

        System.assertNotEquals(
            null,
            result,
            'Account should be returned'
        );
        System.assertEquals(
            acc.Id,
            result.Id,
            'Returned account ID should match'
        );
    }
}