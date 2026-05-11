@IsTest
public class AccountQueueableJobTest {

    @testSetup
    static void setupData() {
        List<Account> accList = new List<Account>();

        for (Integer i = 0; i < 5; i++) {
            accList.add(new Account(
                Name = 'Queueable Test Account ' + i,
                Active__c = 'Active'
            ));
        }

        insert accList;
    }

    @IsTest
    static void testQueueableExecution() {

        Test.startTest();
            System.enqueueJob(new AccountQueueableJob());
        Test.stopTest();

        // Validate results
        List<Account> updatedAccounts = [
            SELECT Active__c
            FROM Account
        ];

        for (Account acc : updatedAccounts) {
            System.assertEquals(
                'Inactive',
                acc.Active__c,
                'Account should be marked inactive by queueable job'
            );
        }
    }
}