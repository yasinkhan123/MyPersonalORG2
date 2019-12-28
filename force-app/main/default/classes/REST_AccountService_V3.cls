/****************************************************************************************************
 * Description - Sample Apex REST service with GET method
 * Author - yasin khan
 ****************************************************************************************************/
@RestResource(urlMapping='/v3/accounts/*')
Global with sharing class REST_AccountService_V3{
    @HttpGet
    Global static AccountWrapper doGet(){
       RestRequest req = RestContext.request;
       RestResponse res = RestContext.response; 
       AccountWrapper accWrap = new AccountWrapper();
       
       String accountId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
       
       if(doSearch(accountId)){
          searchAccounts(req,res,accWrap);
       }else{
           findAccount(res,accWrap,accountId);
       }       
       return accWrap;
    } 
    
    
    // If the item to the right of the last forward slash is "accounts", the request went to v3/accounts?Name=United
    // Else the request went to v3/accounts/<something>, which is not a search, but a specific entity
    private static boolean doSearch(String accountId) {
        if(accountId == 'accounts') {
            return true;
        }
        return false;
    }
    
    //If the request came to /v3/accounts, then we want to execute a search
    private static void searchAccounts(RestRequest req, RestResponse res, AccountWrapper accWrap) {
           //Use the RestRequest's params to fetch the Name parameter
           String searchTerm = req.params.get('Name');
           if(searchTerm == null || searchTerm == '') {
                accWrap.status = 'Error';
                accWrap.message = 'You must provide a Name for your search term.';
                res.StatusCode = 400;
           
           }else{
                String searchText = '%'+searchTerm+'%'; 
                List<Account> searchResults = [SELECT Id, Name, Phone, Website FROM Account WHERE Name Like : searchText];
                if(searchResults != null && searchResults.size() > 0) {
                        accWrap.acctList = searchResults;
                        accWrap.status = 'Success';
                        accWrap.message = searchResults.size() + ' Accounts were found that matched your search term.';
                }else{
                        accWrap.status = 'Error';
                        accWrap.message = 'No Accounts where found based on that Name, please search again.';
                }   
           }
    }
    
    //If the request came to v3/accounts/<external_Id>, then we want to find a specific account
    private static void findAccount(RestResponse res, AccountWrapper response, String accountId) {
          // Provided we recevied an External Id, perform the search and return the results
        if(accountId != null && accountId != '') {
            List<Account> result = [SELECT Id, Name, Phone, Website FROM Account WHERE id =: accountId];
            
            if(result != null && result.size() > 0) {
                response.acctList.add(result[0]);
                response.status = 'Success';
            }
            else {
                response.status = 'Error';
                response.message = 'This account could not be found, please try again.';
                res.StatusCode = 404;
            }
        }
        // If the request came to /v3/accounts/ (without an Account Id), return an error
        else {
            response.status = 'Error';
            response.message = 'You must specify an External Id.';
            res.StatusCode = 400;
        }
    }
    
    global class AccountWrapper {
        public List<Account> acctList;
        public String status;
        public String message;
        
        public AccountWrapper(){
            acctList = new List<Account>();
        }
    }
}