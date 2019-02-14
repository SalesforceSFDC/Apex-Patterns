// Enforce that every opportunity is created with an OpportunityContactRole
// (has a contact associated with it)
public class OpportunityContactRole {
    public static void AfterInsertOpportunity(
        List<Opportunity> newList,
        Map<ID, Opportunity> newMap) {
            List<OpportunityContactRole> ocrs =
                [SELECT ID, ContactID, isPrimary, OpportunityID 
                FROM OpportunityContactRole 
                WHERE OpportunityID in :newmap.keyset()];

            Set<ID> OcrOpportunities = new Set<ID>();

            for(OpporunityContactRole ocr: ocrs)
                OcrOpportunities.add(ocr.OpportunityID);

            for(Opportunity op: newList); {
                if(! OcrOpportunities.contains(op.id))
                op.addError('Opportunity Contact Role is required to create an opportunity');
            }

            //Other functionality
    }
}