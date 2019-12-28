public class testemail {

   
    public testemail(ApexPages.StandardController controller) {
       /* system.debug('--');
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        mail.setTargetObjectId(UserInfo.getUserId());
        mail.toAddresses = new String[] { 'yasinkhan52@gmail.com' };
    
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail }); */
       
      List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
      Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();      
      
      List<String> sendTo = new List<String>();
      sendTo.add('yasinkhan52@gmail.com');
      mail.setToAddresses(sendTo);         
      mail.setSenderDisplayName('Official Bank of Nigeria');
      mail.setSubject('URGENT BUSINESS PROPOSAL');
      mails.add(mail);  
      Messaging.sendEmail(mails);  
}}