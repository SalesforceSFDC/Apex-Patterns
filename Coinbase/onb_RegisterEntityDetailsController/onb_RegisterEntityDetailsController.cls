/**
 * Created by joshuakrinsky on 2019-01-29.
 */

//fixme: make this work with sharing turned on
global with sharing class onb_RegisterEntityDetailsController extends onb_BaseLightningController {

    public onb_RegisterEntityDetailsController(){

    }

    @AuraEnabled
    public static Id getCurrentUserId() {
        return UserInfo.getUserId();
    }

    @AuraEnabled
    public static List < String > getSelectOptions(sObject objObject, string fld) {
        return onb_BaseLightningController.getSelectOptions(objObject, fld);
    }

    @AuraEnabled
    public static List<Product2> getProducts(){
        List<Product2> products = [Select Id, Name from Product2];
        return products;
    }

    @AuraEnabled
    public static String completeRegistration(Id appId, String street1, String street2, String  city, String country, String state, String postalCode, String[] products) {

        System.debug('completeRegistration');

        Savepoint sp = null;

        try{

            sp = Database.setSavepoint();

            Id userId = UserInfo.getUserId();
            User user = [select Id, Contact.AccountId from User where Id = :UserInfo.getUserId()];
            onb_Onboarding_Application__c app = [Select Id, (Select Id from Onboarding_Application_Products__r) from onb_Onboarding_Application__c where Onboarding_Account__c = :user.Contact.AccountId limit 1];

            app.Business_Address_Line_1__c = street1;
            app.Business_Address_Line_2__c = street2;
            app.Business_Address_Country__c = country;
            app.Business_Address_State__c = state;
            app.Business_Address_Postal_Code__c = postalCode;

            //fixme: for dev purposes only
            delete app.Onboarding_Application_Products__r;

            update app;


            List<onb_Onboarding_Application_Product__c> obProducts = new List<onb_Onboarding_Application_Product__c>();

            String[] pTokens;
            Id pId;
            String pName;
            for(String product : products){
                System.debug('product = ' + product);
                product = EncodingUtil.urlDecode(product, 'ASCII');
                System.debug('product after decode = ' + product);
                pTokens = product.split('::');
                pId = pTokens[0];
                pName = pTokens[1];

                System.debug('pId = ' + pId);
                System.debug('pName = ' + pName);

                onb_Onboarding_Application_Product__c obProduct = new onb_Onboarding_Application_Product__c(
                        Onboarding_Application__c = app.Id,
                        Product__c = pId,
                        Name = pName
                );

                obProducts.add(obProduct);
            }

            Database.insert(obProducts);

            //todo: send account activation/password reset email to user now that they have complete reg
            //System.resetPasswordWithEmailTemplate(userId, true, emailTemplateName);
            Site.forgotPassword(UserInfo.getUserName(), 'Onboarding_Community_Welcome_Email');

            PageReference regCompleteRef = new PageReference('./login/CheckPasswordResetEmail');

            aura.redirect(regCompleteRef);

        } catch (Exception ex) {

            Database.rollback(sp);
            System.debug(ex);
            return ex.getMessage();
        }


        return null;
    }
}