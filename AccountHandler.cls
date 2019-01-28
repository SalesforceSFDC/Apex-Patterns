public class AccountHandler {
    //Public method
    public static Account insertNewAccount(String name) {
        Account acct = new Account();
        acct.Name = name;
        try {
            insert acct;
        } catch(dmlException e) {
            return null;
        }
        return acct;
    }
}