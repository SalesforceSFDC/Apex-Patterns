@isTest
public class DiagnosticsMainTest {
    @isTest
    static void TestFakeException() {
        DiagnosticsMain.FakeException = true;
        List<Opportunity> ops =     
            CreateOpportunities('optest', 
            NumberOfStageUpdateOpportunities);
        
        for(Opportunity op : ops) {
            op.CloseDate = Date.Today().addDays(5);
            op.StageName = 'Prospecting';
        }

        List<DebugInfo__c> dbg = [Select ID FROM DebugInfo__c];
        System.Assert(dbg.size()>0);

        Test.StartTest();
        insert ops;
        Test.StopTest();
    }
}