@IsTest
private class StringUtilityLengthTest {

    @IsTest
    static void testGetStringLength() {
        Test.startTest();
        Integer result = StringUtility.getStringLength('DevOps');
        Test.stopTest();

        System.assertEquals(6, result);
    }
}