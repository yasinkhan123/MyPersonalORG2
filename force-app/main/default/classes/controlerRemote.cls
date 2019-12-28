global class controlerRemote {
   public String accountName {get;set;}
   public static Account accountData {get;set;}
   
   @RemoteAction
   global static Account getAccount(String accountName){
       accountData = [SELECT Id, Name From Account WHERE Name =: accountName];
     return accountData;
   }
}