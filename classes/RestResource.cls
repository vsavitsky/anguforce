@RestResource(urlMapping = '/service')
global class RestResource {
    @HttpGet
    global static String doGet() {
        String param = RestContext.request.params.get('param');
        String returnValue = param + '_was_returned_to_you';
        return returnValue;
    }

}