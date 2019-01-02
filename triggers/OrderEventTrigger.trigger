trigger OrderEventTrigger on Order_Event__e (after insert) {
       
    // List to hold all tasks to be created.
    List<Task> tasks = new List<Task>();
    
    // Get queue Id for case owner
    User usr = [SELECT Id, Name FROM User WHERE Id = :UserInfo.getUserId() LIMIT 1];
       
    // Iterate through each notification.
    for (Order_Event__e event : Trigger.New) {
        if (event.Has_Shipped__c == true) {
            Task tk = new Task(Priority='Medium', status='New',subject='Follow up on shipped order ' + event.Order_Number__c, ownerId=usr.Id);
            tasks.add(tk);
        }
   }
    
    // Insert all cases corresponding to events received.
    insert tasks;
    
}