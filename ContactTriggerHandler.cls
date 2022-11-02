public class ContactTriggerHandler {
    
    
    public void onBeforeInsert(List<Contact> newList){
        //FOr Multi Record
        List<Contact> newC= newList;
        //Step 1: Gather Accounts of inserting Contacts
        Set<Id> accIdSet = new Set<Id>();
        for(Contact eachContact : newC){
            accIdSet.add(eachContact.AccountId);
        }
        //Step 2: Query on Existing Contacts
        List<Contact> conList=[Select Id,AccountId from Contact where AccountId In:accIdSet];
        
        Map<Id,List<Contact>> countWithMap = new Map<Id,List<Contact>>();
        for(Contact eachCon : conList){
            if(countWithMap.containsKey(eachCon.AccountId)){
                //Get Existing Elements from Map into List
                List<Contact> existingContactsInMap=countWithMap.get(eachCon.AccountId);
                //Add our element to List
                existingContactsInMap.add(eachCon);
                //Add element into Map
                countWithMap.put(eachCon.AccountId,existingContactsInMap);
            }else{
                List<Contact> brandNewList= new List<Contact>();
                brandNewList.add(eachCon);
                countWithMap.put(eachCon.AccountId,brandNewList);
            }
        }
        system.debug('countWithMap@@@@'+countWithMap);
        for(Contact eachContact : newC){
            if(countWithMap.containsKey(eachContact.AccountId)){
                List<Contact> existingContacts=countWithMap.get(eachContact.AccountId);
                if(existingContacts.size()>2){
                    //eachContact.addError('You cant add more Contacts');
                }
            }
        }    
    }
    
    public void onAfterInsert(List<Contact> newList,Map<Id,Contact> newMap){
        List<Account> accList = new List<Account>();
        for(Contact eachCon: newMap.values()) {
            Account acc= new Account();
            acc.Name=eachCon.lastName;
            accList.add(acc);
        }
        insert accList;
    }
    
    public void onBeforeUpdate(List<Contact> newList,List<Contact> oldList,Map<Id,Contact> newMap,Map<Id,Contact> oldMap){
        
    }
    
    public void onAfterUpdate(List<Contact> newList,List<Contact> oldList,Map<Id,Contact> newMap,Map<Id,Contact> oldMap){
        
    }
    
    public void onBeforeDelete(List<Contact> oldList, Map<Id,Contact> oldMap){
        
    }
    
    public void onAfterDelete(List<Contact> oldList, Map<Id,Contact> oldMap){
        
    }
    
    public void onAfterUndelete(List<Contact> newList,Map<Id,Contact> newMap){
        
    }
}