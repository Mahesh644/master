public with sharing class testCtrl {

    public testCtrl(ApexPages.StandardController controller) {
        List<id> selectedContacts=ApexPages.currentPage().getParameters().get('ids').split(',');
        List<Contact> conList=[Select Id,FirstName from Contact where Id in:selectedContacts];
        system.debug('conList###'+conList.size());
    }

}