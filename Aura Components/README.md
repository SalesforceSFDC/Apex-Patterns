
## Components
* Lightning components are supposed to be self-contained. 
* They are stand-alone elements that encapsulate all of their essential functionality. 
* A component is not allowed to reach into another component, even a child component, and alter its internals.
* There are two principal ways to interact with or affect another component:
    * setting attributes on the component’s tag - A component’s public attributes constitute one part of its API.
    * The second way to interact with a component is through events.  public events constitute a part of the component’s public API. 
* `type="toggle"` is really a checkbox with a toggle switch design.
* `class` enables you to apply custom CSS styling or use SLDS utilities.
* `messageToggleActive` and `messageToggleInactive` provides a custom label for the checked and unchecked positions
* `onchange` attribute of <lightning:input> gives us an easy way to wire the toggle switch to an action handler that updates the record when you slide right (checked) or slide left (unchecked)
* callback to handle the response
* Components do not reach into other components and set values on them. 

#### clickReimbursed Handler
```javascript
({
    clickReimbursed: function(component, event, helper) {
        var expense = component.get("v.expense");
        var updateEvent = component.getEvent("updateExpense");
        updateEvent.setParams("expense": expense);
        updateEvent.fire();
    }
})
```
* `updateExpense` is a custom event, that is, an event we write ourselves
    * You can tell because, unlike getting a server action, we use component.getEvent() instead of component.get(). Also, what we are getting doesn’t have a value provider, just a name. 



## Resources
### JavaScript
* [JavaScript The Right Way](http://jstherightway.org/)

### SLDS
* [SLDS](https://www.lightningdesignsystem.com/)
### Lightning Components
* [Add Lightning Components as Custom Tabs in the Salesforce App](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/aura_add_cmp_salesforce1.htm)
* [Add Lightning Components as Custom Tabs in a Lightning Experience App](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/aura_add_cmp_lex.htm)
* [Configure Components for Lightning Pages and the Lightning App Builder](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/components_config_for_app_builder.htm)
* [Configure Components for Communities](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/components_config_for_builder.htm)
* [Use Lightning Components in Visualforce Pages](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/components_visualforce.htm)
* [Add Aura Components to Any App with Lightning Out (Beta)](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/lightning_out.htm)
* [Use Aura Components with Flows](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/components_using_flow.htm)
### Debugging
* [Chrome DevTools](https://developers.google.com/web/tools/chrome-devtools/?utm_source=dcc&utm_medium=redirect&utm_campaign=2018Q2)
* [Salesforce Lightning Inspector Chrome Extension](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/inspector_intro.htm)
* [Lightning Components Debugging](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/debug_intro.htm)
### Data Types
* [Supported aura:attribute Types](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/ref_aura_attribute.htm)
* [Component Body](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/components_body.htm)
* [Component Facets](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/components_facets.htm)
### Helpers
* [Sharing JavaScript Code in a Component Bundle](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/js_helper.htm)
* [Using JavaScript](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/js_intro.htm)
### Server Request Lifecycle and Handling
* [Creating Server-Side Logic with Controllers](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/controllers_server_intro.htm)
* [Calling a Server-Side Action](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/controllers_server_actions_call.htm)
* [Queueing of Server-Side Actions](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/controllers_server_actions_queue.htm)
### Security
* [Security for Lightning Components](https://trailhead.salesforce.com/en/content/learn/modules/security-for-lightning-components)
* [CRUD and Field-Level Security (FLS)](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/apex_crud_fls.htm)
* [Data Leak Prevention](https://trailhead.salesforce.com/en/content/learn/modules/data-leak-prevention)
### Application Events
* [Application Events](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/events_application.htm)
* [Communicating with Events](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/events_intro.htm)
* [Events Best Practices](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/events_best_practices.htm)
* [Events Anti-Patterns](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/events_anti_patterns.htm)
### Bundle Resource Types
* [Component Bundles](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/components_bundle.htm)
* [Providing Component Documentation](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/components_documentation.htm)
* [Client-Side Rendering to the DOM](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/js_renderers.htm)
### Navigation
* [Navigate Across Your Apps with Page References](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/components_navigation.htm)
* [force:navigateToURL](https://developer.salesforce.com/docs/component-library/bundle/force:navigateToURL/documentation)
### Dynamically Creating Components
* [Dynamically Creating Components](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/js_cb_dynamic_cmp_async.htm)
### Error Handling
* [Throwing and Handling Errors](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/js_throw_error.htm)
* [Validating Fields](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/js_validate_fields.htm)
* [Returning Errors from an Apex Server-Side Controller](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/controllers_server_apex_custom_errors.htm)
### `force:` Namespace Components and Events

### System Events
* [System Events](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/events_system.htm)
* [Event Handling Lifecycle](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/events_overview.htm)
* [Events Fired During the Rendering Lifecycle](https://developer.salesforce.com/docs/atlas.en-us.218.0.lightning.meta/lightning/components_lifecycle.htm)
