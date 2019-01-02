public class EmailMissionSpecialist {
    public void sendMail(String email, String subject, String message) {
    	Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
		String[] toAddresses = new String[] {email};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
		mail.setPlainTextBody(message);
        //Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        
        
        
        
        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
   
}