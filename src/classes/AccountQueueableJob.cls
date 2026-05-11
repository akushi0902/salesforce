public class AccountQueueableJob implements Queueable {

    public void execute(QueueableContext context) {
        List<Account> accs =
            AccountSelector.getActiveAccounts(20);

        AccountService.markAccountsInactive(accs);
    }
}