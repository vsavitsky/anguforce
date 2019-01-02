@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {              
        
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        
        String country = 'Belarus';
        String[] result = ParkLocator.country(country);
        
        System.assertEquals(new List<String>{'Kobrin`s Park', 'Mozir`s Park', 'Minsk`s Park'}, result); 
    }
}