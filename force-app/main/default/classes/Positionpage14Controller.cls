public class Positionpage14Controller {

public List <Positions__c> pos                                     {get;set;}
public List <Job_Application__c> jApp                              {get;set;}
public string query                                                {get;set;}
public string id                                                   {get;set;}
public List <id> idList                                            {get;set;}

public Positionpage14Controller (){

        query = 'select ' + UtilityClass.autoQuery('Positions__c') + ' from Positions__c' ;
        pos = database.query(query);
        
        idList = new List <id>();
        
        
       // query = 'select ' + UtilityClass.autoQuery('Job_Application__c') + ' from Job_Application__c ' ;
        //jApp = database.query(query);
}

public void fetchJapp(){
    query = 'SELECT ' + UtilityClass.autoQuery('Job_Application__c') + ' FROM Job_Application__c WHERE Position__r.id =: id ';
    jApp = database.query(query);
    idList.add(id);
}
public void showAll(){
string s = 'a00i000000VPdyo';
    query = 'SELECT ' + UtilityClass.autoQuery('Positions__c') + ' FROM Positions__c WHERE id  IN : idList';
    pos = database.query(query);
}
}