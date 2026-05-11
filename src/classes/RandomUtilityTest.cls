@isTest
private class RandomUtilityTest {

    @isTest
    static void testGetRandomNumber() {

        Test.startTest();
        Integer value = RandomUtility.getRandomNumber();
        Test.stopTest();

        System.assert(
            value >= 1 && value <= 100,
            'Random number should be between 1 and 100'
        );
    }
}