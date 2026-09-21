// Utility Apex Class
public with sharing class StringUtility {

    public static Boolean isBlankString(String input) {
        return String.isBlank(input);
    }

    public static String toUpperCase(String input) {
        return input == null ? null : input.toUpperCase();
    }

    public static String toLowerCase(String input) {
        return input == null ? null : input.toLowerCase();
    }

    public static Integer getStringLength(String input) {
        return input == null ? 0 : input.length();
    }

    public static String concatenateValues(String value1, String value2) {
        return value1 + value2;
    }
}