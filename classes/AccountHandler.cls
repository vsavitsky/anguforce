public class AccountHandler {

    public static Account insertNewAccount(String str) {
        if (str.length() < 1) {
            return null;
        }
        Account acct = new Account(Name = str);
		insert acct;
		return acct;
        
    }
}