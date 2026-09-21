@IsTest
private class ContactFlowInvokerTest2 {

    @IsTest
    static void testDepartmentUpdated() {

        Test.startTest();

        ContactFlowInvoker.createContact('Johnson');

        Test.stopTest();

        Contact con = [
            SELECT Department
            FROM Contact
            WHERE LastName = 'Johnson'
            LIMIT 1
        ];

        System.assertEquals('Sales', con.Department);
    }
}