public class Positioncontroller1 {
    public Positions__c pos            {get; set;}
     public Positioncontroller1 (){
         
   
              pos = [SELECT id, Name, Days_pen__c, Education_Requirement__c, Functional_Area__c, Java__c, JavaScript__c, 
                            Job_Description__c, Job_Level__c, Location__c, Max_pay__c, Min_pay__c,
                            Hiring_Manager__c, Open_Date__c, Responsibilties__c, Skill_Required__c, 
                            Status__c, testbox__c, Travel_Required__c, Type__c
                            FROM Positions__c  
                            WHERE Hiring_Manager__r.id =: userinfo.getuserid()
                            Limit 1];

            
    }
    public void updatePosition (){
            update pos;
    }
    
    public void newPosition(){
        pos = new Positions__c ();
        
    }
    
    public void insertPosition(){
              Insert pos;
    }
    public void upsertPosition(){
            upsert pos;
    }
}