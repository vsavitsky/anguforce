public with sharing class Home_Angular_Controller {

	public String data {get; set;}
	public SummaryInfo summaryInfo {get; set;}

	public Home_Angular_Controller() {
	
		Data dataObj = new Data();
		List<ProjectInfo> projectsInfo = new List<ProjectInfo>();
		List<TechnologyInfo> technologiesInfo = new List<TechnologyInfo>();
		SummaryInfo summaryInfo = new SummaryInfo();
		summaryInfo.summaryDays = 0;
		summaryInfo.projectsCount = 0;
		Map<String, TechnologyInfo> daysPerTechnologyMap = new Map<String, TechnologyInfo>();

		List<test1_pckg__Project_Technology__c> projectTechnologies = [
				SELECT Id, 
				test1_pckg__Project_participation__r.test1_pckg__Title__c,
				test1_pckg__Project_participation__r.test1_pckg__Participation_Start_Date__c,
				test1_pckg__Project_participation__r.test1_pckg__Participation_End_Date__c,
				test1_pckg__Project_participation__r.test1_pckg__Participated_days__c,
				test1_pckg__Project_participation__r.test1_pckg__Is_Active_Project__c,
				test1_pckg__Technology__r.Id,
				test1_pckg__Technology__r.test1_pckg__Title__c,
				test1_pckg__Technology__r.test1_pckg__Hex_Color__c
				FROM test1_pckg__Project_Technology__c
				ORDER BY test1_pckg__Project_participation__r.test1_pckg__Participation_Start_Date__c
		];

		Set<String> savedProjects = new Set<String>();

		for (test1_pckg__Project_Technology__c projectTechnology : projectTechnologies) {

			ProjectInfo projectInfo = new ProjectInfo();
			projectInfo.projectTitle = projectTechnology.test1_pckg__Project_participation__r.test1_pckg__Title__c;			
			
			if (projectTechnology.test1_pckg__Project_participation__r.test1_pckg__Participation_Start_Date__c != null) {
				Datetime participationStartDate = projectTechnology.test1_pckg__Project_participation__r.test1_pckg__Participation_Start_Date__c;
				projectInfo.participationStartDate = participationStartDate.format('dd-MM-yyyy');
			} else {
				projectInfo.participationStartDate = '';
			}

			if (projectTechnology.test1_pckg__Project_participation__r.test1_pckg__Participation_End_Date__c != null) {
				Datetime participationEndDate = projectTechnology.test1_pckg__Project_participation__r.test1_pckg__Participation_End_Date__c;
				projectInfo.participationEndDate = participationEndDate.format('dd-MM-yyyy');
			} else {
				projectInfo.participationEndDate = 'Is Active >>>';
			}

			projectInfo.participatedDays = projectTechnology.test1_pckg__Project_participation__r.test1_pckg__Participated_days__c;
			projectInfo.participatedPeriod = getPeriodString(projectInfo.participatedDays);
			projectInfo.isActiveProject = projectTechnology.test1_pckg__Project_participation__r.test1_pckg__Is_Active_Project__c;
			//projectInfo.description = projectTechnology.test1_pckg__Project_participation__r.test1_pckg__Description__c;

			Decimal temp = 0;
			if (daysPerTechnologyMap.containsKey(projectTechnology.test1_pckg__Technology__r.test1_pckg__Title__c)) {
				temp = daysPerTechnologyMap.get(projectTechnology.test1_pckg__Technology__r.test1_pckg__Title__c).summaryDays;
			}
			TechnologyInfo tempTech = new TechnologyInfo();
			tempTech.title = projectTechnology.test1_pckg__Technology__r.test1_pckg__Title__c;
			tempTech.color = projectTechnology.test1_pckg__Technology__r.test1_pckg__Hex_Color__c;
			tempTech.summaryDays = (Integer)(temp + projectInfo.participatedDays);
			tempTech.summaryPeriod = getPeriodString(tempTech.summaryDays);
			daysPerTechnologyMap.put(projectTechnology.test1_pckg__Technology__r.test1_pckg__Title__c, tempTech);

			// continue if Project is already saved
			if (savedProjects.contains(projectTechnology.test1_pckg__Project_participation__r.test1_pckg__Title__c)) {
				continue;
			} else {
				summaryInfo.summaryDays += (Integer)projectTechnology.test1_pckg__Project_participation__r.test1_pckg__Participated_days__c;
				summaryInfo.projectsCount++;
				projectsInfo.add(projectInfo);
				savedProjects.add(projectInfo.projectTitle);
			}
		}			

		for (String key : daysPerTechnologyMap.keySet()) {

			technologiesInfo.add(daysPerTechnologyMap.get(key));
		}

		dataObj.projectsInfo = projectsInfo;
		dataObj.technologiesInfo = technologiesInfo;
		summaryInfo.summaryPeriod = getPeriodString(summaryInfo.summaryDays);
		dataObj.summaryInfo = summaryInfo;

		data = JSON.serialize(dataObj);
	}

	private String getPeriodString (Decimal participatedDays) {
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

	public class TechnologyInfo {
		public String title {get;set;}
		public String color {get;set;}
		public Integer summaryDays {get;set;}
		public String summaryPeriod {get;set;}
	}

	public class Data {
		public List<ProjectInfo> projectsInfo {get;set;}
		public SummaryInfo summaryInfo {get;set;}
		public List<TechnologyInfo> technologiesInfo {get;set;}
	}
}