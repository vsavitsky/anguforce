public class MyCalculator {
    
    public static Integer staticInt = 0;
    
    protected Integer instanceInt = 0;
    
    public Integer plus (Integer a, Integer b) {    
        return a + b;
    }
    
    public Integer minus (Integer a, Integer b) {    
        return a - b;
    }
    
    public static Integer multiply (Integer a, Integer b) {    
        return a * b;
    }
    
    public Integer doDevide(Integer a, Integer b) {
        return devide(a, b);
    }
    
    private Integer devide (Integer a, Integer b) {    
        return a / b;
    }

}