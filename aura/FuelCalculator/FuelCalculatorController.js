({
	doInit : function(component, event, helper) {
        setTimeout(function(){
            helper.calculateRoute(component)
        });
	},
    calculateRoute : function(component, event, helper) {
		helper.calculateRoute(component);
	},
    setDefaults : function(component, event, helper) {
		
        component.set("v.townConsumption", 8);
        component.set("v.highwayConsumption", 6);
        component.set("v.fuelPrice", 1.19);
        component.set("v.townDistance", 1);
        component.set("v.highwayDistance", 1);
        
        component.set("v.litersRequired", 0);
        component.set("v.routePrice", 0);
	}
})