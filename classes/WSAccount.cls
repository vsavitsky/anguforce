@RestResource(urlMapping='/account/*')
global class WSAccount {

    @HttpGet
    webservice static List<Account> goGet() {
        return [SELECT Id, Name FROM Account LIMIT 10];
    }
    
    @HttpPost
    global static String doPost(String name, String phone, String AccountNumber) {
        Account acc = new Account();
        acc.name = name;
        acc.phone = phone;
        acc.AccountNumber = AccountNumber;
        insert acc;
        return acc.Id;
    }
    
    @HttpDelete
    global static void doDelete(){
        // RestRequest req = RestContext.request;
        
    }
}