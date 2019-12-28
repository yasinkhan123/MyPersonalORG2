global class AccountRemoter {
    public String accountName {get;set;}
    public static Account accountData {get;set;}
    
    public AccountRemoter(){ }
    
    @RemoteAction
    global static Account getAccount(String accountName){
        accountData = [SELECT Id, Name,AccountNumber, Phone, Type, NumberOfEmployees FROM Account WHERE Name = :accountName];
        return accountData;

    }
}