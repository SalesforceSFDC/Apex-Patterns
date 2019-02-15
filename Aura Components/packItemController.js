({
    packItem : function(component, event, handler) {
        var btnClicked = event.getSource(); // reference to the button
        var btnMessage = btnClicked.get("v.label"); //look inside the button and get its label, which is set on the <lightning:button> in the component markup
        component.set("v.message", btnMessage); // update our message
    }
})

// packItem - action handler name
// function() - anonymous function declaration
// (component, event, hanlder) - function signature with 3 parameters
// component—the component
// event—the event that caused the action handler to be called
// helper—the component’s helper, resource of reusable functions
// Inside the event is the notion of the source - the thing that generated the event which is button itself.
// calling `event.getSource()` gets us a reference to the specific <lighning:button>

// Adding {!c.handleClick} to the onclick attribute of a <lightning:button> component 
// (1) wires it up to the specific action handler. Calling component.set("v.message", newMessage) 
// (2) wires up the result of that action handler to the component’s message attribute.
// Which is itself wired up to the {!v.message} expression.

{
    packItem: function(component, event, handler) {
        //set the Packed__c property of the item (instance of Camping_Item__c) attribute
        component.set("v.item.Packed__c", true);
        //event.getSource refers the source tag from the event has invoked. 
        //set the disabled attribute to true
        event.getSource().set("v.disabled", true);
    }
}

// aura:id -  It sets a (locally) unique ID on each tag it’s added to, and that ID is how you’ll read values out of the form fields. The fields all share the same ID in this example so that we can access them as an array for field validation.

createExpense: function(component, expense) {
    var action = component.get("c.saveExpense");
    action.setParams({
        "expense": expense
    });
    action.setCallback(this, function(response) {
        var state = response.getState();
        if (state === "SUCCESS") {
            var expenses = component.get("v.expenses");
            expenses.push(response.getReturnValue());
            component.set("v.expenses", expenses);
        }
    });
    $A.enqueueAction(action);
}

// 1. create an action (Apex controller method)= var action = component.get("c.saveExpense");
// 2. Next we attach a data payload to the action. We need to send the data for the new expense up to the server. 
// use action.setParams() and provide a JSON-style object with parameter name-parameter value pairs. 
