@IsTest
private class StringUtilityConcatenateTest {

    @IsTest
    static void testConcatenateValues() {
        Test.startTest();
        String result = StringUtility.concatenateValues(
            'Sales',
            'force'
        );
        Test.stopTest();

        System.assertEquals('Salesforce', result);
    }
}