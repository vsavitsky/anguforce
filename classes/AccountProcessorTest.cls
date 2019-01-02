@IsTest
public class AccountProcessorTest {
    public static testmethod void TestAccountProcessorTest() 
    {
        Account account = new Account();
        account.Name = 'Test Account';
        Insert account;

        Contact contact = New Contact();
        contact.FirstName ='firstNameTest';
        contact.LastName ='lastNameTest';
        contact.AccountId = account.Id;
        Insert contact;
        
        set<Id> accountIds = new Set<ID>();
        accountIds.add(account.id);
 
        Test.startTest();
            AccountProcessor.countContacts(accountIds);
        Test.stopTest();
        
        Account resultAccount = [select Number_of_Contacts__c from Account where id = :account.id LIMIT 1];
        System.assertEquals ( Integer.valueOf(resultAccount.Number_of_Contacts__c) ,1);
  }
  
}