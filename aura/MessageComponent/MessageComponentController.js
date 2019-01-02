({
    handleComponentEvent : function(component, event) {
         console.log('handleComponentEvent before invoked');
        var message = event.getParam("message");

        // set the handler attributes based on event data
        component.set("v.messageFromEvent", message);
        var numEventsHandled = parseInt(component.get("v.numEvents")) + 1;
        component.set("v.numEvents", numEventsHandled);

        console.log('handleComponentEvent invoked');
    }

})