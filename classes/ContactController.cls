public with sharing class ContactController {

    @AuraEnabled
    public static List<Contact> getContacts() {
        List<Contact> contacts =
        [SELECT Id, Name, Phone, Email FROM Contact];
        //Add isAccessible() check
        return contacts;
    }

    @AuraEnabled
    public static String searchContactByNameBack(String nameSegment) {
        String nameSegmentSoql = '%' + nameSegment + '%';
        List<Contact> contacts =
        [
                SELECT Id, Name, Phone, Email
                FROM Contact
                WHERE Name LIKE :nameSegmentSoql
        ];

        return JSON.serialize(contacts);
    }

    @AuraEnabled
    public static void updateContactBack(String contactJson) {

        Contact contact = (Contact)JSON.deserialize(contactJson, Contact.class);

        contact.Email = 'tesT' + contact.Email;

        update contact;
    }
}