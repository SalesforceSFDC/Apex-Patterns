public class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads (String name) {
        List<List<SObject>> searchList = [FIND 'Vuk OR Smith' IN ALL FIELDS
                                RETURNING Contact(LastName), Lead(LastName)];
        
        return searchList;
    }
}