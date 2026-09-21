@IsTest
private class ContactFlowInvokerTest1 {

    @IsTest
    static void testContactCreation() {

        Test.startTest();

        ContactFlowInvoker.createContact('Smith');

        Test.stopTest();

        Contact con = [
            SELECT Id, LastName
            FROM Contact
            WHERE LastName = 'Smith'
            LIMIT 1
        ];

        System.assertEquals('Smith', con.LastName);
    }
}