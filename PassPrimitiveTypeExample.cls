/**
* This example shows how a primitive argument of type String is passed by value into another method.
* The debugStatusMessage method in this example creates a String variable, msg, and assigns it a value. 
* It then passes this variable as an argument to another method, which modifies the value of this String. 
* since String is a primitive type, it is passed by value, and when the method returns, the value of the original variable, msg, is unchanged. 
* An assert statement verifies that the value of msg is still the old value.
*/

public class PassPrimitiveTypeExample {
    public static void debugStatusMessage() {
        String msg = 'Original value';
        processString(msg);
        // The value of the msg variable didn't
        // change; it is still the old value.
        System.assertEquals(msg, 'Original value');
    }

    public static void processString(String s) {
        s = 'modified value';
    }
}