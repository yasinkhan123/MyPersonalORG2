public class MyHelloWorld {
           public static  void applyDiscount(Book__c[] books){
                   for(Book__c i: books){
                   i.BookPrice__c *= 0.9;
                   }
           }

}