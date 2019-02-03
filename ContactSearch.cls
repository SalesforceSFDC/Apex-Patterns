public class ContactSearch {
    
    //this is a method declaration
    // Static means that this method is a class method (static method) and not instance method
    // For instance method you omit static keyword, but you would need an instance of that class to call the method
    // List<Contact> is return type of the method
    // It means that this method will return a 'List' of 'Contact' objects
    // searchForContacts is method name, use it to call this method
    // String lastname and String mailingPostalCode are parameters that are expected by this method
    public static List<Contact> searchForContacts(String lastName, String mailingPostalCode){

        List<Contact> retList = [SELECT Name, LastName, MailingPostalCode 
                                    FROM Contact
                                    WHERE LastName = :lastName AND MailingPostalCode = :mailingPostalCode];
        // the above line assigns the results of the query to variable retList
        // List<Contact> retList makes a variable with name retList of type List<Contact>
        // WHERE LastName = :lastName AND MailingPostalCode = :mailingPostalCode -->
        // this adds a filter to the query, so that it would only return results which match LastName 
        // and MailingPostalCode with given parameters
        // : --> tells your code that it is not the value to be searched for, but a variable from code 

        return retList;
    }
}

