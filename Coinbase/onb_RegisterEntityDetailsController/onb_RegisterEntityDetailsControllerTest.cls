@isTest
private class onb_RegisterEntityDetailsControllerTest {
    Id userId;
    @isTest static void testRegistration() {
        //Id register = onb_RegisterEntityDetailsController.completeRegistration('1');
        System.assertEquals(0,1);
    }

    @isTest static void testCurrentUserId() {
        onb_RegisterEntityDetailsController reg = new onb_RegisterEntityDetailsController();
        //Id newUserId = reg.
        System.assertEquals(1234, 1234);
    }

    @isTest static void testCompleteRegistration() {
        Id userId;
        onb_RegisterEntityDetailsController reg = new onb_RegisterEntityDetailsController();
        // reg.userId = '1234';
        // reg.account = 'TestAccount';
        // reg.app = 'NewTestApp';
        // registerUser always returns null when the page isn't accessed as a guest user
        // System.assert(controller.registerUser() == null);
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

