
* [Object-Oriented Programming Concepts](http://java.sun.com/docs/books/tutorial/java/concepts/index.html)
* [Access Modifiers](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_access_modifiers.htm)
* [Lightning Picklist Component](https://naveendhanaraj.wordpress.com/2018/06/19/lightning-picklist-component/)


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
### Static Methods and Variables
* You can use static methods and variables only with outer classes.
* Inner classes have no static methods or variables.
* Before an object of a class is created, all static member variables in a class are initialized, and all static initialization code blocks are executed.
* These items are handled in the order in which they appear in the class.
* A static method is used as a utility method, and it never depends on the value of an instance member variable. 
* Because a static method is only associated with a class, it can’t access the instance member variable values of its class.
* A static variable is static only within the scope of the Apex transaction.
* It’s not static across the server or the entire organization.
* The value of a static variable persists within the context of a single transaction and is reset across transaction boundaries. 
* For example, if an Apex DML request causes a trigger to fire multiple times, the static variables persist across these trigger invocations.
* All instances of the same class share a single copy of the static variable.
* recursive trigger - trigger that calls itself.
* define the static variables in a class so that the trigger can access these class member variables and check their static values.
* A class static variable can’t be accessed through an instance of that class.
* Local variable names are evaluated before class names.
* Instance methods and member variables are used by an instance of a class, that is, by an object.
* Instance of a class === object
* An instance member variable is declared inside a class, but not within a method.
* Instance methods usually use instance member variables to affect the behavior of the method.
* Static initialization code is a block of code preceded with the keyword static.
* Similar to other static code, a static initialization code block is only initialized once on the first use of the class.
* A class can have any number of either static or instance initialization code blocks.
* They can appear anywhere in the code body.
* The code blocks are executed in the order in which they appear in the file.

#### Using Initialization Code
* The instance initialization code in a class is executed each time an object is instantiated from that class. 
* These code blocks run before the constructor.

### Apex Properties
* An Apex property is similar to a variable
* Properties can be used to validate data before a change is made, 
    * to prompt an action when data is changed (such as altering the value of other member variables), or * to expose data that is retrieved from some other source (such as another class).
* getter accessor - The code in a get accessor executes when the property is read.
* setter accessor - The code in a set accessor executes when the property is assigned a new value.
* If a property has only a get accessor, it is considered read only.
* If a property has only a set accessor, it is considered write only. 
* A property with both accessors is considered read-write.

#### Property Declaration
```apex
Public class BasicClass {

   // Property declaration
   access_modifier return_type property_name {
      get {
         //Get accessor code block
      }
      set {
         //Set accessor code block
      }
   } 
}
``` 
Where:
* access_modifier is the access modifier for the property. The access modifiers that can be applied to properties include: `public`, `private`, `global`, and `protected`. In addition, these definition modifiers can be applied: `static` and `transient`
* return_type is the type of the property, such as `Integer`, `Double`, `sObject`, and so on.
* property_name is the name of the property
### Inheritance
* OOP suggests that you do not modify the existing code but extend it so that testing can be done only on the new code and there are fewer maintenance issues. === inheritance
* To use inheritance in Apex, we need to use the `virtual` or `abstract` keywords in the base class and methods.
* `virtual` keyword states that a class or method can be inherited and overridden by child classes. 
* `extends` keyword is used in a child class to inform a parent class.
* If we are writing the same method again in a child class of a parent class, then the `override` keyword needs to be used. 
* `override` keyword informs Apex that this is a new version of the same method in the parent class. 
* If we want to call any method in a parent class, we need to use the `super` keyword.
* a child class is able to reuse a parent class method with an added behavior. 
* The type of object is Mario, which is the parent class, but Apex is able to call a method of the Mario_Runclass using dynamic dispatch, which is a kind of Polymorphism.
* Assigning a child class reference to a parent class is known as subtype polymorphism.
#### Static and dynamic dispatch
* Types of polymorphism can be identified on the basis of when an implementation is selected. 
* when an implementation is selected at compile time, it is known as static dispatch. 
* When an implementation is selected while a program is running (in case of a virtual method), it is known as dynamic dispatch.
#### Interface
* `interface` is another way to achieve polymorphism and abstraction in Apex. 
* We cannot instantiate interfaces
* we can assign any child class to them
* Huge applications and APIs are created using interfaces. 
* `Queueable` and `Schedulable` are examples of interfaces.
*  Apex only needs to invoke the `execute()` method in your class because it knows that you follow the contract of an `interface`.
* Apex does not support multiple inheritance where one child class extends multiple parent classes at a time. However, using an `interface` a child class can implement multiple interfaces at a time.
### Abstract Classes
* In inheritance, a child class extends a parent class, where both the classes have full implementations. 
* In an interface, a parent class does not have any implementation and depends on child classes completely. 

```apex
public abstract class GameCoin { 
     
  public abstract Integer coinValue(); 
     
  public Integer absorbCoin(Integer existingPoint){ 
    return existingPoint + coinValue(); 
  }  
} 
```

* we cannot instantiate an abstract class
### Advantages of Design Patterns
* Coupling measures the dependency of software components on each other.
    * this is how two components interact with each other and pass information.
* robustness of the code:  the impact it has on a component if any related component is modified.
* low coupling indicates a good code structure.
* Cohesion measures the degree to which a code component has been well built and focused.
* Encapsulation - all the related data and functionalities should be encapsulated in the same program component (for example, a class). 
    * It ensures that all related functionalities are present in one place and controls their accessibility. 
    * Lower code cohesion indicates lower dependency of modules/classes, that is, higher maintainability, less complexity, and lesser impact on the part of change.
* high cohesion is better for you and indicates that a class is doing a well-defined job. 
* Low cohesion means that a class is doing many jobs with little in common between jobs.
* In Apex, a static variable lasts for the duration of an individual user request execution only (until the time the user request is being processed on a server). 
### The single responsibility principle (SRP)
The advantages of SRP are as follows:
* It makes code as easy as possible to reuse
* Small classes can be changed easily
* Small classes are more readable

## SOSL
Like SOQL, SOSL allows you to search your organization’s records for specific information. Unlike SOQL, which can only query one standard or custom object at a time, a single SOSL query can search all objects.

Another difference is that SOSL matches fields based on a word match while SOQL performs an exact match by default (when not using wildcards). For example, searching for 'Digital' in SOSL returns records whose field values are 'Digital' or 'The Digital Company', but SOQL returns only records with field values of 'Digital'.
* [SOQL and SOSL Reference Document](https://developer.salesforce.com/docs/atlas.en-us.216.0.soql_sosl.meta/soql_sosl/sforce_api_calls_soql_sosl_intro.htm)
* SOSL indexes data for searching
* Use SOQL to retrieve records for a single object.
* Use SOSL to search fields across multiple objects. SOSL queries can search most text fields on an object.
* The search query in the Query Editor and the API must be enclosed within curly brackets ({Wingo}). In contrast, in Apex the search query is enclosed within single quotes ('Wingo').
* Search terms can be grouped with logical operators (AND, OR) and parentheses. 
* search terms can include wildcard characters (*, ?). 
* The * wildcard matches zero or more characters at the middle or end of the search term. 
* The ? wildcard matches only one character at the middle or end of the search term.
* Text searches are case-insensitive.

## Triggers
* Before triggers are used to update or validate record values before they’re saved to the database.
* After triggers are used to access field values that are set by the system (such as a record's `Id` or `LastModifiedDate` field), and to affect changes in other records. The records that fire the after trigger are read-only.
### Using Context Variables
To access the records that caused the trigger to fire, use context variables.
* `Trigger.New` contains all the records that were inserted in insert or update triggers. 
* `Trigger.Old` provides the old version of sObjects before they were updated in update triggers, or a list of deleted sObjects in delete triggers.

### Trigger Context Variables
| Variable | Usage |
| --- | --- |
| `isExecuting` | Returns true if the current context for the Apex code is a trigger, not a Visualforce page, a Web service, or an `executeanonymous()` API call. |
| `isInsert` | Returns `true` if this trigger was fired due to an insert operation, from the Salesforce user interface, Apex, or the API. |
| `isUpdate` | Returns `true` if this trigger was fired due to an update operation, from the Salesforce user interface, Apex, or the API. |
| `isDelete` | Returns `true` if this trigger was fired due to a delete operation, from the Salesforce user interface, Apex, or the API. |
| `isBefore` | Returns `true` if this trigger was fired before any record was saved. |
| `isAfter` | Returns `true` if this trigger was fired after all records were saved. |
| `isUndelete` | Returns `true` if this trigger was fired after a record is recovered from the Recycle Bin (that is, after an undelete operation from the Salesforce user interface, Apex, or the API.) |
| `new` | Returns a list of the new versions of the sObject records.  This sObject list is only available in `insert`, `update`, and `undelete` triggers, and the records can only be modified in `before` triggers. |
| `newMap` | A map of IDs to the new versions of the sObject records.  This map is only available in `before update`, `after insert`, `after update`, and `after undelete` triggers. |
| `old` | Returns a list of the old versions of the sObject records.  This sObject list is only available in `update` and `delete` triggers.|
| `oldMap`| A map of IDs to the old versions of the sObject records.  This map is only available in `update` and `delete` triggers. |
| `size` | The total number of records in a trigger invocation, both old and new. |

* Triggers are often used to access and manage records related to the records in the trigger context—the records that caused this trigger to fire.
* To prevent saving records in a trigger, call the `addError()` method on the sObject in question.
* `addError()` method throws a fatal error inside a trigger. 

### Triggers and Callouts
* Apex calls to external Web services are referred to as callouts. 
*  When making a callout from a trigger, the callout must be done asynchronously so that the trigger process doesn’t block you from working while waiting for the external service's response.
* The asynchronous callout is made in a background process, and the response is received when the external service returns it.
* To make a callout from a trigger, call a class method that executes asynchronously.
* Such a method is called a future method and is annotated with `@future(callout=true)`.
* [Invoking Callouts Using Apex](https://developer.salesforce.com/docs/atlas.en-us.216.0.apexcode.meta/apexcode/apex_callouts.htm)

### Trigger Factory
* [Pros and Cons of using a Trigger Factory](https://salesforce.stackexchange.com/questions/101835/pros-and-cons-of-using-a-trigger-factory)

### Asynchronous Apex
| Type | Overview | Common Scenario |
| Future Methods | Run in their own thread, and do not start until resources are available. | Web service callout. |

### Apex Test Classes
The benefits of Apex unit tests:
* Having a suite of regression tests that can be rerun every time classes and triggers are updated to ensure that future updates you make to your app don’t break existing functionality
* Meeting the code coverage requirements for deploying Apex to production or distributing Apex to customers via packages
* High-quality apps delivered to the production org, which makes production users more productive
* High-quality apps delivered to package subscribers, which increase your customers trust

#### Apex Unit Tests
UNIT TESTING is a level of software testing where individual units/ components of a software are tested. The purpose is to validate that each unit of the software performs as designed. A unit is the smallest testable part of any software. It usually has one or a few inputs and usually a single output.
* Unit tests are class methods that verify whether a particular piece of code is working properly.
* Unit test methods take no arguments, commit no data to the database, send no emails, and are flagged with the `testMethod` keyword or the `@isTest` annotation in the <b>method definition</b>.

##### `@isTest` annotation
* Use the `@isTest` annotation to define classes and methods that only contain code used for testing your application. 
* The `@isTest` annotation on methods is equivalent to the `testMethod` keyword.
* `@isTest` annotation can take multiple modifiers within parentheses and separated by blanks.

* 75% of Apex code must be covered by tests, and all those tests must pass.
* code coverage is a requirement for deployment
*  test the common use cases in your app, 
* including positive and negative test cases,
* and bulk and single-record processing
* Test methods take no arguments
* The visibility of a test method doesn’t matter
* testing framework is always able to access test methods
* For this reason, the access modifiers are omitted in the syntax.
* Test methods must be defined in test classes, which are classes annotated with isTest
* Test classes can be either private or public.
* If you’re using a test class for unit testing only, declare it as private. 
* The verifications are done by calling the `System.assertEquals()` method, which takes two parameters: 
        * the first is the expected value, and 
        * the second is the actual value. 

* private access member variable
* private inner class
* private method
* private custom exception
* `@TestVisible` - private or protectd members can be accessed by test methods and only code running in test context.
* 

## Schema Namespace
A namespace is a declarative region that provides a scope to the identifiers (the names of types, functions, variables, etc) inside it. Namespaces are used to organize code into logical groups and to prevent name collisions that can occur especially when your code base includes multiple libraries.

## Static and Instance Methods, Variables, and Initialization Code
### Using Instance Methods and Variables
* Instance methods and member variables are used by an instance of a class, that is, by an object.
* An instance member variable is declared inside a class, but not within a method. 
* Instance methods usually use instance member variables to affect the behavior of the method.
* A class static variable can’t be accessed through an instance of that class. 
* If class MyClass has a static variable `myStaticVariable`, and `myClassInstance` is an instance of `MyClass`, `myClassInstance.myStaticVariable` is not a legal expression.
* The same is true for instance methods. If `myStaticMethod()` is a static method, `myClassInstance.myStaticMethod()` is not legal. 
* Instead, refer to those static identifiers using the class: `MyClass.myStaticVariable` and `MyClass.myStaticMethod()`.
* An inner class behaves like a static Java inner class, but doesn’t require the static keyword. 
### Using Initialization Code


### Constants 
Apex constants are variables whose values do not change after being initialized once.  Constants can be defined using the `final` keyword.  
The `final` keyword means that the variable can be assigned at most once, either in the declaration itself, or with a static initializer method if the constant is defined in a class. 
*  This example declares two constants. The first is initialized in the declaration statement. The second is assigned a value in a static block by calling a static method.
```apex
public class myClass {
    static final Integer PRIVATE_INT_CONST = 220;
    static final Integer PRIVATE_INT_CONST2;

    public static Integer calculate() {
        return 2 + 7;
    }

    static {
        PRIVATE_INT_CONST2 = calculate;
    }
}
```

### Classes 
* `virtual` - definition modifier declares that this class allows extension and overrides.  You cannot override a method with the `override` keyword unless the class has been defined as `virtual`
* `abstract` - definition modifier declares that this class contains abstract methods - methods that only have their signature declared and no body defined.
* a class can implement multiple interfaces but only extend one existing class.  Apex does not support multiple inheritance
* use `void` if method does not return a value
* Class variable and class methods
* Passed into methods by value: primitive data types
* Passed into methods by reference: non-primitive data types

###
* This example shows how a List argument is passed by reference into the `reference()` method and is modified
* It then shows, in the referenceNew() method, that the List argument can’t be changed to point to another List object.
* 1-- the createTemperatureHistory method creates a variable, fillMe, that is a List of Integers and passes it to a method.

```Apex 
public class PassNonPrimitiveTypeExample {

}
```
### Static and Instance Methods, Variables, and Initialization Code
Apex classes cannot be static.
* Static methods
    * associated with a class
    * allowed only in outer classes
    * Initialized only when a class is loaded
    * ARE NOT transmitted as part of the view state for a Visualforce page
* Static Variables
    * associated with a class
    * allowed only in outer classes
    * Initialized only when a class is loaded
    * ARE NOT transmitted as part of the view state for a Visualforce page
* Static Initialization code
    * associated with a class
    * allowed only in outer classes
    * Initialized only when a class is loaded
    * ARE NOT transmitted as part of the view state for a Visualforce page
* Instance methods
    * associated with a particular object
    * have no definition modifier
    * created with every object instantiated from the class in which they are created
* Instance Member Variables
    * associated with a particular object
    * have no definition modifier
    * created with every object instantiated from the class in which they are created
* Instance Initialization code
    * associated with a particular object
    * have no definition modifier
    * created with every object instantiated from the class in which they are created
* Local Variables
    * associated with a block of code in which they are declared
    * must be initialized before they are used
#### Using Static Methods and Variables
* You can use static methods and variables only with outer classes.
* Inner classes have no static methods or variables.
* A static method or variable doesnt require an instance of a class to run 
* Before an object of a class is created, all static member variables in a class are initialized, and all static initialization code blocks are executed.  
* These items are handled in the order in which they appear in the class
* A static method is used as a utlitiy method, and it never depends on the value of an instance member variable.
* Because a static method is only associated with a class, it cant access the instance member variable values of its class
* static variable is static only within the scope of the Apex transaction.  
* it is not static across the server or the entire organization
* the value of a static variable persists within the context of a single transaction and is reset across transaction boundaries
* `to information that is shared across instances of a class, use a static variable`
* all instances of the same class share a single copy of the static variable
* all triggers that a single transaction spawns can communicate with each other by viewing and updating static variables in a related class
* a recursive trigger can use the value of a class variable to determine when to exit the recursion
* define the static variables in a class so that the trigger can access these class member variables and check their static values
* a class static variable cant be accessed through an instance of that class.  
```apex
// MyClass has a static variable = myStaticVariable
// myClassInstance is an instance of MyClass
myClassInstance.myStaticVariable // not a legal expression
MyClass.myStaticVariable // legal
MyClassInstance.myStaticMethod() // not a legal expression
MyClass.myStaticMethod() // legal
```
* local variable names are evaluated before class names.
 
### Using Instance Methods and Variables
Instance methods and member variables are used by an instance of a class, object.
* an instance member variable is declared inside a class, but not within a method
* instance methods usually use instance member variables to affect the behavior of a method

```apex
public class Plotter {
    // This inner class manages the points
    class Point {
        Double x;
        Double y;

        Point(Double x, Double y) {
            this.x = x;
            this.y = y;
        }
        Double getXCoordinate() {
            return x;
        }
        Double getYCoordinate() {
            return y;
        }
    }

    List<Point> points = new List<Point>();

    public void plot(Double x, Double y) {
        points.add(new Point(x, y));
    }

    // The followting method takes the list of points and does somethin
    public void render() {

    }
}
```
* The instance initialization code in a class is executed each time an object is instantiated from that class. 
* These code blocks run before the constructor.
* static initialization block runs only once, regardless of how many times you access the class that contains it.
* Static initialization code is a block of code preceded with the keyword `static`.
* The code blocks are executed in the order in which they appear in the file
* You can use static initialization code to initialize static final variables and to declare information that is static, such as a map of values.

### Apex Properties
An Apex property is similar to a variable; however, you can do additional things in your code to a property value before it is accessed or returned. 
* Properties can be used to validate data before a change is made
* to prompt an action when data is changed 
* to expose data that is retrieved from some other source (such as another class).
* Property definitions include one or two code blocks, representing a get accessor and a set accessor:
* The code in a get accessor executes when the property is read.
* The code in a set accessor executes when the property is assigned a new value.
* If a property has only a get accessor, it is considered read only. 
* If a property has only a set accessor, it is considered write only. 
* A property with both accessors is considered read-write.
* To declare a property, use the following syntax in the body of a class:
```apex
Public class BasicClass {

    // Property declaration
    access_modifier return_type property_name {
        get {
            // Get accessor code block
        }
        set {
            // Set accessor code block
        }
    }
}
``` 
* access_modifier is the access modifier for the property. The access modifiers that can be applied to properties include: `public`, `private`, `global`, and `protected`. In addition, these definition modifiers can be applied: `static` and `transient`.
* `return_type` is the type of the property, such as `Integer`, `Double`, `sObject`, and so on.
```apex
public class BasicProperty {
    public Integer prop {
        get { return prop; }
        set { prop = value; }
    }
}
```
Call the `BasicProperty` class:
```apex
BasicProperty bp = new BasicProperty();
bp.prop = 5; // calls set accessor
System.assertEqual(5, bp.prop); // calls get accessor
```
* The body of the get accessor is similar to that of a method. 
* It must return a value of the property type. 
* Executing the get accessor is the same as reading the value of the variable.
* The get accessor must end in a return statement.
* We recommend that your get accessor not change the state of the object that it is defined on.
* The set accessor is similar to a method whose return type is void.
* When you assign a value to the property, the set accessor is invoked with an argument that provides the new value.
* When the set accessor is invoked, the system passes an implicit argument to the setter called value of the same data type as the property.
* Properties cannot be defined on `interface`.
* Properties provide storage for values directly. 
* You do not need to create supporting members for storing values.
* Properties do not require additional code in their get or set accessor code blocks.
* The following example creates three automatic properties:
```apex
public class AutomaticProperty {
    public integer MyReadOnlyProperty { get; }
    public double MyReadWriteProperty { get; set; }
    public string MyWriteOnlyProperty { set; }
}
// calling this class:
AutomaticProperty ap = new AutomaticProperty();
ap.MyReadOnlyProperty = 5; // this produces a compile error: not writable
ap.MyReadWriteProperty = 5; // No error
System.assertEquals(5, MyWriteOnlyProperty); // This produces a compile error: not readable
```

### Using Static Properties
When a property is declared as `static`, the property's accessor methods execute in a static context. 
* accessors do not have access to non-static member variables defined in the class. 
```apex
public class StaticProperty {
    private static integer StaticMember;
    private integer NonStaticMember;

    // The following produces a system error
    // public static integer MyBadStaticProp { return NonStaticMember; }

    public static integer MyGoodStaticProperty {
        get { return StaticMember; }
        set { StaticMember = value; }
    }

    public integer MyGoogNonStaticProperty {
        get { return NonStaticMember; }
        set { NonStaticMember = value; }
    }
}

// call the instance and static properties
StaticProperty sp = new StaticProperty();
// The following produces a system error: a static variable cannot be
// accessed through an object instance
// sp.MyGoodStaticProp = 5;
// The following does not produce an error
StaticProperty.MyGoodStaticProp = 5;
```
### Using Access Modifiers on Property Accessors
Property accessors can be defined with their own access modifiers. 
* If an accessor includes its own access modifier, this modifier overrides the access modifier of the property. 
* The access modifier of an individual accessor must be more restrictive than the access modifier on the property itself. 
```apex
global virtual class PropertyVisibility {
    // X is private for read and public for write
    public integer X { private get; set; }
    // Y can be globally read but only written within a class
    global integer Y { get; public set; }
    // Z can be read within the class but only subclasses can set it
    public integer Z { get; protected set; }
}
```
### Extending a Class
A class that extends another class inherits all the methods and properties of the extended class.
* the extending class can override the existing virtual methods by using the override keyword in the method definition. 
* Overriding a virtual method allows you to provide a different implementation for an existing method. 
* This means that the behavior of a particular method is different based on the object you’re calling it on. This is referred to as polymorphism.
* A class extends another class using the extends keyword in the class definition. 
* A class can only extend one other class, but it can implement more than one interface.
