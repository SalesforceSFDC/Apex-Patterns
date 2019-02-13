/**
 * Created by joshuakrinsky on 2019-01-29.
 */
({
    init:function(component){
        var action = component.get("c.init");        
        action.setCallback(this, function(response){
            if (response.getState() == "SUCCESS") {
                var rtnValue = response.getReturnValue();
                console.log('applicationId = ' + rtnValue);
                //component.set('v.userId', response.getReturnValue());
            }
        });

        $A.enqueueAction(action);
    },
    getLoggedInUserId:function(component){
        var action = component.get("c.getCurrentUserId");
        action.setCallback(this, function(response){
            if (response.getState() == "SUCCESS") {
                component.set('v.userId', response.getReturnValue());
            }
        });

        $A.enqueueAction(action);
    },
    getCountries: function (component) {
        OnboardingUtils.fetchPickListVals(component, 'Business_Address_Country__c', 'country');
    },
    getProducts: function (component) {
        var options = [];
        var action = component.get("c.getProducts");
        action.setCallback(this, function(response){
            if (response.getState() == "SUCCESS") {
                var allValues = response.getReturnValue();
                for (var i = 0; i < allValues.length; i++) {
                    options.push({
                        class: "optionClass",
                        label: allValues[i].Name,
                        value: allValues[i].Id + '::' + allValues[i].Name
                    });
                }
                component.find('products').set("v.options", options);
            }
        });

        $A.enqueueAction(action);

    },
    completeRegistration:function(component, event){
        //street 1
        var street1 = component.find("street1").get("v.value");
        //street 2
        var street2 = component.find("street2").get("v.value");
        //city
        var city = component.find("city").get("v.value");
        //country
        var country = component.find("country").get("v.value");
        //state
        var state = component.find("state").get("v.value");
        //postal code
        var postalCode = component.find("postalCode").get("v.value");
        //products
        var products = component.find("products").get("v.value");
        var action = component.get("c.completeRegistration");
        action.setParams({
            street1: street1,
            street2: street2,
            city: city,
            state: state,
            country:country,
            postalCode:postalCode,
            products:products
        });

        action.setCallback(this, function(a){
            var rtnValue = a.getReturnValue();
            if (rtnValue !== null) {
                component.set("v.errorMessage",rtnValue);
                component.set("v.showError",true);
            }
        });

        $A.enqueueAction(action);
    }   
})