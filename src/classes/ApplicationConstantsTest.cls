@IsTest
public class ApplicationConstantsTest {

    @IsTest
    static void testConstantsValues() {

        System.assertEquals(
            'Active',
            ApplicationConstants.STATUS_ACTIVE
        );

        System.assertEquals(
            'Inactive',
            ApplicationConstants.STATUS_INACTIVE
        );

        System.assertEquals(
            200,
            ApplicationConstants.DEFAULT_BATCH_SIZE
        );

        System.assertEquals(
            'System',
            ApplicationConstants.SYSTEM_USER
        );
    }
}