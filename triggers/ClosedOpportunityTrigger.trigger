trigger ClosedOpportunityTrigger on Opportunity (before insert) {
    List<Task> taskListToInsert = new List<Task>();
    for (Opportunity o : Trigger.New) {
        if (o.StageName == 'Closed Won') {
            Task task = new Task(Subject = 'Follow Up Test Task', WhatId = o.Id);
            taskListToInsert.add(task);
        }
    }
    if(taskListToInsert.size() > 0) {
        insert taskListToInsert ;
    }
}