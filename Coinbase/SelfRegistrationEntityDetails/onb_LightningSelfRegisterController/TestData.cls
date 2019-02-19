@isTest
public class TestData {
    public static List<Account> createAccounts(Integer count) {
        List<Account> accts = new List<Account>();
        for (Integer i = 0; i < count; i++) {
            accts.add(new Account(
                Name = 'Test Account ' + i
            ));
        }
        return accts;
    }

    public static List<Contact> createContacts(Account acct, Integer count) {
        List<Contact> cons = new List<Contact>();
        for (Integer i = 0; i < count; i++) {
            cons.add(new Contact(
                AccountId = acct.Id,
                FirstName = 'John',
                LastName = 'Tester' + i
            ));
        }
        return cons;
    }

    public static List<Product2> createProducts(Product2 product, Integer count) {
        List<Product2> product2 = new List<Product2>();
        for (Integer i = 0; i < count; i++) {
            product2.add(new Product2(
                Id = product.Id,
                Name = 'TestProduct' + i
            ));
        }
        return product2;
    }

    public static User standardUser {
        get {
            if (standardUser == null) {
                List<User> standardUser = 
                    [SELECT Id, Username FROM User WHERE Username = 'standarduser@coinbase.com'];
                if (standardUser.size() > 0) {
                    standardUser = standardUser[0];
                } else {
                    Id profileId = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1].Id;
                    standardUser = new User(
                        Alias = 'person',
                        Email = 'standarduser@coinbase.com',
                        EmailEncodingKey = 'UTF-8',
                        FirstName = 'Standard',
                        LastName = 'Test User',
                        LanguageLocaleKey = 'en_US',
                        LocaleSidKey = 'en_US',
                        ProfileId = profileId,
                        TimeZoneSidKey = 'America/Los_Angeles'
                    );
                    System.runAs(adminUser) {
                        insert standardUser;
                    }
                }
            }
            return standardUser;
        }
        set;
    }

    public static User adminUser {
        get {
            if (adminUser == null) {
                adminUser = [SELECT Id FROM User WHERE Profile.Name = 'System Administrator' LIMIT 1];
            }
            return adminUser;
        }
        set;
    }
}