@isTest
private class onb_RegisterEntityDetailsControllerTest {
    
    @TestSetup
    static void setupDate() {
    	Account acct = TestData.createAccounts(1)[0];
        insert acct; 
    }
    
    @isTest static void testonb_RegisterEntityDetailsController() {
        
    }
    
    @isTest static void testCurrentUserId() {
        Id userId = onb_RegisterEntityDetailsController.getCurrentUserId();
        System.assertNotEquals(null, userId);
        System.assertNotEquals('', userId);
        System.assert(userId != null);
    }
    
    @isTest
    static void testSelectedOptions() {
        //onb_RegisterEntityDetailsController controller = new onb_RegisterEntityDetailsController();
		List<String> selectOption = onb_RegisterEntityDetailsController.getSelectOptions();
        System.assertEquals(null, controller);
        System.assert(controller != null);
    }
    
    @isTest
    static void testProducts() {
        List<Product2> product2 = onb_RegisterEntityDetailsController.getProducts();
        System.assertNotEquals(null, product2);
        System.assert(product2 != null);
    }

    @isTest
    static void testInvalidProducts() {
        List<Product2> product2 = onb_RegisterEntityDetailsController.getProducts();
        System.assertEquals('Normal', product2);
    }

    @isTest static void testCompleteRegistration() {
        Id appId; 
        String street1;
        String street2;
        String city;
        String country;
        String state;
        String postalCode;
        String[] products;
        String completeReg = onb_RegisterEntityDetailsController.completeRegistration(appId, street1, street2, city, country, state, postalCode, products);
        User u = [SELECT UserName,Email FROM User LIMIT 1];
        System.assertNotEquals(null, appId);
        System.assert(appId != null);
    }
    
    @isTest
    static void testIncompleteRegistration() {
        String completeReg = onb_RegisterEntityDetailsController.completeRegistration('00300000003T2PGAA0', '', 'street2', 'city', 'country', 'California', '', 'products');

    }

    @isTest
    static void testViewPageAsAdmin() {
    }
}
// Positive Tests
    // 1. set up data
    // 2. execute the logic we are testing 
    // 3. query for updated record
    // 4. assert expected result
// Negative Tests

// Exception Tests (exceptions are thrown as expected)

// Bulk Tests (everything still works when we are dealing with lots of records)

/** 
Set up test for custom controller:
1. set the current page
PageReference pageRef = Page.EmployeeBonuses;
Test.setCurrentPage(pageRef);

2.  set up the controller
EmployeeBonusController ctrl = new EmployeeBonusController();

3.  call method(s) in the controller
ctrl.doInit();

4.  check the resulting data by referencing the property in the class
List employees = ctrl.employees;    

5. assert expectations 
System.assertEquals(2, ctrl.employees.size(), 'The list should have two employees');
System.assertEquals(0, ApexPages.getMessages().size(), 'There should be no error messages on the page');


Set up the Lightning Component Controller:
1.  set the current page
PageReference pageRef = Page.EmployeeBonuses;
Test.setCurrentPage(pageRef);

2. Call the @AuraEnabled method
List<User> employees = EmployeeBonusController.getEmployeeList();

// call method(s) in the controller
ctrl.doInit();

// check the resulting data by referencing the property in the class
List employees = ctrl.employees;    

// assert expectations 
System.assertEquals(2, ctrl.employees.size(), 'The list should have two employees');
System.assertEquals(0, ApexPages.getMessages().size(), 'There should be no error messages on the page');
*/