public class PassPrimitiveTypeExample {
    public static void debugStatusMessage() {
        String msg = 'Original Value';
        processString(msg);
        // The value of the msg variable didn't
        // change; it is still the old value.
        System.assertEquals(msg, 'Original Value');
    }

    public static void processString(String s) {
        s = 'Modified Value';
    }
}