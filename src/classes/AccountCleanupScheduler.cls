public class AccountCleanupScheduler
 implements Schedulable {

    public void execute(SchedulableContext sc) {
        Database.executeBatch(
            new AccountCleanupBatch(),
            ApplicationConstants.DEFAULT_BATCH_SIZE
        );
    }
}