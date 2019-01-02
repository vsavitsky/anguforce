({
    calculateResult : function(component, event, helper) {
        //helpercalculateSum(component);
        var testResult = component.get("v.firstValue");
        component.set("v.result", 101);
        component.set("v.log", "calculateResult");
    },
    doInit : function(component, event, helper) {
        helper.calculateSum(component);
        component.set("v.log", "doInit");
    }
})