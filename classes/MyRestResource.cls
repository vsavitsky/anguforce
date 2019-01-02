@RestResource(urlMapping = '/myservice')
global class MyRestResource {
    @HttpGet
    global static String doGet() {
        String param = RestContext.request.params.get('param');
        String returnValue = param + '_was_returned_to_you';
        // RestContext.response.responseBody = Blob.valueOf(returnValue); // with void return value (download file)

        return String.valueOf(System.now());
    }

}