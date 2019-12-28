global class CreateTaskEmailExample implements Messaging.InboundEmailHandler {
 
  global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email, Messaging.InboundEnvelope env){
 
 
    Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
     system.debug('-- CreateTaskEmailExample constructor');
    String myPlainText= '';
    
    myPlainText = email.plainTextBody;
   

    Positions__c [] newPos  = new Positions__c[0];

    try {
     // Contact vCon = [SELECT Id, Name, Email FROM Contact WHERE Email = :email.fromAddress  LIMIT 1];
      
     
 //     newPos.add(new positions__c ( Name = 'SW',    Job_Description__c = email.subject)); //, id =  vCon.Id)
     
   //  insert newPos;    

     Positions__c pos = new positions__c ( Name = 'SW',    Job_Description__c = email.subject); //, id =  vCon.Id)     
     insert pos;
     System.debug('New Task Object: ' + newPos );   
    }
  
   catch (QueryException e) {
       System.debug('Query Issue: ' + e);
   }
   
   result.success = true;

   return result;
  }
}