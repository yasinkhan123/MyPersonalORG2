public class Positionpage6Controller {

    public List <Positions__c> pos                                      {get;set;}
    public String posName                                                {get;set;}
    public String errorMessage                                           {get;set;}
    public List <Job_Application__c> jobApp                               {get;set;}
    public List <string> idList                                                {get;set;}
    
    public Positionpage6Controller(){
        idList = new List <string>();
        }
    
    public void search (){
    if (posName !=''){
    pos = [SELECT id, Name , status__c
            FROM Positions__c WHERE Name like : posName+'%' ];
            
            errorMessage=' ';
            
         for (Positions__c po : pos){
          idList.add(po.name);
          }
          
     jobApp = [SELECT id, Name, Average_Rating__c, Candidate__r.name, Cover_Letter__c, 
                         Number_of_Reviews__c, Position__r.name, Status__c, Total_Rating__c
                         FROM Job_Application__c WHERE Position__r.name In : idList];     
    }
      else{
        errorMessage='invalid search';   
        }            
    }
    }