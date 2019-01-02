public with sharing class SObjectDescriber{

    private static SObjectDescriber instance = null;
    private static Map <String, Schema.SObjectType> globalDescribe = Schema.getGlobalDescribe();
    private Map <String, Schema.DescribeSobjectResult> usedObjects = new  Map <String, Schema.DescribeSobjectResult>();

    private  SObjectDescriber(String apiName) {
        if (globalDescribe.containsKey(apiName)) {
            usedObjects.put(apiName, globalDescribe.get(apiName).getDescribe());
        }
    }

    public Schema.DescribeSobjectResult usedObjects(String apiName) {
        if (globalDescribe.containsKey(apiName) && !usedObjects.containsKey(apiName)) {
            usedObjects.put(apiName, globalDescribe.get(apiName).getDescribe());
        }

        return usedObjects.get(apiName);
    }

    public static SObjectDescriber getInstance(String apiName) {
        if (instance == null) {
            instance = new SObjectDescriber(apiName);
        }

        return instance;
    }

}