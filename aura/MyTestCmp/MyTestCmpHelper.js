({
	printInConsole : function(component, myStr) {
		var myVar = component.get("v.MyStringVariable");
        
        component.set("v.MyStringVariable", myStr);
	},
    
    getData : function(component) {
        var action = component.get('c.getContacts');
                
        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set('v.mydata', response.getReturnValue());
            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        }));
        $A.enqueueAction(action);
    },

    searchContactByName : function(component, nameSegmentParam) {
        var action = component.get('c.searchContactByNameBack');

        action.setParams({ nameSegment : nameSegmentParam });

        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set('v.mydata', JSON.parse(response.getReturnValue()));
            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        }));
        $A.enqueueAction(action);
    },

    updateContactHlp : function(component, contactJsonParam) {
        var action = component.get('c.updateContactBack');

        action.setParams({ contactJson : contactJsonParam });

        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                alert('SUCCESS !!!');
            } else if (state === "ERROR") {
                var errors = response.getError();
                console.log(errors);
            }
        }));
        $A.enqueueAction(action);
    }

})