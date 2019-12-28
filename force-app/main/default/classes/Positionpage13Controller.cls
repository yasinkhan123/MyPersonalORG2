public class Positionpage13Controller {

   
public map <id,Positions__c> posMap          {get;set;}
public string val                       {get;set;}
public List <Positions__c> pos          {get;set;}
public List <Positions__c> pos1          {get;set;}
public set <Positions__c> posset          {get;set;}


public Positionpage13Controller(){
posMap = new map <id,Positions__c>();
pos1 = new List <Positions__c>();
posset = new set <Positions__c>();

    pos = [SELECT id, Name
            FROM Positions__c];
}

 
    public void callPos() {
        Positions__c  pos = [SELECT id, Name
            FROM Positions__c WHERE id=: val];
           pos1.add(pos); 
            
}

 public void callPos1() {
        Positions__c  pos = [SELECT id, Name
            FROM Positions__c WHERE id=: val];
           posset.add(pos); 
           pos1.clear();
           for(Positions__c setl:posset){
           pos1.add(setl);
           }
    }
public void mapMethod(){
    Positions__c  pos = [SELECT id, Name
            FROM Positions__c WHERE id=: val];
    posmap.put(pos.id,pos);        
}


}