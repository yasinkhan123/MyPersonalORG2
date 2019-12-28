public class Positionpage4Controller {
    public List <Positions__c> pos        {get;set;}
    public string Txt                     {get;set;}
    public string errorMsg               {get;set;}
    public void search(){
    
    try{
    if (Txt != ''){
    pos = [SELECT id, Name, status__c
            FROM Positions__c WHERE name like: Txt+'%'];
        }else {
        pos = [SELECT id, Name, status__c
            FROM Positions__c];
        }
        }catch(exception e){ 
        }
          
          if (pos.size() == 0){
           errorMsg = 'record not found';
           }else {
           errorMsg = '';
           }
    }
    
}