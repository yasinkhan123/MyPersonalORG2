//this schedular for sending all account details as a attachemnt to sengile user everyday


global class scheduledMerges implements Schedulable { // (Schedulable) is a interface and implements is a keyword
                                                      // scheduledMerges class name   
   global void execute(SchedulableContext SC) {       // start,finish and execute are methods from Schedulable in interface
     // mergeNumbers M = new mergeNumbers(); 
     system.debug('*** sch');
     
        List<Account > acclist = [Select id,name , CreatedDate , lastModifiedDate from Account limit 10]; // soql query for accounts
        string header = 'Record Id, Name , Created Date, Modified Date \n'; // creating a string variable
        string finalstr = header ;
        
        for(Account a: acclist)
        {
               string recordString = a.id+','+a.Name+','+a.CreatedDate+','+a.LastModifiedDate +'\n';
               finalstr = finalstr +recordString; //concatinating  record value with headers
        }
        
        Messaging.EmailFileAttachment csvAttc = new Messaging.EmailFileAttachment(); // creating a attacment instance
        blob csvBlob = Blob.valueOf(finalstr); // converting string value (i.e finalstr) to csvBlob format
        string csvname= 'Account.csv'; // assigning (Account.csv) value to string variable
        csvAttc.setFileName(csvname); // set file name (i.e Account.csv)
        csvAttc.setBody(csvBlob); // set attacment body that is blob converted format value csvBlob
        Messaging.SingleEmailMessage email =new Messaging.SingleEmailMessage(); //creating a email instatace
        String[] toAddresses = new list<string> {'yasin.khan@aqxolt.com'}; // assigning to address
        String subject ='Account CSV'; // subject name of email
        email.setSubject(subject); // assigning variable value
        email.setToAddresses( toAddresses ); // assigning variable value
        email.setPlainTextBody('Account CSV '); //optinal 
        email.setFileAttachments(new Messaging.EmailFileAttachment[]{csvAttc}); // assigning attachment variable value to email
        Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email}); // sending email with one email address
        
   }
}