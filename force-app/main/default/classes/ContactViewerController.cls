public class ContactViewerController { 
    @AuraEnabled 
    public static List<Contact> getContacts() {
        List<Contact> lstContact = [SELECT Id, Name, Phone, Email 
                                    FROM Contact];
        return lstContact; 
    }
}