/****************************************************************************************************
 * Description - Sample Apex REST service with GET method
 * Author - yasin khan
 ****************************************************************************************************/
 @RestResource(urlMapping='/v1/accounts/*')
 Global with sharing class REST_AccountService_V1{
     @HttpGet
     Global static Account doGet(){
       RestRequest req = RestContext.request;
       RestResponse res = RestContext.response;
       String accountId= req.requestURI.substring(req.requestURI.lastindexof('/')+1);
       Account acc = [SELECT Id, Name, Phone, Website, BillingState FROM Account WHERE id = :accountId];
       return acc;
     }
 }