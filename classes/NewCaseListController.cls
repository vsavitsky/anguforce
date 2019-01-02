public class NewCaseListController {
    public List<Case> getNewCases() {
        List<Case> result = [SELECT CaseNumber FROM Case WHERE status='New'];
        return result;
    }
}