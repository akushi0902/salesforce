public class RandomUtility {

    public static Integer getRandomNumber() {
        Integer min = 1;
        Integer max = 100;
        Integer randomValue = Math.mod(Crypto.getRandomInteger(), max - min + 1) + min;
        System.debug('Random Number: ' + randomValue);
        return randomValue;
    }
}