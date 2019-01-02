({
    calculateRoute : function(component) {
        
        var townConsumption = component.get("v.townConsumption");
        var highwayConsumption = component.get("v.highwayConsumption");
        var fuelPrice = component.get("v.fuelPrice");
        
        var townDistance = component.get("v.townDistance");
        var highwayDistance = component.get("v.highwayDistance");
        
        var litersRequired = (townConsumption / 100) * townDistance + (highwayConsumption / 100) * highwayDistance;
        var routePrice = litersRequired * fuelPrice;
        
        component.set("v.litersRequired", litersRequired.toFixed(3));
        component.set("v.routePrice", routePrice.toFixed(2));
        
        var event = $A.get("e.c:FuelCalculatorRecalculating");
        event.setParams({"townConsumption": townConsumption,
                            "highwayConsumption": highwayConsumption,
                            "fuelPrice": fuelPrice,
                            "townDistance": townDistance,
                            "highwayDistance": highwayDistance,
                            "litersRequired": litersRequired,
                            "routePrice": routePrice
                            });
        event.fire();
        
    }
})