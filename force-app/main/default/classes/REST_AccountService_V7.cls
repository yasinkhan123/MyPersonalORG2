/****************************************************************************************************
 * Description - Sample Apex REST service with GET and POST methods
 * Author - Yasin Khan
 * Inspiration taken from Mohit Srivastav @ cloudyworlds.blogspot.in
 * Original source blog post: http://cloudyworlds.blogspot.in/2012/11/native-parsing-of-json-input-into-user.html
 * Example request:
 *
{
  "rqst" :
  {
    "acct" : 
    { 
      "Name" : "Salesforce.com",
      "AccountNumber" : "1001",
      "Website" : "www.salesforce.com"
    },
    "contList" :
    [
      {"FirstName" : "Test", "LastName" : "O'Riley", "Email" : "testcontact1@salesforce.com"},
      {"FirstName" : "Test", "LastName" : "Contact2", "Email" : "testcontact2@salesforce.com"},
      {"FirstName" : "Test", "LastName" : "Contact3", "Email" : "testcontact3@salesforce.com"}
    ]
  }
}
 *    
 ****************************************************************************************************/
@RestResource(urlMapping='/v7/accounts/*')
Global with sharing class REST_AccountService_V7 {
        @HttpPost
        Global static PostResponseWrapper doPost(RequestWrapper rqst){
                RestRequest req = RestContext.request;
                RestResponse res = RestContext.response;                
                PostResponseWrapper response = new PostResponseWrapper();
                try{
                      insert rqst.acct;
                      response.acct = rqst.acct;                  
                      for(Contact conRec : rqst.contList){
                          conRec.AccountId = rqst.acct.Id;
                      }                                    
                      insert rqst.contList;                  
                      response.contList = rqst.contList;
                      response.status = 'Success';
                      response.message = 'Your Accounts have been created successfully';
                }catch(Exception exc) {
                      res.StatusCode = 500;
                      response.acct = null;
                      response.contList = null;
                      response.status = 'Error';
                      response.message = 'Your request failed with the following error: ' + exc.getMessage();
                
                }
                return response;
        }
        
        global class RequestWrapper {
            Account acct;
            List<Contact> contList;
        }
        
        global class PostResponseWrapper {
                Account acct;
                List<Contact> contList;
                String status;
                String message;
                
                public PostResponseWrapper(){
                    
                }
        }
                
}