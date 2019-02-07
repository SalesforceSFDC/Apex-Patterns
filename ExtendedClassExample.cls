public class OuterClass {

    //static final variable - outer class level only
    private static final Integer MY_INT;

    //Non-final static variable - use this to communicate state across triggers
    //within a single request.
    public static String sharedState;

    //Static method - outer class level only
    public static Integer getInt()  { return MY_INT; }

    //Static initialization (can be included where the variable is defined)
    static { MY_INT = 2; }

    //Member variable for outer class
    private final String m;
    
       
}