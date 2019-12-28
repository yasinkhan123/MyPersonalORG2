@RestResource(urlMapping='/v1/getContacts/*')

global with sharing class getContact {
        
  @Httpget
  global static List<Contact> fetchAccount(){ 
           RestRequest req = RestContext.request;
           RestResponse res = Restcontext.response;
           Id accId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);           
           List<Contact> lstcontact = [Select id , name,Phone,Fax,Email from Contact where Accountid=:accId]; 
     return lstcontact ;              
     }
}