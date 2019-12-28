public class Positionpage9Controller {
public Positions__c pos                          {get;set;}
public string searchName                         {get;set;}
public void search(){
pos = [SELECT id, Name, status__c
        FROM Positions__c WHERE Name=: searchName];
        
}

}