public with sharing class CaseController {
    public CaseController() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Case> fetchCases(String subject){
        try {
            String key = '%'+subject+'%';
            List<Case> caseList = [Select id,Status,Origin,Subject,Description from Case where Subject like : key];
            return caseList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}