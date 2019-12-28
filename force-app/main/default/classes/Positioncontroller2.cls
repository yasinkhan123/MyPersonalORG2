public class Positioncontroller2 {
    public Positions__c pos            {get; set;}
    
    public Positioncontroller2 (){
    
       /* pos = [SELECT id, Name, Days_pen__c, Education_Requirement__c, Functional_Area__c, Java__c, JavaScript__c, 
                            Job_Description__c, Job_Level__c, Location__c, Max_pay__c, Min_pay__c,
                            Hiring_Manager__c, Open_Date__c, Responsibilties__c, Skill_Required__c, 
                            Status__c, testbox__c, Travel_Required__c, Type__c
                            FROM Positions__c  
                            /*WHERE Hiring_Manager__r.id =: userinfo.getuserid()
                            Limit 1]; */
        }
    
    public void createJobApplication(){
            
         /*   if (pos.Status__c == 'New Position') {
            Job_Application__c JA= new Job_Application__c();
            //JA.Candidate__c = pos.;
            JA.Position__c = pos.id;
            JA.Status__c = 'New';
            JA.Cover_Letter__c = 'test';
            upsert JA;
            pos.Status__c = 'Open - Approved';
            update pos;
            }       */
            
    }
}