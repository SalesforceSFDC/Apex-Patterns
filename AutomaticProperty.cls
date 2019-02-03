public class AutomaticProperty {
    public integer MyReadOnlyProp { get; }
    public double MyReadWriteProp { get; set; }
    public string MyWriteOnlyProp { set; }
}

//to call the class use this code:

/**
AutomaticProperty ap = new AutomaticProperty();
ap.MyReadOnlyProp = 5;
ap.MyReadWriteProp = 5;
System.assertEquals(5, ap.MyReadOnlyProp);
*/