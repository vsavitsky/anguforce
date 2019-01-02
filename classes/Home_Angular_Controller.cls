public with sharing class Home_Angular_Controller {

	public String data {get; set;}

	public Home_Angular_Controller() {
	
		List<Data> dataSet = new List<Data>();

		for (test1_pckg__Project_participation__c projPart : [SELECT Id, test1_pckg__Title__c, test1_pckg__Participation_Start_Date__c, test1_pckg__Participation_End_Date__c, test1_pckg__Participated_days__c, test1_pckg__Is_Active_Project__c, test1_pckg__Description__c FROM test1_pckg__Project_participation__c ORDER BY test1_pckg__Participation_Start_Date__c]) {

			Data obj = new Data();
			obj.projectTitle = projPart.test1_pckg__Title__c;
			
			if (projPart.test1_pckg__Participation_Start_Date__c != null) {
				Datetime participationStartDate = projPart.test1_pckg__Participation_Start_Date__c;
				obj.participationStartDate = participationStartDate.format('dd-MM-yyyy');
			} else {
				obj.participationStartDate = '';
			}

			if (projPart.test1_pckg__Participation_End_Date__c != null) {
				Datetime participationEndDate = projPart.test1_pckg__Participation_End_Date__c;
				obj.participationEndDate = participationEndDate.format('dd-MM-yyyy');
			} else {
				obj.participationEndDate = 'Is Active >>>';
			}

			obj.participatedDays = projPart.test1_pckg__Participated_days__c;
			obj.participatedPeriod = getParticipatedPeriod(obj.participatedDays);
			obj.isActiveProject = projPart.test1_pckg__Is_Active_Project__c;
			//obj.description = projPart.test1_pckg__Description__c;
			dataSet.add(obj);
		}

		data = JSON.serialize(dataSet);
	}

	private String getParticipatedPeriod (Decimal participatedDays) {
		Integer years = 0;
		Integer month = 0;
		String result = '';

		if (participatedDays >= 365) {
			years = (Integer)participatedDays / 365;
			participatedDays -= 365 * years;
			result += years + ' years';
		}
		
		if (participatedDays >= 30) {
			result += (years > 0) ? ', ' : '';
			month = (Integer)participatedDays / 30;
			participatedDays -= 30 * month;
			result += month + ' month';
		}

		result += (month > 0 || years > 0) ? ', ' : '';
		result += (Integer)participatedDays + ' days';

		return result;
	}

	public class Data {
		public String projectTitle {get;set;}
		public String participationStartDate {get;set;}
		public String participationEndDate {get;set;}
		public Decimal participatedDays {get;set;}
		public String participatedPeriod {get;set;}
		public Boolean isActiveProject {get;set;}
		//public String description {get;set;}
	}
}