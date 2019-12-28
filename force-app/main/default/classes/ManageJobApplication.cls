public class ManageJobApplication {
   @AuraEnabled
    public static void createJobApplication(String id){
        Job_Application__c jp = new Job_Application__c();
            jp.Position__c = id;
        insert jp;
    }
        
}