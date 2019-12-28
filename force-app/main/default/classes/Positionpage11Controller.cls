public class Positionpage11Controller {
public List <Positions__c> pos                    {get;set;}
public Positionpage11Controller (){
    pos= [SELECT id, Name, status__c
               FROM Positions__c]; 
}

}