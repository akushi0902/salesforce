public with sharing class AccountSelector {

    public static List<Account> getActiveAccounts(Integer limitSize) {
        return [
            SELECT Id, Name, Industry
            FROM Account
            WHERE Active__c = 'Active'
            LIMIT :limitSize
        ];
    }

    public static Account getAccountById(Id accountId) {
        return [
            SELECT Id, Name, Description
            FROM Account
            WHERE Id = :accountId
            LIMIT 1
        ];
    }
}