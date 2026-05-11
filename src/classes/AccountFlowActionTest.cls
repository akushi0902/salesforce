@IsTest
public class AccountFlowActionTest {

    @testSetup
    static void setupData() {
        List<Account> accounts = new List<Account>();

        for (Integer i = 0; i < 3; i++) {
            accounts.add(new Account(
                Name = 'Flow Test Account ' + i,
                Active__c = 'Active'
            ));
        }

        insert accounts;
    }

    @IsTest
    static void testRunFromFlow() {

        // Fetch test accounts
        List<Account> accs = [
            SELECT Id, Active__c
            FROM Account
            WHERE Active__c = 'Active'
        ];

        // Prepare invocable requests
        List<AccountFlowAction.Request> requests =
            new List<AccountFlowAction.Request>();

        for (Account acc : accs) {
            AccountFlowAction.Request req =
                new AccountFlowAction.Request();
            req.accountId = acc.Id;
            requests.add(req);
        }

        Test.startTest();
            AccountFlowAction.runFromFlow(requests);
        Test.stopTest();

        // Validate results
        List<Account> updatedAccounts = [
            SELECT Active__c
            FROM Account
            WHERE Id IN :accs
        ];

        for (Account acc : updatedAccounts) {
            System.assertEquals(
                'Inactive',
                acc.Active__c,
                'Account should be deactivated by Flow action'
            );
        }
    }
}