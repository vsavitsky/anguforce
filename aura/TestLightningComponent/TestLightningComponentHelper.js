({
	calculateSum : function(component) {
		var firstValue = component.get("v.firstValue");
        var secondValue = component.get("v.secondValue");
        var thirdValue = component.get("v.thirdValue");
        var result = firstValue + secondValue + thirdValue;
        /*
        var event = $A.get("e.c:ResultChange");
        event.setParams({"firstValue": firstValue,
                         "secondValue": secondValue,
                         "thirdValue": thirdValue,
                         "result": result});*/
        component.set("v.result", result);
        component.set("v.log", "Helper was invoked.");
	}
})