@RestResource(urlMapping='/RestTest/*')
global with sharing class MyRestClass {

    @HttpGet
    global static String getTestTextById() {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String textId = request.requestURI.substring(
          request.requestURI.lastIndexOf('/')+1);
        String result = 'Returning Test Text ' + textId;
        return result;
    }

    @HttpPost
    global static String createCase(String name) {
        CustomTestObject__c customTestObject = new CustomTestObject__c(Name = 'CustomTestObject' + name);
        insert customTestObject;
        return customTestObject.Name;
    }   

    @HttpDelete
    global static void deleteCase() {
        RestRequest request = RestContext.request;
        String textName = request.requestURI.substring(
            request.requestURI.lastIndexOf('/')+1);
        CustomTestObject__c thisCase = [SELECT Id FROM CustomTestObject__c WHERE Name = :textName];
        delete thisCase;
    }       
}