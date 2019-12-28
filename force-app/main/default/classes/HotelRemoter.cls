global with sharing class HotelRemoter {
   
   public String CityName {get; set;}
   
   @RemoteAction
   global static  List<Hotel__c> findAll(String country){
       if(country != '')
           return [SELECT Id, Name, Location__Latitude__s, Location__Longitude__s,Country__c FROM Hotel__c WHERE Country__c =: country];
       else  
           return [SELECT Id, Name, Location__Latitude__s, Location__Longitude__s,Country__c FROM Hotel__c];
   }      
}