public class ContactSearch {
    public static List<Contact> searchForContacts (String lastName, String mailingPostalCode) {
        return [SELECT Name, LastName, MailingPostalCode 
                    FROM Contact
                    WHERE LastName = :lastName AND MailingPostalCode = :mailingPostalCode];
    }
}