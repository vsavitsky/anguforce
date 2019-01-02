@isTest 
public class AnimalLocatorTest {

    @isTest static void AnimalLocatorTest() {
        
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        
        string result=AnimalLocator.getAnimalNameById(1);

        string expectedResult='testAnimalName';

        System.assertEquals(result, expectedResult);
  
    }
}