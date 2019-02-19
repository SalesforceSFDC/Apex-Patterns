@isTest
private class SampleTest {
    @TestSetup
    static void setup() {
        // insert sample data that you want for all test methods here

    }

    // use the comments to describe the scenario that you are testing
    @isTest
    static void testSomething(){
        // set up test data for this scenario

        // execute the logic you are testing

        // query for the updated record(s)

        // assert expected result
        
    }
}