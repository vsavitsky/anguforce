public with sharing class Home_Angular_Controller {

	public String data {get; set;}
	public SummaryInfo summaryInfo {get; set;}

	public Home_Angular_Controller() {
	
		Data dataObj = new Data();
		List<ProjectInfo> projectsInfo = new List<ProjectInfo>();
		SummaryInfo summaryInfo = new SummaryInfo();
		summaryInfo.summaryDays = 0;
		summaryInfo.projectsCount = 0;

		for (test1_pckg__Project_participation__c projPart : [SELECT Id, test1_pckg__Title__c, test1_pckg__Participation_Start_Date__c, test1_pckg__Participation_End_Date__c, test1_pckg__Participated_days__c, test1_pckg__Is_Active_Project__c, test1_pckg__Description__c FROM test1_pckg__Project_participation__c ORDER BY test1_pckg__Participation_Start_Date__c]) {

			ProjectInfo projectInfo = new ProjectInfo();
			projectInfo.projectTitle = projPart.test1_pckg__Title__c;
			
			if (projPart.test1_pckg__Participation_Start_Date__c != null) {
				Datetime participationStartDate = projPart.test1_pckg__Participation_Start_Date__c;
				projectInfo.participationStartDate = participationStartDate.format('dd-MM-yyyy');
			} else {
				projectInfo.participationStartDate = '';
			}

			if (projPart.test1_pckg__Participation_End_Date__c != null) {
				Datetime participationEndDate = projPart.test1_pckg__Participation_End_Date__c;
				projectInfo.participationEndDate = participationEndDate.format('dd-MM-yyyy');
			} else {
				projectInfo.participationEndDate = 'Is Active >>>';
			}

			projectInfo.participatedDays = projPart.test1_pckg__Participated_days__c;
			projectInfo.participatedPeriod = getParticipatedPeriod(projectInfo.participatedDays);
			projectInfo.isActiveProject = projPart.test1_pckg__Is_Active_Project__c;
			//projectInfo.description = projPart.test1_pckg__Description__c;

			summaryInfo.summaryDays += (Integer)projPart.test1_pckg__Participated_days__c;
			summaryInfo.projectsCount++;

			projectsInfo.add(projectInfo);
		}

		dataObj.projectsInfo = projectsInfo;
		summaryInfo.summaryPeriod = getParticipatedPeriod(summaryInfo.summaryDays);
		dataObj.summaryInfo = summaryInfo;

		data = JSON.serialize(dataObj);
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

	public class ProjectInfo {
		public String projectTitle {get;set;}
		public String participationStartDate {get;set;}
		public String participationEndDate {get;set;}
		public Decimal participatedDays {get;set;}
		public String participatedPeriod {get;set;}
		public Boolean isActiveProject {get;set;}
		//public String description {get;set;}
	}

	public class SummaryInfo {
		public Integer projectsCount {get;set;}
		public Integer summaryDays {get;set;}
		public String summaryPeriod {get;set;}
	}

	public class Data {
		public List<ProjectInfo> projectsInfo {get;set;}
		public SummaryInfo summaryInfo {get;set;}
	}
}