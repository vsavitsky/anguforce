public class RandomContactFactory {

    public static List<Contact> generateRandomContacts (Integer numb, String str) {
        List<Contact>contacts = new List<Contact>();
        for (Integer i = 0; i < numb; i++) {
            contacts.add(new Contact(firstName = 'Test ' + i + 1));
        }
        
        return contacts;
    }
    
}