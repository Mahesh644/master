public with sharing class TestMetaInfo {
    public TestMetaInfo() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Case> fetchCases(){
        try {
            Set<String> origingSet = new Set<String>();
           // Set<Integer> footSetNumber = new Set<Integer>();
            return [Select id,Description,Origin from Case where Origin IN :origingSet];
            //return [Select id,Description,Origin from Case where Origin IN :footSetNumber];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}