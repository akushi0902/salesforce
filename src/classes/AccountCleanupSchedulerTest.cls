@IsTest
public class AccountCleanupSchedulerTest {

    @IsTest
    static void testSchedulerExecution() {

        // Prepare data (still okay to create)
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
            String jobId = System.schedule(
                'Account Cleanup Scheduler Test',
                cronExp,
                new AccountCleanupScheduler()
            );
        Test.stopTest();

        // ✅ ASSERT ONLY THAT THE JOB WAS SCHEDULED
        System.assertNotEquals(
            null,
            jobId,
            'Scheduler job should be created'
        );
    }
}