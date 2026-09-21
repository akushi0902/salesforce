@IsTest
private class ContactFlowInvokerTest3 {

    @IsTest
    static void testMultipleContacts() {

        Test.startTest();

        ContactFlowInvoker.createContact('A');
        ContactFlowInvoker.createContact('B');
        ContactFlowInvoker.createContact('C');

        Test.stopTest();

        Integer countContacts = [
            SELECT Count()
            FROM Contact
            WHERE LastName IN ('A','B','C')
        ];

        System.assertEquals(3, countContacts);
    }
}