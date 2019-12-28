public class Positionpage7Controller {
    public list <Positions__c> pos                    {get;set;}
    public string searchVar                           {get;set;}
    public string errorMessage                        {get;set;}
    public Job_Application__c jobApp                  {get;set;}
    public boolean jABool                             {get;set;}
    public string posName                             {get;set;}
    
    public void search(){
    
    if(searchVar != ' '){
    pos=[SELECT id, Name, Status__c 
            FROM Positions__c WHERE Name like : searchVar+'%'];
         errorMessage= '';
         jABool=true;
         }else{
         errorMessage= 'invalid position';
         }   
         
    }
    
    public void createJob(){
    
    jobApp= new Job_Application__c();
    jABool= false; 
    system.debug('**'+posName);
       jobApp.position__c=posName;                        
    }
    
    public void saveJA(){
    
    insert jobApp;
    jABool= true;
    
    }
        
    public void cancel(){
    
    jABool= true;
    }
    
}