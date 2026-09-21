public with sharing class HelloWorldController {

    @AuraEnabled
    public static String getMessage() {
        return 'Hello from Apex!';
    }
}