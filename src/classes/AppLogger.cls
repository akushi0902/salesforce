public class AppLogger {

    public static Boolean ENABLE_DEBUG = false;

    public static void log(String message) {
        if (ENABLE_DEBUG) {
            System.debug(message);
        }
    }
}