public class MyFirstApexClass {
	private String value;
    
    public MyFirstApexClass (String constructorValue) {
        value = constructorValue;
    }
    
    public String getValue () {
        if (value == null) {
            return '';
        } else {
        	return value;
        }
    }
    
    public void setValue (String setterValue) {
        if (setterValue != null) {
        	value = setterValue;
        }
    }
    
    public String getValueWithPrefix () {
    	return 'prefix_' + getValue();
    }
    
    public String getValueWithPostfix () {
    	return getValue() + '_postfix';
    }
}