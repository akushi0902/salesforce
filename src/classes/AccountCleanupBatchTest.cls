@IsTest
public class AccountCleanupBatchTest {

    @testSetup
    static void setupData() {
        List<Account> accList = new List<Account>();

        for (Integer i = 0; i < 5; i++) {
            accList.add(new Account(
                Name = 'Test Account ' + i,
                Active__c = ApplicationConstants.STATUS_ACTIVE
            ));
        }
        insert accList;
    }

    @IsTest
    static void testAccountCleanupBatchExecution() {
        Test.startTest();
            Database.executeBatch(new AccountCleanupBatch(), 200);
        Test.stopTest();

        List<Account> updatedAccounts = [
            SELECT Id, Active__c
            FROM Account
        ];

        for (Account acc : updatedAccounts) {
            System.assertEquals(
                ApplicationConstants.STATUS_INACTIVE,
                acc.Active__c,
                'Account should be marked as Inactive'
            );
        }
    }
}