@isTest
public class CommunityHomeControllerTest {
    static testMethod void getTotalReports(){         
        Account a = new Account(Name='Test Account Name');
        insert a;           
        Contact c = new Contact(LastName = 'Contact Last Name');
        c.AccountId = a.Id;
        insert c;  
        System.runAs ( new User(Id = UserInfo.getUserId()) ) {
            UserRole r = [select id from UserRole where name = 'CEO'];
            UserLicense licence = [SELECT Id FROM UserLicense where name ='Partner Community'];
            
            Profile p = [SELECT Id FROM Profile WHERE UserLicenseId = : licence.Id Limit 1]; 
            User comUser = new User(alias = 'test123', email='test123@noemail.com',
                                    emailencodingkey='UTF-8', lastname='Testing', languagelocalekey='en_US',
                                    localesidkey='en_US', profileid = p.Id, country='United States',IsActive =true,
                                    contactId=c.Id,
                                    timezonesidkey='America/Los_Angeles', username='newone@noemail.com');
            insert comuser;
        }
        User cuser = [select id from user where username ='newone@noemail.com' limit 1];
        System.RunAs(cuser) {
            PageReference pageRef = Page.CommunityHome;
            Test.setCurrentPage(pageRef);
            CommunityHomeController controller = new CommunityHomeController();
            controller.getParentAccounts();
        }         
    }
}