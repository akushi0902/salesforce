public with sharing class AccountSelector {

    public static List<Account> getActiveAccounts(Integer limitSize) {
        return [
            SELECT Id, Name, Industry, Active__c
            FROM Account
            WHERE Active__c = :ApplicationConstants.STATUS_ACTIVE
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