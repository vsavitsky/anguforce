@isTest
private class TestVerifyDate {
    @isTest static void testCheckDates() {
        Date testDate = VerifyDate.CheckDates(Date.newInstance(2017, 2, 17), Date.newInstance(2017, 2, 20));
        System.assertEquals(Date.newInstance(2017, 2, 20), testDate);
    }
    
    @isTest static void testCheckDatesBig() {
        Date testDate = VerifyDate.CheckDates(Date.newInstance(2017, 2, 17), Date.newInstance(2017, 7, 20));
        System.assertEquals(Date.newInstance(2017, 2, 28), testDate);
    }
    /*
    @isTest static void testDateWithin30DaysTrue() {
        Boolean testBool = VerifyDate.DateWithin30Days(Date.newInstance(2017, 2, 17), Date.newInstance(2017, 2, 20));
        System.assertEquals(true, testBool);
    }
    
     @isTest static void testDateWithin30DaysFalse() {
        Boolean testBool = VerifyDate.DateWithin30Days(Date.newInstance(2017, 2, 17), Date.newInstance(2017, 7, 20));
        System.assertEquals(false, testBool);
    }
    
    @isTest static void testSetEndOfMonthDate() {
        Date testDate = VerifyDate.SetEndOfMonthDate(Date.newInstance(2017, 2, 17));
        System.assertEquals(Date.newInstance(2017, 2, 28), testDate);
    }
    */
}