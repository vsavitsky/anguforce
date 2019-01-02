({
	refreshInfo : function(component, event, helper) {
        var townConsumption = event.getParam("townConsumption");
        var highwayConsumption = event.getParam("highwayConsumption");
        var fuelPrice = event.getParam("fuelPrice");
        
        var townDistance = event.getParam("townDistance");
        var highwayDistance = event.getParam("highwayDistance");
        
        var litersRequired = event.getParam("litersRequired");
        var routePrice = event.getParam("routePrice");
        
        var townLitersRequired = (townConsumption / 100) * townDistance;
        var highwayLitersRequired = (highwayConsumption / 100) * highwayDistance;
        var townPrice = townLitersRequired * fuelPrice;
        var highwayPrice = highwayLitersRequired * fuelPrice;
                        
        var distancePersentage;
        var fuelPersentage;
        var pricePersentage;
    
        distancePersentage = (townDistance / (townDistance + highwayDistance)) * 100;
        fuelPersentage = (townLitersRequired / (townLitersRequired + highwayLitersRequired)) * 100;
        pricePersentage = (townPrice / (townPrice + highwayPrice)) * 100;
        
        component.set("v.townConsumption", townConsumption);
        component.set("v.highwayConsumption", highwayConsumption);
        component.set("v.fuelPrice", fuelPrice);
        component.set("v.townDistance", townDistance);
        component.set("v.highwayDistance", highwayDistance);
        
        component.set("v.litersRequired", litersRequired.toFixed(3));
        component.set("v.routePrice", routePrice.toFixed(2));
        
        component.set("v.townLitersRequired", townLitersRequired.toFixed(3));
        component.set("v.highwayLitersRequired", highwayLitersRequired.toFixed(3));
        component.set("v.townPrice", townPrice.toFixed(2));
        component.set("v.highwayPrice", highwayPrice.toFixed(2));
             
        component.set("v.distancePersentage", distancePersentage);
        component.set("v.fuelPersentage", fuelPersentage);
        component.set("v.pricePersentage", pricePersentage);
         
	}
})