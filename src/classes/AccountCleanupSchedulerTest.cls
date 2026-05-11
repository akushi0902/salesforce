@IsTest
public class AccountCleanupSchedulerTest {

    @IsTest
    static void testSchedulerExecution() {

        // Create fresh test data
        List<Account> accList = new List<Account>();
        for (Integer i = 0; i < 5; i++) {
            accList.add(new Account(
                Name = 'Scheduled Test Account ' + i,
                Active__c = ApplicationConstants.STATUS_ACTIVE
            ));
        }
        insert accList;

        String cronExp = '0 0 0 1 1 ? 2099';

        Test.startTest();
            System.schedule(
                'Account Cleanup Scheduler Test',
                cronExp,
                new AccountCleanupScheduler()
            );
        Test.stopTest();

        List<Account> accounts = [
            SELECT Id, Active__c
            FROM Account
        ];

        for (Account acc : accounts) {
            System.assertEquals(
                ApplicationConstants.STATUS_INACTIVE,
                acc.Active__c,
                'Account should be marked Inactive by scheduled batch'
            );
        }
    }
}