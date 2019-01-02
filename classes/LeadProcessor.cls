global class LeadProcessor implements 
Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT ID FROM Lead'
        );
    }
    
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        for(Lead lead : scope) {
            lead.LeadSource = 'Dreamforce';
        }
        
    }
    
    global void finish(Database.BatchableContext bc){
        
    }
    
}