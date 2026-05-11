public with sharing class AccountService {

    public static void markAccountsInactive(List<Account> accounts) {
        if (accounts == null || accounts.isEmpty()) {
            return;
        }

        for (Account acc : accounts) {
            acc.Active__c = 'Inactive';
            acc.Description = 'Marked inactive via AccountService';
        }

        update accounts;
    }

    public static void deactivateOldAccounts() {
        List<Account> accs =
            AccountSelector.getActiveAccounts(50);

        markAccountsInactive(accs);
    }
}