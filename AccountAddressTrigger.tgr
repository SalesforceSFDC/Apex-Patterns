trigger AccountAddressTrigger on Account (before insert,before update) {

    //Iterate all accounts that is updated or inserted.
    for(Account acc :Trigger.New){
        //if match is true set values.
        if(acc.Match_Billing_Address__c){
            acc.ShippingPostalCode = acc.BillingPostalCode;
        }
    }
}