public with sharing class AccountServiceSwap {

    public static Account createAccount(String accountName) {
        Account acc = new Account(
            Name = accountName
        );
        insert acc;
        return acc;
    }

    public static Account getAccountById(Id accountId) {
        return [
            SELECT Id, Name
            FROM Account
            WHERE Id = :accountId
            LIMIT 1
        ];
    }

    public static void updateAccountName(Id accountId, String newName) {
        Account acc = [
            SELECT Id, Name
            FROM Account
            WHERE Id = :accountId
            LIMIT 1
        ];
        acc.Name = newName;
        update acc;
    }

    public static void deleteAccount(Id accountId) {
        delete [
            SELECT Id
            FROM Account
            WHERE Id = :accountId
            LIMIT 1
        ];
    }
}