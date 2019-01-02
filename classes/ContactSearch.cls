public class ContactSearch {

    public static List<Contact> searchForContacts(String lastname, String Postalcode) {
        List<Contact> result = [select ID,Name FROM contact WHERE LastName=:lastname AND MailingPostalCode=:Postalcode];
        return result;
    }
}