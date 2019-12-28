/****************************************************************************************************
 * Description - Sample Apex REST service with GET method
 * Author - yasin khan
 ****************************************************************************************************/
@RestResource(urlMapping='/v2/accounts/*')
Global with sharing class REST_AcoountService_V2{
      @HttpGet
      Global static AccountWrapper goGet(){
            RestRequest req = RestContext.request;
            RestResponse res = RestContext.response;
            AccountWrapper accWrap = new AccountWrapper();
                        
            String accountId = req.requestURI.substring(req.requestURI.lastindexof('/')+1);            
            List<Account> listAcoounts = [SELECT Id, Name, Phone, Website FROM Account WHERE id = :accountId];
            if(listAcoounts.size()>0){
                accWrap.acc = listAcoounts[0];
                accWrap.status = 'Success';
            }else{
                accWrap.acc = null;
                accWrap.status = 'Error';
                accWrap.Message = 'This account could not be found, please try again.';
                res.statusCode = 404;
            }            
            return accWrap;
      }
      
      global class AccountWrapper{
           public Account acc;
           public String status;
           public String Message;
           
           public AccountWrapper(){           
           }
      }  
}