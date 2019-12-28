public class Positionpage12Controller {

public List<Job_Application__c> jApp                 {get;set;}
public Job_Application__c jApp1                 {get;set;}

public string urlid                                    {get;set;}
public Positionpage12Controller(){//ApexPages.StandardController controller
urlid= Apexpages.currentPage().getParameters().get('posid');


jApp=[SELECT id, Name, Candidate__r.name, Average_Rating__c, Cover_Letter__c, Candidate__c,
           Number_of_Reviews__c, Position__r.name, Status__c, Total_Rating__c,Position__r.id, Position__c
           FROM Job_Application__c WHERE Position__r.id=: urlid];
if (jApp.size() == 0){

jApp1 = new Job_Application__c();
try{
jApp1.Position__r.id = urlid;
}catch(Exception e){
jApp.add(jApp1);
}


}


}
public void Save (){
    upsert jApp;
}

public void addNewJApp(){

jApp1 = new Job_Application__c();
try{
jApp1.Position__r.id = urlid;
}catch(Exception e){
jApp.add(jApp1);
}
    
}

}