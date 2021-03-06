@isTest 
private class HelloWorldTestClass {
    static testMethod void validateHelloWorld() {
       Book__c b = new Book__c(Name='Behind the Cloud', BookPrice__c =100);
       System.debug('Price before inserting new book: ' + b.BookPrice__c);

       // Insert book
       insert b;
    
       // Retrieve the new book
       b = [SELECT BookPrice__c FROM Book__c WHERE Id =:b.Id];
       System.debug('Price after trigger fired: ' + b.BookPrice__c );

       // Test that the trigger correctly updated the price
       System.assertEquals(90, b.BookPrice__c );
    }
}