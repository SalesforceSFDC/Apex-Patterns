@isTest
private class LightningSelfRegisterControllerTest {
    
    @TestSetup
    static void setupData() {
        User testUser = TestData.createAccounts(1)[0];
        insert acct;


    }

    @isTest
    static void getTotal() {
        Account acct = new Account(Name='TestAccount');
        insert acct;
        Contact con = new Contact(LastName = 'Tester2');
        insert con;
        con.AccountId = acct.Id;
        System.runAs( new User(Id = UserInfo.getUserId()) ) {
            UserRole rol = [SELECT Id FROM UserRole WHERE Name = 'CEO'];
            UserLicense lic = [SELECT Id FROM UserLicense WHERE Name = 'Customer Community'];
            Profile prof = [SELECT Id FROM Profile WHERE UserLicenseId = : license.Id LIMIT 1];
            User comUser = new User(
                Alias = 'person',
                Email = 'standarduser@coinbase.com',
                EmailEncodingKey = 'UTF-8',
                FirstName = 'Standard',
                LastName = 'Test User',
                LanguageLocaleKey = 'en_US',
                LocaleSidKey = 'en_US',
                ProfileId = prof.Id,
                Country = 'United States',
                IsActive = true,
                ContactId = c.Id,
                TimeZoneSidKey = 'America/Los_Angeles',
                UserName = 'testUser@coinbase.com'
            );
        insert comUser;
        }
        User cUser = [SELECT Id FROM User WHERE userName = 'testUser@coinbase.com' LIMIT 1];
        System.runAs(cUser) {
            //PageReference pageRef = Page.CommunityHome;
            onb_LightningSelfRegisterController controller = new onb_LightningSelfRegisterController();
            LightningSelfRegisterControllerTest myTC = new LightningSelfRegisterControllerTest();
            controller = myTC.selfRegister();
        }
    }

    @isTest
    static void testViewPageAsAdmin() {

    }
}