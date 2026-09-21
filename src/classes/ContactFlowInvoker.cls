public with sharing class ContactFlowInvoker {
//test
    public static void createContact(String lastName) {

        Contact con = new Contact(
            LastName = lastName
        );

        insert con;
    }
}