public class Positionpage5Controller {
    public Positions__c pos             {get;set;}
    public String Txt                     {get;set;}
    public List <Positions__c> disp       {get;set;}
    public boolean b                      {get;set;}   

    public void search (){
    try{
    b = true;
    pos = [SELECT id, Name, status__c
            FROM Positions__c WHERE Name Like: Txt];
            }catch(exception e){
            }
       disp.add(pos);
       Txt = '';
    }
    public Positionpage5Controller (){
    disp = new List <Positions__c> ();
    }
    
    public void display (){
    b = false;
    }
    public void clear(){
    disp.clear();
    }
}