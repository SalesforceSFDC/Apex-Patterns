* The `global` access modifier, which is more permissive than the `public` modifier and allows access across namespaces and applications.

## List
You can add elements to a list when creating the list, or after creating the list by calling the add() method. 
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
