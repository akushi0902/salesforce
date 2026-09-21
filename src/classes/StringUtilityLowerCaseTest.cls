@IsTest
private class StringUtilityLowerCaseTest {

    @IsTest
    static void testToLowerCase() {
        Test.startTest();
        String result = StringUtility.toLowerCase('SALESFORCE');
        Test.stopTest();

        System.assertEquals('salesforce', result);
    }
}