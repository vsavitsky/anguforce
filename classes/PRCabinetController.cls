public with sharing class PRCabinetController {

    public String dayOfWeek{get;set;}
    public String todaysDate{get;set;}
    private Datetime dt;
    public String servicePath{get;set;}

    public PRCabinetController() {
        dt = DateTime.newInstance(Date.today(), Time.newInstance(0, 0, 0, 0));
        dayOfWeek = getDayOfWeek(dt);
        todaysDate = getDate(dt);

        servicePath = 'https://vsavitsky-developer-edition.ap4.force.com/services/apexrest/myservice';
    }

    public String getDayOfWeek(Datetime dt) {
        String dayOfWeek=dt.format('EEEE');
        return dayOfWeek;
    }

    public String getDate(Datetime dt) {
        String retDate=dt.format('dd.MM.YYYY');
        return retDate;
    }



}