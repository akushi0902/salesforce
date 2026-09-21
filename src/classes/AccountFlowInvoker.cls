public with sharing class AccountFlowInvoker {

    public static void createAccount(String accountName) {

        Account acc = new Account(
            Name = accountName
        );

        insert acc;
    }
}