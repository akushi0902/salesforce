@IsTest
private class StringUtilityBlankTest {

    @IsTest
    static void testIsBlankString() {
        Test.startTest();
        Boolean result = StringUtility.isBlankString('');
        Test.stopTest();

        System.assertEquals(true, result);
    }
}