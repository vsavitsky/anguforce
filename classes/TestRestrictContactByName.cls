@isTest
private class TestRestrictContactByName {
	@isTest static void TestInsertContactValidName() {
        Contact contact = new Contact(LastName='ValidName');
        
        System.Debug('-----startTest');
        Test.startTest();
        Database.UpsertResult result = Database.upsert(contact, true);
        Test.stopTest();
		System.Debug('-----stopTest');
        System.assert(result.isSuccess());
       	System.assert(result.getErrors().size() == 0);
        
    }

    @isTest static void TestInsertContactInValidName() {
        Contact contact = new Contact(LastName='INVALIDNAME');
        System.Debug('-----startTest');
        Test.startTest();
        Database.UpsertResult result = Database.upsert(contact, false);
        Test.stopTest();
		System.Debug('-----stopTest');
        System.assert(!result.isSuccess());
       	System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML',
                             result.getErrors()[0].getMessage());
    }
}