public class AddPrimaryContact implements Queueable
{
    private Contact contact;
    private String state;
    public  AddPrimaryContact(Contact contact, String state)
    {
        this.contact = contact;
        this.state = state;
    }
    
    public void execute(QueueableContext context) 
    {
         List<Account> ListAccount = [SELECT ID, Name, (Select id, FirstName, LastName from contacts) FROM ACCOUNT WHERE BillingState = :state LIMIT 200];
         List<Contact> lstContact = new List<Contact>();
         for (Account account:ListAccount)
         {
                 Contact contactClone = contact.clone(false, false, false, false);
                 contactClone.AccountId =  account.id;
                 lstContact.add(contactClone);
         }
         
         if(lstContact.size() > 0)
         {
             insert lstContact;
         }
    }

}