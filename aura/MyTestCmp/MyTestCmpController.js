({
	handleNewClick : function(component, event, helper) {
		helper.printInConsole(component, "New");
        
	},
    
    handleCancelClick : function(component, event, helper) {
        helper.printInConsole(component, "Cancel");
		
	},
 
 	handleCloseClick : function(component, event, helper) {
		helper.printInConsole(component, "Close");
        
	},
    
    init : function(component, event, helper) {
		 component.set('v.mycolumns', [
            { label: 'Contact Name', fieldName: 'Name', type: 'text'},
            { label: 'Phone', fieldName: 'Phone', type: 'phone'},
            { label: 'Email', fieldName: 'Email', type: 'email'}
        ]);
        helper.getData(component);
	},

	searchByName : function(component, event, helper) {

        var nameSegment = component.get("v.nameForSearch");
        if (!nameSegment) {
            nameSegment = '';
        }
        helper.searchContactByName(component, nameSegment);
    },

    updateContact : function(component, event, helper) {

        var contact = component.get("v.mydata")[0];

        console.log('contact: ' + JSON.stringify(contact));

        helper.updateContactHlp(component, JSON.stringify(contact));

    },

    runEvent : function(component, event) {
        console.log('before runEvent');

        var event = $A.get("e.c:TestEvent");
        event.setParams({"message" : "A component event fired me. "});
        event.fire();

        console.log('after runEvent');

    }

})