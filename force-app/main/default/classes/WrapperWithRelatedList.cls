public class WrapperWithRelatedList {
public positions__c pos     {get;set;}
public list <Job_Application__c> ja   {get;set;}
public String posid                 {get;set;}
public list <posWrapper> posWrap    {get;set;}


    public WrapperWithRelatedList(){
    posWrap= new list <posWrapper> ();
    ja = [Select id, Name, Position__c, Candidate__c, Number_of_Reviews__c, Total_Rating__c 
            From Job_Application__c
            Where Position__c != null
            Limit 2];
      }      
            Public void getPosOnClk (){
      pos = [Select id, Name, Close_Date__c, Functional_Area__c, Location__c, Max_pay__c, Min_pay__c
              From positions__c
              where id =: posid];
          posWrap.add(new posWrapper(pos));  
        system.debug(pos);
        system.debug(posid);
        }
        
    public class posWrapper {
    public positions__c pos {get;set;}
    
    public posWrapper(positions__c p1){
    this.pos=p1;
    
    }
    }
}