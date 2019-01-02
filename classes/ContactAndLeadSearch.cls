public class ContactAndLeadSearch {

    public static List<List<sObject>> searchContactsAndLeads(String str) {
    	List<List<sObject>> searchList = [FIND :str IN NAME FIELDS RETURNING
                                                  Contact(LastName),
                                                  Lead(LastName)];   
         return searchList;
    }
}