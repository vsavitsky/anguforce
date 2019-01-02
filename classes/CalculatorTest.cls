@isTest
public class CalculatorTest {

    @isTest
    public static void additionTest () {
        
        System.assertEquals(Calculator.addition(2, 3), 5);
        System.assertEquals(Calculator.addition(-2, 3), 1);
    }
    
    @isTest
    public static void substractionTest () {
        
        System.assertEquals(Calculator.substraction(2, 3), -1);
        System.assertEquals(Calculator.substraction(-2, 3), -5);
    }
}