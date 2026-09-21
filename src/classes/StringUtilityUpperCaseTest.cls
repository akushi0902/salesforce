@IsTest
private class StringUtilityUpperCaseTest {

    @IsTest
    static void testToUpperCase() {
        Test.startTest();
        String result = StringUtility.toUpperCase('opsera');
        Test.stopTest();

        System.assertEquals('OPSERA', result);
    }
}