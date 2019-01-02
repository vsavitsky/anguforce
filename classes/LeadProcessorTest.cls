@isTest
private class LeadProcessorTest {

    @testSetup 
    static void setup() {
        List<Lead> leads = new List<Lead>();
       	
        // insert 200 leads
        for (Integer i=0; i<200; i++) {
            leads.add(new Lead(LastName='testLead'+i, Company='testCompany'));
        }
        insert leads;
    }

    static testmethod void test() {        
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();

        System.assertEquals(200, [select count() from lead where LeadSource = 'Dreamforce']);
    }
    
}