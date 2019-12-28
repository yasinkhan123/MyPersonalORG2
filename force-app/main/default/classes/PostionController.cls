public class PostionController {

    public void Save() {
        upsert pos;
    }

 public Positions__c  pos {get;set;}

    public PostionController(){
            pos = new Positions__c();
          /* pos = [SELECT Id, Apex__c, C__c, Close_Date__c,
                    Days_pen__c, Education_Requirement__c,
                    Functional_Area__c, Hire_By__c, Hiring_Manager__r.UserName,
                    Java__c,JavaScript__c,Job_Description__c,Job_Level__c, Location__c,
                    Max_pay__c, Min_pay__c , Open_Date__c,Responsibilties__c,
                    Skill_Required__c,Status__c ,testbox__c,Travel_Required__c,Type__c FROM 
                    Positions__c  WHERE Hiring_Manager__r.id =: Userinfo.getUserId() Order By CreatedDate ASC  limit 1]; */
          // system.debug('pos :'+pos);
    }
}