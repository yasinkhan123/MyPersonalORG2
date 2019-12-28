public class LoadRelatedList 
{
	@AuraEnabled
    public static List<Contact> getContacts() {
        List<Contact> contacts = [SELECT Id, Name, MailingStreet, Phone, Email, LeadSource FROM Contact];
        //Add isAccessible() check
        return contacts;
    }
    
    @AuraEnabled
    public static List<Account> getAccounts() {
        List<Account> lstAccounts = [SELECT Id, Name, (SELECT Id, Name, MailingStreet, Phone, Email, LeadSource FROM Contacts) FROM Account];
        //Add isAccessible() check
        return lstAccounts;
    }
}