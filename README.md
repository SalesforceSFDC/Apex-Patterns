
* [Object-Oriented Programming Concepts](http://java.sun.com/docs/books/tutorial/java/concepts/index.html)
* [Access Modifiers](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_access_modifiers.htm)


* The `global` access modifier, which is more permissive than the `public` modifier and allows access across namespaces and applications.

## List
You can add elements to a list when creating the list, or after creating the list by calling the add() method. 
* lists don’t require you to determine ahead of time how many elements you need to allocate.
* You can add elements to a list when creating the list, or after creating the list by calling the add() method.
* List elements can be read by specifying an index between square brackets
* you can use the get() method to read a list element.
* Create a list and add elements to it:
```apex
List<String> colors = new List<String> {'red', 'blue'};

//Add elements to list after it has been created
List<String>  moreColors = new List<String>();
moreColors.add('orange');

```
* List syntax: `List<Data Type> variable name = new List<Data Type>();`

* List elements can be read by specifying an index between square brackets, just like with array elements. Also, you can use the get() method to read a list element.

```apex
// Get elements from a list
String color1 = moreColors.get(0);
String color2 = moreColors[0];
System.assertEquals(color1, color2);

//iterate over a list to read elements
for(Integer i=0; i<colors.size(); i++) {
    //write value to the debug log
    System.debug(colors[i]);
}
```

## Apex Class Definition

* Class methods can be called by triggers and other classes.
* public method
* private helper method - 
* built-in Messaging methods
* Apex class library
* class encapsulates the methods that are related to managing email
* member variables (attributes) 
* accessor methods to access attributes
* class member variables
* Instance methods access class member variables.
* Static methods are easier to call than instance methods because they don’t need to be called on an instance of the class but are called directly on the class name.

### sObject
* Every record in Salesforce is natively represented as an sObject in Apex. 
* The Account sObject is an abstraction of the account record and holds the account field information in memory as an object.
* Each Salesforce record is represented as an sObject before it is inserted into Salesforce.
* when persisted records are retrieved from Salesforce, they’re stored in an sObject variable.
* to create an sObject, you need to declare a variable and assign it to an sObject instance. The data type of the variable is the sObject type.
* For custom relationship fields, the API name ends with the __r suffix. 
* [Object Reference for Salesforce and Lightning Platform](https://developer.salesforce.com/docs/atlas.en-us.216.0.object_reference.meta/object_reference/sforce_api_objects_concepts.htm)

All objects have a state and a behavior, things that objects know about itself and things that an object can do.
Variables are used to specify the state of an object, such as the object's Name or Type.  

A class can contain other classes, exception types, and initialization code.

An interface is like a class in which none of the methods have been implemented—the method signatures are there, but the body of each method is empty. To use an interface, another class must implement it by providing a body for all of the methods contained in the interface.

Methods are used to control behavior, such as getOtherQuotes or copyLineItems.

To define a class, specify the following:
* Access modifiers:
    * Must use one of the access modifiers (such as `public` or `global`) in the declaration of the top-level class.
    * You do not have to use an access modifier in the declaration of an inner level class.
* Optional definition modifiers (`virtual`, `abstract`, etc.)
* Required: The keyword `class` followed by the name of the class.
* Optional extensions and/or implementations

Syntax to define a class:
```apex
private | public | global 
[virtual | abstract | with sharing | without sharing]
class ClassName [implements InterfaceNameList] [extends ClassName]
{
    //the body of the class
}
```
* The `virtual` definition modifier declares that this class allows extension and overrides. You cannot override a method with the `override` keyword unless the class has been defined as `virtual`.
* The `abstract` definition modifier declares that this class contains abstract methods, that is, methods that only have their signature declared and no body defined.

### Apex Class Definition
```apex
private | public | global 
[virtual | abstract | with sharing | without sharing] 
class ClassName [implements InterfaceNameList] [extends ClassName] 
{ 
// The body of the class
}
```

### Class Variables
```apex
[public | private | protected | global] [final] [static] data_type variable_name 
[= value] 
```
### Class Methods
```apex 
[public | private | protected | global] [override] [static] data_type method_name 
(input parameters) 
{
// The body of the method
}
```
* Methods with a void return type are typically invoked as a stand-alone statement in Apex code. 
* void - the method does not return a value.
* In Apex, all primitive data type arguments, such as Integer or String, are passed into methods by value. 
* This fact means that any changes to the arguments exist only within the scope of the method.
* When the method returns, the changes to the arguments are lost.
* Non-primitive data type arguments, such as sObjects, are passed into methods by reference. 
* when the method returns, the passed-in argument still references the same object as before the method call.
#### Example: Passing Primitive Data Type Arguments
* This example shows how a primitive argument of type String is passed by value into another method.
* The debugStatusMessage method in this example creates a String variable, msg, and assigns it a value. 
* It then passes this variable as an argument to another method, which modifies the value of this String. 
* since String is a primitive type, it is passed by value, and when the method returns, the value of the original variable, msg, is unchanged. 
* An assert statement verifies that the value of msg is still the old value.
```apex
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
```
#### Invoking a public method
```apex
EmailManager em = new EmailManager();
em.sendMail('Your email address', 'Trailhead Tutorial', '123 body');
```
