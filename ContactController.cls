public with sharing class ContactController {
    public ContactController() {

    }

    @AuraEnabled(cacheable=true)
    public static Object getContacts(){
         throw new AuraHandledException('Forced error');
        
    }
}