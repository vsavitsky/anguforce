@isTest
public class AddPrimaryContactTest 
{
     @isTest static void TestList()
     {
         List<Account> Teste = new List <Account>();
         for (Integer i = 0; i < 50; i++)
         {
             Teste.add(new Account(BillingState = 'CA', name = 'Test' + i));
         }
         for (Integer j = 0; j < 50; j++)
         {
             Teste.add(new Account(BillingState = 'NY', name = 'Test' + j));
         }
         insert Teste;

         Contact contact = new Contact();
         contact.FirstName = 'test';
         contact.LastName = 'test';
         insert contact;
         String state = 'CA';
      
          AddPrimaryContact apc = new AddPrimaryContact(contact, state);
          Test.startTest();
            System.enqueueJob(apc);
          Test.stopTest();
      }
 }